@implementation PSUIConvertToESIMSpecifier

+ (id)keyFor:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@"), objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)specifierWithPhoneNumber:(id)a3 carrierName:(id)a4 hostController:(id)a5 isViewControllerPopNeeded:(BOOL)a6 iccid:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  PSUIConvertToESIMSpecifier *v18;
  PSUIConvertToESIMSpecifier *v19;

  v8 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  +[PSUIConvertToESIMSpecifier keyFor:](PSUIConvertToESIMSpecifier, "keyFor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSFlowHostCache sharedInstance](SSFlowHostCache, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = v17;
  else
    v18 = -[PSUIConvertToESIMSpecifier initWithPhoneNumber:carrierName:hostController:isViewControllerPopNeeded:iccid:]([PSUIConvertToESIMSpecifier alloc], "initWithPhoneNumber:carrierName:hostController:isViewControllerPopNeeded:iccid:", v11, v12, v13, v8, v14);
  v19 = v18;

  return v19;
}

- (PSUIConvertToESIMSpecifier)initWithPhoneNumber:(id)a3 carrierName:(id)a4 hostController:(id)a5 isViewControllerPopNeeded:(BOOL)a6 iccid:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  PSUIConvertToESIMSpecifier *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  BOOL v27;
  objc_super v28;
  uint8_t buf[4];
  PSUIConvertToESIMSpecifier *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v27 = a6;
  v17 = v14;
  v18 = v13;
  if (_MergedGlobals_1_1 != -1)
    dispatch_once(&_MergedGlobals_1_1, &__block_literal_global_7);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Convert to eSIM"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28.receiver = self;
  v28.super_class = (Class)PSUIConvertToESIMSpecifier;
  v21 = -[PSUIConvertToESIMSpecifier initWithName:target:set:get:detail:cell:edit:](&v28, sel_initWithName_target_set_get_detail_cell_edit_, v20, 0, 0, 0, 0, 13, 0);

  if (v21)
  {
    -[PSUIConvertToESIMSpecifier setIdentifier:](v21, "setIdentifier:", CFSTR("Convert to eSIM"));
    -[PSUIConvertToESIMSpecifier setTarget:](v21, "setTarget:", v21);
    -[PSUIConvertToESIMSpecifier setButtonAction:](v21, "setButtonAction:", sel_convertToeSIMCellPressed_);
    objc_storeStrong((id *)&v21->_phoneNumber, a3);
    objc_storeStrong((id *)&v21->_carrierName, a4);
    objc_storeWeak((id *)&v21->_hostController, v15);
    objc_msgSend(v15, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v21->_navigationController, v22);

    v21->_isViewControllerPopNeeded = v27;
    objc_storeStrong((id *)&v21->_iccid, a7);
  }
  objc_msgSend((id)qword_253E97100, "objectForKey:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v17;
  if (v23)
  {
    -[PSUIConvertToESIMSpecifier getLogger](v21, "getLogger");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v21;
      _os_log_impl(&dword_2161C6000, v25, OS_LOG_TYPE_DEFAULT, "update delegate to %@", buf, 0xCu);
    }

    objc_msgSend(v23, "setDelegate:", v21);
  }

  return v21;
}

void __109__PSUIConvertToESIMSpecifier_initWithPhoneNumber_carrierName_hostController_isViewControllerPopNeeded_iccid___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_253E97100;
  qword_253E97100 = v0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSUIConvertToESIMSpecifier;
  -[PSUIConvertToESIMSpecifier dealloc](&v4, sel_dealloc);
}

- (void)convertToeSIMCellPressed:(id)a3
{
  void *v4;
  char v5;

  +[PSUIDeviceWiFiState sharedInstance](PSUIDeviceWiFiState, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isConnectedOverWiFi");

  if ((v5 & 1) != 0)
    -[PSUIConvertToESIMSpecifier _convertToeSIM](self, "_convertToeSIM");
  else
    -[PSUIConvertToESIMSpecifier _showWifiAlert](self, "_showWifiAlert");
}

- (void)odcSuccess:(id)a3 isViewControllerPopNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id WeakRetained;
  id v9;
  uint8_t v10[16];

  v4 = a4;
  v6 = a3;
  -[PSUIConvertToESIMSpecifier getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "ODC Success", v10, 2u);
  }

  objc_msgSend((id)qword_253E97100, "removeObjectForKey:", v6);
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
    v9 = (id)objc_msgSend(WeakRetained, "popViewControllerAnimated:", 1);

  }
}

- (void)odcFailed:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  -[PSUIConvertToESIMSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "ODC Failed", v6, 2u);
  }

  objc_msgSend((id)qword_253E97100, "removeObjectForKey:", v4);
}

- (void)odcCanceled:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  -[PSUIConvertToESIMSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "ODC canceled", v6, 2u);
  }

  objc_msgSend((id)qword_253E97100, "removeObjectForKey:", v4);
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  _QWORD v5[5];
  id v6[2];
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__PSUIConvertToESIMSpecifier_simSetupFlowCompleted___block_invoke;
  v5[3] = &unk_24D5019D0;
  objc_copyWeak(v6, &location);
  v5[4] = self;
  v6[1] = (id)a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __52__PSUIConvertToESIMSpecifier_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(WeakRetained + 29);
    objc_msgSend(v4, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 48);
      v14 = 134217984;
      v15 = v7;
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "simSetupFlowCompleted with completionType:%ld", (uint8_t *)&v14, 0xCu);
    }

    if (*((_BYTE *)v3 + 248) && *(_QWORD *)(a1 + 48) == 2)
    {
      v8 = objc_loadWeakRetained(v3 + 29);
      objc_msgSend(v8, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v9, "popViewControllerAnimated:", 1);

    }
    v11 = v3[26];
    v3[26] = 0;

    +[PSUIConvertToESIMSpecifier keyFor:](PSUIConvertToESIMSpecifier, "keyFor:", v3[32]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSFlowHostCache sharedInstance](SSFlowHostCache, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", v12);

  }
}

- (void)_convertToeSIM
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSString *v6;
  NSString *carrierName;
  void *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSString *phoneNumber;
  const __CFString *v13;
  void *v14;
  NSObject *v15;
  TSSIMSetupFlow *v16;
  TSSIMSetupFlow *flow;
  void *v18;
  NSObject *WeakRetained;
  ConvertToESIMSpecifierCache *v20;
  ConvertToESIMSpecifierCache *v21;
  TSSIMSetupFlow *v22;
  _QWORD v23[4];
  id v24;
  _BYTE buf[24];
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  -[PSUIConvertToESIMSpecifier getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "start convert physical SIM -> eSIM", buf, 2u);
  }

  if (!self->_carrierName)
  {
    -[PSUIConvertToESIMSpecifier getLogger](self, "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "carrier name empty", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CARRIER"), &stru_24D5028C8, CFSTR("Cellular"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    carrierName = self->_carrierName;
    self->_carrierName = v6;

  }
  v26[0] = *MEMORY[0x24BE82B48];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BE82B40];
  v10 = self->_carrierName;
  v27[0] = v8;
  v27[1] = v10;
  v11 = *MEMORY[0x24BE82B50];
  phoneNumber = self->_phoneNumber;
  v26[1] = v9;
  v26[2] = v11;
  if (phoneNumber)
    v13 = (const __CFString *)phoneNumber;
  else
    v13 = &stru_24D5028C8;
  v27[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUIConvertToESIMSpecifier getLogger](self, "getLogger");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v14;
    _os_log_impl(&dword_2161C6000, v15, OS_LOG_TYPE_DEFAULT, "launch SimSetupSupport with options:%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE82B38], "flowWithOptions:", v14);
  v16 = (TSSIMSetupFlow *)objc_claimAutoreleasedReturnValue();
  flow = self->_flow;
  self->_flow = v16;

  -[TSSIMSetupFlow setDelegate:](self->_flow, "setDelegate:", self);
  objc_msgSend((id)qword_253E97100, "objectForKey:", self->_iccid);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[PSUIConvertToESIMSpecifier getLogger](self, "getLogger");
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2161C6000, WeakRetained, OS_LOG_TYPE_ERROR, "The model shouldn't already exist until after _convertToeSIM call", buf, 2u);
    }
  }
  else
  {
    v20 = [ConvertToESIMSpecifierCache alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
    v21 = -[ConvertToESIMSpecifierCache initWithDelegate:isViewControllerPopNeeded:odcFlow:delegate:iccid:](v20, "initWithDelegate:isViewControllerPopNeeded:odcFlow:delegate:iccid:", WeakRetained, self->_isViewControllerPopNeeded, self->_flow, self, self->_iccid);
    objc_msgSend((id)qword_253E97100, "setObject:forKeyedSubscript:", v21, self->_iccid);

  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v22 = self->_flow;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __44__PSUIConvertToESIMSpecifier__convertToeSIM__block_invoke;
  v23[3] = &unk_24D501A68;
  objc_copyWeak(&v24, (id *)buf);
  -[TSSIMSetupFlow firstViewController:](v22, "firstViewController:", v23);
  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);

}

void __44__PSUIConvertToESIMSpecifier__convertToeSIM__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v8);
    objc_msgSend(v4, "setModalPresentationStyle:", 2);
    v5 = objc_loadWeakRetained(WeakRetained + 29);
    objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

    +[PSUIConvertToESIMSpecifier keyFor:](PSUIConvertToESIMSpecifier, "keyFor:", WeakRetained[32]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSFlowHostCache sharedInstance](SSFlowHostCache, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", WeakRetained, v6);

  }
}

- (void)_showWifiAlert
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id WeakRetained;
  _QWORD v28[5];

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sf_isChinaRegionCellularDevice");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("NOT_CONNECTED_TO_WLAN");
  else
    v7 = CFSTR("NOT_CONNECTED_TO_WIFI");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sf_isChinaRegionCellularDevice");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    v13 = CFSTR("TURN_ON_WLAN_FOR_CONVERT_TO_ESIM");
  else
    v13 = CFSTR("TURN_ON_WIFI_FOR_CONVERT_TO_ESIM");
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v8, v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "sf_isChinaRegionCellularDevice");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
    v20 = CFSTR("WLAN_SETTINGS");
  else
    v20 = CFSTR("WIFI_SETTINGS");
  objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v21, 0, &__block_literal_global_46);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v22);
  v23 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __44__PSUIConvertToESIMSpecifier__showWifiAlert__block_invoke_2;
  v28[3] = &unk_24D5017B8;
  v28[4] = self;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 1, v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addAction:", v26);
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v15, 1, 0);

}

void __44__PSUIConvertToESIMSpecifier__showWifiAlert__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=WIFI"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

void __44__PSUIConvertToESIMSpecifier__showWifiAlert__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_2161C6000, v1, OS_LOG_TYPE_DEFAULT, "user canceled on device psim to esim conversion", v2, 2u);
  }

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("convert.esim"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_flow, 0);
}

@end
