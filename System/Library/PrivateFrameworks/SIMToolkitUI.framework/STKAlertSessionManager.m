@implementation STKAlertSessionManager

- (STKAlertSessionManager)initWithEventQueue:(id)a3 logger:(id)a4
{
  id v7;
  id v8;
  STKAlertSessionManager *v9;
  STKAlertSessionManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STKAlertSessionManager;
  v9 = -[STKAlertSessionManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventQueue, a3);
    objc_storeStrong((id *)&v10->_log, a4);
  }

  return v10;
}

- (id)remoteAlertDescriptorForSession:(id)a3
{
  return 0;
}

- (void)enqueuePresentationForSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  STKAlertSessionEventQueue *eventQueue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[STKAlertSessionManager log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v6;
    _os_log_impl(&dword_216439000, v8, OS_LOG_TYPE_DEFAULT, "Session <%p> - Enqueing for presentation", buf, 0xCu);
  }

  eventQueue = self->_eventQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__STKAlertSessionManager_enqueuePresentationForSession_completion___block_invoke;
  v12[3] = &unk_24D563018;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[STKAlertSessionEventQueue enqueue:](eventQueue, "enqueue:", v12);

}

void __67__STKAlertSessionManager_enqueuePresentationForSession_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "remoteAlertDescriptorForSession:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v21 = 134218242;
    v22 = v4;
    v23 = 2114;
    v24 = v2;
    _os_log_impl(&dword_216439000, v3, OS_LOG_TYPE_DEFAULT, "Session <%p> - Remote alert descriptor: %{public}@", (uint8_t *)&v21, 0x16u);
  }

  if (objc_msgSend(v2, "isValid"))
  {
    v5 = objc_alloc(MEMORY[0x24BEB0AE8]);
    objc_msgSend(v2, "serviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "viewControllerName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithServiceName:viewControllerClassName:", v6, v7);

    v9 = objc_alloc_init(MEMORY[0x24BEB0AD0]);
    v10 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v2, "BSAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActions:", v12);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "ussdListener");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "endpoint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_endpoint");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setXpcEndpoint:", v15);

    }
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB0AF8], "newHandleWithDefinition:configurationContext:", v8, v9);
    objc_msgSend(*(id *)(a1 + 32), "_willPresentAlertHandle:", v16);
    v17 = *(void **)(a1 + 40);
    objc_msgSend(v2, "action");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "presentRemoteAlertHandle:withAction:", v16, v18);

    if (!v16)
    {
      objc_msgSend(*(id *)(a1 + 40), "sendResponse:", 5);
      objc_msgSend(*(id *)(a1 + 40), "invalidate");
    }
    (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v16 != 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(a1 + 40);
      v21 = 134217984;
      v22 = v20;
      _os_log_impl(&dword_216439000, v19, OS_LOG_TYPE_DEFAULT, "Session <%p> - Failed to create a remote alert.  Invalidating.", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }

}

- (OS_os_log)log
{
  return self->_log;
}

- (STKAlertSessionEventQueue)eventQueue
{
  return self->_eventQueue;
}

- (NSString)deviceLanguage
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceLanguage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceLanguage, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
