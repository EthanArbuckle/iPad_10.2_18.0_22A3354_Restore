@implementation AXVisualAlertSBNCScreenController

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBNCScreenController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCScreenController"), CFSTR("turnOnScreenForNotificationRequest:"), "v", "@", 0);
}

- (void)turnOnScreenForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
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
      v13 = v4;
      _AXStringForArgs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v11;
        _os_log_impl(&dword_21FD32000, v8, v9, "%{public}@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXTurnedOnScreen"), v13);
  +[AXVisualAlertManager sharedVisualAlertManager](AXVisualAlertManager, "sharedVisualAlertManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addBulletin:", v4);

  v14.receiver = self;
  v14.super_class = (Class)AXVisualAlertSBNCScreenController;
  -[AXVisualAlertSBNCScreenController turnOnScreenForNotificationRequest:](&v14, sel_turnOnScreenForNotificationRequest_, v4);

}

@end
