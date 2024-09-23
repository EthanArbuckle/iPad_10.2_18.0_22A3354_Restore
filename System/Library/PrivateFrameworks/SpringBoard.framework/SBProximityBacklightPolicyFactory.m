@implementation SBProximityBacklightPolicyFactory

+ (id)createNewProximityBacklightPolicyWithBacklightController:(id)a3 sensorModeController:(id)a4
{
  id v5;
  id v6;
  SBProximityBacklightPolicyConfiguration *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  __objc2_class **v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SBProximityBacklightPolicyConfiguration);
  -[SBProximityBacklightPolicyConfiguration setBacklightController:](v7, "setBacklightController:", v6);

  -[SBProximityBacklightPolicyConfiguration setSensorModeController:](v7, "setSensorModeController:", v5);
  +[SBProximityDomain rootSettings](SBProximityDomain, "rootSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBProximityBacklightPolicyConfiguration setProximitySettings:](v7, "setProximitySettings:", v8);

  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBProximityBacklightPolicyConfiguration setSystemGestureManager:](v7, "setSystemGestureManager:", v9);

  if (SBUIIsSystemApertureEnabled())
  {
    SBLogProximitySensor();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Using SBSystemApertureProximityBacklightPolicy.", buf, 2u);
    }
    v11 = off_1E8E98860;
    goto LABEL_19;
  }
  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "userInterfaceIdiom"))
    {

    }
    else
    {
      v13 = SBFEffectiveHomeButtonType();

      if (v13 == 2)
        goto LABEL_13;
    }
LABEL_16:
    SBLogProximitySensor();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Using SBDefaultProximityBacklightPolicy.", v16, 2u);
    }
    v11 = off_1E8E95848;
    goto LABEL_19;
  }
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
    || SBFEffectiveHomeButtonType() != 2)
  {
    goto LABEL_16;
  }
LABEL_13:
  SBLogProximitySensor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Using SBNotchedStatusBarProximityBacklightPolicy.", v17, 2u);
  }
  v11 = off_1E8E971B0;
LABEL_19:

  v14 = (void *)objc_msgSend(objc_alloc(*v11), "initWithConfiguration:", v7);
  return v14;
}

@end
