@implementation MapsTokenStorage

- (MapsTokenStorage)initWithDelegate:(id)a3 tokenGroupName:(id)a4
{
  id v6;
  id v7;
  MapsTokenStorage *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  NSString *v19;
  NSString *tokenGroupName;
  uint64_t v21;
  NSHashTable *observers;
  id v23;
  const char *v24;
  dispatch_queue_attr_t v25;
  NSObject *v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *isolationQueue;
  uint64_t v29;
  NSHashTable *tokens;
  objc_super v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  __CFString *v36;

  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MapsTokenStorage;
  v8 = -[MapsTokenStorage init](&v32, "init");
  if (v8)
  {
    v9 = sub_100C1E0BC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      v19 = (NSString *)objc_msgSend(v7, "copy");
      tokenGroupName = v8->_tokenGroupName;
      v8->_tokenGroupName = v19;

      v21 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
      observers = v8->_observers;
      v8->_observers = (NSHashTable *)v21;

      -[NSHashTable addObject:](v8->_observers, "addObject:", v6);
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.Maps.Tokens.%@"), v7)));
      v24 = (const char *)objc_msgSend(v23, "UTF8String");
      v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      v27 = dispatch_queue_create(v24, v26);
      isolationQueue = v8->_isolationQueue;
      v8->_isolationQueue = (OS_dispatch_queue *)v27;

      v29 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
      tokens = v8->_tokens;
      v8->_tokens = (NSHashTable *)v29;

      goto LABEL_13;
    }
    v11 = v6;
    v12 = v11;
    if (!v11)
    {
      v18 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_9;
      }

    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543618;
    v34 = v7;
    v35 = 2114;
    v36 = v18;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "CREATE %{public}@ storage for %{public}@", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:

  return v8;
}

- (MapsTokenStorage)initWithDelegate:(id)a3 tokenGroupName:(id)a4 callbackQueue:(id)a5
{
  id v8;
  MapsTokenStorage *v9;
  MapsTokenStorage *v10;

  v8 = a5;
  v9 = -[MapsTokenStorage initWithDelegate:tokenGroupName:](self, "initWithDelegate:tokenGroupName:", a3, a4);
  v10 = v9;
  if (v9)
    -[MapsTokenStorage setObserverCallbackQueue:](v9, "setObserverCallbackQueue:", v8);

  return v10;
}

- (id)tokenWithUserInfo:(id)a3
{
  id v4;
  MapsToken *v5;

  v4 = a3;
  v5 = -[MapsToken initWithDelegate:tokenGroupName:userInfo:]([MapsToken alloc], "initWithDelegate:tokenGroupName:userInfo:", self, self->_tokenGroupName, v4);

  return v5;
}

- (id)tokenWithReason:(id)a3
{
  id v4;
  MapsToken *v5;

  v4 = a3;
  v5 = -[MapsToken initWithDelegate:tokenGroupName:reason:]([MapsToken alloc], "initWithDelegate:tokenGroupName:reason:", self, self->_tokenGroupName, v4);

  return v5;
}

- (void)addToken:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *isolationQueue;
  id v8;
  _QWORD block[4];
  id v10;
  MapsTokenStorage *v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = sub_100C1E0BC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "ADD %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x2020000000;
  v15 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C1E370;
  block[3] = &unk_1011B31D8;
  v8 = v4;
  v10 = v8;
  v11 = self;
  p_buf = &buf;
  dispatch_sync(isolationQueue, block);
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    -[MapsTokenStorage notifyObserversAddedToken:](self, "notifyObserversAddedToken:", v8);

  _Block_object_dispose(&buf, 8);
}

- (void)removeToken:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *isolationQueue;
  id v8;
  _QWORD block[5];
  id v10;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = sub_100C1E0BC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "REMOVE %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x2020000000;
  v14 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C1E644;
  block[3] = &unk_1011B31D8;
  block[4] = self;
  v8 = v4;
  v10 = v8;
  p_buf = &buf;
  dispatch_sync(isolationQueue, block);
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    -[MapsTokenStorage notifyObserversForRemovedToken:](self, "notifyObserversForRemovedToken:", v8);

  _Block_object_dispose(&buf, 8);
}

- (NSArray)tokens
{
  NSObject *isolationQueue;
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
  v9 = sub_100C1E89C;
  v10 = sub_100C1E8AC;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C1E8B4;
  v5[3] = &unk_1011AD318;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (unint64_t)count
{
  NSObject *isolationQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C1E9F8;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSArray)allTokenReasons
{
  NSObject *isolationQueue;
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
  v9 = sub_100C1E89C;
  v10 = sub_100C1E8AC;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C1EAE0;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSString *tokenGroupName;
  NSObject *isolationQueue;
  id v17;
  _QWORD block[5];
  id v19;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  NSString *v23;

  v4 = a3;
  v5 = sub_100C1E0BC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v4;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    tokenGroupName = self->_tokenGroupName;
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    v22 = 2114;
    v23 = tokenGroupName;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "REGISTER %{public}@ for %{public}@", buf, 0x16u);

  }
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C1ED18;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v19 = v4;
  v17 = v4;
  dispatch_sync(isolationQueue, block);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSString *tokenGroupName;
  NSObject *isolationQueue;
  id v17;
  _QWORD block[5];
  id v19;
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  NSString *v23;

  v4 = a3;
  v5 = sub_100C1E0BC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v4;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    tokenGroupName = self->_tokenGroupName;
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    v22 = 2114;
    v23 = tokenGroupName;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "UNREGISTER %{public}@ for %{public}@", buf, 0x16u);

  }
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C1EF44;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v19 = v4;
  v17 = v4;
  dispatch_sync(isolationQueue, block);

}

- (void)notifyObserversAddedToken:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100C1E89C;
  v18 = sub_100C1E8AC;
  v19 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C1F150;
  block[3] = &unk_1011ADF48;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(isolationQueue, block);
  v6 = sub_100C1E0BC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend((id)v15[5], "count");
    *(_DWORD *)buf = 134218242;
    v21 = v8;
    v22 = 2114;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "NOTIFY %lu observers DID ADD %{public}@", buf, 0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100C1F18C;
  v10[3] = &unk_1011ADF48;
  v12 = &v14;
  v9 = v4;
  v11 = v9;
  -[MapsTokenStorage _performBlockOnCallbackQueue:](self, "_performBlockOnCallbackQueue:", v10);

  _Block_object_dispose(&v14, 8);
}

- (void)notifyObserversForRemovedToken:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100C1E89C;
  v18 = sub_100C1E8AC;
  v19 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C1F5A4;
  block[3] = &unk_1011ADF48;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(isolationQueue, block);
  v6 = sub_100C1E0BC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = objc_msgSend((id)v15[5], "count");
    *(_DWORD *)buf = 134218242;
    v21 = v8;
    v22 = 2114;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "NOTIFY %lu observers DID REMOVE %{public}@", buf, 0x16u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100C1F5E0;
  v10[3] = &unk_1011ADF48;
  v12 = &v14;
  v9 = v4;
  v11 = v9;
  -[MapsTokenStorage _performBlockOnCallbackQueue:](self, "_performBlockOnCallbackQueue:", v10);

  _Block_object_dispose(&v14, 8);
}

- (void)setObserverCallbackQueue:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSString *tokenGroupName;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSString *v13;
  int v14;
  NSString *v15;
  __int16 v16;
  id v17;

  v5 = a3;
  objc_storeStrong((id *)&self->_callbackQueue, a3);
  v6 = sub_100C1E0BC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      tokenGroupName = self->_tokenGroupName;
      v14 = 138543618;
      v15 = tokenGroupName;
      v16 = 2114;
      v17 = v5;
      v10 = "Updated callback queue for %{public}@: %{public}@";
      v11 = v7;
      v12 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v14, v12);
    }
  }
  else if (v8)
  {
    v13 = self->_tokenGroupName;
    v14 = 138543362;
    v15 = v13;
    v10 = "Removing custom callback queue for %{public}@";
    v11 = v7;
    v12 = 12;
    goto LABEL_6;
  }

}

- (void)_performBlockOnCallbackQueue:(id)a3
{
  void (**v4)(_QWORD);
  id v5;
  NSObject *v6;
  const char *label;
  OS_dispatch_queue *callbackQueue;
  NSObject *v9;
  _QWORD *v10;
  const char *v11;
  const char *v12;
  void *v13;
  _QWORD v14[2];
  uint64_t (*v15)(uint64_t);
  void *v16;
  MapsTokenStorage *v17;
  void (**v18)(_QWORD);
  uint8_t buf[4];
  const char *v20;

  v4 = (void (**)(_QWORD))a3;
  if (v4)
  {
    if (!self->_callbackQueue)
    {
LABEL_8:
      v4[2](v4);
      goto LABEL_16;
    }
    if (-[MapsTokenStorage _callbackQueueIsMainQueue](self, "_callbackQueueIsMainQueue")
      && +[NSThread isMainThread](NSThread, "isMainThread"))
    {
      v5 = sub_100C1E0BC();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        label = dispatch_queue_get_label((dispatch_queue_t)self->_callbackQueue);
        *(_DWORD *)buf = 136446210;
        v20 = label;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "ON MAIN THREAD %{public}s:", buf, 0xCu);
      }

      goto LABEL_8;
    }
    callbackQueue = self->_callbackQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v15 = sub_100C1FB04;
    v16 = &unk_1011AE240;
    v17 = self;
    v18 = v4;
    v9 = callbackQueue;
    v10 = v14;
    v11 = dispatch_queue_get_label(v9);
    v12 = dispatch_queue_get_label(0);
    if (v11 == v12 || v11 && v12 && !strcmp(v11, v12))
    {
      v13 = objc_autoreleasePoolPush();
      v15((uint64_t)v10);
      objc_autoreleasePoolPop(v13);
    }
    else
    {
      dispatch_sync(v9, v10);
    }

  }
LABEL_16:

}

- (BOOL)_callbackQueueIsMainQueue
{
  NSObject *callbackQueue;
  const char *label;
  const char *v5;

  if (!self->_checkedCallbackQueue)
  {
    callbackQueue = self->_callbackQueue;
    if (callbackQueue)
    {
      label = dispatch_queue_get_label(callbackQueue);
      v5 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      if (label == v5 || label && v5 && !strcmp(label, v5))
        self->_callbackQueueIsMainQueue = 1;
    }
    self->_checkedCallbackQueue = 1;
  }
  return self->_callbackQueueIsMainQueue;
}

- (void)incrementForToken:(id)a3
{
  -[MapsTokenStorage addToken:](self, "addToken:", a3);
}

- (void)decrementForToken:(id)a3
{
  -[MapsTokenStorage removeToken:](self, "removeToken:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_tokenGroupName, 0);
}

@end
