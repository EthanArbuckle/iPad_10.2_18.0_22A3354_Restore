@implementation WFSecurityMismatchAlertController

+ (id)securityMismatchAlertControllerWithNetworkName:(id)a3 previousSecurity:(id)a4 newSecurity:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  os_log_type_t v24;
  id v25;
  os_log_type_t v27;
  const char *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v30 = a4;
  v29 = a5;
  v10 = a6;
  v11 = v10;
  if (!v9)
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v27 = OSLogForWFLogLevel(1uLL);
    v21 = 0;
    if (WFCurrentLogLevel() && v23)
    {
      if (os_log_type_enabled(v23, v27))
      {
        *(_WORD *)buf = 0;
        v28 = "Missing network name";
LABEL_16:
        _os_log_impl(&dword_2196CC000, v23, v27, v28, buf, 2u);
      }
LABEL_17:
      v21 = 0;
      v19 = 0;
      v15 = 0;
      v17 = 0;
      v22 = 0;
      goto LABEL_7;
    }
LABEL_18:
    v19 = 0;
    v15 = 0;
    v17 = 0;
    v22 = 0;
    goto LABEL_7;
  }
  if (!v10)
  {
    WFLogForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v27 = OSLogForWFLogLevel(1uLL);
    v21 = 0;
    if (WFCurrentLogLevel() && v23)
    {
      if (os_log_type_enabled(v23, v27))
      {
        *(_WORD *)buf = 0;
        v28 = "Missing completion handler";
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("kCWLocSecurityMismatchPromptTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v14, v9, v30, v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("kCWLocSecurityMismatchPromptDescription"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocPromptAlertCancelButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("kWFLocPromptAlertJoinButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFPromptAlertController promptAlertControllerWithTitle:message:cancelTitle:successTitle:completionHandler:](WFSecurityMismatchAlertController, "promptAlertControllerWithTitle:message:cancelTitle:successTitle:completionHandler:", v15, v17, v19, v21, v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v23 && os_log_type_enabled(v23, v24))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "+[WFSecurityMismatchAlertController securityMismatchAlertControllerWithNetworkName:previousSecurity:newSecurit"
          "y:completionHandler:]";
    v33 = 2112;
    v34 = v15;
    v35 = 2112;
    v36 = v17;
    _os_log_impl(&dword_2196CC000, v23, v24, "%s: title='%@' message='%@'", buf, 0x20u);
  }
LABEL_7:

  v25 = v22;
  return v25;
}

@end
