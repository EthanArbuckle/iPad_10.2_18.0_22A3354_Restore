@implementation SVXPowerLevelManager

- (SVXPowerLevelManager)initWithModule:(id)a3 audioPowerProvider:(id)a4
{
  id v6;
  id v7;
  SVXPowerLevelListener *v8;
  SVXPowerLevelManager *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(SVXPowerLevelListener);
  v9 = -[SVXPowerLevelManager initWithModule:audioPowerProvider:powerLevelListener:](self, "initWithModule:audioPowerProvider:powerLevelListener:", v7, v6, v8);

  return v9;
}

- (SVXPowerLevelManager)initWithModule:(id)a3 audioPowerProvider:(id)a4 powerLevelListener:(id)a5
{
  id v9;
  id v10;
  id v11;
  SVXPowerLevelManager *v12;
  SVXPowerLevelManager *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SVXPowerLevelManager;
  v12 = -[SVXPowerLevelManager init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_module, a3);
    objc_storeStrong((id *)&v13->_audioPowerProvider, a4);
    objc_storeStrong((id *)&v13->_powerLevelListener, a5);
  }

  return v13;
}

- (void)beginUpdateAudioPowerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[SVXPowerLevelManager beginUpdateAudioPowerWithCompletion:]";
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  -[SVXModule performer](self->_module, "performer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__SVXPowerLevelManager_beginUpdateAudioPowerWithCompletion___block_invoke;
  v8[3] = &unk_24D24EF28;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

- (void)endUpdateAudioPower
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SVXPowerLevelManager endUpdateAudioPower]";
    _os_log_impl(&dword_214934000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  -[SVXModule performer](self->_module, "performer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__SVXPowerLevelManager_endUpdateAudioPower__block_invoke;
  v5[3] = &unk_24D24EFF0;
  v5[4] = self;
  objc_msgSend(v4, "performBlock:", v5);

}

- (void)_beginUpdateAudioPowerWithCompletion:(id)a3
{
  void *v4;
  SVXAudioPowerProviding *audioPowerProvider;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v7 = a3;
  -[SVXModule instanceContext](self->_module, "instanceContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "supportsAudioPowerUpdate"))
  {
    audioPowerProvider = self->_audioPowerProvider;

    v6 = (void (**)(_QWORD, _QWORD))v7;
    if (audioPowerProvider)
    {
      -[SVXPowerLevelListener beginListeningToAudioPowerProvider:completion:](self->_powerLevelListener, "beginListeningToAudioPowerProvider:completion:", self->_audioPowerProvider, v7);
LABEL_7:
      v6 = (void (**)(_QWORD, _QWORD))v7;
      goto LABEL_8;
    }
  }
  else
  {

    v6 = (void (**)(_QWORD, _QWORD))v7;
  }
  if (v6)
  {
    v6[2](v6, 0);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_endUpdateAudioPower
{
  void *v3;
  int v4;

  -[SVXModule instanceContext](self->_module, "instanceContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsAudioPowerUpdate");

  if (v4)
    -[SVXPowerLevelListener endListening](self->_powerLevelListener, "endListening");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLevelListener, 0);
  objc_storeStrong((id *)&self->_audioPowerProvider, 0);
  objc_storeStrong((id *)&self->_module, 0);
}

uint64_t __43__SVXPowerLevelManager_endUpdateAudioPower__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endUpdateAudioPower");
}

uint64_t __60__SVXPowerLevelManager_beginUpdateAudioPowerWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginUpdateAudioPowerWithCompletion:", *(_QWORD *)(a1 + 40));
}

@end
