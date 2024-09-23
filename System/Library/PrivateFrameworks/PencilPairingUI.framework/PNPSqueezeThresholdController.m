@implementation PNPSqueezeThresholdController

+ (double)defaultThreshold
{
  return 200.0;
}

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_9);
  return (id)sharedController_sController;
}

void __49__PNPSqueezeThresholdController_sharedController__block_invoke()
{
  PNPSqueezeThresholdController *v0;
  void *v1;

  v0 = objc_alloc_init(PNPSqueezeThresholdController);
  v1 = (void *)sharedController_sController;
  sharedController_sController = (uint64_t)v0;

}

- (id)opaqueTouchSenderDescriptor
{
  return (id)objc_msgSend(MEMORY[0x24BE0B6B0], "build:", &__block_literal_global_8_0);
}

uint64_t __60__PNPSqueezeThresholdController_opaqueTouchSenderDescriptor__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPrimaryPage:primaryUsage:", 65376, 4096);
}

- (BOOL)startAutoCalibrationIfNecessary
{
  NSObject *v3;
  BOOL v4;
  uint8_t v6[16];

  v3 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22ACC1000, v3, OS_LOG_TYPE_DEFAULT, "startAutoCalibrationIfNecessary", v6, 2u);
  }

  v4 = -[PNPSqueezeThresholdController autoCalibrationInProgress](self, "autoCalibrationInProgress");
  if (!v4)
  {
    -[PNPSqueezeThresholdController setAutoCalibrationInProgress:](self, "setAutoCalibrationInProgress:", 1);
    -[PNPSqueezeThresholdController setSqueezeOnboardingModeEnabled:](self, "setSqueezeOnboardingModeEnabled:", 1);
  }
  return !v4;
}

- (void)resetAutoCalibration
{
  -[PNPSqueezeThresholdController setAutoCalibrationInProgress:](self, "setAutoCalibrationInProgress:", 0);
  -[PNPSqueezeThresholdController setSqueezeOnboardingModeEnabled:](self, "setSqueezeOnboardingModeEnabled:", 0);
}

- (void)disableSqueezeOnboardingMode
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  double v6;
  NSObject *v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  int v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_22ACC1000, v3, OS_LOG_TYPE_DEFAULT, "Disabling squeeze onboarding mode", (uint8_t *)&v12, 2u);
  }

  if (-[PNPSqueezeThresholdController squeezeOnboardingModeEnabled](self, "squeezeOnboardingModeEnabled"))
  {
    -[PNPSqueezeThresholdController setSqueezeOnboardingModeEnabled:](self, "setSqueezeOnboardingModeEnabled:", 0);
    getOpaqueTouchValue(CFSTR("SqueezeThreshold"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = os_log_create("com.apple.pencilpairingui", ");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = *(double *)&v4;
      _os_log_impl(&dword_22ACC1000, v5, OS_LOG_TYPE_DEFAULT, "Current squeeze threshold %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(v4, "doubleValue");
    if (v6 >= 9999.0)
    {
      objc_msgSend((id)objc_opt_class(), "defaultThreshold");
      v9 = v8;
      v10 = os_log_create("com.apple.pencilpairingui", ");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134217984;
        v13 = v9;
        _os_log_impl(&dword_22ACC1000, v10, OS_LOG_TYPE_DEFAULT, "Auto-calibration not done, setting default value: %g", (uint8_t *)&v12, 0xCu);
      }

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PNPSqueezeThresholdController setSqueezeThreshold:](self, "setSqueezeThreshold:", v11);

    }
    else
    {
      v7 = os_log_create("com.apple.pencilpairingui", ");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = *(double *)&v4;
        _os_log_impl(&dword_22ACC1000, v7, OS_LOG_TYPE_DEFAULT, "Setting new auto-calibrated value: %@", (uint8_t *)&v12, 0xCu);
      }

      -[PNPSqueezeThresholdController setSqueezeThreshold:](self, "setSqueezeThreshold:", v4);
    }

  }
}

- (void)initializeToDefaultThreshold
{
  NSObject *v3;
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_22ACC1000, v3, OS_LOG_TYPE_DEFAULT, "initializeToDefaultThreshold", (uint8_t *)&v8, 2u);
  }

  objc_msgSend((id)objc_opt_class(), "defaultThreshold");
  v5 = v4;
  v6 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_22ACC1000, v6, OS_LOG_TYPE_DEFAULT, "Synchronizing squeeze threshold to default value: %g", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPSqueezeThresholdController setSqueezeThreshold:](self, "setSqueezeThreshold:", v7);

}

- (void)initializeToDefaultThresholdIfUninitialized
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_22ACC1000, v3, OS_LOG_TYPE_DEFAULT, "initializeToDefaultThresholdIfUninitialized", (uint8_t *)&v6, 2u);
  }

  -[PNPSqueezeThresholdController squeezeThreshold](self, "squeezeThreshold");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = os_log_create("com.apple.pencilpairingui", ");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_22ACC1000, v5, OS_LOG_TYPE_DEFAULT, "Squeeze threshold already set in backboard: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  else
  {
    -[PNPSqueezeThresholdController initializeToDefaultThreshold](self, "initializeToDefaultThreshold");
  }

}

- (void)synchronizeSqueezeThresholdToBackboard
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22ACC1000, v3, OS_LOG_TYPE_DEFAULT, "synchronizeSqueezeThresholdToBackboard", v4, 2u);
  }

  -[PNPSqueezeThresholdController initializeToDefaultThresholdIfUninitialized](self, "initializeToDefaultThresholdIfUninitialized");
}

- (void)disableAutoCalibrationIfNecessary
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22ACC1000, v3, OS_LOG_TYPE_DEFAULT, "disableAutoCalibrationIfNecessary", v4, 2u);
  }

  if (-[PNPSqueezeThresholdController autoCalibrationInProgress](self, "autoCalibrationInProgress"))
  {
    -[PNPSqueezeThresholdController setAutoCalibrationInProgress:](self, "setAutoCalibrationInProgress:", 0);
    -[PNPSqueezeThresholdController synchronizeSqueezeThresholdToBackboard](self, "synchronizeSqueezeThresholdToBackboard");
  }
  if (-[PNPSqueezeThresholdController squeezeOnboardingModeEnabled](self, "squeezeOnboardingModeEnabled"))
    -[PNPSqueezeThresholdController setSqueezeOnboardingModeEnabled:](self, "setSqueezeOnboardingModeEnabled:", 0);
}

- (void)setAutoCalibrationInProgress:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;
  const __CFString *v12;
  _QWORD v13[2];

  v3 = a3;
  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("SqueezeAutoCalibrationEnabled");
  v13[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPSqueezeThresholdController opaqueTouchSenderDescriptor](self, "opaqueTouchSenderDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BKSHIDServicesSetPersistentServiceProperties();

  v8 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v3;
    v10 = 1024;
    v11 = -[PNPSqueezeThresholdController autoCalibrationInProgress](self, "autoCalibrationInProgress");
    _os_log_impl(&dword_22ACC1000, v8, OS_LOG_TYPE_DEFAULT, "setAutoCalibrationInProgress: %d (readback: %d)", (uint8_t *)v9, 0xEu);
  }

}

- (BOOL)autoCalibrationInProgress
{
  void *v2;
  char v3;

  getOpaqueTouchValue(CFSTR("SqueezeAutoCalibrationEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setSqueezeOnboardingModeEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;
  const __CFString *v12;
  _QWORD v13[2];

  v3 = a3;
  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("SqueezeOnboardingModeEnabled");
  v13[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPSqueezeThresholdController opaqueTouchSenderDescriptor](self, "opaqueTouchSenderDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BKSHIDServicesSetPersistentServiceProperties();

  v8 = os_log_create("com.apple.pencilpairingui", ");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = v3;
    v10 = 1024;
    v11 = -[PNPSqueezeThresholdController squeezeOnboardingModeEnabled](self, "squeezeOnboardingModeEnabled");
    _os_log_impl(&dword_22ACC1000, v8, OS_LOG_TYPE_DEFAULT, "setSqueezeOnboardingModeEnabled: %d (readback: %d)", (uint8_t *)v9, 0xEu);
  }

}

- (BOOL)squeezeOnboardingModeEnabled
{
  void *v2;
  char v3;

  getOpaqueTouchValue(CFSTR("SqueezeOnboardingModeEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (NSNumber)squeezeThreshold
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PNPSqueezeThresholdController opaqueTouchSenderDescriptor](self, "opaqueTouchSenderDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("SqueezeThreshold"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BKSHIDServicesGetPersistentServiceProperties();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SqueezeThreshold"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v5;
}

- (void)setSqueezeThreshold:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v5 = os_log_create("com.apple.pencilpairingui", ");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_22ACC1000, v5, OS_LOG_TYPE_DEFAULT, "Setting squeeze threshold: %@", buf, 0xCu);
    }

    v8 = CFSTR("SqueezeThreshold");
    v9 = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPSqueezeThresholdController opaqueTouchSenderDescriptor](self, "opaqueTouchSenderDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BKSHIDServicesSetPersistentServiceProperties();

  }
}

@end
