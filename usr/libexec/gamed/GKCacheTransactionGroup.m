@implementation GKCacheTransactionGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)performOnManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  objc_super v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = v4;
  if (!os_log_GKGeneral)
    v6 = (id)GKOSLoggers(v4);
  v7 = os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F74D8(v7, v8, v9, v10, v11, v12, v13, v14);
  v17[1] = 3221225472;
  v17[2] = sub_100009E20;
  v17[3] = &unk_1002C2B98;
  v17[4] = self;
  v18 = v5;
  v16.receiver = self;
  v16.super_class = (Class)GKCacheTransactionGroup;
  v17[0] = _NSConcreteStackBlock;
  v15 = v5;
  -[GKCacheTransactionGroup perform:](&v16, "perform:", v17);

}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)notifyOnQueue:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C5A0;
  v10[3] = &unk_1002C2BE8;
  objc_copyWeak(&v12, &location);
  v8 = v7;
  v11 = v8;
  v9.receiver = self;
  v9.super_class = (Class)GKCacheTransactionGroup;
  -[GKCacheTransactionGroup notifyOnQueue:block:](&v9, "notifyOnQueue:block:", v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)stripGKPlayerInternalPIIs
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t isKindOfClass;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheTransactionGroup client](self, "client"));
  v4 = objc_msgSend(v3, "clientHasAnyPrivateEntitlement");

  if ((v4 & 1) == 0)
  {
    v6 = OBJC_IVAR___GKDispatchGroup__result;
    v7 = *(_QWORD *)&self->GKDispatchGroup_opaque[OBJC_IVAR___GKDispatchGroup__result];
    if (v7)
    {
      v8 = objc_opt_class(NSArray, v5);
      isKindOfClass = objc_opt_isKindOfClass(v7, v8);
      v11 = *(_QWORD *)&self->GKDispatchGroup_opaque[v6];
      if ((isKindOfClass & 1) != 0)
      {
        sub_1000F71CC(isKindOfClass, *(void **)&self->GKDispatchGroup_opaque[v6]);
      }
      else
      {
        v12 = objc_opt_class(NSDictionary, v10);
        v13 = objc_opt_isKindOfClass(v11, v12);
        v15 = *(_QWORD *)&self->GKDispatchGroup_opaque[v6];
        if ((v13 & 1) != 0)
        {
          v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->GKDispatchGroup_opaque[v6], "allValues"));
          sub_1000F71CC((uint64_t)v17, v17);

        }
        else
        {
          v16 = objc_opt_class(GKPlayerInternal, v14);
          if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
            objc_msgSend(*(id *)&self->GKDispatchGroup_opaque[v6], "sanitize");
        }
      }
    }
  }
}

- (GKClientProxy)client
{
  return self->_client;
}

- (void)dealloc
{
  NSManagedObjectContext *v3;
  NSManagedObjectContext *v4;
  objc_super v5;
  _QWORD v6[4];
  NSManagedObjectContext *v7;

  v3 = self->_context;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000A270;
  v6[3] = &unk_1002C2B48;
  v7 = v3;
  v4 = v3;
  GKIncrementContextTransactionCount(v4, -1, v6);

  v5.receiver = self;
  v5.super_class = (Class)GKCacheTransactionGroup;
  -[GKCacheTransactionGroup dealloc](&v5, "dealloc");
}

+ (id)transactionGroupWithName:(id)a3 context:(id)a4 client:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v10);
  v13 = os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F7400(v13, v14, v15, v16, v17, v18, v19, v20);
  v21 = objc_msgSend(objc_alloc((Class)a1), "initWithName:context:client:", v8, v9, v11);

  return v21;
}

- (GKCacheTransactionGroup)initWithName:(id)a3 context:(id)a4 client:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  GKCacheTransactionGroup *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!os_log_GKGeneral)
    v12 = (id)GKOSLoggers(v10);
  v13 = os_log_GKCache;
  if (os_log_type_enabled(os_log_GKCache, OS_LOG_TYPE_DEBUG))
    sub_1000F7430(v13, v14, v15, v16, v17, v18, v19, v20);
  v27.receiver = self;
  v27.super_class = (Class)GKCacheTransactionGroup;
  v21 = -[GKCacheTransactionGroup initWithName:](&v27, "initWithName:", v8);
  if (v21)
  {
    if (!v9)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assertion failed")));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheTransactionGroup.m"));
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent")));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (context != ((void *)0))\n[%s (%s:%d)]"), v22, "-[GKCacheTransactionGroup initWithName:context:client:]", objc_msgSend(v24, "UTF8String"), 93));

      +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v25);
    }
    -[GKCacheTransactionGroup setContext:](v21, "setContext:", v9);
    -[GKCacheTransactionGroup setClient:](v21, "setClient:", v11);
    GKIncrementContextTransactionCount(v21->_context, 1, 0);
  }

  return v21;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void)performOnQueue:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008A70;
  v8[3] = &unk_1002C2B98;
  v9 = a3;
  v10 = a4;
  v6 = v10;
  v7 = v9;
  -[GKCacheTransactionGroup perform:](self, "perform:", v8);

}

+ (id)dispatchGroupWithName:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot use dispatchGroupWithName with GKCacheTransactionGroup")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheTransactionGroup.m"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v3, "+[GKCacheTransactionGroup dispatchGroupWithName:]", objc_msgSend(v5, "UTF8String"), 58));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  return 0;
}

- (GKCacheTransactionGroup)transactionGroupWithName:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v6 = objc_alloc((Class)objc_opt_class(self, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheTransactionGroup context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GKCacheTransactionGroup client](self, "client"));
  v9 = objc_msgSend(v6, "initWithName:context:client:", v4, v7, v8);

  return (GKCacheTransactionGroup *)v9;
}

- (GKCacheTransactionGroup)initWithName:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cannot use initWithName: with GKCacheTransactionGroup")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKCacheTransactionGroup.m"));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (NO)\n[%s (%s:%d)]"), v4, "-[GKCacheTransactionGroup initWithName:]", objc_msgSend(v6, "UTF8String"), 81));

  +[NSException raise:format:](NSException, "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  return 0;
}

- (void)notifyOnMainQueueWithBlock:(id)a3
{
  id v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F73BC;
  v7[3] = &unk_1002C2BE8;
  objc_copyWeak(&v9, &location);
  v5 = v4;
  v8 = v5;
  v6.receiver = self;
  v6.super_class = (Class)GKCacheTransactionGroup;
  -[GKCacheTransactionGroup notifyOnMainQueueWithBlock:](&v6, "notifyOnMainQueueWithBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

@end
