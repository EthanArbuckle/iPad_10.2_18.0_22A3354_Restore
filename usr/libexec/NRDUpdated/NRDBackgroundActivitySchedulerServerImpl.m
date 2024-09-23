@implementation NRDBackgroundActivitySchedulerServerImpl

- (NRDBackgroundActivitySchedulerServerImpl)initWithIdentifier:(id)a3
{
  id v4;
  NRDBackgroundActivitySchedulerServerImpl *v5;
  NSBackgroundActivityScheduler *v6;
  NSBackgroundActivityScheduler *scheduler;

  v4 = a3;
  v5 = -[NRDBackgroundActivitySchedulerServerImpl init](self, "init");
  if (v5)
  {
    v6 = (NSBackgroundActivityScheduler *)objc_msgSend(objc_alloc((Class)NSBackgroundActivityScheduler), "initWithIdentifier:", v4);
    scheduler = v5->_scheduler;
    v5->_scheduler = v6;

  }
  return v5;
}

- (void)dealloc
{
  NSBackgroundActivityScheduler *scheduler;
  objc_super v4;

  scheduler = self->_scheduler;
  self->_scheduler = 0;

  v4.receiver = self;
  v4.super_class = (Class)NRDBackgroundActivitySchedulerServerImpl;
  -[NRDBackgroundActivitySchedulerServerImpl dealloc](&v4, "dealloc");
}

- (void)identifier:(id)a3
{
  NSBackgroundActivityScheduler *scheduler;
  id v5;
  id v6;

  scheduler = self->_scheduler;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NSBackgroundActivityScheduler identifier](scheduler, "identifier"));
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)qualityOfService:(id)a3
{
  NSBackgroundActivityScheduler *scheduler;
  id v5;

  scheduler = self->_scheduler;
  v5 = a3;
  (*((void (**)(id, NSQualityOfService))a3 + 2))(v5, -[NSBackgroundActivityScheduler qualityOfService](scheduler, "qualityOfService"));

}

- (void)setQualityOfService:(int64_t)a3
{
  -[NSBackgroundActivityScheduler setQualityOfService:](self->_scheduler, "setQualityOfService:", a3);
}

- (void)repeats:(id)a3
{
  NSBackgroundActivityScheduler *scheduler;
  id v5;

  scheduler = self->_scheduler;
  v5 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v5, -[NSBackgroundActivityScheduler repeats](scheduler, "repeats"));

}

- (void)interval:(id)a3
{
  NSBackgroundActivityScheduler *scheduler;
  id v5;

  scheduler = self->_scheduler;
  v5 = a3;
  -[NSBackgroundActivityScheduler interval](scheduler, "interval");
  (*((void (**)(id))a3 + 2))(v5);

}

- (void)setRepeats:(BOOL)a3
{
  -[NSBackgroundActivityScheduler setRepeats:](self->_scheduler, "setRepeats:", a3);
}

- (void)setInterval:(double)a3
{
  -[NSBackgroundActivityScheduler setInterval:](self->_scheduler, "setInterval:", a3);
}

- (void)tolerance:(id)a3
{
  NSBackgroundActivityScheduler *scheduler;
  id v5;

  scheduler = self->_scheduler;
  v5 = a3;
  -[NSBackgroundActivityScheduler tolerance](scheduler, "tolerance");
  (*((void (**)(id))a3 + 2))(v5);

}

- (void)setTolerance:(double)a3
{
  -[NSBackgroundActivityScheduler setTolerance:](self->_scheduler, "setTolerance:", a3);
}

- (void)scheduleWithRemoteableBlock:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  const char *v9;
  NSQualityOfService v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSBackgroundActivityScheduler *scheduler;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  NRDBackgroundActivitySchedulerServerImpl *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  NSQualityOfService v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;

  v4 = a3;
  v5 = nrdSharedLogger();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSBackgroundActivityScheduler identifier](self->_scheduler, "identifier"));
    v8 = "NO";
    if (-[NSBackgroundActivityScheduler isPreregistered](self->_scheduler, "isPreregistered"))
      v9 = "YES";
    else
      v9 = "NO";
    v10 = -[NSBackgroundActivityScheduler qualityOfService](self->_scheduler, "qualityOfService");
    if (-[NSBackgroundActivityScheduler repeats](self->_scheduler, "repeats"))
      v8 = "YES";
    -[NSBackgroundActivityScheduler interval](self->_scheduler, "interval");
    v12 = v11;
    -[NSBackgroundActivityScheduler delay](self->_scheduler, "delay");
    v14 = v13;
    -[NSBackgroundActivityScheduler tolerance](self->_scheduler, "tolerance");
    *(_DWORD *)buf = 138414082;
    v21 = self;
    v22 = 2112;
    v23 = v7;
    v24 = 2080;
    v25 = v9;
    v26 = 2048;
    v27 = v10;
    v28 = 2080;
    v29 = v8;
    v30 = 2048;
    v31 = v12;
    v32 = 2048;
    v33 = v14;
    v34 = 2048;
    v35 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Scheduling Activity %@ = {\n\tidentifier = %@\n\tpreregistered = %s\n\tqualityOfService = %ld\n\trepeats = %s\n\tinterval = %f\n\tdelay = %f\n\ttolerance = %f\n}", buf, 0x52u);

  }
  scheduler = self->_scheduler;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __72__NRDBackgroundActivitySchedulerServerImpl_scheduleWithRemoteableBlock___block_invoke;
  v18[3] = &unk_1000147A0;
  v18[4] = self;
  v19 = v4;
  v17 = v4;
  -[NSBackgroundActivityScheduler scheduleWithBlock:](scheduler, "scheduleWithBlock:", v18);

}

void __72__NRDBackgroundActivitySchedulerServerImpl_scheduleWithRemoteableBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;

  v3 = a2;
  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheduler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" fired.", buf, 0x16u);

  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __72__NRDBackgroundActivitySchedulerServerImpl_scheduleWithRemoteableBlock___block_invoke_2;
  v11[3] = &unk_100014778;
  v9 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v10 = v3;
  objc_msgSend(v9, "execute:", v11);

}

uint64_t __72__NRDBackgroundActivitySchedulerServerImpl_scheduleWithRemoteableBlock___block_invoke_2(uint64_t a1, int a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  __CFString *v16;

  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheduler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    if (a2 == 1)
    {
      v9 = CFSTR("NSBackgroundActivityResultFinished");
    }
    else if (a2 == 2)
    {
      v9 = CFSTR("NSBackgroundActivityResultDeferred");
    }
    else
    {
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a2));
    }
    *(_DWORD *)buf = 138412802;
    v12 = v6;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" result: %@", buf, 0x20u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)invalidate
{
  -[NSBackgroundActivityScheduler invalidate](self->_scheduler, "invalidate");
}

- (void)shouldDefer:(id)a3
{
  NSBackgroundActivityScheduler *scheduler;
  id v5;

  scheduler = self->_scheduler;
  v5 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v5, -[NSBackgroundActivityScheduler shouldDefer](scheduler, "shouldDefer"));

}

- (void)preregistered:(id)a3
{
  NSBackgroundActivityScheduler *scheduler;
  id v5;

  scheduler = self->_scheduler;
  v5 = a3;
  (*((void (**)(id, id))a3 + 2))(v5, -[NSBackgroundActivityScheduler isPreregistered](scheduler, "isPreregistered"));

}

- (void)setPreregistered:(BOOL)a3
{
  -[NSBackgroundActivityScheduler setPreregistered:](self->_scheduler, "setPreregistered:", a3);
}

- (void)delay:(id)a3
{
  NSBackgroundActivityScheduler *scheduler;
  id v5;

  scheduler = self->_scheduler;
  v5 = a3;
  -[NSBackgroundActivityScheduler delay](scheduler, "delay");
  (*((void (**)(id))a3 + 2))(v5);

}

- (void)setDelay:(double)a3
{
  -[NSBackgroundActivityScheduler setDelay:](self->_scheduler, "setDelay:", a3);
}

- (void)_setAdditionalXPCActivityProperties:(id)a3
{
  id v4;

  v4 = (id)_CFXPCCreateXPCObjectFromCFObject(a3, a2);
  -[NSBackgroundActivityScheduler _setAdditionalXPCActivityProperties:](self->_scheduler, "_setAdditionalXPCActivityProperties:", v4);

}

- (void)setCheckInHandler:(id)a3
{
  id v4;
  NSBackgroundActivityScheduler *scheduler;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  _QWORD v15[3];
  char v16;

  v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  scheduler = self->_scheduler;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSBackgroundActivityScheduler identifier](scheduler, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSBackgroundActivityScheduler description](self->_scheduler, "description"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke;
    v10[3] = &unk_1000147F0;
    v8 = v7;
    v11 = v8;
    v9 = v6;
    v12 = v9;
    v13 = v4;
    v14 = v15;
    -[NSBackgroundActivityScheduler setCheckInHandler:](self->_scheduler, "setCheckInHandler:", v10);

  }
  else
  {
    -[NSBackgroundActivityScheduler setCheckInHandler:](scheduler, "setCheckInHandler:", 0);
  }
  _Block_object_dispose(v15, 8);

}

void __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke(_QWORD *a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];
  uint64_t (*v24)(uint64_t);
  void *v25;
  uint64_t v26;
  _QWORD v27[5];
  _BYTE buf[22];

  v2 = nrdSharedLogger();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    v5 = a1[5];
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" check-in.", buf, 0x16u);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke_5;
  v27[3] = &unk_1000147C8;
  v6 = (void *)a1[6];
  v27[4] = a1[7];
  objc_msgSend(v6, "execute:", v27);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v24 = __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke_2;
  v25 = &unk_1000145F8;
  v26 = a1[7];
  v7 = v23;
  v8 = objc_autoreleasePoolPush();
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  do
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:", 0.02));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v12, "runUntilDate:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v13, "timeIntervalSinceDate:", v10);
    v15 = v14;

    if (v15 < 0.02)
    {
      *(_QWORD *)buf = (uint64_t)(0.02 - v15);
      *(_QWORD *)&buf[8] = (uint64_t)((0.02 - v15 - (double)*(uint64_t *)buf) * 1000000000.0);
      nanosleep((const timespec *)buf, 0);
    }

    if ((v24((uint64_t)v7) & 1) != 0)
      break;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v16, "timeIntervalSinceDate:", v9);
    v18 = v17 < 3.1536e10;

  }
  while (v18);

  objc_autoreleasePoolPop(v8);
  v19 = nrdSharedLogger();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = a1[4];
    v22 = a1[5];
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v21;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" check-in complete.", buf, 0x16u);
  }

}

uint64_t __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke_5(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t __62__NRDBackgroundActivitySchedulerServerImpl_setCheckInHandler___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (void)_isAppRefresh:(id)a3
{
  NSBackgroundActivityScheduler *scheduler;
  id v5;

  scheduler = self->_scheduler;
  v5 = a3;
  (*((void (**)(id, id))a3 + 2))(v5, -[NSBackgroundActivityScheduler _isAppRefresh](scheduler, "_isAppRefresh"));

}

- (void)set_appRefresh:(BOOL)a3
{
  -[NSBackgroundActivityScheduler set_appRefresh:](self->_scheduler, "set_appRefresh:", a3);
}

- (NSBackgroundActivityScheduler)scheduler
{
  return self->_scheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
