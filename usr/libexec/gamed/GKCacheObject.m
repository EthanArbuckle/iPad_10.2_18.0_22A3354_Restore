@implementation GKCacheObject

- (void)updateWithServerRepresentation:(id)a3
{
  dispatch_queue_t current_queue;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;

  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKCacheObject updateWithServerRepresentation:]", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v5, "-[GKCacheObject updateWithServerRepresentation:]", objc_msgSend(v7, "UTF8String"), 280));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v8);
  }

}

- (id)internalRepresentation
{
  return 0;
}

+ (id)entityName
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclasses must provide a valid entityName")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v2, "+[GKCacheObject entityName]", objc_msgSend(v4, "UTF8String"), 292));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v5);
  return 0;
}

+ (id)entityInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    sub_1000F6490();
    if (v5)
      goto LABEL_5;
  }
  else if (v5)
  {
LABEL_5:
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "entityName"));
    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclasses must provide a valid entityName")));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (entityName != nil)\n[%s (%s:%d)]"), v9, "+[GKCacheObject entityInManagedObjectContext:]", objc_msgSend(v11, "UTF8String"), 305));

      +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", v8, v5));

    goto LABEL_14;
  }
  if (!os_log_GKGeneral)
    v14 = (id)GKOSLoggers(v7);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F6464();
  v13 = 0;
LABEL_14:

  return v13;
}

- (GKCacheObject)initWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  dispatch_queue_t current_queue;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  GKCacheObject *v17;
  objc_super v19;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F64BC();
  current_queue = dispatch_get_current_queue();
  v8 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKCacheObject initWithManagedObjectContext:]", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v10, "-[GKCacheObject initWithManagedObjectContext:]", objc_msgSend(v12, "UTF8String"), 314));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }

  v15 = objc_msgSend((id)objc_opt_class(self, v14), "entityInManagedObjectContext:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    v19.receiver = self;
    v19.super_class = (Class)GKCacheObject;
    self = -[GKCacheObject initWithEntity:insertIntoManagedObjectContext:](&v19, "initWithEntity:insertIntoManagedObjectContext:", v16, v5);
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)fetchRequestForContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F64E8();
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "entityName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", v7));

  objc_msgSend(v8, "setIncludesSubentities:", 1);
  objc_msgSend(v8, "setIncludesPropertyValues:", 1);
  objc_msgSend(v8, "setIncludesPendingChanges:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchSortDescriptors"));
  objc_msgSend(v8, "setSortDescriptors:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "relationshipKeyPathsForPrefetch"));
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v10);

  objc_msgSend(v8, "setReturnsObjectsAsFaults:", 0);
  return v8;
}

+ (id)relationshipKeyPathsForPrefetch
{
  return 0;
}

+ (id)fetchSortDescriptors
{
  return 0;
}

+ (id)allObjectsInContext:(id)a3
{
  return objc_msgSend(a1, "objectsMatchingPredicate:context:", 0, a3);
}

+ (id)objectsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_t current_queue;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKCacheObject objectsMatchingPredicate:context:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "+[GKCacheObject objectsMatchingPredicate:context:]", objc_msgSend(v13, "UTF8String"), 358));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForContext:", v7));
  if (!v6)
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  objc_msgSend(v15, "setPredicate:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_gkObjectsFromFetchRequest:withContext:", v15, v7));

  return v16;
}

+ (unint64_t)countObjectsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_t current_queue;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKCacheObject countObjectsMatchingPredicate:context:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "+[GKCacheObject countObjectsMatchingPredicate:context:]", objc_msgSend(v13, "UTF8String"), 371));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForContext:", v7));
  if (!v6)
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  objc_msgSend(v15, "setPredicate:", v6);
  v16 = objc_msgSend(v7, "_gkCountObjectsFromRequest:", v15);

  return (unint64_t)v16;
}

+ (id)firstObjectMatchingPredicate:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_t current_queue;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v21;

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKCacheObject firstObjectMatchingPredicate:context:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "+[GKCacheObject firstObjectMatchingPredicate:context:]", objc_msgSend(v13, "UTF8String"), 384));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForContext:", v7));
  objc_msgSend(v15, "setFetchLimit:", 1);
  if (!v6)
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  objc_msgSend(v15, "setPredicate:", v6);
  v21 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v15, &v21));
  v17 = v21;
  if (objc_msgSend(v16, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", 0));
  }
  else
  {
    v18 = 0;
    if (!v16 && v17)
    {
      if (!os_log_GKGeneral)
        v19 = (id)GKOSLoggers(0);
      if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
        sub_1000F6318();
      v18 = 0;
    }
  }

  return v18;
}

+ (void)deleteObjectsMatchingPredicate:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  dispatch_queue_t current_queue;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKCacheObject deleteObjectsMatchingPredicate:context:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "+[GKCacheObject deleteObjectsMatchingPredicate:context:]", objc_msgSend(v13, "UTF8String"), 406));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectsMatchingPredicate:context:", v6, v7));
  v16 = (void *)v15;
  if (!os_log_GKGeneral)
    v17 = (id)GKOSLoggers(v15);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F6514();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(v7, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v22));
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v20);
  }

}

- (BOOL)isValid
{
  return 1;
}

+ (id)uniqueAttributeName
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclass %@ must override uniqueAttributeName"), objc_opt_class(a1, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "+[GKCacheObject uniqueAttributeName]", objc_msgSend(v5, "UTF8String"), 427));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return 0;
}

+ (const)uniqueObjectIDLookupKey
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclass %@ must override uniqueObjectIDLookupKey"), objc_opt_class(a1, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "+[GKCacheObject uniqueObjectIDLookupKey]", objc_msgSend(v5, "UTF8String"), 434));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return 0;
}

+ (id)uniqueObjectIDLookupWithContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id AssociatedObject;
  GKUniqueObjectIDLookup *v9;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F6574();
  v7 = objc_msgSend(a1, "uniqueObjectIDLookupKey");
  AssociatedObject = objc_getAssociatedObject(v5, v7);
  v9 = (GKUniqueObjectIDLookup *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v9)
  {
    v9 = -[GKUniqueObjectIDLookup initWithObjectClass:context:]([GKUniqueObjectIDLookup alloc], "initWithObjectClass:context:", a1, v5);
    objc_setAssociatedObject(v5, v7, v9, (void *)1);
  }

  return v9;
}

+ (id)attributesDescriptionsForAttributesWithKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "entityName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GKClientProxy managedObjectModel](GKClientProxy, "managedObjectModel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entitiesByName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v5));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000DE3DC;
  v12[3] = &unk_1002BDF20;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributesByName"));
  v9 = v13;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_gkMapWithBlock:", v12));

  return v10;
}

- (id)imageCacheKeyPathsByKey
{
  dispatch_queue_t current_queue;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  current_queue = dispatch_get_current_queue();
  v3 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v3, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKCacheObject(GKCacheObjectImageProtocol) imageCacheKeyPathsByKey]", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v5, "-[GKCacheObject(GKCacheObjectImageProtocol) imageCacheKeyPathsByKey]", objc_msgSend(v7, "UTF8String"), 469));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v8);
  }

  if (qword_100317F68 != -1)
    dispatch_once(&qword_100317F68, &stru_1002C2470);
  return (id)qword_100317F60;
}

- (id)updateImagesWithImageURLs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  dispatch_queue_t current_queue;
  NSObject *v8;
  _UNKNOWN **v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  GKCacheObject *v28;
  id v29;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F65A0();
  current_queue = dispatch_get_current_queue();
  v8 = objc_claimAutoreleasedReturnValue(current_queue);
  v9 = &IDSCopyIDForPhoneNumber_ptr;
  if (dispatch_queue_get_specific(v8, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKCacheObject(GKCacheObjectImageProtocol) updateImagesWithImageURLs:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "-[GKCacheObject(GKCacheObjectImageProtocol) updateImagesWithImageURLs:]", objc_msgSend(v13, "UTF8String"), 486));

    v9 = &IDSCopyIDForPhoneNumber_ptr;
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);

  }
  if ((-[GKCacheObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___GKCacheObjectImageProtocol) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastPathComponent")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]"), v15, "-[GKCacheObject(GKCacheObjectImageProtocol) updateImagesWithImageURLs:]", objc_msgSend(v17, "UTF8String"), 487));

    objc_msgSend(v9[239], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v18);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageCacheKeyPathsByKey](self, "imageCacheKeyPathsByKey"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000DE830;
  v26[3] = &unk_1002C2498;
  v27 = v5;
  v28 = self;
  v21 = v19;
  v29 = v21;
  v22 = v5;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v26);

  v23 = v29;
  v24 = v21;

  return v24;
}

- (id)imageURLDictionary
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKCacheObject(GKCacheObjectImageProtocol) imageURLDictionary]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKCacheObject(GKCacheObjectImageProtocol) imageURLDictionary]", objc_msgSend(v8, "UTF8String"), 505));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  if ((-[GKCacheObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___GKCacheObjectImageProtocol) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]"), v10, "-[GKCacheObject(GKCacheObjectImageProtocol) imageURLDictionary]", objc_msgSend(v12, "UTF8String"), 506));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1000DEB7C;
  v22 = sub_1000DEB8C;
  v23 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageCacheKeyPathsByKey](self, "imageCacheKeyPathsByKey"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000DEB94;
  v17[3] = &unk_1002C24C0;
  v17[4] = self;
  v17[5] = &v18;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v17);

  v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v15;
}

- (void)deleteCachedImage:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  id v14;
  _BOOL8 v15;
  id v16;
  id v17;
  id v18;

  v3 = a3;
  v4 = v3;
  if (!os_log_GKGeneral)
    v5 = (id)GKOSLoggers(v3);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
  {
    sub_1000F6708();
    if (!v4)
      goto LABEL_21;
LABEL_5:
    v6 = GKImageCacheRoot(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)v7;
    if (!os_log_GKGeneral)
      v9 = (id)GKOSLoggers(v7);
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    {
      sub_1000F66A8();
      if (!v8)
        goto LABEL_20;
    }
    else if (!v8)
    {
      goto LABEL_20;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v8);

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v18 = 0;
      v13 = objc_msgSend(v12, "removeItemAtPath:error:", v8, &v18);
      v14 = v18;

      if (!v13)
        goto LABEL_14;
      if (!os_log_GKGeneral)
        v16 = (id)GKOSLoggers(v15);
      v15 = os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG);
      if (v15)
      {
        sub_1000F6648();
        if (v14)
          goto LABEL_15;
      }
      else
      {
LABEL_14:
        if (v14)
        {
LABEL_15:
          if (!os_log_GKGeneral)
            v17 = (id)GKOSLoggers(v15);
          if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
            sub_1000F65CC();
        }
      }

    }
LABEL_20:

    goto LABEL_21;
  }
  if (v4)
    goto LABEL_5;
LABEL_21:

}

- (void)clearImages
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKCacheObject(GKCacheObjectImageProtocol) clearImages]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKCacheObject(GKCacheObjectImageProtocol) clearImages]", objc_msgSend(v8, "UTF8String"), 548));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  if ((-[GKCacheObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___GKCacheObjectImageProtocol) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]"), v10, "-[GKCacheObject(GKCacheObjectImageProtocol) clearImages]", objc_msgSend(v12, "UTF8String"), 549));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageCacheKeyPathsByKey](self, "imageCacheKeyPathsByKey"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000DF028;
  v15[3] = &unk_1002C24E8;
  v15[4] = self;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v15);

}

- (BOOL)hasImages
{
  dispatch_queue_t current_queue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKCacheObject(GKCacheObjectImageProtocol) hasImages]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKCacheObject(GKCacheObjectImageProtocol) hasImages]", objc_msgSend(v8, "UTF8String"), 560));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  if ((-[GKCacheObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___GKCacheObjectImageProtocol) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]"), v10, "-[GKCacheObject(GKCacheObjectImageProtocol) hasImages]", objc_msgSend(v12, "UTF8String"), 561));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageCacheKeyPathsByKey](self, "imageCacheKeyPathsByKey"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000DF308;
  v17[3] = &unk_1002C24C0;
  v17[4] = self;
  v17[5] = &v18;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v17);

  v15 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v15;
}

@end
