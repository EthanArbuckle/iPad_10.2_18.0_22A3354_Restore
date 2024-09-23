@implementation WFCarPlayDisablePromptOperation

+ (id)carPlayDisablePromptOperation
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("kWFLocCCDisableCarPlayAlertTitle"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, *MEMORY[0x24BDBD6D8]);

  WFCurrentDeviceCapability();
  LODWORD(v3) = WFCapabilityIsChinaDevice();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((_DWORD)v3)
    v7 = CFSTR("kWFLocCCDisableCarPlayAlertMessageCH");
  else
    v7 = CFSTR("kWFLocCCDisableCarPlayAlertMessage");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v8, *MEMORY[0x24BDBD6E0]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("kWFLocCCDisableCarPlayAlertCancelButton"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v10, *MEMORY[0x24BDBD6F0]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("kWFLocCCDisableCarPlayAlertDisconnectButton"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v12, *MEMORY[0x24BDBD6F8]);

  v13 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v2, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("SBUserNotificationDismissOnLock"));
  objc_msgSend(v2, "setObject:forKey:", &stru_24DC36C30, CFSTR("SBUserNotificationAlertMessageDelimiterKey"));
  objc_msgSend(v2, "setObject:forKey:", v13, *MEMORY[0x24BDBD6E8]);
  objc_msgSend(v2, "setObject:forKey:", v13, CFSTR("SBUserNotificationForcesModalAlertAppearance"));
  objc_msgSend(v2, "setObject:forKey:", v13, CFSTR("SBUserNotificationDisplayActionButtonOnLockScreen"));
  v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptions:timeout:", v2, 0.0);

  return v14;
}

@end
