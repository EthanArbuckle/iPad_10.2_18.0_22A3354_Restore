@implementation WFCarPlayAlertController

+ (id)carPlayAlertControllerWithNetworkName:(id)a3 carName:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v27;
  os_log_type_t v28;
  const char *v29;
  uint8_t *v30;
  id v31;
  uint8_t buf[2];
  __int16 v33;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v7)
  {
    WFLogForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v27 || !os_log_type_enabled(v27, v28))
      goto LABEL_17;
    v33 = 0;
    v29 = "Missing network name";
    v30 = (uint8_t *)&v33;
    goto LABEL_16;
  }
  if (!v9)
  {
    WFLogForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v27 || !os_log_type_enabled(v27, v28))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v29 = "Missing completion handler";
    v30 = buf;
LABEL_16:
    _os_log_impl(&dword_2196CC000, v27, v28, v29, v30, 2u);
LABEL_17:

    v23 = 0;
    v21 = 0;
    v15 = 0;
    v19 = 0;
    v24 = 0;
    goto LABEL_7;
  }
  v31 = v9;
  if (v8)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocDisableCarPlayAlertTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v8;
    objc_msgSend(v11, "stringWithFormat:", v13, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocDisableCarPlayAlertTitleNoCarName"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v16 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("kWFLocDisableCarPlayAlertMessage"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v18, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("kWFLocPromptAlertCancelButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("kWFLocPromptAlertJoinButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v31;
  +[WFPromptAlertController promptAlertControllerWithTitle:message:cancelTitle:successTitle:completionHandler:](WFCarPlayAlertController, "promptAlertControllerWithTitle:message:cancelTitle:successTitle:completionHandler:", v15, v19, v21, v23, v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
LABEL_7:
  v25 = v24;

  return v25;
}

@end
