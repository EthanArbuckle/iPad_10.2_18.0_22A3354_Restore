@implementation GKPlayerProfileCacheObject

+ (id)selfPlayerID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_familiarityLookup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", &off_1002DB7D8));

  return v3;
}

+ (id)_familiarityLookup
{
  dispatch_queue_t current_queue;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  dispatch_queue_t v9;
  NSObject *v10;
  void *specific;
  id v12;

  current_queue = dispatch_get_current_queue();
  v3 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v3, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) _familiarityLookup]", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v5, "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) _familiarityLookup]", objc_msgSend(v7, "UTF8String"), 1092));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v8);
  }

  v9 = dispatch_get_current_queue();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  specific = dispatch_queue_get_specific(v10, CFSTR("com.apple.gamed.GKPlayerProfileCacheObject.familiarityLookup"));
  v12 = (id)objc_claimAutoreleasedReturnValue(specific);
  if (!v12)
  {
    v12 = objc_alloc_init((Class)NSMutableDictionary);
    dispatch_queue_set_specific(v10, CFSTR("com.apple.gamed.GKPlayerProfileCacheObject.familiarityLookup"), v12, (dispatch_function_t)_GKLookupRelease);
  }

  return v12;
}

+ (id)playersByFamiliarity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[5];
  _QWORD v39[5];

  v4 = a3;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_familiarityLookup"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", &off_1002DB7D8));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", &off_1002DB7F0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", &off_1002DB808));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", &off_1002DB820));
  v8 = objc_msgSend(v4, "count");
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000E296C;
  v28[3] = &unk_1002C2588;
  v29 = v22;
  v30 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", 1));
  v31 = v5;
  v32 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", v8));
  v33 = v6;
  v34 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", v8));
  v35 = v7;
  v36 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", v8));
  v37 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", v8));
  v9 = v37;
  v21 = v36;
  v26 = v7;
  v10 = v34;
  v25 = v6;
  v11 = v32;
  v24 = v5;
  v12 = v30;
  v23 = v22;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v28);

  v38[0] = &off_1002DB7D8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
  v39[0] = v13;
  v38[1] = &off_1002DB7F0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
  v39[1] = v14;
  v38[2] = &off_1002DB808;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
  v39[2] = v15;
  v38[3] = &off_1002DB820;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allObjects"));
  v39[3] = v16;
  v38[4] = &off_1002DB838;
  v17 = v9;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
  v39[4] = v18;
  v20 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 5));

  return v20;
}

+ (id)uniqueAttributeName
{
  return CFSTR("playerID");
}

+ (const)uniqueObjectIDLookupKey
{
  return CFSTR("GKPlayerProfileCacheObjectUniqueObjectIDLookupKey");
}

- (BOOL)isValid
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKPlayerProfileCacheObject;
  if (!-[GKExpiringCacheObject isValid](&v6, "isValid")
    || (-[GKPlayerProfileCacheObject availablePieces](self, "availablePieces") & 1) == 0)
  {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject alias](self, "alias"));
  v3 = v4 != 0;

  return v3;
}

- (void)invalidate
{
  objc_super v3;

  -[GKPlayerProfileCacheObject setAvailablePieces:](self, "setAvailablePieces:", 0);
  v3.receiver = self;
  v3.super_class = (Class)GKPlayerProfileCacheObject;
  -[GKExpiringCacheObject invalidate](&v3, "invalidate");
}

- (BOOL)isUnderage
{
  id v2;
  void *v3;
  unsigned __int8 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKPlayerProfileCacheObject;
  v2 = -[GKPlayerProfileCacheObject primitiveValueForKey:](&v6, "primitiveValueForKey:", CFSTR("underage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isFindable
{
  id v2;
  void *v3;
  unsigned __int8 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKPlayerProfileCacheObject;
  v2 = -[GKPlayerProfileCacheObject primitiveValueForKey:](&v6, "primitiveValueForKey:", CFSTR("findable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
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
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKPlayerProfileCacheObject clearImages]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKPlayerProfileCacheObject clearImages]", objc_msgSend(v8, "UTF8String"), 736));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  if ((-[GKPlayerProfileCacheObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___GKCacheObjectImageProtocol) & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]"), v10, "-[GKPlayerProfileCacheObject clearImages]", objc_msgSend(v12, "UTF8String"), 737));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageCacheKeyPathsByKey](self, "imageCacheKeyPathsByKey"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E03F0;
  v15[3] = &unk_1002C24E8;
  v15[4] = self;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v15);

  -[GKPlayerProfileCacheObject deleteCachedAvatars](self, "deleteCachedAvatars");
}

- (void)deleteCachedAvatars
{
  id v3;
  dispatch_queue_t current_queue;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (!os_log_GKGeneral)
    v3 = (id)GKOSLoggers(self);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F684C();
  current_queue = dispatch_get_current_queue();
  v5 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v5, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKPlayerProfileCacheObject deleteCachedAvatars]", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v7, "-[GKPlayerProfileCacheObject deleteCachedAvatars]", objc_msgSend(v9, "UTF8String"), 754));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject playerID](self, "playerID"));
  v12 = GKAvatarSubdirectoryNameForPlayerID();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  -[GKPlayerProfileCacheObject deleteCachedImage:](self, "deleteCachedImage:", v13);
}

- (void)deleteCachedImage:(id)a3
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
  void *v14;
  id v15;
  id v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  id v20;
  objc_super v21;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F68D8();
  current_queue = dispatch_get_current_queue();
  v8 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v8, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKPlayerProfileCacheObject deleteCachedImage:]", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v10, "-[GKPlayerProfileCacheObject deleteCachedImage:]", objc_msgSend(v12, "UTF8String"), 765));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v5));
  v15 = objc_msgSend(v14, "isFileURL");
  if ((_DWORD)v15)
  {
    if (!os_log_GKGeneral)
      v16 = (id)GKOSLoggers(v15);
    if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
      sub_1000F6878();
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v18 = objc_msgSend(v17, "removeItemAtURL:error:", v14, 0);

    if (v18)
    {
      if (!os_log_GKGeneral)
        v20 = (id)GKOSLoggers(v19);
      if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
        sub_1000F6648();
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)GKPlayerProfileCacheObject;
    -[GKCacheObject deleteCachedImage:](&v21, "deleteCachedImage:", v5);
  }

}

+ (id)localPlayerInManagedObjectContext:(id)a3
{
  id v4;
  dispatch_queue_t current_queue;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id AssociatedObject;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  current_queue = dispatch_get_current_queue();
  v6 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v6, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:]", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v8, "+[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:]", objc_msgSend(v10, "UTF8String"), 783));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }

  AssociatedObject = objc_getAssociatedObject(v4, CFSTR("GKLocalPlayerObjectIDKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectRegisteredForID:", v13));
  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "selfPlayerID"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("playerID = %@"), v15));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[GKCacheObject firstObjectMatchingPredicate:context:](GKPlayerProfileCacheObject, "firstObjectMatchingPredicate:context:", v16, v4));

      objc_setAssociatedObject(v4, CFSTR("GKLocalPlayerObjectIDKey"), v13, (void *)1);
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

+ (id)playerProfileWithPlayerID:(id)a3 inManagedObjectContext:(id)a4
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
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;

  v6 = a3;
  v7 = a4;
  current_queue = dispatch_get_current_queue();
  v9 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v9, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "+[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:]", objc_msgSend(v13, "UTF8String"), 798));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);
  }

  if (v6
    && (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "selfPlayerID")),
        v16 = objc_msgSend(v6, "isEqualToString:", v15),
        v15,
        !v16))
  {
    v21 = v6;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "playerProfilesWithPlayerIDs:inManagedObjectContext:", v18, v7));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastObject"));

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localPlayerInManagedObjectContext:", v7));
  }

  return v17;
}

+ (id)profileForPlayer:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerID"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "playerID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject playerProfileWithPlayerID:inManagedObjectContext:](GKPlayerProfileCacheObject, "playerProfileWithPlayerID:inManagedObjectContext:", v8, v6));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GKPlayerProfileCacheObject localPlayerInManagedObjectContext:](GKPlayerProfileCacheObject, "localPlayerInManagedObjectContext:", v6));
  }

  return v9;
}

+ (id)playerProfilesWithPlayers:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_gkFilterWithBlock:", &stru_1002C2510));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "playerProfilesWithPlayerIDs:inManagedObjectContext:", v7, v6));

  return v8;
}

+ (id)playerProfilesWithPlayerIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  dispatch_queue_t current_queue;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!os_log_GKGeneral)
    v9 = (id)GKOSLoggers(v7);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F6904();
  current_queue = dispatch_get_current_queue();
  v11 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v11, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "+[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:]", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v13, "+[GKPlayerProfileCacheObject playerProfilesWithPlayerIDs:inManagedObjectContext:]", objc_msgSend(v15, "UTF8String"), 827));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v16);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueObjectIDLookupWithContext:", v8));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000E0F20;
  v21[3] = &unk_1002C2538;
  v22 = v8;
  v23 = a1;
  v18 = v8;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "uniqueObjectsForKeys:context:newObject:", v6, v18, v21));

  return v19;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4
{
  -[GKPlayerProfileCacheObject updateWithServerRepresentation:expirationDate:pieces:](self, "updateWithServerRepresentation:expirationDate:pieces:", a3, a4, 0);
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
  void *v21;
  void *v22;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F6930();
  current_queue = dispatch_get_current_queue();
  v8 = objc_claimAutoreleasedReturnValue(current_queue);
  v9 = &IDSCopyIDForPhoneNumber_ptr;
  if (dispatch_queue_get_specific(v8, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKPlayerProfileCacheObject updateImagesWithImageURLs:]", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v11, "-[GKPlayerProfileCacheObject updateImagesWithImageURLs:]", objc_msgSend(v13, "UTF8String"), 844));

    v9 = &IDSCopyIDForPhoneNumber_ptr;
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v14);

  }
  if ((-[GKPlayerProfileCacheObject conformsToProtocol:](self, "conformsToProtocol:", &OBJC_PROTOCOL___GKCacheObjectImageProtocol) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastPathComponent")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ ([self conformsToProtocol:@protocol(GKCacheObjectImageProtocol)])\n[%s (%s:%d)]"), v15, "-[GKPlayerProfileCacheObject updateImagesWithImageURLs:]", objc_msgSend(v17, "UTF8String"), 845));

    objc_msgSend(v9[239], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v18);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("template")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject valueForKeyPath:](self, "valueForKeyPath:", CFSTR("imageTemplate")));
  v22 = v21;
  if (v21 != v20 && (objc_msgSend(v21, "isEqualToString:", v20) & 1) == 0)
  {
    -[GKPlayerProfileCacheObject clearImages](self, "clearImages");
    objc_msgSend(v19, "addObject:", CFSTR("template"));
    -[GKPlayerProfileCacheObject setValue:forKeyPath:](self, "setValue:forKeyPath:", v20, CFSTR("imageTemplate"));
  }

  return v19;
}

- (void)updateWithServerRepresentation:(id)a3 expirationDate:(id)a4 pieces:(unsigned __int8)a5
{
  id v7;
  id v8;
  dispatch_queue_t current_queue;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  id v53;
  void *v54;
  _UNKNOWN **v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  _QWORD v72[5];
  objc_super v73;

  v7 = a3;
  v8 = a4;
  current_queue = dispatch_get_current_queue();
  v10 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v10, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKPlayerProfileCacheObject updateWithServerRepresentation:expirationDate:pieces:]", v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v12, "-[GKPlayerProfileCacheObject updateWithServerRepresentation:expirationDate:pieces:]", objc_msgSend(v14, "UTF8String"), 868));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v15);
  }

  v73.receiver = self;
  v73.super_class = (Class)GKPlayerProfileCacheObject;
  -[GKExpiringCacheObject updateWithServerRepresentation:expirationDate:](&v73, "updateWithServerRepresentation:expirationDate:", v7, v8);
  if (v7)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", GKPlayerIDKey));
    v69 = (void *)v16;
    if (v16)
    {
      -[GKPlayerProfileCacheObject setPlayerID:](self, "setPlayerID:", v16);
    }
    else
    {
      if (!os_log_GKGeneral)
        v17 = (id)GKOSLoggers(0);
      if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
        sub_1000F69E8();
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKAliasKey));
    -[GKPlayerProfileCacheObject setAlias:](self, "setAlias:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKPlayerStatusKey));
    -[GKPlayerProfileCacheObject setStatus:](self, "setStatus:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("pb-account")));
    -[GKPlayerProfileCacheObject setPurpleBuddyAccount:](self, "setPurpleBuddyAccount:", objc_msgSend(v20, "BOOLValue"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKUnderageKey));
    v22 = v21;
    if (v21)
      -[GKPlayerProfileCacheObject setUnderage:](self, "setUnderage:", objc_msgSend(v21, "BOOLValue"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKFindableKey));

    if (v23)
      -[GKPlayerProfileCacheObject setFindable:](self, "setFindable:", objc_msgSend(v23, "BOOLValue"));
    if (-[GKPlayerProfileCacheObject isLocalPlayer](self, "isLocalPlayer"))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject photoPendingExpirationDate](self, "photoPendingExpirationDate"));
      objc_msgSend(v24, "timeIntervalSinceNow");
      v26 = v25;

      if (v26 < 0.0)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", GKPhotoPendingKey));
        -[GKPlayerProfileCacheObject setPhotoPending:](self, "setPhotoPending:", objc_msgSend(v27, "BOOLValue"));

      }
      if (-[GKPlayerProfileCacheObject photoPending](self, "photoPending"))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheObject imageURLDictionary](self, "imageURLDictionary"));
        if (objc_msgSend(v28, "count"))
        {
          v72[0] = _NSConcreteStackBlock;
          v72[1] = 3221225472;
          v72[2] = sub_1000E1B44;
          v72[3] = &unk_1002C2560;
          v72[4] = self;
          objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v72);
        }
        else
        {
          -[GKPlayerProfileCacheObject setPhotoPending:](self, "setPhotoPending:", 0);
        }

      }
      +[GKContactsIntegrationUserSettings applySettingsToObject:fromResults:](GKContactsIntegrationUserSettings, "applySettingsToObject:fromResults:", self, v7);
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKPrivacySettingsKey));
    v30 = v29;
    if (v29)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", GKPrivacySettingsFriendsKey));
      -[GKPlayerProfileCacheObject setFriendsVisibility:](self, "setFriendsVisibility:", sub_1000E1BE8((uint64_t)v31, v31));

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", GKPrivacySettingsAchievementsKey));
      -[GKPlayerProfileCacheObject setAchievementsVisibility:](self, "setAchievementsVisibility:", sub_1000E1BE8((uint64_t)v32, v32));

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", GKPrivacySettingsGamesPlayedKey));
      -[GKPlayerProfileCacheObject setGamesPlayedVisibility:](self, "setGamesPlayedVisibility:", sub_1000E1BE8((uint64_t)v33, v33));

    }
    else
    {
      -[GKPlayerProfileCacheObject setFriendsVisibility:](self, "setFriendsVisibility:", 2);
      -[GKPlayerProfileCacheObject setAchievementsVisibility:](self, "setAchievementsVisibility:", 2);
      -[GKPlayerProfileCacheObject setGamesPlayedVisibility:](self, "setGamesPlayedVisibility:", 2);
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKGlobalFriendListAccessKey));
    -[GKPlayerProfileCacheObject setGlobalFriendListAccess:](self, "setGlobalFriendListAccess:", sub_1000E1C58((uint64_t)v34, v34));

    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKIsArcadeSubscriberKey));
    v36 = v35;
    if (v35)
      v37 = objc_msgSend(v35, "BOOLValue");
    else
      v37 = 0;
    v70 = v8;
    -[GKPlayerProfileCacheObject setIsArcadeSubscriber:](self, "setIsArcadeSubscriber:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", GKPhotoURLsKey));
    if (v38 && (-[GKPlayerProfileCacheObject photoPending](self, "photoPending") & 1) == 0)
      v39 = -[GKPlayerProfileCacheObject updateImagesWithImageURLs:](self, "updateImagesWithImageURLs:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", GKAvatarTypeKey));
    if (v40)
      -[GKPlayerProfileCacheObject setAvatarType:](self, "setAvatarType:", v40);
    v68 = v23;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKFriendBiDirectionalKey));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKFriendPlayedWithKey));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", GKFriendPlayedNearbyKey));
    v67 = v42;
    if (v41)
    {
      v66 = v38;
      v44 = v40;
      v45 = v30;
      v46 = v36;
      v47 = v43;
      v48 = (unint64_t)objc_msgSend(v41, "integerValue");
      v49 = v48 | (2 * (_QWORD)objc_msgSend(v42, "integerValue"));
      v43 = v47;
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v49 | (4 * (_QWORD)objc_msgSend(v47, "integerValue"))));
      -[GKPlayerProfileCacheObject setFriendLevel:](self, "setFriendLevel:", v50);

      v52 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v53 = (id)GKOSLoggers(v51);
        v52 = os_log_GKGeneral;
      }
      v36 = v46;
      v30 = v45;
      v40 = v44;
      v38 = v66;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        sub_1000F695C(v52, self);
    }
    else
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject firstName](self, "firstName"));

      if (v54)
        v55 = &off_1002DB7C0;
      else
        v55 = &off_1002DB7A8;
      -[GKPlayerProfileCacheObject setFriendLevel:](self, "setFriendLevel:", v55);
    }
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", GKNumberOfFriendsKey));
    v57 = objc_msgSend(v56, "integerValue");

    if (v57 != (id)(int)-[GKPlayerProfileCacheObject numberOfFriends](self, "numberOfFriends"))
      -[GKPlayerProfileCacheObject setNumberOfFriends:](self, "setNumberOfFriends:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", GKNumberOfGamesPlayedKey));
    -[GKPlayerProfileCacheObject setNumberOfGames:](self, "setNumberOfGames:", objc_msgSend(v58, "integerValue"));

    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", GKNumberOfAchievementsKey));
    -[GKPlayerProfileCacheObject setNumberOfAchievements:](self, "setNumberOfAchievements:", objc_msgSend(v59, "integerValue"));

    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", GKNumberOfAchievementPointsKey));
    -[GKPlayerProfileCacheObject setNumberOfAchievementPoints:](self, "setNumberOfAchievementPoints:", objc_msgSend(v60, "integerValue"));

    if ((a5 & 0x10) != 0)
    {
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", GKNumberOfFriendsInCommonKey));
      -[GKPlayerProfileCacheObject setNumberOfFriendsInCommon:](self, "setNumberOfFriendsInCommon:", objc_msgSend(v61, "integerValue"));

      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", GKNumberOfGamesInCommonKey));
      -[GKPlayerProfileCacheObject setNumberOfGamesInCommon:](self, "setNumberOfGamesInCommon:", objc_msgSend(v62, "integerValue"));

    }
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("allow-friend-invites-from-challenges")));
    -[GKPlayerProfileCacheObject setAllowChallengeFriendInvites:](self, "setAllowChallengeFriendInvites:", objc_msgSend(v63, "isEqualToString:", CFSTR("allowed")));

    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("allow-friend-invites-from-multiplayer-invites")));
    -[GKPlayerProfileCacheObject setAllowMultiplayerFriendInvites:](self, "setAllowMultiplayerFriendInvites:", objc_msgSend(v64, "isEqualToString:", CFSTR("allowed")));

    if ((a5 & 0x80) != 0)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("check-friend-invitation-ability")));
      -[GKPlayerProfileCacheObject setAllowReceivingFriendInvites:](self, "setAllowReceivingFriendInvites:", objc_msgSend(v65, "BOOLValue"));

    }
    -[GKPlayerProfileCacheObject setAvailablePieces:](self, "setAvailablePieces:");

    v8 = v70;
  }

}

- (id)internalRepresentationWithPieces:(unsigned __int8)a3
{
  dispatch_queue_t current_queue;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  Class *v12;

  current_queue = dispatch_get_current_queue();
  v5 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v5, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKPlayerProfileCacheObject internalRepresentationWithPieces:]", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v7, "-[GKPlayerProfileCacheObject internalRepresentationWithPieces:]", objc_msgSend(v9, "UTF8String"), 1031));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v10);
  }

  v11 = -[GKPlayerProfileCacheObject familiarity](self, "familiarity") - 1;
  if (v11 > 3)
    v12 = (Class *)GKPlayerInternal_ptr;
  else
    v12 = (Class *)off_1002C2AF8[v11];
  return objc_msgSend(objc_alloc(*v12), "initWithCacheObject:", self);
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

  current_queue = dispatch_get_current_queue();
  v4 = objc_claimAutoreleasedReturnValue(current_queue);
  if (dispatch_queue_get_specific(v4, CFSTR("com.apple.gamed.cachequeue")) != CFSTR("com.apple.gamed.cachequeue"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s not invoked on managed object context queue at %@"), "-[GKPlayerProfileCacheObject internalRepresentation]", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (_queueContext == (__bridge const void * _Nonnull)GKCacheQueueID)\n[%s (%s:%d)]"), v6, "-[GKPlayerProfileCacheObject internalRepresentation]", objc_msgSend(v8, "UTF8String"), 1057));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }

  return -[GKPlayerProfileCacheObject internalRepresentationWithPieces:](self, "internalRepresentationWithPieces:", (unint64_t)-[GKPlayerProfileCacheObject availablePieces](self, "availablePieces") & 0xDF);
}

+ (id)entityName
{
  return CFSTR("PlayerProfile");
}

- (void)expireRecentMatchesWithGame:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject managedObjectContext](self, "managedObjectContext"));
  if (v8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("player = %@ AND game = %@"), self, v8));
    +[GKExpiringCacheObject expireObjectsMatchingPredicate:context:](GKRecentPlayerListCacheObject, "expireObjectsMatchingPredicate:context:", v5, v4);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("player = %@ && game == nil"), self));
  +[GKExpiringCacheObject expireObjectsMatchingPredicate:context:](GKRecentPlayerListCacheObject, "expireObjectsMatchingPredicate:context:", v6, v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("player = %@ OR otherPlayer = %@"), self, self));
  +[GKExpiringCacheObject expireObjectsMatchingPredicate:context:](GKRecentGameListCacheObject, "expireObjectsMatchingPredicate:context:", v7, v4);

}

+ (void)buildFamiliarilyLookupForProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  _QWORD v20[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playerID"));

  if (v5)
  {
    v19[0] = &off_1002DB7D8;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "playerID"));
    v18 = a1;
    v20[0] = v17;
    v19[1] = &off_1002DB7F0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "friendList"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "playerIDs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    v20[1] = v7;
    v19[2] = &off_1002DB808;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "friendRequestList"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "playerIDs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
    v20[2] = v10;
    v19[3] = &off_1002DB820;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "friendRecommendationList"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playerIDs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));
    v20[3] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 4));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_familiarityLookup"));
    objc_msgSend(v15, "addEntriesFromDictionary:", v14);

  }
}

+ (int)familiarityForPlayerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (!v4)
    goto LABEL_11;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_familiarityLookup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_1002DB7D8));
  if (objc_msgSend(v6, "isEqualToString:", v4))
  {

    v7 = 1;
    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_1002DB7F0));
  if ((objc_msgSend(v8, "containsObject:", v4) & 1) != 0)
  {
    v7 = 2;
    v9 = 1;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_1002DB808));
    if ((objc_msgSend(v10, "containsObject:", v4) & 1) != 0)
    {
      v7 = 3;
      v9 = 1;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_1002DB820));
      v9 = objc_msgSend(v11, "containsObject:", v4);

      v7 = 4;
    }

  }
  if (!v9)
LABEL_11:
    v7 = 0;
LABEL_12:

  return v7;
}

- (int)familiarity
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject playerID](self, "playerID"));
  v3 = +[GKPlayerProfileCacheObject familiarityForPlayerID:](GKPlayerProfileCacheObject, "familiarityForPlayerID:", v2);

  return v3;
}

+ (void)addFamiliarPlayerIDs:(id)a3 familiarity:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v4 = *(_QWORD *)&a4;
  v14 = a3;
  if ((_DWORD)v4 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (familiarity != GKPlayerFamiliaritySelf)\n[%s (%s:%d)]"), v6, "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) addFamiliarPlayerIDs:familiarity:]", objc_msgSend(v8, "UTF8String"), 1164));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_familiarityLookup"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));
  v13 = objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v13, "addObjectsFromArray:", v14);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v11);

}

+ (void)removeFamiliarPlayerIDs:(id)a3 familiarity:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = *(_QWORD *)&a4;
  v14 = a3;
  if ((_DWORD)v4 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (familiarity != GKPlayerFamiliaritySelf)\n[%s (%s:%d)]"), v6, "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) removeFamiliarPlayerIDs:familiarity:]", objc_msgSend(v8, "UTF8String"), 1177));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_familiarityLookup"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v11));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E26EC;
  v15[3] = &unk_1002C0A90;
  v16 = objc_msgSend(v12, "mutableCopy");
  v13 = v16;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v11);

}

+ (void)setFamiliarPlayerIDs:(id)a3 familiarity:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = *(_QWORD *)&a4;
  v13 = a3;
  if ((_DWORD)v4 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheObject.m"));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (familiarity != GKPlayerFamiliaritySelf)\n[%s (%s:%d)]"), v6, "+[GKPlayerProfileCacheObject(GKPlayerFamiliarity) setFamiliarPlayerIDs:familiarity:]", objc_msgSend(v8, "UTF8String"), 1198));

    +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_familiarityLookup"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v11);

}

- (BOOL)isLocalPlayer
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GKPlayerProfileCacheObject playerID](self, "playerID"));
  v3 = +[GKPlayerProfileCacheObject familiarityForPlayerID:](GKPlayerProfileCacheObject, "familiarityForPlayerID:", v2) == 1;

  return v3;
}

+ (unsigned)piecesToLoadForFamiliarity:(int)a3
{
  unint64_t v3;

  v3 = 0x8183032B01uLL >> (8 * a3);
  if (a3 >= 5)
    LOBYTE(v3) = 1;
  return v3;
}

+ (id)filterPlayerIDs:(id)a3 familiarity:(int)a4 includeSelf:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "playersByFamiliarity:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v6));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));

  if (v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", &off_1002DB7D8));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "setByAddingObjectsFromArray:", v13));

    v12 = (void *)v14;
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000E2B7C;
  v18[3] = &unk_1002BF9B0;
  v19 = v12;
  v15 = v12;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_gkFilterWithBlock:", v18));

  return v16;
}

@end
