@implementation PSUICarrierSpacePlansController

- (void)simStatusChanged
{
  NSObject *v3;
  void *v4;
  int v5;
  id WeakRetained;
  id v7;
  int v8;
  const char *v9;
  __int16 v10;
  __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpacePlansController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[PSUICarrierSpacePlansController simStatusChanged]";
    v10 = 2112;
    v11 = CFSTR("PSCarrierSpaceSIMStatusChanged");
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSIMMissing");

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x24BE757A0]));
    v7 = (id)objc_msgSend(WeakRetained, "popViewControllerAnimated:", 1);

  }
}

- (void)carrierSpaceChanged
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpacePlansController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[PSUICarrierSpacePlansController carrierSpaceChanged]";
    v6 = 2112;
    v7 = CFSTR("PSUICarrierSpaceChanged");
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification: %@", (uint8_t *)&v4, 0x16u);
  }

  -[PSUICarrierSpacePlansController reloadSpecifiers](self, "reloadSpecifiers");
}

- (PSUICarrierSpacePlansController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  PSUICarrierSpacePlansController *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *carrierSpaceQueue;
  void *v11;
  objc_class *v12;
  uint64_t v13;
  CTCarrierSpaceClient *carrierSpaceClient;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PSUICarrierSpacePlansController;
  v8 = -[PSUICarrierSpacePlansController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    v9 = dispatch_queue_create("com.apple.preferences.carrier_space_plans_queue", 0);
    carrierSpaceQueue = v8->_carrierSpaceQueue;
    v8->_carrierSpaceQueue = (OS_dispatch_queue *)v9;

    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v11 = (void *)_MergedGlobals_1_4;
    v23 = _MergedGlobals_1_4;
    if (!_MergedGlobals_1_4)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __getCTCarrierSpaceClientClass_block_invoke_0;
      v19[3] = &unk_24D5018D0;
      v19[4] = &v20;
      __getCTCarrierSpaceClientClass_block_invoke_0((uint64_t)v19);
      v11 = (void *)v21[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v20, 8);
    v13 = objc_msgSend([v12 alloc], "initWithQueue:", v8->_carrierSpaceQueue);
    carrierSpaceClient = v8->_carrierSpaceClient;
    v8->_carrierSpaceClient = (CTCarrierSpaceClient *)v13;

    -[CTCarrierSpaceClient setDelegate:](v8->_carrierSpaceClient, "setDelegate:", v8);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v8, sel_simStatusChanged, 0x24D506888, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v8, sel_carrierSpaceChanged, 0x24D506868, 0);

  }
  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  __CFString *v6;
  void (*v7)(__CFString *, _QWORD);
  objc_super v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  __int128 buf;
  void *(*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpacePlansController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[PSUICarrierSpacePlansController viewDidAppear:]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)PSUICarrierSpacePlansController;
  -[PSUICarrierSpacePlansController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
  v6 = CFSTR("com.apple.Preferences.CarrierSpacePlansEvent");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v7 = (void (*)(__CFString *, _QWORD))off_253E97138;
  v12 = off_253E97138;
  if (!off_253E97138)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v14 = __getAnalyticsSendEventSymbolLoc_block_invoke_3;
    v15 = &unk_24D5018D0;
    v16 = &v9;
    __getAnalyticsSendEventSymbolLoc_block_invoke_3((uint64_t)&buf);
    v7 = (void (*)(__CFString *, _QWORD))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v7)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  v7(v6, MEMORY[0x24BDBD1B8]);

}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
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
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  uint64_t v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v45 = (int)*MEMORY[0x24BE756E0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PLANS"), &stru_24D5028C8, CFSTR("CarrierSpacePlans"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICarrierSpacePlansController setTitle:](self, "setTitle:", v5);

    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "plansInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "planGroupsList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v8;
    v48 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
    if (v48)
    {
      v47 = *(_QWORD *)v58;
      v52 = *MEMORY[0x24BE75948];
      v51 = *MEMORY[0x24BE75850];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v58 != v47)
            objc_enumerationMutation(obj);
          v49 = v9;
          v10 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v9);
          v11 = (void *)MEMORY[0x24BE75590];
          -[PSUICarrierSpacePlansController stringFromGroupCategory:](self, "stringFromGroupCategory:", objc_msgSend(v10, "planCategory"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "groupSpecifierWithName:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          objc_msgSend(v10, "groupOptionsList");
          v50 = (id)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v54;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                v18 = v6;
                if (*(_QWORD *)v54 != v16)
                  objc_enumerationMutation(v50);
                v19 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
                v20 = (void *)MEMORY[0x24BE75590];
                objc_msgSend(v19, "planLabel");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, self, 0, 0, 0, 4, 0);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v22, "setProperty:forKey:", objc_opt_class(), v52);
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v19, "planPurchasable"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setProperty:forKey:", v23, 0x24D505108);

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v19, "planStatus") == 1);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setProperty:forKey:", v24, 0x24D505128);

                objc_msgSend(v19, "planLabel");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setProperty:forKey:", v25, 0x24D505148);

                -[PSUICarrierSpacePlansController detailForPlanOption:](self, "detailForPlanOption:", v19);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setProperty:forKey:", v26, 0x24D505168);

                objc_msgSend(v19, "planId");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setIdentifier:", v27);

                objc_msgSend(v19, "planDetailsURL");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "length");

                if (v29)
                  objc_msgSend(v22, "setProperty:forKey:", &unk_24D51C440, v51);
                else
                  objc_msgSend(v22, "removePropertyForKey:", v51);
                objc_msgSend(v22, "setProperty:forKey:", v19, CFSTR("PSUICarrierSpacePlanKey"));
                v6 = v18;
                objc_msgSend(v18, "addObject:", v22);
                -[PSUICarrierSpacePlansController getLogger](self, "getLogger");
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v62 = v19;
                  _os_log_impl(&dword_2161C6000, v30, OS_LOG_TYPE_DEFAULT, "Creating specifier for plan: %@", buf, 0xCu);
                }

              }
              v15 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
            }
            while (v15);
          }

          v9 = v49 + 1;
        }
        while (v49 + 1 != v48);
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v64, 16);
      }
      while (v48);
    }

    objc_msgSend(v44, "plansInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "morePlansURL");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "length");

    if (v33)
    {
      +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "activeDataCarrierName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("MORE_PLANS_FROM_CARRRIER%@"), &stru_24D5028C8, CFSTR("CarrierSpacePlans"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "stringWithFormat:", v38, v35);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v40);
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v39, self, 0, 0, 0, 13, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setButtonAction:", sel_moreDetailsButtonTapped_);
      objc_msgSend(v6, "addObject:", v41);

    }
    objc_msgSend(MEMORY[0x24BE856B8], "logSpecifiers:origin:", v6, CFSTR("[PSUICarrierSpacePlansController specifiers] end"));
    v42 = *(Class *)((char *)&self->super.super.super.super.super.isa + v45);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v45) = (Class)v6;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v45);
  }
  return v3;
}

- (void)moreDetailsButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "plansInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "morePlansURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "plansInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "morePlansURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject openURL:options:completionHandler:](v8, "openURL:options:completionHandler:", v12, MEMORY[0x24BDBD1B8], 0);

  }
  else
  {
    -[PSUICarrierSpacePlansController getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, "More plans button tapped, but no plans url present.", v13, 2u);
    }
  }

}

- (id)detailForPlanOption:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v16;

  v3 = a3;
  objc_msgSend(v3, "planValue");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "planStatus") == 1)
  {
    if (v4 && -[__CFString length](v4, "length"))
    {
      v5 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("PLAN%@_CURRENT_SUBSCRIPTION");
LABEL_9:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24D5028C8, CFSTR("CarrierSpacePlans"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v9, v4);
LABEL_17:
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v12 = CFSTR("CURRENT_SUBSCRIPTION");
    goto LABEL_16;
  }
  if (objc_msgSend(v3, "planStatus") == 2)
  {
    if (v4 && -[__CFString length](v4, "length"))
    {
      v5 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("PLAN%@_IN_PROGRESS");
      goto LABEL_9;
    }
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    v12 = CFSTR("IN_PROGRESS");
LABEL_16:
    objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_24D5028C8, CFSTR("CarrierSpacePlans"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v9, v16);
    goto LABEL_17;
  }
  v13 = &stru_24D5028C8;
  if (v4 && -[__CFString length](v4, "length"))
    v13 = v4;
  v14 = v13;
LABEL_18:

  return v14;
}

- (id)stringFromGroupCategory:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  const __CFString *v10;

  if (a3 == 3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v9;
    v10 = CFSTR("INTERNATIONAL_ROAMING_PLANS");
LABEL_7:
    objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_24D5028C8, CFSTR("CarrierSpacePlans"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (a3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v9;
    v10 = CFSTR("ROAMING_PLANS");
    goto LABEL_7;
  }
  if (a3 != 1)
  {
    v8 = &stru_24D5028C8;
    return v8;
  }
  +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDataCarrierName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DOMESTIC_PLANS_FROM_%@CARRIER"), &stru_24D5028C8, CFSTR("CarrierSpacePlans"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v4);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v8;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  RemoteUIController *v17;
  RemoteUIController *remoteUIController;
  RemoteUIController *v19;
  void *v20;
  void *v21;
  void *v22;
  RemoteUIController *v23;
  NSObject *v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 buf;
  Class (*v32)(uint64_t);
  void *v33;
  uint64_t *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PSUICarrierSpacePlansController specifierAtIndex:](self, "specifierAtIndex:", -[PSUICarrierSpacePlansController indexForIndexPath:](self, "indexForIndexPath:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", CFSTR("PSUICarrierSpacePlanKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "planDetailsURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    v12 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v9, "planDetailsURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v15 = (void *)qword_253E97148;
    v30 = qword_253E97148;
    if (!qword_253E97148)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v32 = __getRemoteUIControllerClass_block_invoke_0;
      v33 = &unk_24D5018D0;
      v34 = &v27;
      __getRemoteUIControllerClass_block_invoke_0((uint64_t)&buf);
      v15 = (void *)v28[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v27, 8);
    v17 = (RemoteUIController *)objc_alloc_init(v16);
    remoteUIController = self->_remoteUIController;
    self->_remoteUIController = v17;

    -[RemoteUIController setDelegate:](self->_remoteUIController, "setDelegate:", self);
    -[RemoteUIController setHostViewController:](self->_remoteUIController, "setHostViewController:", self);
    v19 = self->_remoteUIController;
    +[PSUICarrierSpaceManager getNSURLSessionConfiguration](PSUICarrierSpaceManager, "getNSURLSessionConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RemoteUIController setSessionConfiguration:](v19, "setSessionConfiguration:", v20);

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v21, "sf_isInternalInstall");

    if ((_DWORD)v19)
    {
      -[RemoteUIController loader](self->_remoteUIController, "loader");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAllowNonSecureHTTP:", 1);

    }
    v23 = self->_remoteUIController;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __86__PSUICarrierSpacePlansController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke;
    v25[3] = &unk_24D501D80;
    v25[4] = self;
    v26 = v14;
    v24 = v14;
    -[RemoteUIController loadURL:postBody:completion:](v23, "loadURL:postBody:completion:", v24, 0, v25);

  }
  else
  {
    -[PSUICarrierSpacePlansController getLogger](self, "getLogger");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_2161C6000, v24, OS_LOG_TYPE_DEFAULT, "No plan detail url for plan: %@", (uint8_t *)&buf, 0xCu);
    }
  }

}

void __86__PSUICarrierSpacePlansController_tableView_accessoryButtonTappedForRowWithIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412802;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "Could not load plan detail url: %@, success: %@, error: %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CTCarrierSpaceClient *carrierSpaceClient;
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PSUICarrierSpacePlansController;
  v6 = a4;
  -[PSUICarrierSpacePlansController tableView:didSelectRowAtIndexPath:](&v13, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  v7 = -[PSUICarrierSpacePlansController indexForIndexPath:](self, "indexForIndexPath:", v6);

  -[PSUICarrierSpacePlansController specifierAtIndex:](self, "specifierAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "propertyForKey:", CFSTR("PSUICarrierSpacePlanKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "planPurchasable"))
  {
    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICarrierSpacePlansController highlightSpecifierWithID:](self, "highlightSpecifierWithID:", v10);

    carrierSpaceClient = self->_carrierSpaceClient;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__PSUICarrierSpacePlansController_tableView_didSelectRowAtIndexPath___block_invoke;
    v12[3] = &unk_24D501738;
    v12[4] = self;
    -[CTCarrierSpaceClient purchasePlan:completion:](carrierSpaceClient, "purchasePlan:completion:", v9, v12);
  }

}

void __69__PSUICarrierSpacePlansController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      v6 = "Plan purchase finished with error: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    v6 = "Plan purchase finished";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__PSUICarrierSpacePlansController_tableView_didSelectRowAtIndexPath___block_invoke_52;
  block[3] = &unk_24D501660;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __69__PSUICarrierSpacePlansController_tableView_didSelectRowAtIndexPath___block_invoke_52(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)dismissPlanDetail
{
  id v2;

  -[PSUICarrierSpacePlansController navigationController](self, "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (objc_class *)MEMORY[0x24BEBD410];
  v6 = a4;
  v9 = (id)objc_msgSend([v5 alloc], "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismissPlanDetail);
  objc_msgSend(v6, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:animated:", v9, 0);

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CarrierSpacePlansController"));
}

- (CTCarrierSpaceClient)carrierSpaceClient
{
  return self->_carrierSpaceClient;
}

- (void)setCarrierSpaceClient:(id)a3
{
  objc_storeStrong((id *)&self->_carrierSpaceClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierSpaceClient, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_carrierSpaceQueue, 0);
}

@end
