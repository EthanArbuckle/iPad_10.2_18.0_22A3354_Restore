@implementation WFDeveloperOutrankAlertController

+ (id)developerOutrankAlertControllerWithNetworkName:(id)a3 chinaDevice:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  os_log_type_t v23;
  const char *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  uint8_t buf[8];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  v9 = v8;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v25 = v7;
  if (!v7)
  {
    WFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    v23 = OSLogForWFLogLevel(1uLL);
    v11 = 0;
    if (WFCurrentLogLevel() && v12)
    {
      if (os_log_type_enabled(v12, v23))
      {
        *(_WORD *)buf = 0;
        v24 = "Missing network name";
LABEL_13:
        _os_log_impl(&dword_2196CC000, v12, v23, v24, buf, 2u);
      }
LABEL_14:
      v11 = 0;
      v10 = 0;
      goto LABEL_4;
    }
LABEL_15:
    v10 = 0;
    goto LABEL_4;
  }
  if (!v8)
  {
    WFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    v23 = OSLogForWFLogLevel(1uLL);
    v11 = 0;
    if (WFCurrentLogLevel() && v12)
    {
      if (os_log_type_enabled(v12, v23))
      {
        *(_WORD *)buf = 0;
        v24 = "Missing completion handler";
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  +[WFDeveloperOutrankAlertController titleForNetworkName:chinaDevice:](WFDeveloperOutrankAlertController, "titleForNetworkName:chinaDevice:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFDeveloperOutrankAlertController messageForChinaDevice:](WFDeveloperOutrankAlertController, "messageForChinaDevice:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFDeveloperOutrankAlertController okButtonTitle](WFDeveloperOutrankAlertController, "okButtonTitle");
  v12 = objc_claimAutoreleasedReturnValue();
  +[WFDeveloperOutrankAlertController settingsButtonTitle](WFDeveloperOutrankAlertController, "settingsButtonTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFPromptAlertController alertControllerWithTitle:message:preferredStyle:](WFPromptAlertController, "alertControllerWithTitle:message:preferredStyle:", v10, v11, 1);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v30[5];
  v30[5] = v14;

  objc_msgSend((id)v30[5], "setCompletionHandler:", v9);
  v16 = (void *)v30[5];
  v17 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __114__WFDeveloperOutrankAlertController_developerOutrankAlertControllerWithNetworkName_chinaDevice_completionHandler___block_invoke;
  v27[3] = &unk_24DB37378;
  v27[4] = &v29;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v12, 0, v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v18);

  v19 = (void *)v30[5];
  v26[0] = v17;
  v26[1] = 3221225472;
  v26[2] = __114__WFDeveloperOutrankAlertController_developerOutrankAlertControllerWithNetworkName_chinaDevice_completionHandler___block_invoke_2;
  v26[3] = &unk_24DB37378;
  v26[4] = &v29;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v13, 0, v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAction:", v20);

LABEL_4:
  v21 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v21;
}

void __114__WFDeveloperOutrankAlertController_developerOutrankAlertControllerWithNetworkName_chinaDevice_completionHandler___block_invoke(uint64_t a1)
{
  void (**v1)(id, _QWORD);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "completionHandler");
  v1 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v1[2](v1, 0);

}

void __114__WFDeveloperOutrankAlertController_developerOutrankAlertControllerWithNetworkName_chinaDevice_completionHandler___block_invoke_2(uint64_t a1)
{
  void (**v1)(id, uint64_t);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "completionHandler");
  v1 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v1[2](v1, 1);

}

+ (id)titleForNetworkName:(id)a3 chinaDevice:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = a3;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
    v10 = CFSTR("kWFLocDeveloperOutrankAlertTitle_CH");
  else
    v10 = CFSTR("kWFLocDeveloperOutrankAlertTitle");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)messageForChinaDevice:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("kWFLocDeveloperOutrankAlertMessage_CH");
  else
    v6 = CFSTR("kWFLocDeveloperOutrankAlertMessage");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)okButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("kWFLocPromptAlertDeveloperOutrankOKButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)settingsButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("kWFLocPromptAlertDeveloperOutrankSettingsButton"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)okButtonTitle
{
  return self->_okButtonTitle;
}

- (void)setOkButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1312);
}

- (NSString)settingButtonTitle
{
  return self->_settingButtonTitle;
}

- (void)setSettingButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1320);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingButtonTitle, 0);
  objc_storeStrong((id *)&self->_okButtonTitle, 0);
}

@end
