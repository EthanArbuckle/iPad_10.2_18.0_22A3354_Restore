@implementation ICSessionManager

- (ICSessionManager)initWithDelegate:(id)a3
{
  id v4;
  ICSessionManager *v5;
  NSMutableArray *v6;
  NSMutableArray *sessions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSessionManager;
  v5 = -[ICSessionManager init](&v9, "init");
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    sessions = v5->_sessions;
    v5->_sessions = v6;

    v5->_sessionsLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (BOOL)createSessionWithConnection:(id)a3
{
  id v4;
  void *v5;
  ICSession *v6;
  void *v7;
  void *v8;
  void *v9;
  ICSession *v10;
  NSObject *v11;
  BOOL v12;
  void ***v13;
  void *v14;
  __CFString *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  id v26;
  void **v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  ICSessionManager *v32;
  id v33;
  id location;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;

  v4 = a3;
  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSessionManager sessionWithConnection:](self, "sessionWithConnection:", v4)),
        v5,
        !v5))
  {
    v6 = -[ICSession initWithConnection:]([ICSession alloc], "initWithConnection:", v4);
    objc_initWeak(&location, v4);
    v28 = _NSConcreteStackBlock;
    v29 = 3221225472;
    v30 = sub_10001CC24;
    v31 = &unk_100048D00;
    objc_copyWeak(&v33, &location);
    v32 = self;
    v13 = objc_retainBlock(&v28);
    objc_msgSend(v4, "setInterruptionHandler:", v13);
    objc_msgSend(v4, "setInvalidationHandler:", v13);
    os_unfair_lock_lock(&self->_sessionsLock);
    -[NSMutableArray addObject:](self->_sessions, "addObject:", v6);
    os_unfair_lock_unlock(&self->_sessionsLock);
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(CFSTR("CM"), "length") < 0x15)
    {
      v15 = CFSTR("CM");
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("CM"), "substringWithRange:", 0, 18));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", CFSTR("..")));

    }
    v16 = (id)-[ICSession pid](v6, "pid");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("add: [%05d]"), v16, v28, v29, v30, v31));
    v18 = (id)_gICOSLog;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = -[__CFString UTF8String](objc_retainAutorelease(v15), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v36 = v19;
      v37 = 2114;
      v38 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    v12 = 1;
  }
  else
  {
    __ICOSLogCreate();
    v6 = (ICSession *)CFSTR("CM");
    if ((unint64_t)objc_msgSend(CFSTR("CM"), "length") >= 0x15)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("CM"), "substringWithRange:", 0, 18));
      v6 = (ICSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("..")));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("exists: [%05d]"), objc_msgSend(v4, "processIdentifier")));
    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v6);
      v11 = v9;
      *(_DWORD *)buf = 136446466;
      v36 = -[ICSession UTF8String](v10, "UTF8String");
      v37 = 2114;
      v38 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v12 = 0;
  }

  __ICOSLogCreate();
  if ((unint64_t)objc_msgSend(CFSTR("CM"), "length") < 0x15)
  {
    v21 = CFSTR("CM");
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("CM"), "substringWithRange:", 0, 18));
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", CFSTR("..")));

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("count: [%05lu]"), -[ICSessionManager currentSessionCount](self, "currentSessionCount")));
  v23 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v24 = objc_retainAutorelease(v21);
    v25 = v23;
    v26 = -[__CFString UTF8String](v24, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v36 = v26;
    v37 = 2114;
    v38 = v22;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  return v12;
}

- (NSArray)sessions
{
  os_unfair_lock_s *p_sessionsLock;
  id v4;

  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  v4 = -[NSMutableArray copy](self->_sessions, "copy");
  os_unfair_lock_unlock(p_sessionsLock);
  return (NSArray *)v4;
}

- (unint64_t)currentSessionCount
{
  os_unfair_lock_s *p_sessionsLock;
  id v4;

  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(&self->_sessionsLock);
  v4 = -[NSMutableArray count](self->_sessions, "count");
  os_unfair_lock_unlock(p_sessionsLock);
  return (unint64_t)v4;
}

- (id)sessionWithConnection:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ICSessionManager sessions](self, "sessions"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connection", (_QWORD)v13));
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)addNotifications:(id)a3 toSessionWithConnection:(id)a4
{
  id v6;
  void *v7;
  os_unfair_lock_s *p_sessionsLock;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSessionManager sessionWithConnection:](self, "sessionWithConnection:", a4));
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(p_sessionsLock);
  __ICOSLogCreate();
  v9 = CFSTR("CM");
  if ((unint64_t)objc_msgSend(CFSTR("CM"), "length") >= 0x15)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("CM"), "substringWithRange:", 0, 18));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("+ note: [%05d] - %@"), objc_msgSend(v7, "pid"), v6));
  v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v9);
    v14 = v12;
    *(_DWORD *)buf = 136446466;
    v16 = -[__CFString UTF8String](v13, "UTF8String");
    v17 = 2114;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  objc_msgSend(v7, "addNotifications:", v6);
  os_unfair_lock_unlock(p_sessionsLock);

}

- (void)remNotifications:(id)a3 fromSessionWithConnection:(id)a4
{
  id v6;
  void *v7;
  os_unfair_lock_s *p_sessionsLock;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSessionManager sessionWithConnection:](self, "sessionWithConnection:", a4));
  p_sessionsLock = &self->_sessionsLock;
  os_unfair_lock_lock(p_sessionsLock);
  __ICOSLogCreate();
  v9 = CFSTR("CM");
  if ((unint64_t)objc_msgSend(CFSTR("CM"), "length") >= 0x15)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("CM"), "substringWithRange:", 0, 18));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("- note: [%05d] - %@"), objc_msgSend(v7, "pid"), v6));
  v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v9);
    v14 = v12;
    *(_DWORD *)buf = 136446466;
    v16 = -[__CFString UTF8String](v13, "UTF8String");
    v17 = 2114;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  objc_msgSend(v7, "remNotifications:", v6);
  os_unfair_lock_unlock(p_sessionsLock);

}

- (unint64_t)removeSessionWithConnection:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  id WeakRetained;
  unint64_t v14;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSessionManager sessionWithConnection:](self, "sessionWithConnection:", a3));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connection"));
    objc_msgSend(v6, "invalidate");

    __ICOSLogCreate();
    v7 = CFSTR("CM");
    if ((unint64_t)objc_msgSend(CFSTR("CM"), "length") >= 0x15)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("CM"), "substringWithRange:", 0, 18));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("..")));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("remove: [%05lu]"), (int)objc_msgSend(v5, "pid")));
    v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v7);
      v12 = v10;
      *(_DWORD *)buf = 136446466;
      v17 = -[__CFString UTF8String](v11, "UTF8String");
      v18 = 2114;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    os_unfair_lock_lock(&self->_sessionsLock);
    -[NSMutableArray removeObject:](self->_sessions, "removeObject:", v5);
    os_unfair_lock_unlock(&self->_sessionsLock);
  }
  if (!-[ICSessionManager currentSessionCount](self, "currentSessionCount"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sessionManagerDidCloseAllSessions:", self);

  }
  v14 = -[ICSessionManager currentSessionCount](self, "currentSessionCount");

  return v14;
}

- (unint64_t)removeSessionsWithProcessIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  void *v12;
  unint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSessionManager sessions](self, "sessions"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "pid");
        if (v11 == objc_msgSend(v4, "intValue"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connection"));
          -[ICSessionManager removeSessionWithConnection:](self, "removeSessionWithConnection:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  v13 = -[ICSessionManager currentSessionCount](self, "currentSessionCount");

  return v13;
}

- (void)removeAllSessions
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSessionManager sessions](self, "sessions"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "connection"));
        -[ICSessionManager removeSessionWithConnection:](self, "removeSessionWithConnection:", v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)connectionsMonitoringNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSessionManager sessions](self, "sessions"));
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    v7 = CFSTR("noteInterest");
    if ((unint64_t)objc_msgSend(CFSTR("noteInterest"), "length") >= 0x15)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("noteInterest"), "substringWithRange:", 0, 18));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("..")));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%05d] - %@"), objc_msgSend(v6, "count"), v4));
    v10 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease(v7);
      v12 = v10;
      *(_DWORD *)buf = 136446466;
      v27 = -[__CFString UTF8String](v11, "UTF8String");
      v28 = 2114;
      v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v18, "interestedInNotification:", v4))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "connection"));
          objc_msgSend(v5, "addObject:", v19);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  return v5;
}

- (id)connectionsMonitoringObjectID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSessionManager sessions](self, "sessions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%08lX"), objc_msgSend(v4, "longValue")));
  __ICOSLogCreate();
  if (__ICLogTypeEnabled(4))
  {
    v8 = CFSTR("noteInterest");
    if ((unint64_t)objc_msgSend(CFSTR("noteInterest"), "length") >= 0x15)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("noteInterest"), "substringWithRange:", 0, 18));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("..")));

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%05d] - %@"), objc_msgSend(v6, "count"), v7));
    v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v8);
      v13 = v11;
      *(_DWORD *)buf = 136446466;
      v29 = -[__CFString UTF8String](v12, "UTF8String");
      v30 = 2114;
      v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v20 = objc_msgSend(v19, "objectHandle");
        if (v20 == (id)(int)objc_msgSend(v4, "intValue"))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "connection"));
          objc_msgSend(v5, "addObject:", v21);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  return v5;
}

- (NSArray)connections
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSessionManager sessions](self, "sessions"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "connection"));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (ICSessionManagerProtocol)delegate
{
  return (ICSessionManagerProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)sessionCount
{
  return self->_sessionCount;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end
