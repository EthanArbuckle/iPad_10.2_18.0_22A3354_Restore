@implementation WFCellularOutrankPromptOperation

+ (id)cellularOutrankPromptOperationWithNetworkName:(id)a3 privateCellular:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t IsChinaDevice;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  NSObject *v14;
  os_log_type_t v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  WFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v7 && os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "+[WFCellularOutrankPromptOperation cellularOutrankPromptOperationWithNetworkName:privateCellular:]";
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_219FC8000, v7, v8, "%s: showing cellular outrank prompt for network='%@'", buf, 0x16u);
  }

  WFCurrentDeviceCapability();
  IsChinaDevice = WFCapabilityIsChinaDevice();
  objc_msgSend(MEMORY[0x24BEC2930], "titleForNetworkName:chinaDevice:privateCellular:", v5, IsChinaDevice, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKey:", v10, *MEMORY[0x24BDBD6D8]);
  }
  else
  {
    WFLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "+[WFCellularOutrankPromptOperation cellularOutrankPromptOperationWithNetworkName:privateCellular:]";
      v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_219FC8000, v11, v12, "%s: nil title for prompt, networkName='%@'", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x24BEC2930], "messageForChinaDevice:privateCellular:", IsChinaDevice, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v6, "setObject:forKey:", v13, *MEMORY[0x24BDBD6E0]);
  }
  else
  {
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "+[WFCellularOutrankPromptOperation cellularOutrankPromptOperationWithNetworkName:privateCellular:]";
      v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_219FC8000, v14, v15, "%s: nil message for prompt, networkName='%@'", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x24BEC2930], "cancelButtonTitleForPrivateCellular:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v6, "setObject:forKey:", v16, *MEMORY[0x24BDBD6F0]);
  }
  else
  {
    WFLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v18))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "+[WFCellularOutrankPromptOperation cellularOutrankPromptOperationWithNetworkName:privateCellular:]";
      v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_219FC8000, v17, v18, "%s: nil cancelButtonTitle for prompt, networkName='%@'", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x24BEC2930], "defaultButtonTitleForChinaDevice:", IsChinaDevice);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v6, "setObject:forKey:", v19, *MEMORY[0x24BDBD6F8]);
  }
  else
  {
    WFLogForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v20 && os_log_type_enabled(v20, v21))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "+[WFCellularOutrankPromptOperation cellularOutrankPromptOperationWithNetworkName:privateCellular:]";
      v28 = 2112;
      v29 = v5;
      _os_log_impl(&dword_219FC8000, v20, v21, "%s: nil defaultButtonTitle for prompt, networkName='%@'", buf, 0x16u);
    }

  }
  v22 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v6, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("SBUserNotificationDismissOnLock"));
  objc_msgSend(v6, "setObject:forKey:", &stru_24DC36C30, CFSTR("SBUserNotificationAlertMessageDelimiterKey"));
  objc_msgSend(v6, "setObject:forKey:", v22, *MEMORY[0x24BDBD6E8]);
  objc_msgSend(v6, "setObject:forKey:", v22, CFSTR("SBUserNotificationForcesModalAlertAppearance"));
  objc_msgSend(v6, "setObject:forKey:", v22, CFSTR("SBUserNotificationDisplayActionButtonOnLockScreen"));
  v23 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithOptions:timeout:", v6, 0.0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cellular outrank prompt for network='%@'"), v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setName:", v24);

  return v23;
}

@end
