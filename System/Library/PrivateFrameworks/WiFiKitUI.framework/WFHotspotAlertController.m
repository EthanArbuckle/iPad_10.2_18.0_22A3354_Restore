@implementation WFHotspotAlertController

+ (id)hotspotAlertControllerWithNetworkName:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v21;
  os_log_type_t v22;
  const char *v23;
  uint8_t *v24;
  uint8_t buf[2];
  __int16 v26;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    WFLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v21 || !os_log_type_enabled(v21, v22))
      goto LABEL_14;
    v26 = 0;
    v23 = "Missing network name";
    v24 = (uint8_t *)&v26;
    goto LABEL_13;
  }
  if (!v6)
  {
    WFLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v21 || !os_log_type_enabled(v21, v22))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v23 = "Missing completion handler";
    v24 = buf;
LABEL_13:
    _os_log_impl(&dword_2196CC000, v21, v22, v23, v24, 2u);
LABEL_14:

    v17 = 0;
    v15 = 0;
    v13 = 0;
    v9 = 0;
    v18 = 0;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("kWFLocDisablePersonalHotspotAlertTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("kWFLocDisablePersonalHotspotAlertMessage"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v12, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("kWFLocPromptAlertCancelButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("kWFLocPromptAlertJoinButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFPromptAlertController promptAlertControllerWithTitle:message:cancelTitle:successTitle:completionHandler:](WFHotspotAlertController, "promptAlertControllerWithTitle:message:cancelTitle:successTitle:completionHandler:", v9, v13, v15, v17, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
  v19 = v18;

  return v19;
}

@end
