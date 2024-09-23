@implementation _DASCPMModeMonitor

- (_DASCPMModeMonitor)init
{
  _DASCPMModeMonitor *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DASCPMModeMonitor;
  v2 = -[_DASCPMModeMonitor init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.dasd.cpmModesMonitorQueue", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    -[_DASCPMModeMonitor registerForModeChanges](v2, "registerForModeChanges");
  }
  return v2;
}

+ (id)sharedMonitor
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000180C4;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB3B8 != -1)
    dispatch_once(&qword_1001AB3B8, block);
  return (id)qword_1001AB3C0;
}

- (void)registerForModeChanges
{
  ContextualPowerModesClient *v3;
  ContextualPowerModesClient *cpmClient;
  ContextualPowerModesClient *v5;
  OS_dispatch_queue *queue;
  _QWORD v7[5];

  v3 = (ContextualPowerModesClient *)objc_alloc_init((Class)ContextualPowerModesClient);
  cpmClient = self->_cpmClient;
  self->_cpmClient = v3;

  v5 = self->_cpmClient;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001816C;
  v7[3] = &unk_10015D3D0;
  v7[4] = self;
  -[ContextualPowerModesClient registerWithIdentifier:queue:callback:](v5, "registerWithIdentifier:queue:callback:", CFSTR("com.apple.dasd"), queue, v7);
}

- (void)queue_handleMode:(id)a3 updatedToState:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  _DASCPMModeMonitor *v14;
  id v15;
  void *v16;
  NSObject *v17;

  v4 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("cpmModes")));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1000DF7C8((uint64_t)v6, v4, v7);

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCPMModeMonitor currentMode](self, "currentMode"));
    v9 = v8;
    if (v4)
    {
      if (v8)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCPMModeMonitor currentMode](self, "currentMode"));
        v11 = objc_msgSend(v10, "isEqualToString:", v6) ^ 1;

      }
      else
      {
        v11 = 1;
      }
    }
    else
    {
      v11 = objc_msgSend(v8, "isEqualToString:", v6);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASCPMModeMonitor currentMode](self, "currentMode"));
    v13 = objc_msgSend(v12, "isEqual:", v6);

    if (!v13 || v4)
    {
      if (!v4)
        goto LABEL_15;
      v14 = self;
      v15 = v6;
    }
    else
    {
      v14 = self;
      v15 = 0;
    }
    -[_DASCPMModeMonitor setCurrentMode:](v14, "setCurrentMode:", v15);
LABEL_15:
    if (v11)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "evaluationQueue"));
      dispatch_async(v17, &stru_10015D410);

    }
  }

}

- (NSString)currentMode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCurrentMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (ContextualPowerModesClient)cpmClient
{
  return self->_cpmClient;
}

- (void)setCpmClient:(id)a3
{
  objc_storeStrong((id *)&self->_cpmClient, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cpmClient, 0);
  objc_storeStrong((id *)&self->_currentMode, 0);
}

@end
