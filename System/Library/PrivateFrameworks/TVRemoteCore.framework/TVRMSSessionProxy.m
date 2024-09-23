@implementation TVRMSSessionProxy

- (TVRMSSessionProxy)init
{
  return -[TVRMSSessionProxy initWithTimeout:](self, "initWithTimeout:", 60.0);
}

- (TVRMSSessionProxy)initWithTimeout:(double)a3
{
  TVRMSSessionProxy *v4;
  TVRMSSessionProxy *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TVRMSSessionProxy;
  v4 = -[TVRMSSessionProxy init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_sessionTimeout = a3;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__applicationWillResignActiveNotification_, *MEMORY[0x24BDF75D8], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__applicationDidBecomeActive_, *MEMORY[0x24BDF7510], 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[TVRMSSessionProxy endHeartbeat](self, "endHeartbeat");
  v4.receiver = self;
  v4.super_class = (Class)TVRMSSessionProxy;
  -[TVRMSSessionProxy dealloc](&v4, sel_dealloc);
}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_heartbeatTimer)
  {
    _TVRCRMSLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_21A51B000, v4, OS_LOG_TYPE_DEFAULT, "[%@] Application suspended, pausing heartbeat", (uint8_t *)&v7, 0xCu);

    }
    -[TVRMSSessionProxy endHeartbeat](self, "endHeartbeat");
    self->_isPaused = 1;
  }
}

- (void)_applicationDidBecomeActive:(id)a3
{
  id v4;
  double v5;
  double v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  double sessionTimeout;
  double v12;
  NSObject *v13;
  _BOOL4 v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_isPaused)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v6 = v5 - self->_lastHeartbeatTime;
    _TVRCRMSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = *(double *)&v9;
      v20 = 2048;
      v21 = v6;
      _os_log_impl(&dword_21A51B000, v7, OS_LOG_TYPE_DEFAULT, "[%@] Application foregrounded, time since last heartbeat: %f", (uint8_t *)&v18, 0x16u);

    }
    _TVRCRMSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      sessionTimeout = self->_sessionTimeout;
      v18 = 134217984;
      v19 = sessionTimeout;
      _os_log_impl(&dword_21A51B000, v10, OS_LOG_TYPE_DEFAULT, "Session timeout: %f", (uint8_t *)&v18, 0xCu);
    }

    v12 = self->_sessionTimeout;
    _TVRCRMSLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v6 >= v12)
    {
      if (v14)
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "Backgrounded for too long, session is over", (uint8_t *)&v18, 2u);
      }

      -[TVRMSSessionProxy heartbeatDidFail](self, "heartbeatDidFail");
      -[TVRMSSessionProxy endHeartbeat](self, "endHeartbeat");
      self->_sessionIdentifier = 0;
    }
    else
    {
      if (v14)
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_21A51B000, v13, OS_LOG_TYPE_DEFAULT, "Resuming session", (uint8_t *)&v18, 2u);
      }

      -[TVRMSSessionProxy beginHeartbeat](self, "beginHeartbeat");
      v15 = -[TVRMSSessionProxy heartbeatTime](self, "heartbeatTime");
      if (v15 >= 0)
        v16 = v15;
      else
        v16 = v15 + 1;
      if (v6 > (double)(v16 >> 1))
      {
        _TVRCRMSLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_21A51B000, v17, OS_LOG_TYPE_DEFAULT, "Sending immediate heartbeat", (uint8_t *)&v18, 2u);
        }

        -[NSTimer fire](self->_heartbeatTimer, "fire");
      }
    }
  }

}

- (void)beginHeartbeat
{
  uint64_t v3;
  double v4;
  _QWORD block[5];

  if (!self->_heartbeatTimer)
  {
    self->_isPaused = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v3 = MEMORY[0x24BDAC760];
    self->_lastHeartbeatTime = v4;
    block[0] = v3;
    block[1] = 3221225472;
    block[2] = __35__TVRMSSessionProxy_beginHeartbeat__block_invoke;
    block[3] = &unk_24DCD70C8;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __35__TVRMSSessionProxy_beginHeartbeat__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel__sendHeartbeat_, 0, 1, (double)(int)objc_msgSend(*(id *)(a1 + 32), "heartbeatTime"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

}

- (void)endHeartbeat
{
  NSTimer *heartbeatTimer;
  NSTimer *v4;

  heartbeatTimer = self->_heartbeatTimer;
  if (heartbeatTimer)
  {
    -[NSTimer invalidate](heartbeatTimer, "invalidate");
    v4 = self->_heartbeatTimer;
    self->_heartbeatTimer = 0;

  }
  self->_isPaused = 0;
}

- (int)heartbeatTime
{
  return 30;
}

- (BOOL)sessionMatchesNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RMSIDSClientSessionIdentifierNotificationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  LOBYTE(self) = self->_sessionIdentifier == v6;
  return (char)self;
}

- (void)_sendHeartbeat:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[TVRMSSessionProxy sessionIdentifier](self, "sessionIdentifier");
  objc_initWeak(&location, self);
  _TVRCRMSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Sending heartbeat for session: %@", buf, 0xCu);

  }
  +[TVRMSIDSClient sharedClient](TVRMSIDSClient, "sharedClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __36__TVRMSSessionProxy__sendHeartbeat___block_invoke;
  v10[3] = &unk_24DCD7078;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "sendHeartbeatWithSessionIdentifier:completionHandler:", v5, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __36__TVRMSSessionProxy__sendHeartbeat___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;
  uint64_t v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && (WeakRetained[1] || *((_BYTE *)WeakRetained + 32)))
  {
    if (a2 == 1)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      v4[3] = v5;
      _TVRCRMSLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_21A51B000, v6, OS_LOG_TYPE_DEFAULT, "Hearbeat success response for session: %@", (uint8_t *)&v12, 0xCu);

      }
    }
    else
    {
      _TVRCRMSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_21A51B000, v9, OS_LOG_TYPE_DEFAULT, "Heartbeat failure response for session: %@", (uint8_t *)&v12, 0xCu);

      }
      objc_msgSend(v4, "endHeartbeat");
      objc_msgSend(v4, "heartbeatDidFail");
    }
  }

}

- (int)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(int)a3
{
  self->_sessionIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
}

@end
