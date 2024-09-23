@implementation SRUIFAudioPowerLevelUpdater

- (SRUIFAudioPowerLevelUpdater)initWithDelegate:(id)a3
{
  id v4;
  SRUIFAudioPowerLevelUpdater *v5;
  SRUIFAudioPowerLevelUpdater *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SRUIFAudioPowerLevelUpdater;
  v5 = -[SRUIFAudioPowerLevelUpdater init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (float)averagePower
{
  return self->_averageAudioPower;
}

- (void)startObservingUpdates
{
  CSAudioPowerServiceClient *inputAudioPowerUpdater;
  id v4;
  CSAudioPowerServiceClient *v5;
  CSAudioPowerServiceClient *v6;

  inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
  if (!inputAudioPowerUpdater)
  {
    v4 = objc_alloc(MEMORY[0x24BE283B0]);
    v5 = (CSAudioPowerServiceClient *)objc_msgSend(v4, "initWithQueue:frequency:delegate:", MEMORY[0x24BDAC9B8], 1, self);
    v6 = self->_inputAudioPowerUpdater;
    self->_inputAudioPowerUpdater = v5;

    inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
  }
  -[CSAudioPowerServiceClient beginUpdate](inputAudioPowerUpdater, "beginUpdate");
}

- (void)stopObservingUpdates
{
  CSAudioPowerServiceClient *inputAudioPowerUpdater;

  -[CSAudioPowerServiceClient endUpdate](self->_inputAudioPowerUpdater, "endUpdate");
  -[CSAudioPowerServiceClient invalidate](self->_inputAudioPowerUpdater, "invalidate");
  inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
  self->_inputAudioPowerUpdater = 0;

  self->_averageAudioPower = 0.0;
}

- (void)sessionStateDidChangeTo:(int64_t)a3 isAttending:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    SRUIFSiriSessionStateGetDescription(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[SRUIFAudioPowerLevelUpdater sessionStateDidChangeTo:isAttending:]";
    v12 = 2112;
    v13 = v9;
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_219F26000, v8, OS_LOG_TYPE_DEFAULT, "%s #IntuitiveConversation state=%@ attending=%d", (uint8_t *)&v10, 0x1Cu);

  }
  if (a3 == 3)
  {
    if (!v4)
    {
LABEL_7:
      -[SRUIFAudioPowerLevelUpdater stopObservingUpdates](self, "stopObservingUpdates");
      return;
    }
  }
  else if (a3 != 1 && (a3 || !v4))
  {
    goto LABEL_7;
  }
  -[SRUIFAudioPowerLevelUpdater startObservingUpdates](self, "startObservingUpdates");
}

- (void)audioPowerDidUpdateWithType:(unint64_t)a3 averagePower:(float)a4 peakPower:(float)a5
{
  double v8;
  double v9;
  id WeakRetained;

  self->_averageAudioPower = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  *(float *)&v8 = a4;
  *(float *)&v9 = a5;
  objc_msgSend(WeakRetained, "audioPowerUpdaterDidUpdate:averagePower:peakPower:", self, v8, v9);

}

- (void)dealloc
{
  CSAudioPowerServiceClient *inputAudioPowerUpdater;
  objc_super v4;

  -[CSAudioPowerServiceClient endUpdate](self->_inputAudioPowerUpdater, "endUpdate");
  -[CSAudioPowerServiceClient invalidate](self->_inputAudioPowerUpdater, "invalidate");
  inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
  self->_inputAudioPowerUpdater = 0;

  v4.receiver = self;
  v4.super_class = (Class)SRUIFAudioPowerLevelUpdater;
  -[SRUIFAudioPowerLevelUpdater dealloc](&v4, sel_dealloc);
}

- (CSAudioPowerServiceClient)_inputAudioPowerUpdater
{
  return self->_inputAudioPowerUpdater;
}

- (float)_averageAudioPower
{
  return self->_averageAudioPower;
}

- (SRUIFAudioPowerLevelUpdaterDelegate)_delegate
{
  return (SRUIFAudioPowerLevelUpdaterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inputAudioPowerUpdater, 0);
}

@end
