@implementation PSUICellularDataSpecifier

- (PSUICellularDataSpecifier)initWithHostController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PSUICellularDataSpecifier *v11;

  v4 = (void *)MEMORY[0x24BE856A8];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICoreTelephonyCallCache sharedInstance](PSUICoreTelephonyCallCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUIDeviceWiFiState sharedInstance](PSUIDeviceWiFiState, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PSUICellularDataSpecifier initWithHostController:simStatusCache:planManagerCache:callCache:dataCache:wifiState:](self, "initWithHostController:simStatusCache:planManagerCache:callCache:dataCache:wifiState:", v5, v6, v7, v8, v9, v10);

  return v11;
}

- (PSUICellularDataSpecifier)initWithHostController:(id)a3 simStatusCache:(id)a4 planManagerCache:(id)a5 callCache:(id)a6 dataCache:(id)a7 wifiState:(id)a8
{
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PSUICellularDataSpecifier *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v14 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v20 = a8;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MOBILE_DATA_SETTINGS"), &stru_24D5028C8, CFSTR("Cellular"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  v25.receiver = self;
  v25.super_class = (Class)PSUICellularDataSpecifier;
  v18 = -[PSUICellularDataSpecifier initWithName:target:set:get:detail:cell:edit:](&v25, sel_initWithName_target_set_get_detail_cell_edit_, v16, self, sel_setCellularDataEnabled_specifier_, sel_isCellularDataEnabled_, v17, 6, 0);

  if (v18)
  {
    -[PSUICellularDataSpecifier setIdentifier:](v18, "setIdentifier:", CFSTR("MOBILE_DATA_SETTINGS"));
    objc_storeWeak((id *)&v18->_hostController, v14);
    objc_storeStrong((id *)&v18->_simStatusCache, a4);
    objc_storeStrong((id *)&v18->_planManagerCache, a5);
    objc_storeStrong((id *)&v18->_dataCache, a7);
    objc_storeStrong((id *)&v18->_callCache, a6);
    objc_storeStrong((id *)&v18->_wifiState, a8);
    -[PSUICellularDataSpecifier setAirplaneMode:](v18, "setAirplaneMode:", -[PSUICoreTelephonyDataCache isAirplaneModeEnabled](v18->_dataCache, "isAirplaneModeEnabled"));
    -[PSUICellularDataSpecifier setProperty:forKey:](v18, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75CB8]);
    -[PSUICellularDataSpecifier updateCachedState](v18, "updateCachedState");
  }

  return v18;
}

- (void)updateCachedState
{
  NSArray *v3;
  NSArray *cachedPlanItems;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSUInteger v18;
  void *v19;
  NSUInteger v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *v28;
  char *__ptr32 *v29;
  unint64_t v30;
  int v31;
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
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  int v65;
  NSObject *v66;
  int v67;
  int v68;
  void *v69;
  void *v70;
  uint8_t buf[4];
  _BYTE v72[20];
  __int16 v73;
  int v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularPlanManagerCache planItems](self->_planManagerCache, "planItems");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  cachedPlanItems = self->_cachedPlanItems;
  self->_cachedPlanItems = v3;

  -[PSSimStatusCache subscriptionContexts](self->_simStatusCache, "subscriptionContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      -[PSSimStatusCache subscriptionContexts](self->_simStatusCache, "subscriptionContexts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v8 |= objc_msgSend(v11, "isSimHidden");
      v9 += objc_msgSend(v11, "isSimPresent");

      ++v7;
      -[PSSimStatusCache subscriptionContexts](self->_simStatusCache, "subscriptionContexts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

    }
    while (v13 > v7);
    v14 = (v9 > 1) & v8;
  }
  else
  {
    v14 = 0;
  }
  self->_isMSOActive = v14;
  -[PSUICellularDataSpecifier getLogger](self, "getLogger");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[PSSimStatusCache subscriptionContexts](self->_simStatusCache, "subscriptionContexts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    v18 = -[NSArray count](self->_cachedPlanItems, "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)v72 = v17;
    *(_WORD *)&v72[8] = 2048;
    *(_QWORD *)&v72[10] = v18;
    _os_log_impl(&dword_2161C6000, v15, OS_LOG_TYPE_DEFAULT, "%lu subscription context(s) and %lu plan item(s)", buf, 0x16u);

  }
  -[PSSimStatusCache subscriptionContexts](self->_simStatusCache, "subscriptionContexts");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v19, "count") < 2)
  {

    goto LABEL_21;
  }
  v20 = -[NSArray count](self->_cachedPlanItems, "count");

  if (v20 < 2)
  {
LABEL_21:
    -[PSUICellularDataSpecifier setCellType:](self, "setCellType:", 6);
    *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75750]) = (Class)sel_isCellularDataEnabled_;
    *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75760]) = (Class)sel_setCellularDataEnabled_specifier_;
    return;
  }
  -[PSUICellularDataSpecifier setCellType:](self, "setCellType:", 2);
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75750]) = (Class)sel__isCellularDataEnabled_;
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75760]) = (Class)sel__setCellularDataEnabled_specifier_;
  v21 = (void *)objc_opt_new();
  v22 = (void *)objc_opt_new();
  v70 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("OFF"), &stru_24D5028C8, CFSTR("Cellular"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v21;
  objc_msgSend(v21, "addObject:", v24);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("OFF"), &stru_24D5028C8, CFSTR("Cellular"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v26);

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "addObject:", v27);

  v28 = self->_cachedPlanItems;
  v29 = &off_216246000;
  if (-[NSArray count](v28, "count"))
  {
    v30 = 0;
    v31 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v32, "isSelected") & 1) != 0)
      {
        ++v31;
        v33 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v32, "userLabel");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "label");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", CFSTR("%@"), v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addObject:", v36);

        v37 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v32, "userLabel");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "label");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", CFSTR("%@"), v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v40);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v30);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addObject:", v41);

        -[PSUICellularDataSpecifier getLogger](self, "getLogger");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v32, "userLabel");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "label");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v72 = v44;
          *(_WORD *)&v72[8] = 1024;
          *(_DWORD *)&v72[10] = v30;
          _os_log_impl(&dword_2161C6000, v42, OS_LOG_TYPE_DEFAULT, "Adding plan item %@ with value %d", buf, 0x12u);

        }
      }
      else
      {
        -[PSUICellularDataSpecifier getLogger](self, "getLogger");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v32, "userLabel");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "label");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v72 = v30;
          *(_WORD *)&v72[4] = 2112;
          *(_QWORD *)&v72[6] = v46;
          _os_log_impl(&dword_2161C6000, v42, OS_LOG_TYPE_DEFAULT, "Plan item %d (%@) is not selected", buf, 0x12u);

        }
      }

      ++v30;
    }
    while (-[NSArray count](v28, "count") > v30);
    v29 = &off_216246000;
    if (v31 >= 2)
      goto LABEL_35;
  }
  else
  {
    v31 = 0;
  }
  -[PSUICellularDataSpecifier getLogger](self, "getLogger");
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2161C6000, v47, OS_LOG_TYPE_DEFAULT, "Adding additional plans", buf, 2u);
  }

  if (-[NSArray count](v28, "count"))
  {
    v48 = 0;
    v67 = *((_QWORD *)v29 + 210);
    v68 = v31;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v49, "isSelected") & 1) != 0 || (objc_msgSend(v49, "isSelectable") & 1) == 0)
      {
        -[PSUICellularDataSpecifier getLogger](self, "getLogger");
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v49, "userLabel");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "label");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend(v49, "isSelected");
          v65 = objc_msgSend(v49, "isSelectable");
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v72 = v48;
          *(_WORD *)&v72[4] = 2112;
          *(_QWORD *)&v72[6] = v63;
          *(_WORD *)&v72[14] = 1024;
          *(_DWORD *)&v72[16] = v64;
          v73 = 1024;
          v74 = v65;
          _os_log_impl(&dword_2161C6000, v59, OS_LOG_TYPE_DEFAULT, "Plan item %d (%@) is selected (%d) or not selectable (%d)", buf, 0x1Eu);

        }
      }
      else
      {
        v50 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v49, "userLabel");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "label");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "stringWithFormat:", CFSTR("%@"), v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addObject:", v53);

        v54 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v49, "userLabel");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "label");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "stringWithFormat:", CFSTR("%@"), v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v57);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v48);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addObject:", v58);

        -[PSUICellularDataSpecifier getLogger](self, "getLogger");
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v49, "userLabel");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "label");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v67;
          *(_QWORD *)v72 = v61;
          *(_WORD *)&v72[8] = 1024;
          *(_DWORD *)&v72[10] = v48;
          _os_log_impl(&dword_2161C6000, v59, OS_LOG_TYPE_DEFAULT, "Adding plan item %@ with value %d", buf, 0x12u);

        }
        v31 = v68;
      }

      ++v48;
    }
    while (-[NSArray count](v28, "count") > v48);
  }
LABEL_35:
  -[PSUICellularDataSpecifier getLogger](self, "getLogger");
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v72 = v31;
    _os_log_impl(&dword_2161C6000, v66, OS_LOG_TYPE_DEFAULT, "%d lines turned on", buf, 8u);
  }

  -[PSUICellularDataSpecifier setValues:titles:shortTitles:](self, "setValues:titles:shortTitles:", v70, v69, v22);
}

- (BOOL)isDetailControllerNeeded
{
  return -[PSUICellularDataSpecifier cellType](self, "cellType") == 2;
}

- (void)setAirplaneMode:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularDataSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "OFF";
    if (v3)
      v6 = "ON";
    v7 = 136315138;
    v8 = v6;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Airplane mode is %s", (uint8_t *)&v7, 0xCu);
  }

  if (v3)
    -[PSUICellularDataSpecifier setProperty:forKey:](self, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  else
    -[PSUICellularDataSpecifier removePropertyForKey:](self, "removePropertyForKey:", *MEMORY[0x24BE75A18]);
}

- (id)isCellularDataEnabled:(id)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v6;
  const char *v7;
  const char *v8;
  int v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = -[PSUICoreTelephonyDataCache isCellularDataEnabled](self->_dataCache, "isCellularDataEnabled", a3);
  v5 = -[PSUICoreTelephonyDataCache isAirplaneModeEnabled](self->_dataCache, "isAirplaneModeEnabled");
  -[PSUICellularDataSpecifier getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "OFF";
    if (v4)
      v8 = "ON";
    else
      v8 = "OFF";
    if (v5)
      v7 = "ON";
    v10 = 136315394;
    v11 = v8;
    v12 = 2080;
    v13 = v7;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Cellular data %s airplane mode %s", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4 && !v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setCellularDataEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[PSUICellularDataSpecifier getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v5, "BOOLValue");
    v8 = CFSTR("OFF");
    if (v7)
      v8 = CFSTR("ON");
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to set cellular data switch to %@", (uint8_t *)&v12, 0xCu);
  }

  v9 = objc_msgSend(v5, "BOOLValue");
  if ((_DWORD)v9 != -[PSUICoreTelephonyDataCache isCellularDataEnabled](self->_dataCache, "isCellularDataEnabled"))
  {
    if ((v9 & 1) != 0 || !-[PSUICoreTelephonyCallCache isAnyVOIPCallActive](self->_callCache, "isAnyVOIPCallActive"))
    {
      -[PSUICellularDataSpecifier setCellularDataSwitch:](self, "setCellularDataSwitch:", v9);
    }
    else
    {
      -[PSUICellularDataSpecifier callEndConfirmationSpecifier](self, "callEndConfirmationSpecifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setConfirmationAction:", sel_acceptedDataSwitch_);
      objc_msgSend(v10, "setProperty:forKey:", v5, CFSTR("newValue"));
      WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
      objc_msgSend(WeakRetained, "showConfirmationViewForSpecifier:", v10);

    }
  }

}

- (void)acceptedDataSwitch:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[16];

  v4 = a3;
  -[PSUICellularDataSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "User confirmed cellular data switch action", v8, 2u);
  }

  objc_msgSend(v4, "propertyForKey:", CFSTR("newValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  -[PSUICellularDataSpecifier setCellularDataSwitch:](self, "setCellularDataSwitch:", v7);
}

- (void)setCellularDataSwitch:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularDataSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("OFF");
    if (v3)
      v6 = CFSTR("ON");
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Setting cellular data switch to %@", (uint8_t *)&v7, 0xCu);
  }

  -[PSUICoreTelephonyDataCache setCellularDataEnabled:](self->_dataCache, "setCellularDataEnabled:", v3);
}

- (id)_isCellularDataEnabled:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  void *v10;
  NSArray *v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[PSUICoreTelephonyDataCache isCellularDataEnabled](self->_dataCache, "isCellularDataEnabled");
  v6 = -[PSUICoreTelephonyDataCache isAirplaneModeEnabled](self->_dataCache, "isAirplaneModeEnabled");
  -[PSUICellularDataSpecifier getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "OFF";
    if (v5)
      v9 = "ON";
    else
      v9 = "OFF";
    if (v6)
      v8 = "ON";
    v18 = 136315394;
    v19 = v9;
    v20 = 2080;
    v21 = v8;
    _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Cellular data %s airplane mode %s", (uint8_t *)&v18, 0x16u);
  }

  if (!v5 || v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = self->_cachedPlanItems;
    if (-[NSArray count](v11, "count"))
    {
      v12 = 0;
      v10 = 0;
      v13 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isSelected"))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
          v15 = objc_claimAutoreleasedReturnValue();

          v13 = (id)v15;
        }
        if (objc_msgSend(v14, "isActiveDataPlan"))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
          v16 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v16;
        }

        ++v12;
      }
      while (-[NSArray count](v11, "count") > v12);
      if (v13 && self->_isMSOActive)
      {
        v13 = v13;

        v10 = v13;
      }
    }
    else
    {
      v13 = 0;
      v10 = 0;
    }

  }
  return v10;
}

- (void)_setCellularDataEnabled:(id)a3 specifier:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *WeakRetained;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[PSUICellularDataSpecifier getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to set cellular data switch to %@", (uint8_t *)&v12, 0xCu);
  }

  if (self->_isMSOActive)
  {
    -[PSUICellularDataSpecifier getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "MSO active, ignore cellular data switch", (uint8_t *)&v12, 2u);
    }
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v5);

  if (!v9)
  {
    -[NSArray objectAtIndexedSubscript:](self->_cachedPlanItems, "objectAtIndexedSubscript:", objc_msgSend(v5, "integerValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PSUICoreTelephonyDataCache isCellularDataEnabled](self->_dataCache, "isCellularDataEnabled")
      && objc_msgSend(v10, "isActiveDataPlan"))
    {
      -[PSUICellularDataSpecifier getLogger](self, "getLogger");
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        _os_log_debug_impl(&dword_2161C6000, WeakRetained, OS_LOG_TYPE_DEBUG, "Cellular data is already on and plan is already the active data plan", (uint8_t *)&v12, 2u);
      }
      goto LABEL_14;
    }

LABEL_16:
    -[PSUICellularDataSpecifier _setCellularDataSwitch:](self, "_setCellularDataSwitch:", v5);
    goto LABEL_20;
  }
  if (!-[PSUICoreTelephonyDataCache isCellularDataEnabled](self->_dataCache, "isCellularDataEnabled"))
  {
    -[PSUICellularDataSpecifier getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_debug_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEBUG, "Cellular data is already off", (uint8_t *)&v12, 2u);
    }
    goto LABEL_19;
  }
  if (!-[PSUICoreTelephonyCallCache isAnyVOIPCallActive](self->_callCache, "isAnyVOIPCallActive"))
    goto LABEL_16;
  -[PSUICellularDataSpecifier callEndConfirmationSpecifier](self, "callEndConfirmationSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setConfirmationAction:", sel__acceptedDataSwitch_);
  objc_msgSend(v10, "setProperty:forKey:", v5, CFSTR("newValue"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  -[NSObject showConfirmationViewForSpecifier:](WeakRetained, "showConfirmationViewForSpecifier:", v10);
LABEL_14:

LABEL_20:
}

- (void)_acceptedDataSwitch:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  -[PSUICellularDataSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "User confirmed cellular data switch action", v7, 2u);
  }

  objc_msgSend(v4, "propertyForKey:", CFSTR("newValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUICellularDataSpecifier _setCellularDataSwitch:](self, "_setCellularDataSwitch:", v6);
}

- (void)_setCellularDataSwitch:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSUICellularDataSpecifier getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "Setting cellular data switch to %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    -[PSUICoreTelephonyDataCache setCellularDataEnabled:](self->_dataCache, "setCellularDataEnabled:", 0);
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_cachedPlanItems, "objectAtIndexedSubscript:", objc_msgSend(v4, "integerValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICoreTelephonyDataCache setCellularDataEnabled:](self->_dataCache, "setCellularDataEnabled:", 1);
    -[PSUICellularPlanManagerCache setSelectedPlanItemForData:](self->_planManagerCache, "setSelectedPlanItemForData:", v8);

  }
}

- (id)planItemForListItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;

  v4 = a3;
  if (objc_msgSend(v4, "cellType") != 3)
    goto LABEL_5;
  objc_msgSend(v4, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) != 0
    || (objc_msgSend(v4, "values"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "firstObject"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "integerValue"),
        v10,
        v9,
        -[NSArray count](self->_cachedPlanItems, "count") <= v11))
  {
LABEL_5:
    v12 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_cachedPlanItems, "objectAtIndexedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)subscriptionContextForListItem:(id)a3
{
  void *v4;
  void *v5;

  -[PSUICellularDataSpecifier planItemForListItem:](self, "planItemForListItem:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICellularPlanManagerCache subscriptionContextForPlanItem:cachedSubscriptionContexts:](self->_planManagerCache, "subscriptionContextForPlanItem:cachedSubscriptionContexts:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)callEndConfirmationSpecifier
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
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

  v3 = -[PSUIDeviceWiFiState isConnectedOverWiFi](self->_wifiState, "isConnectedOverWiFi");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("CELLULAR_DATA_ON_FACETIME_WIFI_WARNING_DISABLE");
  else
    v6 = CFSTR("CELLULAR_DATA_ON_FACETIME_WARNING_DISABLE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24D5028C8, CFSTR("Cellular"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE754D0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24D5028C8, self, 0, 0, 0, -1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("ON_CALL_CANCEL"), &stru_24D5028C8, CFSTR("Cellular"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v11, *MEMORY[0x24BE75970]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ON_CALL_OK_DISABLE"), &stru_24D5028C8, CFSTR("Cellular"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v13, *MEMORY[0x24BE75980]);

  objc_msgSend(v9, "setObject:forKey:", v7, *MEMORY[0x24BE75988]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DISABLE_CELLULAR_DATA"), &stru_24D5028C8, CFSTR("Cellular"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v15, *MEMORY[0x24BE75990]);

  objc_msgSend(v8, "setupWithDictionary:", v9);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v16, *MEMORY[0x24BE75978]);

  objc_msgSend(v8, "setConfirmationCancelAction:", sel_canceledDataSwitch_);
  return v8;
}

- (void)canceledDataSwitch:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  uint8_t v8[16];

  -[PSUICellularDataSpecifier getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "User cancelled cellular data switch action", v8, 2u);
  }

  -[PSUICellularDataSpecifier detailController](self, "detailController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PSUICellularDataSpecifier detailController](self, "detailController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadSpecifiers");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  objc_msgSend(WeakRetained, "reloadSpecifierID:animated:", CFSTR("MOBILE_DATA_SETTINGS"), 1);

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("DataSpecifier"));
}

- (PSUICellularDataListItemsController)detailController
{
  return (PSUICellularDataListItemsController *)objc_loadWeakRetained((id *)&self->_detailController);
}

- (void)setDetailController:(id)a3
{
  objc_storeWeak((id *)&self->_detailController, a3);
}

- (PSListController)hostController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_hostController);
}

- (void)setHostController:(id)a3
{
  objc_storeWeak((id *)&self->_hostController, a3);
}

- (PSSimStatusCache)simStatusCache
{
  return self->_simStatusCache;
}

- (void)setSimStatusCache:(id)a3
{
  objc_storeStrong((id *)&self->_simStatusCache, a3);
}

- (PSUICellularPlanManagerCache)planManagerCache
{
  return self->_planManagerCache;
}

- (void)setPlanManagerCache:(id)a3
{
  objc_storeStrong((id *)&self->_planManagerCache, a3);
}

- (PSUICoreTelephonyDataCache)dataCache
{
  return self->_dataCache;
}

- (void)setDataCache:(id)a3
{
  objc_storeStrong((id *)&self->_dataCache, a3);
}

- (PSUICoreTelephonyCallCache)callCache
{
  return self->_callCache;
}

- (void)setCallCache:(id)a3
{
  objc_storeStrong((id *)&self->_callCache, a3);
}

- (PSUIDeviceWiFiState)wifiState
{
  return self->_wifiState;
}

- (void)setWifiState:(id)a3
{
  objc_storeStrong((id *)&self->_wifiState, a3);
}

- (NSArray)cachedPlanItems
{
  return self->_cachedPlanItems;
}

- (void)setCachedPlanItems:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPlanItems, a3);
}

- (BOOL)isMSOActive
{
  return self->_isMSOActive;
}

- (void)setIsMSOActive:(BOOL)a3
{
  self->_isMSOActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPlanItems, 0);
  objc_storeStrong((id *)&self->_wifiState, 0);
  objc_storeStrong((id *)&self->_callCache, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_planManagerCache, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_destroyWeak((id *)&self->_hostController);
  objc_destroyWeak((id *)&self->_detailController);
}

@end
