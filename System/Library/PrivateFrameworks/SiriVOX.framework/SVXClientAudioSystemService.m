@implementation SVXClientAudioSystemService

- (void)handleAudioSessionWillBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5
{
  id v8;
  id v9;
  SVXPerforming *performer;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  SVXClientAudioSystemService *v16;
  BOOL v17;

  v8 = a4;
  v9 = a5;
  performer = self->_performer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __104__SVXClientAudioSystemService_handleAudioSessionWillBecomeActive_activationContext_deactivationContext___block_invoke;
  v13[3] = &unk_24D24F130;
  v17 = a3;
  v14 = v8;
  v15 = v9;
  v16 = self;
  v11 = v9;
  v12 = v8;
  -[SVXPerforming performBlock:](performer, "performBlock:", v13);

}

- (void)handleAudioSessionDidBecomeActive:(BOOL)a3 activationContext:(id)a4 deactivationContext:(id)a5
{
  id v8;
  id v9;
  SVXPerforming *performer;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  SVXClientAudioSystemService *v16;
  BOOL v17;

  v8 = a4;
  v9 = a5;
  performer = self->_performer;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __103__SVXClientAudioSystemService_handleAudioSessionDidBecomeActive_activationContext_deactivationContext___block_invoke;
  v13[3] = &unk_24D24F130;
  v17 = a3;
  v14 = v8;
  v15 = v9;
  v16 = self;
  v11 = v9;
  v12 = v8;
  -[SVXPerforming performBlock:](performer, "performBlock:", v13);

}

- (void)handleAudioSessionIDDidChange:(unsigned int)a3
{
  SVXPerforming *performer;
  _QWORD v4[5];
  unsigned int v5;

  performer = self->_performer;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__SVXClientAudioSystemService_handleAudioSessionIDDidChange___block_invoke;
  v4[3] = &unk_24D24F158;
  v4[4] = self;
  v5 = a3;
  -[SVXPerforming performBlock:](performer, "performBlock:", v4);
}

- (SVXClientAudioSystemService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  id v8;
  id v9;
  SVXClientAudioSystemService *v10;
  SVXClientAudioSystemService *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SVXClientAudioSystemService;
  v10 = -[SVXClientAudioSystemService init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_performer, a5);
    objc_storeStrong((id *)&v11->_clientServiceProvider, a3);
  }

  return v11;
}

- (SVXClientAudioSystemServiceDelegate)delegate
{
  return (SVXClientAudioSystemServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

void __61__SVXClientAudioSystemService_handleAudioSessionIDDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v4, "audioSystemService:audioSessionIDDidChange:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));

  }
}

void __103__SVXClientAudioSystemService_handleAudioSessionDidBecomeActive_activationContext_deactivationContext___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  NSObject *v10;
  id WeakRetained;
  char v12;
  id v13;
  int v14;
  id v15;
  char v16;
  id v17;
  int v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE08FB0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = *(unsigned __int8 *)(a1 + 56);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v19 = 136315906;
    v20 = "-[SVXClientAudioSystemService handleAudioSessionDidBecomeActive:activationContext:deactivationContext:]_block_invoke";
    v21 = 1024;
    v22 = v4;
    v23 = 2112;
    v24 = v5;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s flag = %d, activationContext = %@, deactivationContext = %@", (uint8_t *)&v19, 0x26u);
  }
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(unsigned __int8 *)(v7 + 24);
  v9 = *(unsigned __int8 *)(a1 + 56);
  if (v8 == v9)
  {
    v10 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315394;
      v20 = "-[SVXClientAudioSystemService handleAudioSessionDidBecomeActive:activationContext:deactivationContext:]_block_invoke";
      v21 = 1024;
      v22 = v8;
      _os_log_error_impl(&dword_214934000, v10, OS_LOG_TYPE_ERROR, "%s _isAudioSessionActive = %d, no need to deliver the delegate callbacka again.", (uint8_t *)&v19, 0x12u);
    }
  }
  else
  {
    *(_BYTE *)(v7 + 24) = v9;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 32));
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 32));
      objc_msgSend(v13, "audioSystemService:audioSessionDidBecomeActive:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));

    }
    v14 = *(unsigned __int8 *)(a1 + 56);
    v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 32));
    if (v14)
    {
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) == 0)
        return;
      v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 32));
      objc_msgSend(v17, "audioSystemService:audioSessionDidBecomeActiveWithActivationContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    }
    else
    {
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) == 0)
        return;
      v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 32));
      objc_msgSend(v17, "audioSystemService:audioSessionDidBecomeInactiveWithDeactivationContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }

  }
}

void __104__SVXClientAudioSystemService_handleAudioSessionWillBecomeActive_activationContext_deactivationContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  id v10;
  char v11;
  id v12;
  int v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v14 = 136315906;
    v15 = "-[SVXClientAudioSystemService handleAudioSessionWillBecomeActive:activationContext:deactivationContext:]_block_invoke";
    v16 = 1024;
    v17 = v3;
    v18 = 2112;
    v19 = v4;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_214934000, v2, OS_LOG_TYPE_INFO, "%s flag = %d, activationContext = %@, deactivationContext = %@", (uint8_t *)&v14, 0x26u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 32));
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 32));
    objc_msgSend(v8, "audioSystemService:audioSessionWillBecomeActive:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));

  }
  v9 = *(unsigned __int8 *)(a1 + 56);
  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 32));
  if (v9)
  {
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
      return;
    v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 32));
    objc_msgSend(v12, "audioSystemService:audioSessionWillBecomeActiveWithActivationContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  }
  else
  {
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0)
      return;
    v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 32));
    objc_msgSend(v12, "audioSystemService:audioSessionWillBecomeInactiveWithDeactivationContext:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }

}

@end
