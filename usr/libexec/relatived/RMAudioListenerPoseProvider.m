@implementation RMAudioListenerPoseProvider

- (RMAudioListenerPoseProvider)initWithConfiguration:(id)a3 receiverQueue:(id)a4
{
  id v6;
  id v7;
  RMAudioListenerPoseProvider *v8;
  RMAudioListenerPoseProvider *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RMAudioListenerPoseProvider;
  v8 = -[RMAudioListenerPoseProvider init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[RMAudioListenerPoseProvider setConfiguration:](v8, "setConfiguration:", v6);
    -[RMAudioListenerPoseProvider setReceiverQueue:](v9, "setReceiverQueue:", v7);
    atomic_store(0, (unsigned __int8 *)&v9->isRunning);
  }

  return v9;
}

- (id)startProducingDataWithCallback:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  RMAudioListenerPoseProvider *v17;

  v4 = a3;
  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100024B18);
  v5 = qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134283521;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "startProducingData: %{private}p", buf, 0xCu);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioListenerPoseProvider configuration](self, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tempestOptions"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMAudioListenerPoseProvider configuration](self, "configuration"));
  v9 = objc_msgSend(v8, "forceSessionRestart");

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RMAudioListenerPoseEngine sharedInstance](RMAudioListenerPoseEngine, "sharedInstance"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000083BC;
  v14[3] = &unk_100024AF8;
  v14[4] = self;
  v15 = v4;
  v11 = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startProducingDataForObject:tempestOptions:forceSessionRestart:callback:", self, v7, v9, v14));

  if (!v12)
    atomic_store(1u, (unsigned __int8 *)&self->isRunning);

  return v12;
}

- (void)stopProducingData
{
  NSObject *v3;
  void *v4;
  int v5;
  RMAudioListenerPoseProvider *v6;

  if (qword_10002C4B0 != -1)
    dispatch_once(&qword_10002C4B0, &stru_100024B18);
  v3 = qword_10002C4B8;
  if (os_log_type_enabled((os_log_t)qword_10002C4B8, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134283521;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "stopProducingData: %{private}p", (uint8_t *)&v5, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RMAudioListenerPoseEngine sharedInstance](RMAudioListenerPoseEngine, "sharedInstance"));
  objc_msgSend(v4, "stopProducingDataForObject:", self);

  atomic_store(0, (unsigned __int8 *)&self->isRunning);
}

- (OS_dispatch_queue)receiverQueue
{
  return self->_receiverQueue;
}

- (void)setReceiverQueue:(id)a3
{
  objc_storeStrong((id *)&self->_receiverQueue, a3);
}

- (RMAudioListenerPoseProviderConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_receiverQueue, 0);
}

@end
