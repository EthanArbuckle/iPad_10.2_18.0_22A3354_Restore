@implementation GKCompatibilityEntryCacheObject

+ (id)entityName
{
  return CFSTR("CompatibilityMatrixEntry");
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
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKCompatibilityEntryCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKCompatibilityEntryCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 2664));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GKCompatibilityEntryInternal internalRepresentation](GKCompatibilityEntryInternal, "internalRepresentation"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject bundleID](self, "bundleID"));
  objc_msgSend(v10, "setBundleID:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject adamID](self, "adamID"));
  objc_msgSend(v10, "setAdamID:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject platform](self, "platform"));
  objc_msgSend(v10, "setPlatform:", objc_msgSend(v13, "integerValue"));

  v14 = objc_alloc((Class)NSMutableSet);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject versions](self, "versions"));
  v16 = objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject versions](self, "versions"));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v38;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v21), "version"));
        objc_msgSend(v16, "addObject:", v22);

        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v19);
  }

  objc_msgSend(v10, "setVersions:", v16);
  v23 = objc_alloc((Class)NSMutableSet);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject shortVersions](self, "shortVersions"));
  v25 = objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v24, "count"));

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject shortVersions](self, "shortVersions"));
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v34;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(v26);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v30), "shortVersion"));
        objc_msgSend(v25, "addObject:", v31);

        v30 = (char *)v30 + 1;
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v28);
  }

  objc_msgSend(v10, "setShortVersions:", v25);
  return v10;
}

- (void)updateWithServerRepresentation:(id)a3
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  GKCompatibilityVersionCacheObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *j;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  GKCompatibilityShortVersionCacheObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  GKCompatibilityEntryCacheObject *v53;
  GKCompatibilityEntryCacheObject *v54;
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  _BYTE v67[128];

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKCompatibilityEntryCacheObject updateWithServerRepresentation:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "-[GKCompatibilityEntryCacheObject updateWithServerRepresentation:]", objc_msgSend(v10, "UTF8String"), 2687));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject managedObjectContext](self, "managedObjectContext"));
  v65.receiver = self;
  v65.super_class = (Class)GKCompatibilityEntryCacheObject;
  -[GKCacheObject updateWithServerRepresentation:](&v65, "updateWithServerRepresentation:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject versions](self, "versions"));
  objc_msgSend(v12, "_gkDeleteObjects:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("bundle-id")));
  -[GKCompatibilityEntryCacheObject setBundleID:](self, "setBundleID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("adam-id")));
  -[GKCompatibilityEntryCacheObject setAdamID:](self, "setAdamID:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("platform")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[GKGameDescriptor gamePlatformFromServerGameDescriptorString:](GKGameDescriptor, "gamePlatformFromServerGameDescriptorString:", v16)));
  -[GKCompatibilityEntryCacheObject setPlatform:](self, "setPlatform:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("versions")));
  v19 = v18;
  if (v14 && objc_msgSend(v18, "count"))
  {
    v50 = v16;
    v53 = self;
    v55 = v4;
    v20 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", objc_msgSend(v19, "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v48 = v19;
    v21 = v19;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    if (v22)
    {
      v24 = v22;
      v25 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v62 != v25)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
          v28 = objc_opt_class(NSDictionary, v23);
          if ((objc_opt_isKindOfClass(v27, v28) & 1) != 0)
            v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKey:", CFSTR("bundle-version")));
          else
            v29 = v27;
          v30 = v29;
          if (v29)
          {
            v31 = -[GKCacheObject initWithManagedObjectContext:]([GKCompatibilityVersionCacheObject alloc], "initWithManagedObjectContext:", v12);
            -[GKCompatibilityVersionCacheObject setVersion:](v31, "setVersion:", v30);
            objc_msgSend(v20, "addObject:", v31);

          }
        }
        v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      }
      while (v24);
    }

    self = v53;
    -[GKCompatibilityEntryCacheObject setVersions:](v53, "setVersions:", v20);

    v4 = v55;
    v19 = v48;
    v16 = v50;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[GKCompatibilityEntryCacheObject shortVersions](self, "shortVersions"));
  objc_msgSend(v12, "_gkDeleteObjects:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("short-versions")));
  v34 = v33;
  if (v14 && objc_msgSend(v33, "count"))
  {
    v49 = v19;
    v51 = v16;
    v52 = v14;
    v54 = self;
    v56 = v4;
    v35 = objc_msgSend(objc_alloc((Class)NSMutableOrderedSet), "initWithCapacity:", objc_msgSend(v34, "count"));
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v47 = v34;
    v36 = v34;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    if (v37)
    {
      v39 = v37;
      v40 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v39; j = (char *)j + 1)
        {
          if (*(_QWORD *)v58 != v40)
            objc_enumerationMutation(v36);
          v42 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
          v43 = objc_opt_class(NSDictionary, v38);
          if ((objc_opt_isKindOfClass(v42, v43) & 1) != 0)
            v44 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKey:", CFSTR("short-bundle-version")));
          else
            v44 = v42;
          v45 = v44;
          if (v44)
          {
            v46 = -[GKCacheObject initWithManagedObjectContext:]([GKCompatibilityShortVersionCacheObject alloc], "initWithManagedObjectContext:", v12);
            -[GKCompatibilityShortVersionCacheObject setShortVersion:](v46, "setShortVersion:", v45);
            objc_msgSend(v35, "addObject:", v46);

          }
        }
        v39 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      }
      while (v39);
    }

    -[GKCompatibilityEntryCacheObject setShortVersions:](v54, "setShortVersions:", v35);
    v4 = v56;
    v14 = v52;
    v19 = v49;
    v16 = v51;
    v34 = v47;
  }

}

@end
