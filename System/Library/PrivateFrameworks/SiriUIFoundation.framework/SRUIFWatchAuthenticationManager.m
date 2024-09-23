@implementation SRUIFWatchAuthenticationManager

- (SRUIFWatchAuthenticationManager)init
{
  SRUIFWatchAuthenticationManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *watchAuthenticationQueue;
  uint64_t v6;
  SFAuthenticationManager *authenticationManager;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SRUIFWatchAuthenticationManager;
  v2 = -[SRUIFWatchAuthenticationManager init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.siri.SRUIFWatchAuthenticationManager", v3);
    watchAuthenticationQueue = v2->_watchAuthenticationQueue;
    v2->_watchAuthenticationQueue = (OS_dispatch_queue *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE900C8]), "initWithQueue:", v2->_watchAuthenticationQueue);
    authenticationManager = v2->_authenticationManager;
    v2->_authenticationManager = (SFAuthenticationManager *)v6;

    -[SRUIFWatchAuthenticationManager authenticationManager](v2, "authenticationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v2);

  }
  return v2;
}

- (SRUIFWatchAuthenticationManager)initWithQueue:(id)a3 manager:(id)a4
{
  id v7;
  id v8;
  SRUIFWatchAuthenticationManager *v9;
  SRUIFWatchAuthenticationManager *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SRUIFWatchAuthenticationManager;
  v9 = -[SRUIFWatchAuthenticationManager init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_watchAuthenticationQueue, a3);
    objc_storeStrong((id *)&v10->_authenticationManager, a4);
    -[SRUIFWatchAuthenticationManager authenticationManager](v10, "authenticationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v10);

  }
  return v10;
}

- (void)requestWatchAuthentication:(id)a3
{
  id v4;
  NSObject *watchAuthenticationQueue;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    watchAuthenticationQueue = self->_watchAuthenticationQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__SRUIFWatchAuthenticationManager_requestWatchAuthentication___block_invoke;
    block[3] = &unk_24DC1A930;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    dispatch_async(watchAuthenticationQueue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFWatchAuthenticationManager requestWatchAuthentication:].cold.1(v6);
  }

}

void __62__SRUIFWatchAuthenticationManager_requestWatchAuthentication___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_requestWatchAuthentication:", *(_QWORD *)(a1 + 32));

}

- (void)_requestWatchAuthentication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  OS_dispatch_queue *watchAuthenticationQueue;
  id v21;
  AFWatchdogTimer *v22;
  AFWatchdogTimer *authenticationWatchdogTimer;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void (**v32)(_QWORD, _QWORD);
  _QWORD v33[4];
  id v34;
  id v35;
  id location;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SRUIFWatchAuthenticationManager currentSessionID](self, "currentSessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SRUIFWatchAuthenticationManager authenticationWatchdogTimer](self, "authenticationWatchdogTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "cancelIfNotAlreadyCanceled");

    if (v7)
    {
      v8 = (void *)*MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        -[SRUIFWatchAuthenticationManager currentSessionID](self, "currentSessionID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v38 = "-[SRUIFWatchAuthenticationManager _requestWatchAuthentication:]";
        v39 = 2112;
        v40 = v10;
        _os_log_impl(&dword_219F26000, v9, OS_LOG_TYPE_DEFAULT, "%s Watch authentication request already in progress. Cancelling session: %@", buf, 0x16u);

      }
      -[SRUIFWatchAuthenticationManager authenticationManager](self, "authenticationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SRUIFWatchAuthenticationManager currentSessionID](self, "currentSessionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cancelAuthenticationSessionWithID:", v12);

    }
  }
  -[SRUIFWatchAuthenticationManager setAuthenticationCompletion:](self, "setAuthenticationCompletion:", v4);
  -[SRUIFWatchAuthenticationManager authenticationManager](self, "authenticationManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSupportedForType:", 1);

  -[SRUIFWatchAuthenticationManager authenticationManager](self, "authenticationManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEnabledForType:", 1);

  if ((v14 & v16) == 1)
  {
    -[SRUIFWatchAuthenticationManager authenticationManager](self, "authenticationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "authenticateForType:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    v19 = objc_alloc(MEMORY[0x24BE093A8]);
    watchAuthenticationQueue = self->_watchAuthenticationQueue;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __63__SRUIFWatchAuthenticationManager__requestWatchAuthentication___block_invoke;
    v33[3] = &unk_24DC1A838;
    objc_copyWeak(&v35, &location);
    v21 = v18;
    v34 = v21;
    v22 = (AFWatchdogTimer *)objc_msgSend(v19, "initWithTimeoutInterval:onQueue:timeoutHandler:", watchAuthenticationQueue, v33, 5.0);
    authenticationWatchdogTimer = self->_authenticationWatchdogTimer;
    self->_authenticationWatchdogTimer = v22;

    -[SRUIFWatchAuthenticationManager setCurrentSessionID:](self, "setCurrentSessionID:", v21);
    -[SRUIFWatchAuthenticationManager authenticationWatchdogTimer](self, "authenticationWatchdogTimer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "start");

    v25 = (id)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      -[SRUIFWatchAuthenticationManager currentSessionID](self, "currentSessionID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v38 = "-[SRUIFWatchAuthenticationManager _requestWatchAuthentication:]";
      v39 = 2112;
      v40 = v26;
      _os_log_impl(&dword_219F26000, v25, OS_LOG_TYPE_DEFAULT, "%s Attempting watch authentication with sessionID: %@", buf, 0x16u);

    }
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);

  }
  else
  {
    v27 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)MEMORY[0x24BDD16E0];
      v29 = v27;
      objc_msgSend(v28, "numberWithBool:", v14);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v16);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v38 = "-[SRUIFWatchAuthenticationManager _requestWatchAuthentication:]";
      v39 = 2112;
      v40 = v30;
      v41 = 2112;
      v42 = v31;
      _os_log_impl(&dword_219F26000, v29, OS_LOG_TYPE_DEFAULT, "%s Not attempting watch authentication, supported: %@, enabled: %@", buf, 0x20u);

    }
    -[SRUIFWatchAuthenticationManager authenticationCompletion](self, "authenticationCompletion");
    v32 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v32[2](v32, 0);

    -[SRUIFWatchAuthenticationManager setAuthenticationCompletion:](self, "setAuthenticationCompletion:", 0);
  }

}

void __63__SRUIFWatchAuthenticationManager__requestWatchAuthentication___block_invoke(uint64_t a1)
{
  id WeakRetained;
  os_log_t *v3;
  void *v4;
  void *v5;
  int v6;
  void (**v7)(_QWORD, _QWORD);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (os_log_t *)MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      __63__SRUIFWatchAuthenticationManager__requestWatchAuthentication___block_invoke_cold_2();
    objc_msgSend(WeakRetained, "authenticationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelAuthenticationSessionWithID:", *(_QWORD *)(a1 + 32));

    objc_msgSend(WeakRetained, "currentSessionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v6)
    {
      objc_msgSend(WeakRetained, "authenticationCompletion");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0);

      objc_msgSend(WeakRetained, "setAuthenticationCompletion:", 0);
      objc_msgSend(WeakRetained, "setCurrentSessionID:", 0);
    }
    else if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
    {
      __63__SRUIFWatchAuthenticationManager__requestWatchAuthentication___block_invoke_cold_1();
    }
  }

}

- (void)manager:(id)a3 didStartAuthenticationForSessionWithID:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SRUIFWatchAuthenticationManager manager:didStartAuthenticationForSessionWithID:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s Starting new watch authentication request with sessionID: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)manager:(id)a3 didCompleteAuthenticationForSessionWithID:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[SRUIFWatchAuthenticationManager currentSessionID](self, "currentSessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  v8 = *MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315394;
      v13 = "-[SRUIFWatchAuthenticationManager manager:didCompleteAuthenticationForSessionWithID:]";
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_219F26000, v8, OS_LOG_TYPE_DEFAULT, "%s Completed watch authentication request with sessionID: %@", (uint8_t *)&v12, 0x16u);
    }
    -[SRUIFWatchAuthenticationManager authenticationCompletion](self, "authenticationCompletion");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v10[2](v10, 1);

    -[SRUIFWatchAuthenticationManager authenticationWatchdogTimer](self, "authenticationWatchdogTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cancel");

    -[SRUIFWatchAuthenticationManager setAuthenticationCompletion:](self, "setAuthenticationCompletion:", 0);
    -[SRUIFWatchAuthenticationManager setCurrentSessionID:](self, "setCurrentSessionID:", 0);
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    -[SRUIFWatchAuthenticationManager manager:didCompleteAuthenticationForSessionWithID:].cold.1();
  }

}

- (void)manager:(id)a3 didFailAuthenticationForSessionWithID:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  -[SRUIFWatchAuthenticationManager currentSessionID](self, "currentSessionID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v7);

  v11 = *MEMORY[0x24BE08FB0];
  v12 = *MEMORY[0x24BE08FB0];
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315650;
      v16 = "-[SRUIFWatchAuthenticationManager manager:didFailAuthenticationForSessionWithID:error:]";
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_219F26000, v11, OS_LOG_TYPE_DEFAULT, "%s Failed authentication request with sessionID: %@, error: %@", (uint8_t *)&v15, 0x20u);
    }
    -[SRUIFWatchAuthenticationManager authenticationCompletion](self, "authenticationCompletion");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0);

    -[SRUIFWatchAuthenticationManager authenticationWatchdogTimer](self, "authenticationWatchdogTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cancel");

    -[SRUIFWatchAuthenticationManager setAuthenticationCompletion:](self, "setAuthenticationCompletion:", 0);
    -[SRUIFWatchAuthenticationManager setCurrentSessionID:](self, "setCurrentSessionID:", 0);
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[SRUIFWatchAuthenticationManager manager:didFailAuthenticationForSessionWithID:error:].cold.1();
  }

}

- (id)authenticationCompletion
{
  return self->_authenticationCompletion;
}

- (void)setAuthenticationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)currentSessionID
{
  return self->_currentSessionID;
}

- (void)setCurrentSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (AFWatchdogTimer)authenticationWatchdogTimer
{
  return self->_authenticationWatchdogTimer;
}

- (void)setAuthenticationWatchdogTimer:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationWatchdogTimer, a3);
}

- (SFAuthenticationManager)authenticationManager
{
  return self->_authenticationManager;
}

- (void)setAuthenticationManager:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationManager, 0);
  objc_storeStrong((id *)&self->_authenticationWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_currentSessionID, 0);
  objc_storeStrong(&self->_authenticationCompletion, 0);
  objc_storeStrong((id *)&self->_watchAuthenticationQueue, 0);
}

- (void)requestWatchAuthentication:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SRUIFWatchAuthenticationManager requestWatchAuthentication:]";
  _os_log_error_impl(&dword_219F26000, log, OS_LOG_TYPE_ERROR, "%s No completion handler provided.", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __63__SRUIFWatchAuthenticationManager__requestWatchAuthentication___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_219F26000, v0, v1, "%s Ignoring unexpected watch authentication timeout for unknown sessionID: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __63__SRUIFWatchAuthenticationManager__requestWatchAuthentication___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_219F26000, v0, v1, "%s Watch authentication request timed out for sessionID: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)manager:didCompleteAuthenticationForSessionWithID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_219F26000, v0, v1, "%s Ignoring unexpected watch authentication session completion for unknown sessionID: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)manager:didFailAuthenticationForSessionWithID:error:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_3();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl(&dword_219F26000, v2, OS_LOG_TYPE_ERROR, "%s Ignoring unexpected watch authentication session failure for unknown sessionID: %@ error: %@", (uint8_t *)v3, 0x20u);
}

@end
