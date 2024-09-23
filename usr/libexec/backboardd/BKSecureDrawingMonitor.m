@implementation BKSecureDrawingMonitor

- (BKSecureDrawingMonitor)init
{
  BKSecureDrawingMonitor *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  OS_dispatch_queue *reportingQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKSecureDrawingMonitor;
  v2 = -[BKSecureDrawingMonitor init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSDispatchQueueAttributes serial](BSDispatchQueueAttributes, "serial"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serviceClass:", 9));
    v5 = BSDispatchQueueCreate(CFSTR("com.apple.backboardd.secure-drawing-monitor"), v4);
    reportingQueue = v2->_reportingQueue;
    v2->_reportingQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)startMonitoringSecureDrawing
{
  NSObject *reportingQueue;
  _QWORD v3[5];
  int out_token;

  out_token = 0;
  reportingQueue = self->_reportingQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10006D300;
  v3[3] = &unk_1000EBB60;
  v3[4] = self;
  notify_register_dispatch("com.apple.CoreAnimation.CAWindowServer.SecureModeViolation", &out_token, reportingQueue, v3);
}

- (void)reportAndKillInsecureProcesses
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[6];
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  void **v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;

  if (-[BKSecureDrawingMonitor isSecureModeEnabled](self, "isSecureModeEnabled"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[CAWindowServer serverIfRunning](CAWindowServer, "serverIfRunning"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "secureModeViolations"));

    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = sub_10006CDEC;
    v34 = sub_10006CDFC;
    v35 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = sub_10006CDEC;
    v28[4] = sub_10006CDFC;
    v29 = 0;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10006CE04;
    v27[3] = &unk_1000EBB88;
    v27[4] = &v30;
    v27[5] = v28;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v27);
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_10006CDEC;
    v25 = sub_10006CDFC;
    v26 = 0;
    if (v31[5])
    {
      v4 = objc_alloc_init((Class)NSMutableArray);
      v5 = (void *)v22[5];
      v22[5] = (uint64_t)v4;

      v6 = (void *)v31[5];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10006CFE0;
      v20[3] = &unk_1000EBBD8;
      v20[4] = v28;
      v20[5] = &v21;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v20);
      if (v22[5])
      {
        v41 = 0;
        v42 = &v41;
        v43 = 0x2050000000;
        v7 = (void *)qword_1001174C0;
        v44 = qword_1001174C0;
        if (!qword_1001174C0)
        {
          v36 = _NSConcreteStackBlock;
          v37 = 3221225472;
          v38 = (uint64_t)sub_10006D0DC;
          v39 = &unk_1000EBC00;
          v40 = &v41;
          sub_10006D0DC((uint64_t)&v36);
          v7 = (void *)v42[3];
        }
        v8 = objc_retainAutorelease(v7);
        _Block_object_dispose(&v41, 8);
        v9 = objc_alloc_init(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "systemApplicationBundleIdentifier"));
        v36 = 0;
        v37 = (uint64_t)&v36;
        v38 = 0x2020000000;
        v11 = (id *)qword_1001174D0;
        v39 = (void *)qword_1001174D0;
        if (!qword_1001174D0)
        {
          v12 = sub_10006D1A0();
          v11 = (id *)dlsym(v12, "FBSOpenApplicationOptionKeyActions");
          *(_QWORD *)(v37 + 24) = v11;
          qword_1001174D0 = (uint64_t)v11;
        }
        _Block_object_dispose(&v36, 8);
        if (!v11)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "NSString *getFBSOpenApplicationOptionKeyActions(void)"));
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("BKSecureDrawingMonitor.m"), 27, CFSTR("%s"), dlerror());

          __break(1u);
          return;
        }
        v13 = *v11;
        v14 = v13;
        if (v10)
        {
          if (v13)
          {
            v15 = objc_alloc((Class)BKSInsecureDrawingAction);
            v16 = objc_msgSend(v15, "initWithSecureModeViolations:", v22[5]);
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v16));
            objc_msgSend(v9, "sendActions:withResult:", v17, 0);

          }
        }

      }
    }
    _Block_object_dispose(&v21, 8);

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(&v30, 8);

  }
}

- (BOOL)isSecureModeEnabled
{
  return self->_secureModeEnabled;
}

- (void)setSecureModeEnabled:(BOOL)a3
{
  self->_secureModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingQueue, 0);
}

+ (id)sharedInstance
{
  if (qword_1001174B8 != -1)
    dispatch_once(&qword_1001174B8, &stru_1000EBB38);
  return (id)qword_1001174B0;
}

@end
