@implementation CLIndoorXPCProvider

+ (id)newConnectionFor:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint8_t v14[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_alloc((Class)NSXPCConnection);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endpointName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentDomainForName:", CFSTR("com.apple.pipelined.framework")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("UnprivilegedDaemon")));
  v9 = objc_msgSend(v8, "BOOLValue");

  if (!v9)
  {
    v11 = 4096;
    goto LABEL_7;
  }
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE730);
    v10 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
      goto LABEL_5;
    goto LABEL_4;
  }
  v10 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
  {
LABEL_4:
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "UnprivilegedDaemon default found.  Connecting to service launched manually (i.e. not via launchd)", v14, 2u);
  }
LABEL_5:
  v11 = 0;
LABEL_7:

  v12 = objc_msgSend(v5, "initWithMachServiceName:options:", v6, v11);
  return v12;
}

- (CLIndoorXPCProvider)init
{
  void *v3;
  id v4;
  NSObject *v5;
  CLIndoorXPCProvider *v6;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider impl](self, "impl"));
  v4 = +[CLIndoorXPCProvider newConnectionFor:](CLIndoorXPCProvider, "newConnectionFor:", v3);

  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE730);
    v5 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CLIndoorXPCProvider, init", v8, 2u);
  }
LABEL_4:
  v6 = -[CLIndoorXPCProvider initWithConnection:](self, "initWithConnection:", v4);

  return v6;
}

- (CLIndoorXPCProvider)initWithEndpoint:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  CLIndoorXPCProvider *v7;
  uint8_t v9[16];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithListenerEndpoint:", v4);
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE730);
    v6 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "CLIndoorXPCProvider, initWithEndpoint", v9, 2u);
  }
LABEL_4:
  v7 = -[CLIndoorXPCProvider initWithConnection:](self, "initWithConnection:", v5);

  return v7;
}

- (CLIndoorXPCProvider)initWithConnection:(id)a3
{
  id v5;
  CLIndoorXPCProvider *v6;
  CLIndoorXPCProvider *v7;
  CLIndoorXPCProvider *v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *frameworkQueue;
  OS_dispatch_queue *v17;
  dispatch_source_t v18;
  OS_dispatch_source *interruptReconnection;
  NSObject *v20;
  NSObject *v21;
  const __CFString *v23;
  id v24;
  id to[2];
  _QWORD handler[4];
  id v27;
  id location;
  objc_super v29;

  v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CLIndoorXPCProvider;
  v6 = -[CLIndoorXPCProvider init](&v29, "init");
  v7 = v6;
  v8 = v6;
  if (v6)
  {
    if (-[CLIndoorXPCProvider conformsToProtocol:](v6, "conformsToProtocol:", &OBJC_PROTOCOL___CLIndoorXPCProviderImplementation))
    {
      v9 = objc_autoreleasePoolPush();
      v10 = (objc_class *)objc_opt_class(v8);
      v11 = NSStringFromClass(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.CoreIndoor.%@"), v12));

      v14 = objc_retainAutorelease(v13);
      v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);
      frameworkQueue = v8->_frameworkQueue;
      v8->_frameworkQueue = (OS_dispatch_queue *)v15;

      v17 = v8->_frameworkQueue;
      objc_autoreleasePoolPop(v9);
      if (!v17)
      {
        v7 = 0;
        goto LABEL_10;
      }
      objc_storeStrong((id *)&v7->_connection, a3);
      if (v8->_connection)
      {
        dispatch_queue_set_specific((dispatch_queue_t)v8->_frameworkQueue, &unk_100382728, v8, 0);
        v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v8->_frameworkQueue);
        interruptReconnection = v8->_interruptReconnection;
        v8->_interruptReconnection = (OS_dispatch_source *)v18;

        objc_initWeak(&location, v8);
        v20 = v8->_interruptReconnection;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3321888768;
        handler[2] = sub_1000DBBA4;
        handler[3] = &unk_1003EE650;
        objc_copyWeak(to, &location);
        objc_copyWeak(&v27, to);
        dispatch_source_set_event_handler(v20, handler);
        objc_destroyWeak(to);
        dispatch_resume((dispatch_object_t)v8->_interruptReconnection);
        if (qword_100417EE8 == -1)
        {
          v21 = qword_100417EF0;
          if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
          {
LABEL_8:
            -[CLIndoorXPCProvider withinQueueInitializeConnection](v8, "withinQueueInitializeConnection");
            v7 = v8;
            objc_destroyWeak(&v27);
            objc_destroyWeak(&location);
            goto LABEL_10;
          }
        }
        else
        {
          dispatch_once(&qword_100417EE8, &stru_1003EE730);
          v21 = qword_100417EF0;
          if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
            goto LABEL_8;
        }
        LOWORD(to[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CLIndoorXPCProvider, initWithConnection, re-initializing", (uint8_t *)to, 2u);
        goto LABEL_8;
      }
      v23 = CFSTR("Must provide a connection");
    }
    else
    {
      v23 = CFSTR("Concrete implementation of CLIndoorXPCProvider must conform to CLIndoorXPCProviderImplementation");
    }
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, v23, 0));
    objc_exception_throw(v24);
  }
LABEL_10:

  return v7;
}

- (void)dealloc
{
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  NSObject *frameworkQueue;
  CLIndoorXPCProvider *v8;
  NSObject *v9;
  objc_super v10;
  _QWORD block[4];
  CLIndoorXPCProvider *v12;
  uint8_t buf[4];
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider impl](self, "impl"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endpointName")));
  v5 = objc_msgSend(v4, "UTF8String");

  if (dispatch_get_specific(&unk_100382728) == self || !self->_frameworkQueue)
  {
    if (qword_100417EE8 == -1)
    {
      v9 = qword_100417EF0;
      if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
      {
LABEL_10:
        -[CLIndoorXPCProvider withinQueueInvalidate](self, "withinQueueInvalidate");
        goto LABEL_11;
      }
    }
    else
    {
      dispatch_once(&qword_100417EE8, &stru_1003EE730);
      v9 = qword_100417EF0;
      if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_INFO))
        goto LABEL_10;
    }
    *(_DWORD *)buf = 136446210;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "dealloc connection to %{public}s", buf, 0xCu);
    goto LABEL_10;
  }
  if (qword_100417EE8 != -1)
  {
    dispatch_once(&qword_100417EE8, &stru_1003EE730);
    v6 = qword_100417EF0;
    if (!os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
      goto LABEL_6;
    goto LABEL_5;
  }
  v6 = qword_100417EF0;
  if (os_log_type_enabled((os_log_t)qword_100417EF0, OS_LOG_TYPE_DEBUG))
  {
LABEL_5:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "dealloc begins", buf, 2u);
  }
LABEL_6:
  frameworkQueue = self->_frameworkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000DBE94;
  block[3] = &unk_1003EE680;
  v12 = self;
  v8 = v12;
  dispatch_sync(frameworkQueue, block);

LABEL_11:
  v10.receiver = self;
  v10.super_class = (Class)CLIndoorXPCProvider;
  -[CLIndoorXPCProvider dealloc](&v10, "dealloc");
}

- (void)invalidate
{
  NSObject *frameworkQueue;
  id v3;
  _QWORD block[4];
  id v5;

  frameworkQueue = self->_frameworkQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_1000DBFE4;
  block[3] = &unk_1003EE6B0;
  v5 = self;
  v3 = v5;
  dispatch_sync(frameworkQueue, block);

}

- (void)withinQueueInvalidate
{
  NSObject *v3;
  NSXPCConnection *connection;
  void *v5;
  void *v6;
  NSObject *interruptReconnection;
  NSXPCConnection *v8;
  void *v9;
  int v10;
  NSXPCConnection *v11;
  __int16 v12;
  void *v13;

  if (qword_100417EE8 != -1)
    dispatch_once(&qword_100417EE8, &stru_1003EE730);
  v3 = (id)qword_100417EF0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider impl](self, "impl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endpointName"));
    v10 = 134349314;
    v11 = connection;
    v12 = 2114;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "About to invalidate connection %{public}p to %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  interruptReconnection = self->_interruptReconnection;
  if (interruptReconnection)
    dispatch_source_cancel(interruptReconnection);
  v8 = self->_connection;
  self->_connection = 0;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider impl](self, "impl"));
  objc_msgSend(v9, "withinQueueInvalidateState");

}

- (void)withinQueueInitializeConnection
{
  void *v3;
  void *v4;
  void *v5;
  void ***v6;
  void ***v7;
  id v8;
  id from;
  id to;
  id location;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider impl](self, "impl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteObjectProtocol"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", v4));
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v5);

  objc_initWeak(&location, self);
  objc_copyWeak(&to, &location);
  v12 = _NSConcreteStackBlock;
  v13 = 3321888768;
  v14 = sub_1000DCF8C;
  v15 = &unk_1003EE750;
  objc_copyWeak(&v16, &to);
  v6 = objc_retainBlock(&v12);
  objc_destroyWeak(&v16);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v6);

  objc_destroyWeak(&to);
  objc_initWeak(&from, self);
  objc_copyWeak(&v8, &from);
  v12 = _NSConcreteStackBlock;
  v13 = 3321888768;
  v14 = sub_1000DD028;
  v15 = &unk_1003EE7A8;
  objc_copyWeak(&v16, &v8);
  v7 = objc_retainBlock(&v12);
  objc_destroyWeak(&v16);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v7);

  objc_destroyWeak(&v8);
  -[NSXPCConnection resume](self->_connection, "resume");
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)withinQueueInterruptionHandler
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider impl](self, "impl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "withinQueuePermanentShutdownReason"));

  if (v4)
  {
    if (qword_100417EE8 != -1)
      dispatch_once(&qword_100417EE8, &stru_1003EE730);
    v5 = (id)qword_100417EF0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider impl](self, "impl"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endpointName"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
      v12 = 138543618;
      v13 = v7;
      v14 = 2114;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "XPC connection invalidated by daemon to %{public}@: %{public}@", (uint8_t *)&v12, 0x16u);

    }
    -[CLIndoorXPCProvider withinQueueInvalidate](self, "withinQueueInvalidate");
  }
  else
  {
    if (qword_100417EE8 != -1)
      dispatch_once(&qword_100417EE8, &stru_1003EE730);
    v9 = (id)qword_100417EF0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider impl](self, "impl"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "endpointName"));
      v12 = 138543362;
      v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "pipelined interruption handler for %{public}@", (uint8_t *)&v12, 0xCu);

    }
    -[CLIndoorXPCProvider withinQueueHandleReconnect:](self, "withinQueueHandleReconnect:", std::chrono::steady_clock::now().__d_.__rep_);
  }

}

- (void)withinQueueHandleReconnect:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock
{
  unsigned int v5;

  v5 = -[CLIndoorXPCProvider withinQueueShouldReinitializeRemote:](self, "withinQueueShouldReinitializeRemote:");
  if (v5 == 1)
  {
    -[CLIndoorXPCProvider withinQueueReinitializeRemoteState](self, "withinQueueReinitializeRemoteState");
    if (self->_lastReconnectTime.m_initialized)
    {
LABEL_5:
      *(time_point<std::chrono::steady_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) = a3;
      return;
    }
  }
  else
  {
    if (v5 == 2)
      -[CLIndoorXPCProvider withinQueueScheduleReconnect:reason:](self, "withinQueueScheduleReconnect:reason:", *(_QWORD *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) - a3.var0.__rep_ + 10000000000, CFSTR("deferred re-initialization"));
    if (self->_lastReconnectTime.m_initialized)
      goto LABEL_5;
  }
  self->_lastReconnectTime.m_initialized = 1;
  *(time_point<std::chrono::steady_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) = a3;
}

- (int)withinQueueShouldReinitializeRemote:()time_point<std:(std:()std:(1000000000>>>)a3 :ratio<1 :chrono::duration<long)long :chrono::steady_clock
{
  void *v5;
  unsigned __int8 v6;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider impl](self, "impl"));
  v6 = objc_msgSend(v5, "withinQueueCanReinitializeRemoteState");

  if ((v6 & 1) != 0)
  {
    if (self->_lastReconnectTime.m_initialized
      && a3.var0.__rep_ - *(_QWORD *)((char *)&self->_lastReconnectTime.m_storage.dummy_.aligner_ + 7) < 10000000000)
    {
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else
  {
    if (qword_100417EE8 != -1)
      dispatch_once(&qword_100417EE8, &stru_1003EE730);
    v8 = (id)qword_100417EF0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider impl](self, "impl"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endpointName"));
      v11 = 138543362;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Already invalidated/no remote state - ignoring request to re-initialize %{public}@", (uint8_t *)&v11, 0xCu);

    }
    return 0;
  }
}

- (void)withinQueueReinitializeRemoteState
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  if (qword_100417EE8 != -1)
    dispatch_once(&qword_100417EE8, &stru_1003EE730);
  v3 = (id)qword_100417EF0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider impl](self, "impl"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endpointName"));
    v7 = 138543362;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "re-initializing pipelined connection to %{public}@ with existing state", (uint8_t *)&v7, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider impl](self, "impl"));
  objc_msgSend(v6, "withinQueueReinitializeRemoteState");

}

- (void)withinQueueScheduleReconnect:(duration<long)long reason:()std:(1000000000>>)a3 :(id)a4 ratio<1
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  dispatch_time_t v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int64_t v16;

  v6 = a4;
  if (qword_100417EE8 != -1)
    dispatch_once(&qword_100417EE8, &stru_1003EE730);
  v7 = (id)qword_100417EF0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider impl](self, "impl"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endpointName"));
    v11 = 138543874;
    v12 = v9;
    v13 = 2114;
    v14 = v6;
    v15 = 2048;
    v16 = a3.__rep_ / 1000000;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Connection to %{public}@ %{public}@ - retrying in %lld milliseconds", (uint8_t *)&v11, 0x20u);

  }
  v10 = dispatch_time(0, a3.__rep_);
  dispatch_source_set_timer((dispatch_source_t)self->_interruptReconnection, v10, 0xFFFFFFFFFFFFFFFFLL, 0x77359400uLL);

}

- (id)_defaultErrHandlerForCaller:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[CLIndoorXPCProvider _defaultErrHandler:forCaller:](self, "_defaultErrHandler:forCaller:", &stru_1003EE6E0, a3));
}

- (id)_defaultErrHandler:(id)a3 forCaller:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3321888768;
  v11[2] = sub_1000DCD64;
  v11[3] = &unk_1003EE700;
  v5 = a4;
  v6 = objc_retainBlock(a3);
  v7 = v5;
  v12 = v7;
  v13 = objc_retainBlock(v6);
  v8 = objc_retainBlock(v11);

  v9 = objc_retainBlock(v8);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptReconnection, 0);
  if (self->_lastReconnectTime.m_initialized)
    self->_lastReconnectTime.m_initialized = 0;
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_frameworkQueue, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 24) = 0;
  return self;
}

@end
