@implementation AXVisualAlertSBUIFlashlightController

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIFlashlightController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIFlashlightController"), CFSTR("_turnPowerOff"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIFlashlightController"), CFSTR("_turnPowerOn"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIFlashlightController"), CFSTR("setLevel:"), "v", "Q", 0);

}

- (void)setLevel:(unint64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  unint64_t v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)AXVisualAlertSBUIFlashlightController;
  -[AXVisualAlertSBUIFlashlightController setLevel:](&v16, sel_setLevel_);
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ignoreLogging");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      AXColorizeFormatLog();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = a3;
      _AXStringForArgs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v11;
        _os_log_impl(&dword_21FD32000, v8, v9, "%{public}@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a3)
    v14 = CFSTR("AXVisualAlertManagerControlCenterTorchWasEnabledNotification");
  else
    v14 = CFSTR("AXVisualAlertManagerControlCenterTorchWasDisabledNotification");
  objc_msgSend(v12, "postNotificationName:object:", v14, self);

}

- (void)_turnPowerOff
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)AXVisualAlertSBUIFlashlightController;
  -[AXVisualAlertSBUIFlashlightController _turnPowerOff](&v11, sel__turnPowerOff);
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("AXVisualAlertManagerControlCenterTorchWasDisabledNotification"), self);

}

- (void)_turnPowerOn
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)AXVisualAlertSBUIFlashlightController;
  -[AXVisualAlertSBUIFlashlightController _turnPowerOn](&v11, sel__turnPowerOn);
  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreLogging");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v6, v7))
    {
      AXColorizeFormatLog();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:", CFSTR("AXVisualAlertManagerControlCenterTorchWasEnabledNotification"), self);

}

@end
