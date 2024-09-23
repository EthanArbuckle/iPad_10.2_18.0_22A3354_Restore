@implementation MapsPocketStateProvider

- (MapsPocketStateProvider)initWithDelegate:(id)a3
{
  id v4;
  MapsPocketStateProvider *v5;
  MapsPocketStateProvider *v6;
  CMPocketStateManager *v7;
  CMPocketStateManager *manager;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapsPocketStateProvider;
  v5 = -[MapsPocketStateProvider init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    if (+[CMPocketStateManager isPocketStateAvailable](CMPocketStateManager, "isPocketStateAvailable"))
    {
      v7 = objc_opt_new(CMPocketStateManager);
      manager = v6->_manager;
      v6->_manager = v7;

      -[CMPocketStateManager setDelegate:](v6->_manager, "setDelegate:", v6);
    }
  }

  return v6;
}

- (void)dealloc
{
  NSTimer *updateTimer;
  objc_super v4;

  -[CMPocketStateManager setDelegate:](self->_manager, "setDelegate:", 0);
  -[NSTimer invalidate](self->_updateTimer, "invalidate");
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

  v4.receiver = self;
  v4.super_class = (Class)MapsPocketStateProvider;
  -[MapsPocketStateProvider dealloc](&v4, "dealloc");
}

- (void)pocketStateManager:(id)a3 didUpdateState:(int64_t)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11[2];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  const __CFString *v19;

  v6 = a3;
  if (qword_1014D36F0 != -1)
    dispatch_once(&qword_1014D36F0, &stru_1011D9B38);
  v7 = (void *)qword_1014D36E8;
  if (os_log_type_enabled((os_log_t)qword_1014D36E8, OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)a4 > 4)
      v8 = CFSTR("Unknown");
    else
      v8 = *(&off_1011D9B58 + a4);
    *(_DWORD *)buf = 136315906;
    v13 = "-[MapsPocketStateProvider pocketStateManager:didUpdateState:]";
    v14 = 2114;
    v15 = v6;
    v16 = 2048;
    v17 = a4;
    v18 = 2114;
    v19 = v8;
    v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s, manager: %{public}@ pocket state change: %ld (%{public}@)", buf, 0x2Au);

  }
  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1008774CC;
  v10[3] = &unk_1011B72B0;
  objc_copyWeak(v11, (id *)buf);
  v11[1] = (id)a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  objc_destroyWeak(v11);
  objc_destroyWeak((id *)buf);

}

- (void)_enqueueNewState:(int64_t)a3
{
  NSTimer *updateTimer;
  NSTimer *v6;
  NSTimer *v7;
  _QWORD v8[4];
  id v9[2];
  id location;

  -[NSTimer invalidate](self->_updateTimer, "invalidate");
  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008775F4;
  v8[3] = &unk_1011D9B18;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a3;
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 10.0));
  v7 = self->_updateTimer;
  self->_updateTimer = v6;

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (void)_fireStateUpdate:(int64_t)a3
{
  id WeakRetained;
  NSTimer *updateTimer;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didUpdatePocketStateType:", a3);

  updateTimer = self->_updateTimer;
  self->_updateTimer = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
