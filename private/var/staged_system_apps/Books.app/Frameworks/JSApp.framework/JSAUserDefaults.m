@implementation JSAUserDefaults

- (JSAUserDefaults)init
{
  JSAUserDefaults *v2;
  uint64_t v3;
  NSMapTable *defaultsToCallback;
  uint64_t v5;
  NSMapTable *defaultsToKeysToObserve;
  uint64_t v7;
  NSMapTable *defaultsToCachedValues;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)JSAUserDefaults;
  v2 = -[JSAUserDefaults init](&v10, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    defaultsToCallback = v2->_defaultsToCallback;
    v2->_defaultsToCallback = (NSMapTable *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    defaultsToKeysToObserve = v2->_defaultsToKeysToObserve;
    v2->_defaultsToKeysToObserve = (NSMapTable *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    defaultsToCachedValues = v2->_defaultsToCachedValues;
    v2->_defaultsToCachedValues = (NSMapTable *)v7;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)getInstance
{
  if (qword_B9EF0 != -1)
    dispatch_once(&qword_B9EF0, &stru_9DD38);
  return (id)qword_B9EF8;
}

- (id)registerOnDefaultsChange:(id)a3 keysToObserve:(id)a4 fromGroup:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  os_unfair_lock_s *p_lock;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v10, "debugAssertRunningOnJSAThread");

  v11 = JSALog();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v30 = "-[JSAUserDefaults registerOnDefaultsChange:keysToObserve:fromGroup:]";
    v31 = 2048;
    v32 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}s %lu keys", buf, 0x16u);
  }

  if (v5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BUAppGroup books](BUAppGroup, "books"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userDefaults"));

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  }
  v15 = sub_542C(self, v9, 1, v5);
  p_lock = &self->_lock;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_5634;
  v24[3] = &unk_9DD60;
  v24[4] = self;
  v25 = v8;
  v26 = v14;
  v27 = v9;
  v17 = (id)objc_claimAutoreleasedReturnValue(v15);
  v28 = v17;
  v18 = v9;
  v19 = v14;
  v20 = v8;
  os_unfair_lock_lock_with_options(p_lock, 0x10000);
  sub_5634(v24);
  os_unfair_lock_unlock(p_lock);
  v21 = v28;
  v22 = v17;

  return v22;
}

- (void)unregisterOnDefaultsChangeFromGroup:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  os_unfair_lock_s *p_lock;
  id v17;
  _QWORD v18[5];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v5, "debugAssertRunningOnJSAThread");

  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BUAppGroup books](BUAppGroup, "books"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userDefaults"));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_defaultsToKeysToObserve, "objectForKey:", v7));
  v9 = v8;
  v10 = (uint64_t *)&off_B7040;
  if (!v3)
    v10 = (uint64_t *)&off_B7048;
  v11 = *v10;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v9);
        objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15), v11);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }
  p_lock = &self->_lock;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_58E8;
  v18[3] = &unk_9DCF8;
  v18[4] = self;
  v19 = v7;
  v17 = v7;
  os_unfair_lock_lock_with_options(p_lock, 0x10000);
  sub_58E8((uint64_t)v18);
  os_unfair_lock_unlock(p_lock);

}

- (id)valuesForDefaults:(id)a3 fromGroup:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[2];
  void (*v15)(uint64_t);
  void *v16;
  JSAUserDefaults *v17;
  uint64_t *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v7, "debugAssertRunningOnJSAThread");

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_5A9C;
  v24 = sub_5AAC;
  v25 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v15 = sub_5AB4;
  v16 = &unk_9DD88;
  v17 = self;
  v18 = &v20;
  v19 = v4;
  v8 = v14;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
  v15((uint64_t)v8);
  os_unfair_lock_unlock(&self->_lock);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v21[5], "allKeys"));
  LODWORD(v8) = objc_msgSend(v9, "isEqualToArray:", v6);

  if ((_DWORD)v8)
  {
    v10 = (id)v21[5];
  }
  else
  {
    v11 = sub_542C(self, v6, 0, v4);
    v10 = (id)objc_claimAutoreleasedReturnValue(v11);
  }
  v12 = v10;
  _Block_object_dispose(&v20, 8);

  return v12;
}

- (void)setValueForDefaults:(id)a3 forKey:(id)a4 fromGroup:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  objc_msgSend(v8, "debugAssertRunningOnJSAThread");

  if (objc_msgSend(v13, "isNull"))
  {
    if (a5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[BUAppGroup books](BUAppGroup, "books"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userDefaults"));

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    }
    objc_msgSend(v10, "removeObjectForKey:", v7);
  }
  else
  {
    if (a5)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[BUAppGroup books](BUAppGroup, "books"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userDefaults"));

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    }
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "toObject"));
    objc_msgSend(v10, "setObject:forKey:", v12, v7);

    v7 = (id)v12;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[4];
  _QWORD *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  _QWORD *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_B7048 == a6)
  {
    objc_initWeak(&location, self);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_6388;
    v26[3] = &unk_9DDD8;
    v13 = &v29;
    objc_copyWeak(&v29, &location);
    v27 = v10;
    v28 = v12;
    v14 = objc_retainBlock(v26);
    if (v14)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        ((void (*)(_QWORD *))v14[2])(v14);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_63F0;
        block[3] = &unk_9DCD0;
        v25 = v14;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      }
    }

    v16 = v27;
    goto LABEL_14;
  }
  if (off_B7040 == a6)
  {
    objc_initWeak(&location, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_63FC;
    v20[3] = &unk_9DDD8;
    v13 = &v23;
    objc_copyWeak(&v23, &location);
    v21 = v10;
    v22 = v12;
    v15 = objc_retainBlock(v20);
    if (v15)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        ((void (*)(_QWORD *))v15[2])(v15);
      }
      else
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_6464;
        v18[3] = &unk_9DCD0;
        v19 = v15;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

      }
    }

    v16 = v21;
LABEL_14:

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
    goto LABEL_15;
  }
  v17.receiver = self;
  v17.super_class = (Class)JSAUserDefaults;
  -[JSAUserDefaults observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
LABEL_15:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsToCachedValues, 0);
  objc_storeStrong((id *)&self->_defaultsToKeysToObserve, 0);
  objc_storeStrong((id *)&self->_defaultsToCallback, 0);
}

@end
