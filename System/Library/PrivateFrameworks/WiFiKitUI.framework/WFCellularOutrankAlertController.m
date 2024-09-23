@implementation WFCellularOutrankAlertController

+ (id)cellularOutrankAlertControllerWithNetworkName:(id)a3 chinaDevice:(BOOL)a4 privateCellular:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  os_log_type_t v25;
  const char *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[8];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = a6;
  v11 = v10;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v27 = v9;
  if (!v9)
  {
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v25 = OSLogForWFLogLevel(1uLL);
    v12 = 0;
    if (WFCurrentLogLevel() && v14)
    {
      if (os_log_type_enabled(v14, v25))
      {
        *(_WORD *)buf = 0;
        v26 = "Missing network name";
LABEL_13:
        _os_log_impl(&dword_2196CC000, v14, v25, v26, buf, 2u);
      }
LABEL_14:
      v12 = 0;
      v13 = 0;
      goto LABEL_4;
    }
LABEL_15:
    v13 = 0;
    goto LABEL_4;
  }
  if (!v10)
  {
    WFLogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    v25 = OSLogForWFLogLevel(1uLL);
    v12 = 0;
    if (WFCurrentLogLevel() && v14)
    {
      if (os_log_type_enabled(v14, v25))
      {
        *(_WORD *)buf = 0;
        v26 = "Missing completion handler";
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  +[WFCellularOutrankAlertController titleForNetworkName:chinaDevice:privateCellular:](WFCellularOutrankAlertController, "titleForNetworkName:chinaDevice:privateCellular:", v9, v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCellularOutrankAlertController messageForChinaDevice:privateCellular:](WFCellularOutrankAlertController, "messageForChinaDevice:privateCellular:", v8, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCellularOutrankAlertController cancelButtonTitleForPrivateCellular:](WFCellularOutrankAlertController, "cancelButtonTitleForPrivateCellular:", v7);
  v14 = objc_claimAutoreleasedReturnValue();
  +[WFCellularOutrankAlertController defaultButtonTitleForChinaDevice:](WFCellularOutrankAlertController, "defaultButtonTitleForChinaDevice:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFPromptAlertController alertControllerWithTitle:message:preferredStyle:](WFPromptAlertController, "alertControllerWithTitle:message:preferredStyle:", v12, v13, 1);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v32[5];
  v32[5] = v16;

  objc_msgSend((id)v32[5], "setCompletionHandler:", v11);
  v18 = (void *)v32[5];
  v19 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __128__WFCellularOutrankAlertController_cellularOutrankAlertControllerWithNetworkName_chinaDevice_privateCellular_completionHandler___block_invoke;
  v29[3] = &unk_24DB37378;
  v29[4] = &v31;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v15, 0, v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v20);

  v21 = (void *)v32[5];
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __128__WFCellularOutrankAlertController_cellularOutrankAlertControllerWithNetworkName_chinaDevice_privateCellular_completionHandler___block_invoke_2;
  v28[3] = &unk_24DB37378;
  v28[4] = &v31;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v14, 0, v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAction:", v22);

LABEL_4:
  v23 = (id)v32[5];

  _Block_object_dispose(&v31, 8);
  return v23;
}

void __128__WFCellularOutrankAlertController_cellularOutrankAlertControllerWithNetworkName_chinaDevice_privateCellular_completionHandler___block_invoke(uint64_t a1)
{
  void (**v1)(id, uint64_t);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "completionHandler");
  v1 = (void (**)(id, uint64_t))objc_claimAutoreleasedReturnValue();
  v1[2](v1, 1);

}

void __128__WFCellularOutrankAlertController_cellularOutrankAlertControllerWithNetworkName_chinaDevice_privateCellular_completionHandler___block_invoke_2(uint64_t a1)
{
  void (**v1)(id, _QWORD);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "completionHandler");
  v1 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v1[2](v1, 0);

}

+ (id)titleForNetworkName:(id)a3 chinaDevice:(BOOL)a4 privateCellular:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;

  v5 = a5;
  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = (void *)MEMORY[0x24BDD1488];
  v9 = a3;
  objc_msgSend(v8, "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = CFSTR("kWFLocCellularOutrankAlertTitle");
  if (v6)
    v12 = CFSTR("kWFLocCellularOutrankAlertTitle_CH");
  v13 = CFSTR("kWFLocPrivateCellularOutrankAlertTitle_CH");
  if (!v6)
    v13 = CFSTR("kWFLocPrivateCellularOutrankAlertTitle");
  if (v5)
    v14 = v13;
  else
    v14 = v12;
  objc_msgSend(v10, "localizedStringForKey:value:table:", v14, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v15, v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)messageForChinaDevice:(BOOL)a3 privateCellular:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = CFSTR("kWFLocCellularOutrankAlertMessage");
  if (v5)
    v8 = CFSTR("kWFLocCellularOutrankAlertMessage_CH");
  v9 = CFSTR("kWFLocPrivateCellularOutrankAlertMessage_CH");
  if (!v5)
    v9 = CFSTR("kWFLocPrivateCellularOutrankAlertMessage");
  if (v4)
    v10 = v9;
  else
    v10 = v8;
  objc_msgSend(v6, "localizedStringForKey:value:table:", v10, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)cancelButtonTitleForPrivateCellular:(BOOL)a3
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
    v6 = CFSTR("kWFLocPromptAlertPrivateCellularOutrankCancelButton");
  else
    v6 = CFSTR("kWFLocPromptAlertCellularOutrankCancelButton");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)defaultButtonTitleForChinaDevice:(BOOL)a3
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
    v6 = CFSTR("kWFLocPromptAlertCellularOutrankAcceptButton_CH");
  else
    v6 = CFSTR("kWFLocPromptAlertCellularOutrankAcceptButton");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (void)setCancelButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1312);
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1320);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
}

@end
