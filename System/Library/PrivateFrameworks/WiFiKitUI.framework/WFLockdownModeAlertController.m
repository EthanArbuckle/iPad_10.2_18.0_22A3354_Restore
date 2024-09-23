@implementation WFLockdownModeAlertController

+ (id)lockdownModeAlertControllerWithNetworkName:(id)a3 securityType:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v46;
  os_log_type_t v47;
  const char *v48;
  uint8_t *v49;
  uint8_t buf[2];
  __int16 v51;

  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (!v7)
  {
    WFLogForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v46 || !os_log_type_enabled(v46, v47))
      goto LABEL_23;
    v51 = 0;
    v48 = "Missing network name";
    v49 = (uint8_t *)&v51;
    goto LABEL_22;
  }
  if (!v8)
  {
    WFLogForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v46 || !os_log_type_enabled(v46, v47))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v48 = "Missing completion handler";
    v49 = buf;
LABEL_22:
    _os_log_impl(&dword_2196CC000, v46, v47, v48, v49, 2u);
LABEL_23:

    v42 = 0;
    v40 = 0;
    v38 = 0;
    v13 = 0;
    v43 = 0;
    goto LABEL_13;
  }
  switch(a4)
  {
    case 0uLL:
      v10 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("kWFLocLockdownModeOpenAlertTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v12, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("kWFLocLockdownModeOpenAlertMessage");
      break;
    case 1uLL:
      v20 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("kWFLocLockdownModeWeakAlertTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", v22, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("kWFLocLockdownModeWPAAlertMessage");
      break;
    case 2uLL:
      v23 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("kWFLocLockdownModeWeakAlertTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", v25, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("kWFLocLockdownModeWEPAlertMessage");
      break;
    case 3uLL:
      v26 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("kWFLocLockdownModeWeakAlertTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", v28, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("kWFLocLockdownModeWAPIAlertMessage");
      break;
    case 4uLL:
      v29 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("kWFLocLockdownModeWeakAlertTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", v31, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("kWFLocLockdownModeWPATKIPAlertMessage");
      break;
    case 5uLL:
      v32 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("kWFLocLockdownModePasspointAlertTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", v34, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("kWFLocLockdownModePasspointAlertMessage");
      break;
    case 6uLL:
      v35 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("kWFLocLockdownModeCaptiveAlertTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", v37, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("kWFLocLockdownModeCaptiveAlertMessage");
      break;
    default:
      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("kWFLocLockdownModeOtherAlertTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v19, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("kWFLocLockdownModeOtherAlertMessage");
      break;
  }
  objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("kWFLocPromptAlertCancelButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("kWFLocPromptAlertJoinButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  +[WFPromptAlertController promptAlertControllerWithTitle:message:cancelTitle:successTitle:completionHandler:](WFLockdownModeAlertController, "promptAlertControllerWithTitle:message:cancelTitle:successTitle:completionHandler:", v13, v38, v40, v42, v9);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  v44 = v43;

  return v44;
}

@end
