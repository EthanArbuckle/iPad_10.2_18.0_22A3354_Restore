@implementation SVXSystemObserver

- (void)addDeviceContextListener:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__SVXSystemObserver_addDeviceContextListener___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)removeDeviceContextListener:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SVXModule performer](self->_module, "performer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SVXSystemObserver_removeDeviceContextListener___block_invoke;
  v7[3] = &unk_24D24F018;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (void)getLocalDeviceContextWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[SVXModule performer](self->_module, "performer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __57__SVXSystemObserver_getLocalDeviceContextWithCompletion___block_invoke;
    v6[3] = &unk_24D24EF28;
    v6[4] = self;
    v7 = v4;
    objc_msgSend(v5, "performBlock:", v6);

  }
}

- (SVXSystemObserver)initWithModule:(id)a3
{
  id v5;
  SVXSystemObserver *v6;
  SVXSystemObserver *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  AFDeviceContextConnection *deviceContextConnection;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SVXSystemObserver;
  v6 = -[SVXSystemObserver init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_module, a3);
    v8 = objc_alloc(MEMORY[0x24BE09198]);
    objc_msgSend(v5, "performer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    objc_msgSend(v10, "queue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "instanceContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "initWithQueue:instanceContext:delegate:", v11, v12, v7);
    deviceContextConnection = v7->_deviceContextConnection;
    v7->_deviceContextConnection = (AFDeviceContextConnection *)v13;

  }
  return v7;
}

- (void)dealloc
{
  SVXDeviceContextAnnouncer *deviceContextAnnouncer;
  objc_super v4;

  -[AFDeviceContextConnection invalidate](self->_deviceContextConnection, "invalidate");
  deviceContextAnnouncer = self->_deviceContextAnnouncer;
  self->_deviceContextAnnouncer = 0;

  v4.receiver = self;
  v4.super_class = (Class)SVXSystemObserver;
  -[SVXSystemObserver dealloc](&v4, sel_dealloc);
}

- (void)startWithModuleInstanceProvider:(id)a3 platformDependencies:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[SVXSystemObserver _startObservingInfo](self, "_startObservingInfo");
  -[SVXSystemObserver _startObservingDeviceContext](self, "_startObservingDeviceContext");
  objc_msgSend(v5, "sessionManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addActivityListener:", self);
}

- (void)stopWithModuleInstanceProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SVXSystemObserver _stopObservingInfo](self, "_stopObservingInfo");
  -[SVXSystemObserver _stopObservingDeviceContext](self, "_stopObservingDeviceContext");
  objc_msgSend(v4, "sessionManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeActivityListener:", self);
}

- (void)sessionDidChangeFromState:(int64_t)a3 toState:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  _QWORD v8[9];

  if (a4 == 2)
  {
    v8[7] = v4;
    v8[8] = v5;
    -[SVXModule performer](self->_module, "performer", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__SVXSystemObserver_sessionDidChangeFromState_toState___block_invoke;
    v8[3] = &unk_24D24EFF0;
    v8[4] = self;
    objc_msgSend(v7, "performBlock:", v8);

  }
}

- (void)_startObservingInfo
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  -[SVXSystemObserver _stopObservingInfo](self, "_stopObservingInfo");
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[SVXSystemObserver _startObservingInfo]";
    _os_log_error_impl(&dword_214934000, v2, OS_LOG_TYPE_ERROR, "%s SoundAutoConfig is not available on this platform.", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_logSnapshot
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (objc_msgSend(v4, "count"))
  {
    -[SVXModule analytics](self->_module, "analytics");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logEventWithType:context:contextNoCopy:", 3101, v4, 1);

  }
}

- (BOOL)_isSoundAutoConfigAvailable
{
  return 0;
}

- (void)_startObservingDeviceContext
{
  -[AFDeviceContextConnection beginUpdateLocalDeviceContext](self->_deviceContextConnection, "beginUpdateLocalDeviceContext");
}

- (void)_stopObservingDeviceContext
{
  -[AFDeviceContextConnection endUpdateLocalDeviceContext](self->_deviceContextConnection, "endUpdateLocalDeviceContext");
}

- (void)deviceContextConnectionDidInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXSystemObserver deviceContextConnectionDidInvalidate:]";
    v12 = 2112;
    v13 = v4;
    _os_log_debug_impl(&dword_214934000, v5, OS_LOG_TYPE_DEBUG, "%s deviceContextConnection = %@", buf, 0x16u);
  }
  -[SVXModule performer](self->_module, "performer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__SVXSystemObserver_deviceContextConnectionDidInvalidate___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)deviceContextConnection:(id)a3 didUpdateLocalDeviceContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
  {
    v12 = v8;
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v18 = "-[SVXSystemObserver deviceContextConnection:didUpdateLocalDeviceContext:]";
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v13;
    _os_log_debug_impl(&dword_214934000, v12, OS_LOG_TYPE_DEBUG, "%s deviceContextConnection = %@, localDeviceContext = %@", buf, 0x20u);

  }
  -[SVXModule performer](self->_module, "performer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __73__SVXSystemObserver_deviceContextConnection_didUpdateLocalDeviceContext___block_invoke;
  v14[3] = &unk_24D24EF00;
  v14[4] = self;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "performBlock:", v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceContextConnection, 0);
  objc_storeStrong((id *)&self->_deviceContextAnnouncer, 0);
  objc_storeStrong((id *)&self->_module, 0);
}

void __73__SVXSystemObserver_deviceContextConnection_didUpdateLocalDeviceContext___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  v1 = a1[5];
  if (*(_QWORD *)(v2 + 24) == v1)
  {
    objc_msgSend(*(id *)(v2 + 16), "localDeviceContextDidUpdate:", a1[6]);
  }
  else
  {
    v3 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(v2 + 16);
      v5 = 136315650;
      v6 = "-[SVXSystemObserver deviceContextConnection:didUpdateLocalDeviceContext:]_block_invoke";
      v7 = 2112;
      v8 = v4;
      v9 = 2112;
      v10 = v1;
      _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s Ignored because the device context connection is %@, not %@.", (uint8_t *)&v5, 0x20u);
    }
  }
}

void __58__SVXSystemObserver_deviceContextConnectionDidInvalidate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(void **)(v3 + 24);
  if (v4 == v2)
  {
    objc_msgSend(v4, "invalidate");
    v7 = objc_alloc(MEMORY[0x24BE09198]);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "performer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    objc_msgSend(v9, "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "instanceContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "initWithQueue:instanceContext:delegate:", v10, v11, *(_QWORD *)(a1 + 32));
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 24);
    *(_QWORD *)(v13 + 24) = v12;

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isActive"))
      objc_msgSend(*(id *)(a1 + 32), "_startObservingDeviceContext");
  }
  else
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(v3 + 16);
      v15 = 136315650;
      v16 = "-[SVXSystemObserver deviceContextConnectionDidInvalidate:]_block_invoke";
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v2;
      _os_log_error_impl(&dword_214934000, v5, OS_LOG_TYPE_ERROR, "%s Ignored because the device context connection is %@, not %@.", (uint8_t *)&v15, 0x20u);
    }
  }
}

uint64_t __55__SVXSystemObserver_sessionDidChangeFromState_toState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logSnapshot");
}

uint64_t __57__SVXSystemObserver_getLocalDeviceContextWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "getLocalDeviceContextWithCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__SVXSystemObserver_removeDeviceContextListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeListener:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__SVXSystemObserver_addDeviceContextListener___block_invoke(uint64_t a1)
{
  void *v2;
  SVXDeviceContextAnnouncer *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(SVXDeviceContextAnnouncer);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return objc_msgSend(v2, "addListener:", *(_QWORD *)(a1 + 40));
}

@end
