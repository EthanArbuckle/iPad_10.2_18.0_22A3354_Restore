@implementation RPDelegateBase

- (RPDelegateBase)init
{
  RPDelegateBase *v2;
  uint64_t v3;
  BOOL v4;
  NSMutableArray *v5;
  NSMutableArray *delegateArray;
  NSLock *v7;
  NSLock *lock;
  OS_dispatch_queue *delegateQueue;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  RPDelegateBase *v17;

  v11.receiver = self;
  v11.super_class = (Class)RPDelegateBase;
  v2 = -[RPDelegateBase init](&v11, "init");
  if (v2)
  {
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v13 = "-[RPDelegateBase init]";
      v14 = 1024;
      v15 = 25;
      v16 = 2048;
      v17 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
    }
    v3 = objc_opt_class(v2);
    v4 = v3 != objc_opt_class(RPDelegateBase) || dword_100095B40 > 2;
    if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100050748();
    v5 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    delegateArray = v2->_delegateArray;
    v2->_delegateArray = v5;

    v7 = (NSLock *)objc_alloc_init((Class)NSLock);
    lock = v2->_lock;
    v2->_lock = v7;

    v2->_isValid = 1;
    delegateQueue = v2->_delegateQueue;
    v2->_protocol = 0;
    v2->_delegateQueue = 0;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  RPDelegateBase *v9;

  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v5 = "-[RPDelegateBase dealloc]";
    v6 = 1024;
    v7 = 39;
    v8 = 2048;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  v3.receiver = self;
  v3.super_class = (Class)RPDelegateBase;
  -[RPDelegateBase dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  -[NSLock lock](self->_lock, "lock");
  if (self->_isValid)
  {
    -[NSMutableArray removeAllObjects](self->_delegateArray, "removeAllObjects");
    self->_isValid = 0;
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (BOOL)valid
{
  BOOL isValid;

  -[NSLock lock](self->_lock, "lock");
  isValid = self->_isValid;
  -[NSLock unlock](self->_lock, "unlock");
  return isValid;
}

- (void)addDelegate:(id)a3
{
  id v4;

  v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_isValid && !-[RPDelegateBase containsDelegate:](self, "containsDelegate:", v4))
    -[NSMutableArray addObject:](self->_delegateArray, "addObject:", v4);
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)removeDelegate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_isValid)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_delegateArray;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          if (*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i) == v4)
          {
            -[NSMutableArray removeObject:](self->_delegateArray, "removeObject:", v4, (_QWORD)v10);
            -[NSLock unlock](self->_lock, "unlock");

            goto LABEL_13;
          }
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  -[NSLock unlock](self->_lock, "unlock", (_QWORD)v10);
LABEL_13:

}

- (void)removeAllDelegates
{
  -[NSLock lock](self->_lock, "lock");
  if (self->_isValid)
    -[NSMutableArray removeAllObjects](self->_delegateArray, "removeAllObjects");
  -[NSLock unlock](self->_lock, "unlock");
}

- (unint64_t)delegateCount
{
  id v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = -[NSMutableArray count](self->_delegateArray, "count");
  -[NSLock unlock](self->_lock, "unlock");
  return (unint64_t)v3;
}

- (BOOL)hasDelegate:(id)a3
{
  NSLock *lock;
  id v5;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  LOBYTE(lock) = -[RPDelegateBase containsDelegate:](self, "containsDelegate:", v5);

  -[NSLock unlock](self->_lock, "unlock");
  return (char)lock;
}

- (void)callDelegate:(id)a3
{
  -[RPDelegateBase callDelegate:forProtocol:](self, "callDelegate:forProtocol:", a3, self->_protocol);
}

- (void)callDelegate:(id)a3 forProtocol:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  NSObject *delegateQueue;
  id v17;
  __int128 v18;
  _QWORD block[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  _BYTE v29[128];

  v6 = a3;
  v7 = a4;
  -[NSLock lock](self->_lock, "lock");
  if (self->_isValid)
  {
    v8 = -[NSMutableArray copy](self->_delegateArray, "copy");
    -[NSLock unlock](self->_lock, "unlock");
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v22;
      *(_QWORD *)&v11 = 136446466;
      v18 = v11;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v15, "conformsToProtocol:", v7, v18))
          {
            delegateQueue = self->_delegateQueue;
            if (delegateQueue)
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_100036874;
              block[3] = &unk_100081D68;
              v17 = v6;
              block[4] = v15;
              v20 = v17;
              dispatch_async(delegateQueue, block);

            }
            else
            {
              (*((void (**)(id, void *))v6 + 2))(v6, v15);
            }
          }
          else if (dword_100095B40 <= 2
                 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v26 = "-[RPDelegateBase callDelegate:forProtocol:]";
            v27 = 1024;
            v28 = 145;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d calling delegate does not conform to protocol", buf, 0x12u);
          }
        }
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v12);
    }

  }
  else
  {
    -[NSLock unlock](self->_lock, "unlock");
  }

}

- (BOOL)containsDelegate:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_delegateArray;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i) == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (void)setProtocol:(id)a3
{
  self->_protocol = (Protocol *)a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_delegateArray, 0);
}

@end
