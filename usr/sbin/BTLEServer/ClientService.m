@implementation ClientService

+ (id)UUID
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)start
{
  double v3;
  id v4;

  -[ClientService startTimeout](self, "startTimeout");
  if (v3 != 0.0)
  {
    -[ClientService startTimeout](self, "startTimeout");
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "startDidTimeout", 0, 0));
    -[ClientService setStartTimer:](self, "setStartTimer:", v4);

  }
}

- (void)stop
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ClientService startTimer](self, "startTimer"));
  objc_msgSend(v2, "invalidate");

}

- (ClientService)initWithManager:(id)a3 peripheral:(id)a4 service:(id)a5
{
  id v8;
  id v9;
  id v10;
  ClientService *v11;
  ClientService *v12;
  NSTimer *startTimer;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ClientService;
  v11 = -[ClientService init](&v15, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_manager, v8);
    objc_storeStrong((id *)&v12->_peripheral, a4);
    objc_storeStrong((id *)&v12->_service, a5);
    *(_WORD *)&v12->_isPrimary = 0;
    v12->_startTimeout = 10.0;
    startTimer = v12->_startTimer;
    v12->_priority = 10;
    v12->_startTimer = 0;

  }
  return v12;
}

- (void)notifyDidStart
{
  void *v3;
  CBService *service;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;

  if (!-[ClientService isStarted](self, "isStarted"))
  {
    v3 = (void *)qword_1000C9178;
    if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
    {
      service = self->_service;
      v5 = v3;
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBService UUID](service, "UUID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CBPeripheral name](self->_peripheral, "name"));
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Service \"%@\" has started on peripheral \"%@\", (uint8_t *)&v10, 0x16u);

    }
    -[ClientService setIsStarted:](self, "setIsStarted:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService startTimer](self, "startTimer"));
    objc_msgSend(v8, "invalidate");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
    objc_msgSend(v9, "clientServiceDidStart:", self);

  }
}

- (void)startDidTimeout
{
  void *v3;
  void *v4;

  v3 = (void *)qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_ERROR))
    sub_10006DECC((uint64_t)self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ClientService manager](self, "manager"));
  objc_msgSend(v4, "clientServiceDidStart:", self);

}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (BOOL)isStarted
{
  return self->_isStarted;
}

- (void)setIsStarted:(BOOL)a3
{
  self->_isStarted = a3;
}

- (NSTimer)startTimer
{
  return self->_startTimer;
}

- (void)setStartTimer:(id)a3
{
  objc_storeStrong((id *)&self->_startTimer, a3);
}

- (ClientServiceManager)manager
{
  return (ClientServiceManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (CBService)service
{
  return self->_service;
}

- (double)startTimeout
{
  return self->_startTimeout;
}

- (void)setStartTimeout:(double)a3
{
  self->_startTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_startTimer, 0);
}

@end
