@implementation SVXClientAudioPowerService

- (SVXClientAudioPowerService)initWithType:(int64_t)a3 clientServiceProvider:(id)a4 analytics:(id)a5 performer:(id)a6
{
  id v10;
  id v11;
  SVXClientAudioPowerService *v12;
  SVXClientAudioPowerService *v13;
  objc_super v15;

  v10 = a4;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SVXClientAudioPowerService;
  v12 = -[SVXClientAudioPowerService init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_performer, a6);
    v13->_type = a3;
    objc_storeStrong((id *)&v13->_clientServiceProvider, a4);
    v13->_providerLock._os_unfair_lock_opaque = 0;
  }

  return v13;
}

- (void)handleWillBeginUpdateAudioPowerWithProvider:(id)a3
{
  id v4;
  NSObject *v5;
  SVXPerforming *performer;
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
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXClientAudioPowerService handleWillBeginUpdateAudioPowerWithProvider:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s provider = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__SVXClientAudioPowerService_handleWillBeginUpdateAudioPowerWithProvider___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);

}

- (void)handleDidEndUpdateAudioPower
{
  NSObject *v3;
  SVXPerforming *performer;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXClientAudioPowerService handleDidEndUpdateAudioPower]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__SVXClientAudioPowerService_handleDidEndUpdateAudioPower__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v5);
}

- (SVXClientAudioPowerService)initWithClientServiceProvider:(id)a3 analytics:(id)a4 performer:(id)a5
{
  return -[SVXClientAudioPowerService initWithType:clientServiceProvider:analytics:performer:](self, "initWithType:clientServiceProvider:analytics:performer:", 0, a3, a4, a5);
}

- (void)clientServiceDidChange:(BOOL)a3
{
  uint64_t v4;
  SVXPerforming *performer;
  SVXClientServiceProviding *clientServiceProvider;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = MEMORY[0x24BDAC760];
  performer = self->_performer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke;
  v8[3] = &unk_24D24EFF0;
  v8[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v8);
  clientServiceProvider = self->_clientServiceProvider;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke_2;
  v7[3] = &unk_24D24D360;
  v7[4] = self;
  -[SVXClientServiceProviding getClientServiceUsingBlock:errorHandler:](clientServiceProvider, "getClientServiceUsingBlock:errorHandler:", v7, &__block_literal_global_7740);
}

- (void)beginUpdateWithFrequency:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  SVXPerforming *performer;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    if ((unint64_t)a3 > 3)
      v7 = CFSTR("(unknown)");
    else
      v7 = off_24D24E810[a3];
    v8 = v7;
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXClientAudioPowerService beginUpdateWithFrequency:]";
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s frequency = %@", buf, 0x16u);

  }
  performer = self->_performer;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__SVXClientAudioPowerService_beginUpdateWithFrequency___block_invoke;
  v10[3] = &unk_24D24EA18;
  v10[4] = self;
  v10[5] = a3;
  -[SVXPerforming performBlock:](performer, "performBlock:", v10);
}

- (void)endUpdate
{
  NSObject *v3;
  SVXPerforming *performer;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXClientAudioPowerService endUpdate]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__SVXClientAudioPowerService_endUpdate__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  -[SVXPerforming performBlock:](performer, "performBlock:", v5);
}

- (float)averagePower
{
  void *v2;
  float v3;
  float v5;

  v5 = 0.0;
  -[SVXClientAudioPowerService _provider](self, "_provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "getAveragePower:andPeakPower:", &v5, 0))
    v3 = v5;
  else
    v3 = 0.0;

  return v3;
}

- (float)peakPower
{
  void *v2;
  float v3;
  float v5;

  v5 = 0.0;
  -[SVXClientAudioPowerService _provider](self, "_provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "getAveragePower:andPeakPower:", 0, &v5))
    v3 = v5;
  else
    v3 = 0.0;

  return v3;
}

- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5
{
  id v8;
  SVXPerforming *performer;
  id v10;
  _QWORD v11[5];
  id v12;
  float v13;
  float v14;

  v8 = a3;
  performer = self->_performer;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__SVXClientAudioPowerService_audioPowerUpdaterDidUpdate_averagePower_peakPower___block_invoke;
  v11[3] = &unk_24D24ECE8;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  -[SVXPerforming performBlock:withOptions:](performer, "performBlock:withOptions:", v11, 2);

}

- (void)_beginUpdateWithFrequency:(int64_t)a3
{
  int64_t v5;

  -[SVXClientAudioPowerService _endUpdate](self, "_endUpdate");
  self->_wantsUpdate = 1;
  if ((unint64_t)(a3 - 1) >= 3)
    v5 = 0;
  else
    v5 = a3;
  self->_frequency = v5;
  -[SVXClientAudioPowerService _createUpdater](self, "_createUpdater");
}

- (void)_endUpdate
{
  -[SVXClientAudioPowerService _destroyUpdater](self, "_destroyUpdater");
  self->_frequency = 0;
  self->_wantsUpdate = 0;
}

- (void)_handleWillBeginUpdateAudioPowerWithProvider:(id)a3
{
  id v4;

  v4 = a3;
  -[SVXClientAudioPowerService _handleDidEndUpdateAudioPower](self, "_handleDidEndUpdateAudioPower");
  -[SVXClientAudioPowerService _setProvider:](self, "_setProvider:", v4);

  -[SVXClientAudioPowerService _createUpdater](self, "_createUpdater");
}

- (void)_handleDidEndUpdateAudioPower
{
  -[SVXClientAudioPowerService _destroyUpdater](self, "_destroyUpdater");
  -[SVXClientAudioPowerService _setProvider:](self, "_setProvider:", 0);
}

- (void)_createUpdater
{
  id WeakRetained;
  NSObject *v4;
  NSObject *v5;
  AFAudioPowerUpdater *v6;
  AFAudioPowerUpdater *updater;
  id v8;

  -[SVXClientAudioPowerService _destroyUpdater](self, "_destroyUpdater");
  if ((unint64_t)(self->_type - 1) <= 1 && self->_wantsUpdate && self->_provider)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "audioPowerServiceWillBeginUpdate:", self);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SVXPerforming queue](self->_performer, "queue");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
      v5 = objc_claimAutoreleasedReturnValue();

      v8 = dispatch_queue_create("com.apple.SiriVOX.client.audio-power-updater", v5);
    }
    v6 = (AFAudioPowerUpdater *)objc_msgSend(objc_alloc(MEMORY[0x24BE090F8]), "initWithProvider:queue:frequency:delegate:", self->_provider, v8, self->_frequency, self);
    updater = self->_updater;
    self->_updater = v6;

    -[AFAudioPowerUpdater beginUpdate](self->_updater, "beginUpdate");
  }
}

- (void)_destroyUpdater
{
  AFAudioPowerUpdater *updater;
  AFAudioPowerUpdater *v4;
  id WeakRetained;

  updater = self->_updater;
  if (updater)
  {
    -[AFAudioPowerUpdater endUpdate](updater, "endUpdate");
    -[AFAudioPowerUpdater invalidate](self->_updater, "invalidate");
    v4 = self->_updater;
    self->_updater = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "audioPowerServiceDidEndUpdate:", self);

  }
}

- (id)_provider
{
  os_unfair_lock_s *p_providerLock;
  AFAudioPowerProviding *v4;

  p_providerLock = &self->_providerLock;
  os_unfair_lock_lock(&self->_providerLock);
  v4 = self->_provider;
  os_unfair_lock_unlock(p_providerLock);
  return v4;
}

- (void)_setProvider:(id)a3
{
  AFAudioPowerProviding *v4;
  AFAudioPowerProviding *provider;

  v4 = (AFAudioPowerProviding *)a3;
  os_unfair_lock_lock(&self->_providerLock);
  provider = self->_provider;
  self->_provider = v4;

  os_unfair_lock_unlock(&self->_providerLock);
}

- (SVXClientAudioPowerServiceDelegate)delegate
{
  return (SVXClientAudioPowerServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_clientServiceProvider, 0);
  objc_storeStrong((id *)&self->_performer, 0);
}

void __80__SVXClientAudioPowerService_audioPowerUpdaterDidUpdate_averagePower_peakPower___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v3;
  double v4;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 64) == *(_QWORD *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 72));
    LODWORD(v3) = *(_DWORD *)(a1 + 48);
    LODWORD(v4) = *(_DWORD *)(a1 + 52);
    objc_msgSend(WeakRetained, "audioPowerServiceDidUpdate:averagePower:peakPower:", *(_QWORD *)(a1 + 32), v3, v4);

  }
}

uint64_t __39__SVXClientAudioPowerService_endUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endUpdate");
}

uint64_t __55__SVXClientAudioPowerService_beginUpdateWithFrequency___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginUpdateWithFrequency:", *(_QWORD *)(a1 + 40));
}

uint64_t __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidEndUpdateAudioPower");
}

uint64_t __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke_3;
  v5[3] = &unk_24D24D338;
  v5[4] = v2;
  return objc_msgSend(a2, "fetchAudioPowerWithType:completion:", v3, v5);
}

void __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[SVXClientAudioPowerService clientServiceDidChange:]_block_invoke_5";
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_214934000, v3, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v4, 0x16u);
  }

}

void __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x24BE09100];
    v4 = a2;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithXPCWrapper:", v4);

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 8);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke_4;
    v9[3] = &unk_24D24F018;
    v9[4] = v6;
    v10 = v5;
    v8 = v5;
    objc_msgSend(v7, "performBlock:", v9);

  }
}

uint64_t __53__SVXClientAudioPowerService_clientServiceDidChange___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleWillBeginUpdateAudioPowerWithProvider:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__SVXClientAudioPowerService_handleDidEndUpdateAudioPower__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDidEndUpdateAudioPower");
}

uint64_t __74__SVXClientAudioPowerService_handleWillBeginUpdateAudioPowerWithProvider___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleWillBeginUpdateAudioPowerWithProvider:", *(_QWORD *)(a1 + 40));
}

@end
