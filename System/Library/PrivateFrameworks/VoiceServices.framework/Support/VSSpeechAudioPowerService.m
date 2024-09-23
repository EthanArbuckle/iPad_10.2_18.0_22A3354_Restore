@implementation VSSpeechAudioPowerService

- (id)getCurrentAudioPowerProvider
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  +[VSSpeechTaskQueue mainDeviceQueue](VSSpeechTaskQueue, "mainDeviceQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "conformsToProtocol:", &unk_25510DB08))
  {
    v4 = v3;
    if (objc_msgSend(v4, "isSpeaking") && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "audioPowerProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)didEndAccessPower
{
  AFAudioPowerProviding **p_previousProvider;
  id WeakRetained;

  p_previousProvider = &self->_previousProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_previousProvider);
  objc_msgSend(WeakRetained, "didEndAccessPower");

  objc_storeWeak((id *)p_previousProvider, 0);
}

- (BOOL)getAveragePower:(float *)a3 andPeakPower:(float *)a4
{
  id v7;
  BOOL v8;
  AFAudioPowerProviding **p_previousProvider;
  id WeakRetained;
  id v11;

  -[VSSpeechAudioPowerService getCurrentAudioPowerProvider](self, "getCurrentAudioPowerProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;
  if (!v7)
    goto LABEL_6;
  p_previousProvider = &self->_previousProvider;
  WeakRetained = objc_loadWeakRetained((id *)p_previousProvider);

  if (v7 != WeakRetained)
  {
    v11 = objc_loadWeakRetained((id *)p_previousProvider);
    objc_msgSend(v11, "didEndAccessPower");

    objc_msgSend(v7, "willBeginAccessPower");
    objc_storeWeak((id *)p_previousProvider, v7);
  }
  if ((objc_msgSend(v7, "getAveragePower:andPeakPower:", a3, a4) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
LABEL_6:
    *a3 = -120.0;
    *a4 = -120.0;
  }

  return v8;
}

- (AFAudioPowerProviding)previousProvider
{
  return (AFAudioPowerProviding *)objc_loadWeakRetained((id *)&self->_previousProvider);
}

- (void)setPreviousProvider:(id)a3
{
  objc_storeWeak((id *)&self->_previousProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previousProvider);
}

+ (id)sharedServices
{
  if (sharedServices_onceToken != -1)
    dispatch_once(&sharedServices_onceToken, &__block_literal_global_2645);
  return (id)sharedServices___sharedService;
}

void __43__VSSpeechAudioPowerService_sharedServices__block_invoke()
{
  VSSpeechAudioPowerService *v0;
  void *v1;

  v0 = objc_alloc_init(VSSpeechAudioPowerService);
  v1 = (void *)sharedServices___sharedService;
  sharedServices___sharedService = (uint64_t)v0;

}

@end
