@implementation AXVisualAlertSBNCSoundController

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBNCSoundController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCSoundController"), CFSTR("playSoundAndReadOutForNotificationRequest:presentingDestination:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBNCSoundController"), CFSTR("stopSoundForNotificationRequest:"), "v", "@", 0);

}

- (void)playSoundAndReadOutForNotificationRequest:(id)a3 presentingDestination:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXVisualAlertSBNCSoundController;
  -[AXVisualAlertSBNCSoundController playSoundAndReadOutForNotificationRequest:presentingDestination:](&v8, sel_playSoundAndReadOutForNotificationRequest_presentingDestination_, v6, a4);
  v7 = v6;
  AXPerformBlockOnMainThreadAfterDelay();

}

void __100__AXVisualAlertSBNCSoundController_playSoundAndReadOutForNotificationRequest_presentingDestination___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  os_log_type_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  const char *Name;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "sectionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
      Name = sel_getName(*(SEL *)(a1 + 40));
      v24 = *(_QWORD *)(a1 + 32);
      _AXStringForArgs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 138543362;
        v26 = v9;
        _os_log_impl(&dword_21FD32000, v6, v7, "%{public}@", buf, 0xCu);
      }

    }
  }
  +[AXVisualAlertManager sharedVisualAlertManager](AXVisualAlertManager, "sharedVisualAlertManager", Name, v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "existingBulletinForBulletin:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "_accessibilityBoolValueForKey:", CFSTR("AXTurnedOnScreen")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.springboard.SBDismissOnlyAlertItem")))
      {
        objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "ignoreLogging");

        if ((v13 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BE00710], "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v15 = objc_claimAutoreleasedReturnValue();

          v16 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v15, v16))
          {
            AXColorizeFormatLog();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            _AXStringForArgs();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, v16))
            {
              *(_DWORD *)buf = 138543362;
              v26 = v18;
LABEL_18:
              _os_log_impl(&dword_21FD32000, v15, v16, "%{public}@", buf, 0xCu);
              goto LABEL_19;
            }
            goto LABEL_19;
          }
          goto LABEL_20;
        }
      }
      else if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
      {
        objc_msgSend((id)_VisualAlertManager, "_handleVisualAlertForIncomingMessage");
      }
      else if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobiletimer")))
      {
        objc_msgSend((id)_VisualAlertManager, "_handleBeginVisualAlertForAlarmWithSound:", 1);
      }
      else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilephone")) & 1) == 0
             && (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.facetime")) & 1) == 0)
      {
        objc_msgSend((id)_VisualAlertManager, "_handleVisualAlertForRegularNotification:", v2);
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "ignoreLogging");

    if ((v20 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00710], "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v15 = objc_claimAutoreleasedReturnValue();

      v16 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v15, v16))
      {
        AXColorizeFormatLog();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, v16))
        {
          *(_DWORD *)buf = 138543362;
          v26 = v18;
          goto LABEL_18;
        }
LABEL_19:

      }
LABEL_20:

    }
  }
  +[AXVisualAlertManager sharedVisualAlertManager](AXVisualAlertManager, "sharedVisualAlertManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeBulletin:", *(_QWORD *)(a1 + 32));

}

- (void)stopSoundForNotificationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)AXVisualAlertSBNCSoundController;
  v4 = a3;
  -[AXVisualAlertSBNCSoundController stopSoundForNotificationRequest:](&v13, sel_stopSoundForNotificationRequest_, v4);
  objc_msgSend(v4, "sectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE00710], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "ignoreLogging");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00710], "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v9, v10))
    {
      AXColorizeFormatLog();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      sel_getName(a2);
      _AXStringForArgs();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v12;
        _os_log_impl(&dword_21FD32000, v9, v10, "%{public}@", buf, 0xCu);
      }

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobiletimer")))
  {
    objc_msgSend((id)_VisualAlertManager, "_handleEndVisualAlertForAlarm");
  }

}

@end
