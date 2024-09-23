@implementation PRNarrowbandSARManager

- (PRNarrowbandSARManager)initWithQueue:(id)a3 stateChangeHandler:(id)a4
{
  id v8;
  id v9;
  PRNarrowbandSARManager *v10;
  PRNarrowbandSARManager *v11;
  NSNotificationCenter *fNotificationCenter;
  id v13;
  id stateChangeHandler;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRNarrowbandSARMonitor.mm"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

  }
  v17.receiver = self;
  v17.super_class = (Class)PRNarrowbandSARManager;
  v10 = -[PRNarrowbandSARManager init](&v17, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a3);
    fNotificationCenter = v11->_fNotificationCenter;
    v11->_fNotificationCenter = 0;

    *(_WORD *)&v11->_monitoring = 0;
    if (v11->_overrideSARState.__engaged_)
      v11->_overrideSARState.__engaged_ = 0;
    v11->_systemSARState = 0;
    v13 = objc_retainBlock(v9);
    stateChangeHandler = v11->_stateChangeHandler;
    v11->_stateChangeHandler = v13;

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[PRNarrowbandSARManager stopMonitoring](self, "stopMonitoring");
  v3.receiver = self;
  v3.super_class = (Class)PRNarrowbandSARManager;
  -[PRNarrowbandSARManager dealloc](&v3, "dealloc");
}

- (void)initNarrowbandSARListner
{
  NSNotificationCenter *v3;
  NSNotificationCenter *fNotificationCenter;
  NSNotificationCenter *v5;
  id v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (NSNotificationCenter *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  fNotificationCenter = self->_fNotificationCenter;
  self->_fNotificationCenter = v3;

  v5 = self->_fNotificationCenter;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  -[NSNotificationCenter addObserver:selector:name:object:](v5, "addObserver:selector:name:object:", self, "audioRouteChanged:", AVAudioSessionRouteChangeNotification);

}

- (BOOL)startMonitoring
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  OS_dispatch_queue *queue;
  unsigned int v11;
  _QWORD block[5];
  uint8_t buf[16];

  if (!self->_monitoring)
  {
    v3 = qword_10085B178;
    if (os_log_type_enabled((os_log_t)qword_10085B178, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#nb-sar,starting monitoring", buf, 2u);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForKey:", CFSTR("NBSARStateMonitorOverride")));

    if (!v5)
      goto LABEL_13;
    v6 = v5;
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("failsafe")) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("head")) & 1) == 0)
      {
        v11 = objc_msgSend(v6, "isEqualToString:", CFSTR("body"));
        if (v11)
          v7 = 2;
        else
          v7 = 0;

        if (!v11)
        {
LABEL_13:
          queue = self->_queue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100283280;
          block[3] = &unk_1007FB340;
          block[4] = self;
          dispatch_async((dispatch_queue_t)queue, block);
          self->_monitoring = 1;

          return 1;
        }
LABEL_10:
        v8 = qword_10085B178;
        if (os_log_type_enabled((os_log_t)qword_10085B178, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#nb-sar,injecting state from defaults", buf, 2u);
        }
        -[PRNarrowbandSARManager injectNarrowbandSARState:](self, "injectNarrowbandSARState:", v7);
        goto LABEL_13;
      }
      v7 = 1;
    }

    goto LABEL_10;
  }
  return 1;
}

- (void)stopMonitoring
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  if (self->_monitoring)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100283314;
    block[3] = &unk_1007FB340;
    block[4] = self;
    dispatch_async((dispatch_queue_t)queue, block);
    self->_monitoring = 0;
  }
}

- (void)audioRouteChanged:(id)a3
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10028340C;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (int)checkCurrentAudioRoute
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  unsigned __int8 v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRoute"));

  if (v3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "outputs", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "portType"));
          v9 = objc_msgSend(v8, "isEqualToString:", AVAudioSessionPortBuiltInReceiver);

          if ((v9 & 1) != 0)
          {
            v10 = 1;
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          continue;
        break;
      }
    }
    v10 = 2;
LABEL_12:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)updateSARStateIfRequired
{
  uint64_t v3;
  NSObject *v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  void **v10;
  void **v11;
  _BYTE *v12;
  NSObject *v13;
  void **v14;
  void *__p[2];
  char v16;
  _BYTE buf[12];
  char v18;
  uint8_t v19[4];
  void **v20;
  __int16 v21;
  _BYTE *v22;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = -[PRNarrowbandSARManager checkCurrentAudioRoute](self, "checkCurrentAudioRoute");
  v4 = (id)qword_10085B178;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000BF04(__p, (&off_100811418)[(int)v3]);
    v5 = v16 >= 0 ? __p : (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#nb-sar,audio route: %s", buf, 0xCu);
    if (v16 < 0)
      operator delete(__p[0]);
  }

  v6 = -[PRNarrowbandSARManager audioRouteToSARState:](self, "audioRouteToSARState:", v3);
  v7 = v6;
  if (!self->_sarStateInitialized || self->_systemSARState != (_DWORD)v6)
  {
    self->_sarStateInitialized = 1;
    self->_systemSARState = v6;
    if (self->_overrideSARState.__engaged_)
    {
      v8 = (id)qword_10085B178;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        if (!self->_overrideSARState.__engaged_)
          sub_10000BA44();
        sub_10000BF04(__p, (&off_100811430)[self->_overrideSARState.var0.__val_]);
        v9 = v16;
        v10 = (void **)__p[0];
        sub_10000BF04(buf, (&off_100811430)[(int)v7]);
        v11 = __p;
        if (v9 < 0)
          v11 = v10;
        if (v18 >= 0)
          v12 = buf;
        else
          v12 = *(_BYTE **)buf;
        *(_DWORD *)v19 = 136315394;
        v20 = v11;
        v21 = 2080;
        v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#nb-sar,SAR override %s - ignoring SAR state  : %s", v19, 0x16u);
        if (v18 < 0)
          operator delete(*(void **)buf);
        if (v16 < 0)
          operator delete(__p[0]);
      }

    }
    else if (self->_stateChangeHandler)
    {
      v13 = (id)qword_10085B178;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        sub_10000BF04(__p, (&off_100811430)[(int)v7]);
        v14 = v16 >= 0 ? __p : (void **)__p[0];
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#nb-sar,updated SAR state: %s", buf, 0xCu);
        if (v16 < 0)
          operator delete(__p[0]);
      }

      (*((void (**)(id, _QWORD))self->_stateChangeHandler + 2))(self->_stateChangeHandler, -[PRNarrowbandSARManager nbSARStateToSARIndex:](self, "nbSARStateToSARIndex:", v7));
    }
  }
}

- (unsigned)getCurrentSARIndexOnQueue
{
  uint64_t v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = 28;
  if (!self->_overrideSARState.__engaged_)
    v3 = 36;
  return -[PRNarrowbandSARManager nbSARStateToSARIndex:](self, "nbSARStateToSARIndex:", *(unsigned int *)((char *)&self->super.isa + v3));
}

- (id)printableStateOnQueue
{
  NSMutableArray *v3;
  _BOOL8 monitoring;
  _BOOL8 sarStateInitialized;
  void **v6;
  _BOOL4 engaged;
  void **v8;
  void *v9;
  void *__p[2];
  char v12;
  void *v13[2];
  char v14;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_opt_new(NSMutableArray);
  monitoring = self->_monitoring;
  sarStateInitialized = self->_sarStateInitialized;
  sub_10000BF04(v13, (&off_100811430)[self->_systemSARState]);
  if (v14 >= 0)
    v6 = v13;
  else
    v6 = (void **)v13[0];
  engaged = self->_overrideSARState.__engaged_;
  if (self->_overrideSARState.__engaged_)
  {
    sub_10000BF04(__p, (&off_100811430)[self->_overrideSARState.var0.__val_]);
    if (v12 >= 0)
      v8 = __p;
    else
      v8 = (void **)__p[0];
  }
  else
  {
    v8 = (void **)"-";
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Monitoring: %d. State initialized: %d. System state: %s. Override state: %s"), monitoring, sarStateInitialized, v6, v8));
  -[NSMutableArray addObject:](v3, "addObject:", v9);

  if (engaged && v12 < 0)
    operator delete(__p[0]);
  if (v14 < 0)
    operator delete(v13[0]);
  return v3;
}

- (BOOL)injectNarrowbandSARState:(int)a3
{
  OS_dispatch_queue *queue;
  _QWORD v5[5];
  int v6;

  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100283AD0;
  v5[3] = &unk_10080B978;
  v5[4] = self;
  v6 = a3;
  dispatch_async((dispatch_queue_t)queue, v5);
  return 1;
}

- (BOOL)clearSARStateOverride
{
  OS_dispatch_queue *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100283C78;
  block[3] = &unk_1007FB340;
  block[4] = self;
  dispatch_async((dispatch_queue_t)queue, block);
  return 1;
}

- (int)audioRouteToSARState:(int)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (unsigned)nbSARStateToSARIndex:(int)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (id)stateChangeHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setStateChangeHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangeHandler, 0);
  objc_storeStrong((id *)&self->_fNotificationCenter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 28) = 0;
  *((_BYTE *)self + 32) = 0;
  return self;
}

@end
