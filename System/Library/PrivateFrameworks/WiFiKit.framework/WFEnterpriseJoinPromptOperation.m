@implementation WFEnterpriseJoinPromptOperation

+ (id)enterpriseJoinPromptOperationWithDeviceCapability:(int64_t)a3
{
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  int IsChinaDevice;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  const char *v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(3uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    v21 = 136315394;
    v22 = "+[WFEnterpriseJoinPromptOperation enterpriseJoinPromptOperationWithDeviceCapability:]";
    v23 = 2048;
    v24 = a3;
    _os_log_impl(&dword_219FC8000, v4, v5, "%s: creating enterprise prompt with capability %ld", (uint8_t *)&v21, 0x16u);
  }

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  IsChinaDevice = WFCapabilityIsChinaDevice();
  v8 = CFSTR("kWFLocEnterpriseJoinAlertTitle");
  if (IsChinaDevice)
    v8 = CFSTR("kWFLocEnterpriseJoinAlertTitle_CH");
  v9 = (void *)MEMORY[0x24BDD1488];
  v10 = v8;
  objc_msgSend(v9, "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", v10, &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKey:", v12, *MEMORY[0x24BDBD6D8]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("kWFLocEnterpriseJoinAlertBody"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v14, *MEMORY[0x24BDBD6E0]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("kWFLocEnterpriseJoinAlertButtonOk"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v16, *MEMORY[0x24BDBD6F8]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("kWFLocEnterpriseJoinAlertButtonCancel"), &stru_24DC36C30, CFSTR("WiFiKitLocalizableStrings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v18, *MEMORY[0x24BDBD6F0]);

  objc_msgSend(v6, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("SBUserNotificationDismissOnLock"));
  objc_msgSend(v6, "setObject:forKey:", &stru_24DC36C30, CFSTR("SBUserNotificationAlertMessageDelimiterKey"));
  v19 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptions:timeout:flags:", v6, 0, 0.0);

  return v19;
}

- (NSString)password
{
  return self->password;
}

- (NSString)username
{
  return self->username;
}

- (__SecIdentity)TLSIdentity
{
  return self->TLSIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->username, 0);
  objc_storeStrong((id *)&self->password, 0);
}

@end
