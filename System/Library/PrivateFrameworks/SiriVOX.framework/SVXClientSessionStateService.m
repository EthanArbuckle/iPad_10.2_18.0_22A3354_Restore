@implementation SVXClientSessionStateService

- (void)handleWillChangeSessionStateFrom:(int64_t)a3 to:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  SVXPerforming *performer;
  _QWORD v14[7];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 4)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_24D24E7A8[a3];
    v10 = v9;
    if ((unint64_t)a4 > 4)
      v11 = CFSTR("(unknown)");
    else
      v11 = off_24D24E7A8[a4];
    v12 = v11;
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXClientSessionStateService handleWillChangeSessionStateFrom:to:]";
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", buf, 0x20u);

  }
  performer = self->_performer;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __68__SVXClientSessionStateService_handleWillChangeSessionStateFrom_to___block_invoke;
  v14[3] = &unk_24D24ED50;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v14);
}

- (void)handleDidChangeSessionStateFrom:(int64_t)a3 to:(int64_t)a4
{
  void *v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  SVXPerforming *performer;
  _QWORD v14[7];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    if ((unint64_t)a3 > 4)
      v9 = CFSTR("(unknown)");
    else
      v9 = off_24D24E7A8[a3];
    v10 = v9;
    if ((unint64_t)a4 > 4)
      v11 = CFSTR("(unknown)");
    else
      v11 = off_24D24E7A8[a4];
    v12 = v11;
    *(_DWORD *)buf = 136315650;
    v16 = "-[SVXClientSessionStateService handleDidChangeSessionStateFrom:to:]";
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_214934000, v8, OS_LOG_TYPE_INFO, "%s fromState = %@, toState = %@", buf, 0x20u);

  }
  performer = self->_performer;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __67__SVXClientSessionStateService_handleDidChangeSessionStateFrom_to___block_invoke;
  v14[3] = &unk_24D24ED50;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v14);
}

- (SVXClientSessionStateService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  id v8;
  id v9;
  SVXClientSessionStateService *v10;
  SVXClientSessionStateService *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SVXClientSessionStateService;
  v10 = -[SVXClientSessionStateService init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_performer, a5);
    objc_storeStrong((id *)&v11->_clientServiceProvider, a3);
  }

  return v11;
}

- (void)clientServiceDidChange:(BOOL)a3
{
  -[SVXClientSessionStateService fetchStateWithCompletion:](self, "fetchStateWithCompletion:", 0);
}

- (void)fetchStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  SVXClientServiceProviding *clientServiceProvider;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[SVXClientSessionStateService fetchStateWithCompletion:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v6 = MEMORY[0x24BDAC760];
  clientServiceProvider = self->_clientServiceProvider;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke;
  v11[3] = &unk_24D24DAD8;
  v11[4] = self;
  v12 = v4;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke_4;
  v9[3] = &unk_24D24DEF8;
  v9[4] = self;
  v10 = v12;
  v8 = v12;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v11, v9);

}

- (void)_setCurrentState:(int64_t)a3
{
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  int64_t currentState;
  id WeakRetained;
  NSObject *v12;
  unint64_t v13;
  NSObject *v14;
  __CFString *v15;
  __CFString *v16;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    if ((unint64_t)a3 > 4)
      v8 = CFSTR("(unknown)");
    else
      v8 = off_24D24E7A8[a3];
    v9 = v8;
    v21 = 136315394;
    v22 = "-[SVXClientSessionStateService _setCurrentState:]";
    v23 = 2112;
    v24 = v9;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s currentState = %@", (uint8_t *)&v21, 0x16u);

  }
  currentState = self->_currentState;
  if (currentState != a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sessionStateService:willChangeStateFrom:to:", self, currentState, a3);

    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v13 = self->_currentState;
      v14 = v12;
      if (v13 > 4)
        v15 = CFSTR("(unknown)");
      else
        v15 = off_24D24E7A8[v13];
      v16 = v15;
      v21 = 136315394;
      v22 = "-[SVXClientSessionStateService _setCurrentState:]";
      v23 = 2112;
      v24 = v16;
      _os_log_impl(&dword_214934000, v14, OS_LOG_TYPE_INFO, "%s _currentState = %@", (uint8_t *)&v21, 0x16u);

      v12 = *v5;
    }
    self->_currentState = a3;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v17 = v12;
      if ((unint64_t)a3 > 4)
        v18 = CFSTR("(unknown)");
      else
        v18 = off_24D24E7A8[a3];
      v19 = v18;
      v21 = 136315394;
      v22 = "-[SVXClientSessionStateService _setCurrentState:]";
      v23 = 2112;
      v24 = v19;
      _os_log_impl(&dword_214934000, v17, OS_LOG_TYPE_INFO, "%s _currentState = %@", (uint8_t *)&v21, 0x16u);

    }
    v20 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v20, "sessionStateService:didChangeStateFrom:to:", self, currentState, a3);

  }
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (SVXClientSessionStateServiceDelegate)delegate
{
  return (SVXClientSessionStateServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);
  objc_storeStrong((id *)&self->_performer, 0);
}

void __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke_2;
  v4[3] = &unk_24D24DAB0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "fetchSessionStateWithCompletion:", v4);

}

void __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[SVXClientSessionStateService fetchStateWithCompletion:]_block_invoke_4";
    v11 = 2112;
    v12 = v3;
    _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
  }
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke_3;
  v7[3] = &unk_24D24DE08;
  v8 = v5;
  objc_msgSend(v6, "performBlock:", v7);

}

uint64_t __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_setCurrentState:", *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

void __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  if (a3)
    a2 = 0;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(v5 + 8);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__SVXClientSessionStateService_fetchStateWithCompletion___block_invoke_3;
  v9[3] = &unk_24D24EB40;
  v9[4] = v5;
  v11 = a2;
  v10 = v6;
  v8 = a3;
  objc_msgSend(v7, "performBlock:", v9);

}

uint64_t __67__SVXClientSessionStateService_handleDidChangeSessionStateFrom_to___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  unint64_t v3;
  NSObject **v4;
  NSObject *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  unint64_t v9;
  NSObject *v10;
  __CFString *v11;
  __CFString *v12;
  id WeakRetained;
  int v15;
  const char *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)a1[4];
  v3 = v2[3];
  if (v3 == a1[5])
  {
    v4 = (NSObject **)MEMORY[0x24BE08FB0];
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      if (v3 > 4)
        v7 = CFSTR("(unknown)");
      else
        v7 = off_24D24E7A8[v3];
      v8 = v7;
      v15 = 136315394;
      v16 = "-[SVXClientSessionStateService handleDidChangeSessionStateFrom:to:]_block_invoke";
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s _currentState = %@", (uint8_t *)&v15, 0x16u);

      v2 = (_QWORD *)a1[4];
      v5 = *v4;
    }
    v2[3] = a1[6];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1[4] + 24);
      v10 = v5;
      if (v9 > 4)
        v11 = CFSTR("(unknown)");
      else
        v11 = off_24D24E7A8[v9];
      v12 = v11;
      v15 = 136315394;
      v16 = "-[SVXClientSessionStateService handleDidChangeSessionStateFrom:to:]_block_invoke";
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_214934000, v10, OS_LOG_TYPE_INFO, "%s _currentState = %@", (uint8_t *)&v15, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
    objc_msgSend(WeakRetained, "sessionStateService:didChangeStateFrom:to:", a1[4], a1[5], a1[6]);

    v2 = (_QWORD *)a1[4];
  }
  return objc_msgSend(v2, "_setCurrentState:", a1[6]);
}

void __68__SVXClientSessionStateService_handleWillChangeSessionStateFrom_to___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_setCurrentState:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 24) == *(_QWORD *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
    objc_msgSend(WeakRetained, "sessionStateService:willChangeStateFrom:to:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

@end
