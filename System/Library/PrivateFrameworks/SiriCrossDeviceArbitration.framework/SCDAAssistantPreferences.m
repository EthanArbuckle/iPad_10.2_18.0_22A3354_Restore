@implementation SCDAAssistantPreferences

- (SCDAAssistantPreferences)initWithInstanceContext:(id)a3
{
  id v4;
  SCDAAssistantPreferences *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *navTokenQueue;
  AFInstanceContext *v10;
  AFInstanceContext *instanceContext;
  NSObject *v12;
  AFInstanceContext *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  SCDAAssistantPreferences *v19;
  __int16 v20;
  AFInstanceContext *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCDAAssistantPreferences;
  v5 = -[SCDAAssistantPreferences init](&v15, sel_init);
  if (v5)
  {
    if (SCDALogInitIfNeeded_once != -1)
      dispatch_once(&SCDALogInitIfNeeded_once, &__block_literal_global_512);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_SCDAAssistantPreferencesDidChangeCallback, CFSTR("kSCDAPreferencesDidChangeDarwinNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("navTokenQueue", v7);
    navTokenQueue = v5->_navTokenQueue;
    v5->_navTokenQueue = (OS_dispatch_queue *)v8;

    if (v4)
    {
      v10 = (AFInstanceContext *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE091F8], "defaultContext");
      v10 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v10;

    v12 = SCDALogContextCore;
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
    {
      v14 = v5->_instanceContext;
      *(_DWORD *)buf = 136315650;
      v17 = "-[SCDAAssistantPreferences initWithInstanceContext:]";
      v18 = 2048;
      v19 = v5;
      v20 = 2112;
      v21 = v14;
      _os_log_debug_impl(&dword_246211000, v12, OS_LOG_TYPE_DEBUG, "%s %p %@", buf, 0x20u);
    }
  }

  return v5;
}

- (SCDAAssistantPreferences)init
{
  return -[SCDAAssistantPreferences initWithInstanceContext:](self, "initWithInstanceContext:", 0);
}

- (void)_preferencesDidChangeExternally
{
  NSObject *v3;
  void *v4;
  AFInstanceContext *instanceContext;
  int v6;
  const char *v7;
  __int16 v8;
  SCDAAssistantPreferences *v9;
  __int16 v10;
  AFInstanceContext *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_DEBUG))
  {
    instanceContext = self->_instanceContext;
    v6 = 136315650;
    v7 = "-[SCDAAssistantPreferences _preferencesDidChangeExternally]";
    v8 = 2048;
    v9 = self;
    v10 = 2112;
    v11 = instanceContext;
    _os_log_debug_impl(&dword_246211000, v3, OS_LOG_TYPE_DEBUG, "%s %p %@", (uint8_t *)&v6, 0x20u);
  }
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.support"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant.backedup"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.assistant"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SCDAPreferencesDidChangeNotification"), self);

}

- (BOOL)myriadCoordinationEnabled
{
  void *v3;
  char v4;

  if (SCDAIsInternalInstall_onceToken != -1)
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1256);
  if (!SCDAIsInternalInstall_isInternal)
    return 1;
  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Allow Myriad Coordination"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)myriadCoordinationEnabledForAccessoryLogging
{
  void *v2;
  char v3;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Allow Myriad Coordination"), CFSTR("com.apple.assistant"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _SCDAAssistantPreferencesBoolFromValueWithDefault(v2, (uint64_t)CFSTR("Allow Myriad Coordination"), 1);

  return v3;
}

- (void)setMyriadCoordinationEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Allow Myriad Coordination"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (BOOL)disableMyriadBLEActivity
{
  void *v3;
  char v4;

  if (SCDAIsInternalInstall_onceToken != -1)
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1256);
  if (!SCDAIsInternalInstall_isInternal)
    return 0;
  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Disable Myriad BLE Activity"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)myriadDuckingEnabled
{
  void *v2;
  void *v3;
  char v4;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Allow Myriad Ducking"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setMyriadDuckingEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Allow Myriad Ducking"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (id)myriadDeviceGroup
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Myriad Device Group"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;

      v3 = v5;
    }
  }

  return v3;
}

- (void)setMyriadDeviceGroup:(id)a3
{
  _SCDAAssistantPreferencesSetValueForKeyWithContext(a3, CFSTR("Myriad Device Group"), CFSTR("com.apple.assistant"), self->_instanceContext);
}

- (BOOL)myriadServerHasProvisioned
{
  void *v2;
  void *v3;
  char v4;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Server Has Provisioned Myriad"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setMyriadServerHasProvisioned:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Server Has Provisioned Myriad"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (BOOL)myriadServerProvisioning
{
  void *v2;
  void *v3;
  char v4;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Server Provisions Myriad"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (void)setMyriadServerProvisioning:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Server Provisions Myriad"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (unsigned)myriadDeviceClass
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Myriad Device Class"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (void)setMyriadDeviceClass:(unsigned __int8)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Device Class"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (int)myriadConstantGoodness
{
  void *v2;
  void *v3;
  int v4;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Myriad Constant Goodness"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = -1;

  return v4;
}

- (void)setMyriadConstantGoodness:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Constant Goodness"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (float)myriadDeviceAdjust
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Myriad Device Adjust"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setMyriadDeviceAdjust:(float)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Device Adjust"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (double)myriadDeviceDelay
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Myriad Device Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setMyriadDeviceDelay:(double)a3
{
  id v4;

  *(float *)&a3 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Device Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (double)myriadTestDeviceDelay
{
  void *v2;
  double v3;
  BOOL v4;
  double v5;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Myriad Test Device Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (SCDAIsInternalInstall_onceToken != -1)
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1256);
  v3 = 0.0;
  if (SCDAIsInternalInstall_isInternal)
    v4 = v2 == 0;
  else
    v4 = 1;
  if (!v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    v3 = v5;
  }

  return v3;
}

- (void)setMyriadTestDeviceDelay:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Test Device Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (double)myriadDeviceSlowdown
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Myriad Device Slowdown"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setMyriadDeviceSlowdown:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Device Slowdown"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (double)myriadDeviceTrumpDelay
{
  void *v2;
  void *v3;
  float v4;
  double v5;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Myriad Device Trump Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "floatValue");
    v5 = v4;
  }
  else
  {
    v5 = 1.75;
  }

  return v5;
}

- (void)setMyriadDeviceTrumpDelay:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Device Trump Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (id)myriadLastWin
{
  void *v2;
  id v3;
  void *v4;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Myriad Last Win"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (void)setMyriadLastWin
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v3, CFSTR("Myriad Last Win"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (double)myriadDeviceVTEndTimeDistanceThreshold
{
  void *v2;
  double v3;
  double v4;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Myriad VTEndtimeDistanceThreshold"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    v3 = v4;
  }

  return v3;
}

- (void)setMyriadDeviceVTEndTimeDistanceThreshold:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad VTEndtimeDistanceThreshold"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (BOOL)myriadShouldIgnoreAdjustedBoost
{
  void *v2;
  char v3;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Myriad Ignore Adjusted Boost"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (void)setIgnoreMyriadAdjustedBoost:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Ignore Adjusted Boost"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (BOOL)ignoreMyriadPlatformBias
{
  void *v3;
  char v4;

  if (SCDAIsInternalInstall_onceToken != -1)
    dispatch_once(&SCDAIsInternalInstall_onceToken, &__block_literal_global_1256);
  if (!SCDAIsInternalInstall_isInternal)
    return 0;
  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Myriad Ignore Platform Bias"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (void)setIgnoreMyriadPlatformBias:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Ignore Platform Bias"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (id)myriadMonitorTimeOutInterval
{
  void *v2;
  id v3;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Myriad Monitor Timeout Interval"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (double)myriadMaxNoOperationDelay
{
  void *v2;
  double v3;
  double v4;
  double v5;

  _SCDAAssistantPreferencesValueForKeyWithContext(CFSTR("Myriad Max No Op Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.005;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    if (v4 != 0.0)
    {
      objc_msgSend(v2, "doubleValue");
      v3 = v5;
    }
  }

  return v3;
}

- (void)setMyriadMaxNoOperationDelay:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  _SCDAAssistantPreferencesSetValueForKeyWithContext(v4, CFSTR("Myriad Max No Op Delay"), CFSTR("com.apple.assistant"), self->_instanceContext);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_navTokenQueue, 0);
}

+ (id)sharedPreferencesWithInstanceContext:(id)a3
{
  id v3;
  SCDAAssistantPreferences *v4;

  v3 = a3;
  v4 = -[SCDAAssistantPreferences initWithInstanceContext:]([SCDAAssistantPreferences alloc], "initWithInstanceContext:", v3);

  return v4;
}

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1)
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_733);
  return (id)sharedPreferences_sSharedPreferences;
}

void __45__SCDAAssistantPreferences_sharedPreferences__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BE091F8], "currentContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[SCDAAssistantPreferences sharedPreferencesWithInstanceContext:](SCDAAssistantPreferences, "sharedPreferencesWithInstanceContext:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedPreferences_sSharedPreferences;
  sharedPreferences_sSharedPreferences = v0;

}

@end
