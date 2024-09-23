@implementation GKListCacheObject

+ (Class)entryClass
{
  return (Class)objc_opt_class(GKListEntryCacheObject, a2);
}

+ (id)relationshipKeyPathsForPrefetch
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("entries"), 0);
}

- (void)updateSeed
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  -[GKListCacheObject setSeed:](self, "setSeed:", v3);

}

- (id)internalRepresentation
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
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKListCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKListCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 2259));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v16), "internalRepresentation"));
        if (v17)
          objc_msgSend(v11, "addObject:", v17);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v11;
}

- (void)reorderEntry:(id)a3 toIndex:(int64_t)a4
{
  dispatch_queue_t current_queue;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  GKListCacheObject *v13;
  void *v14;
  id v15;

  v15 = a3;
  current_queue = dispatch_get_current_queue();
  v7 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v7, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKListCacheObject reorderEntry:toIndex:]", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v9, "-[GKListCacheObject reorderEntry:toIndex:]", objc_msgSend(v11, "UTF8String"), 2272));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
  }

  v13 = (GKListCacheObject *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "list"));
  if (v13 == self)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject mutableOrderedSetValueForKey:](self, "mutableOrderedSetValueForKey:", CFSTR("entries")));
    objc_msgSend(v14, "insertObject:atIndex:", v15, a4);
    -[GKListCacheObject updateSeed](self, "updateSeed");

  }
}

- (void)removeEntriesMatchingPredicate:(id)a3
{
  dispatch_queue_t current_queue;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  current_queue = dispatch_get_current_queue();
  v5 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v5, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKListCacheObject removeEntriesMatchingPredicate:]", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v7, "-[GKListCacheObject removeEntriesMatchingPredicate:]", objc_msgSend(v9, "UTF8String"), 2283));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:", v15));

  if (objc_msgSend(v13, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject managedObjectContext](self, "managedObjectContext"));
    objc_msgSend(v14, "_gkDeleteObjects:", v13);

    -[GKListCacheObject updateSeed](self, "updateSeed");
  }

}

- (void)updateEntriesWithRepresentations:(id)a3 entryForRepresentation:(id)a4 reuseEntriesByIndex:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t (**v9)(id, _QWORD, void *);
  dispatch_queue_t current_queue;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *j;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *k;
  void *v45;
  void *v46;
  void *v47;
  GKListCacheObject *v48;
  void *v49;
  id obj;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];

  v5 = a5;
  v8 = a3;
  v9 = (uint64_t (**)(id, _QWORD, void *))a4;
  current_queue = dispatch_get_current_queue();
  v11 = objc_claimAutoreleasedReturnValue(current_queue);
  v47 = v8;
  v48 = self;
  if (dispatch_queue_get_specific(v11, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v13, "-[GKListCacheObject updateEntriesWithRepresentations:entryForRepresentation:reuseEntriesByIndex:]", objc_msgSend(v15, "UTF8String"), 2296));

    self = v48;
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject managedObjectContext](self, "managedObjectContext"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", objc_msgSend(v8, "count")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToWeakObjectsMapTable](NSMapTable, "weakToWeakObjectsMapTable"));
  if (v5)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
    v20 = (char *)objc_msgSend(v19, "count");

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v8;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (!v21)
      goto LABEL_26;
    v22 = v21;
    v23 = 0;
    v24 = *(_QWORD *)v61;
    v49 = v17;
    while (1)
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v61 != v24)
          objc_enumerationMutation(obj);
        v26 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
        if ((char *)i + v23 >= v20)
        {
          v29 = v9[2](v9, *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i), v49);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v29);
          if (!v28)
            goto LABEL_14;
LABEL_13:
          objc_msgSend(v51, "addObject:", v28);
          objc_msgSend(v18, "setObject:forKey:", v26, v28);
          goto LABEL_14;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](v48, "entries"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndex:", (char *)i + v23));

        if (v28)
          goto LABEL_13;
LABEL_14:

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
      v23 += (uint64_t)i;
      v17 = v49;
      if (!v22)
        goto LABEL_26;
    }
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v30 = v8;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(_QWORD *)v57 != v33)
          objc_enumerationMutation(v30);
        v35 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)j);
        v36 = v9[2](v9, v35, v17);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        if (v37)
        {
          objc_msgSend(v51, "addObject:", v37);
          objc_msgSend(v18, "setObject:forKey:", v35, v37);
        }

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    }
    while (v32);
  }
LABEL_26:

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](v48, "entries"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSetWithOrderedSet:](NSMutableOrderedSet, "orderedSetWithOrderedSet:", v38));

  objc_msgSend(v39, "minusOrderedSet:", v51);
  -[GKListCacheObject setEntries:](v48, "setEntries:", v51);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v40 = v51;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v53;
    do
    {
      for (k = 0; k != v42; k = (char *)k + 1)
      {
        if (*(_QWORD *)v53 != v43)
          objc_enumerationMutation(v40);
        v45 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)k);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v45));
        objc_msgSend(v45, "updateWithServerRepresentation:", v46);

      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v42);
  }

  if (objc_msgSend(v39, "count"))
    objc_msgSend(v17, "_gkDeleteObjects:", v39);
  -[GKListCacheObject updateSeed](v48, "updateSeed");

}

- (id)findEntry:(id)a3
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
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKListCacheObject findEntry:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKListCacheObject findEntry:]", objc_msgSend(v10, "UTF8String"), 2352));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000E8778;
  v18[3] = &unk_1002C27D0;
  v13 = v4;
  v19 = v13;
  v14 = objc_msgSend(v12, "indexOfObjectPassingTest:", v18);

  if (v14 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = 0;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndex:", v14));

  }
  return v15;
}

- (id)entryPassingTest:(id)a3
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
  id v13;
  void *v14;
  void *v15;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKListCacheObject entryPassingTest:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKListCacheObject entryPassingTest:]", objc_msgSend(v10, "UTF8String"), 2370));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
  v13 = objc_msgSend(v12, "indexOfObjectPassingTest:", v4);

  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 0;
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", v13));

  }
  return v14;
}

- (id)entriesPassingTest:(id)a3
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
  void *v14;
  void *v15;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKListCacheObject entriesPassingTest:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKListCacheObject entriesPassingTest:]", objc_msgSend(v10, "UTF8String"), 2381));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexesOfObjectsPassingTest:", v4));

  if (objc_msgSend(v13, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKListCacheObject entries](self, "entries"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectsAtIndexes:", v13));

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
