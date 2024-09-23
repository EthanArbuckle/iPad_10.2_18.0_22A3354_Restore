@implementation PSUICarrierSpaceUsageController

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
  -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[PSUICarrierSpaceUsageController simStatusChanged]";
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
  -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[PSUICarrierSpaceUsageController carrierSpaceChanged]";
    v6 = 2112;
    v7 = CFSTR("PSUICarrierSpaceChanged");
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification: %@", (uint8_t *)&v4, 0x16u);
  }

  -[PSUICarrierSpaceUsageController reloadSpecifiers](self, "reloadSpecifiers");
}

- (PSUICarrierSpaceUsageController)initWithNibName:(id)a3 bundle:(id)a4
{
  PSUICarrierSpaceUsageController *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSUICarrierSpaceUsageController;
  v4 = -[PSUICarrierSpaceUsageController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_simStatusChanged, 0x24D506888, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v4, sel_carrierSpaceChanged, 0x24D506868, 0);

  }
  return v4;
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
  -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[PSUICarrierSpaceUsageController viewDidAppear:]";
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)PSUICarrierSpaceUsageController;
  -[PSUICarrierSpaceUsageController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
  v6 = CFSTR("com.apple.Preferences.CarrierSpaceUsageEvent");
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v7 = (void (*)(__CFString *, _QWORD))off_253E96FD0;
  v12 = off_253E96FD0;
  if (!off_253E96FD0)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v14 = __getAnalyticsSendEventSymbolLoc_block_invoke_0;
    v15 = &unk_24D5018D0;
    v16 = &v9;
    __getAnalyticsSendEventSymbolLoc_block_invoke_0((uint64_t)&buf);
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

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (id)barGraphColors
{
  if (_MergedGlobals_58 != -1)
    dispatch_once(&_MergedGlobals_58, &__block_literal_global_5);
  return (id)qword_253E96FC8;
}

void __49__PSUICarrierSpaceUsageController_barGraphColors__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.105882353, 0.678431373, 0.97254902, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.8, 0.0, 1.0, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.8, 0.450980392, 0.960784314, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.584313725, 0.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.298039216, 0.850980392, 0.392156863, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_253E96FC8;
  qword_253E96FC8 = v5;

}

- (id)usageCategories
{
  uint64_t i;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v19 = (id)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[PSUICarrierSpaceUsageController usageSections](self, "usageSections");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v5 = v19;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (!v6)
        {

LABEL_18:
          v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v4, 0);
          objc_msgSend(v5, "addObject:", v15);

          continue;
        }
        v7 = v6;
        v21 = i;
        v22 = 0;
        v8 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v7; ++j)
          {
            if (*(_QWORD *)v24 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
            objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "accountMetrics");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "accountMetrics");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v12, "isEqual:", v13);

            if (v14)
            {
              objc_msgSend(v10, "addObject:", v4);
              v22 = 1;
            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v7);

        i = v21;
        if ((v22 & 1) == 0)
          goto LABEL_18;
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v20);
  }

  return v19;
}

- (id)usageSections
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void *v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  NSObject *v30;
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
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  id obj;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t v86[128];
  uint8_t buf[4];
  void *v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x24BDAC8D0];
  v61 = (void *)objc_opt_new();
  +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "usageInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v3;
  v58 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
  if (v58)
  {
    v57 = *(_QWORD *)v83;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v83 != v57)
          objc_enumerationMutation(obj);
        v59 = v4;
        v5 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v4);
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v69 = v5;
        objc_msgSend(v5, "applicablePlans");
        v60 = (id)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
        if (v63)
        {
          v62 = *(_QWORD *)v79;
          do
          {
            for (i = 0; i != v63; ++i)
            {
              if (*(_QWORD *)v79 != v62)
                objc_enumerationMutation(v60);
              v7 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
              objc_msgSend(v7, "dataUsage");
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "sharedPlanIdentifier");
              v9 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "dataUsage");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "thisDeviceDataUsed");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v68 = v7;
              objc_msgSend(v7, "dataUsage");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = +[PSUICarrierSpaceManager bytesFromString:carrierSpaceUnits:](PSUICarrierSpaceManager, "bytesFromString:carrierSpaceUnits:", v11, objc_msgSend(v12, "units"));

              objc_msgSend(v69, "networkUsageLabel");
              v14 = objc_claimAutoreleasedReturnValue();
              v15 = objc_alloc(MEMORY[0x24BE754A0]);
              objc_msgSend(v69, "networkUsageLabel");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BEBD4B8], "greenColor");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = (void *)v14;
              v65 = (void *)objc_msgSend(v15, "initWithIdentifier:title:color:bytes:", v16, v14, v17, v13);

              v76 = 0u;
              v77 = 0u;
              v74 = 0u;
              v75 = 0u;
              v18 = v61;
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
              if (!v19)
              {

                v22 = 0;
                v34 = (void *)v14;
LABEL_32:
                v35 = v22;
                v22 = (void *)objc_opt_new();

                if (objc_msgSend(v69, "localDevice"))
                {
                  objc_msgSend(v22, "setSharedPlanIdentifier:", v9);
                  objc_msgSend(v22, "setPrimaryMetrics:", v68);
                }
                else
                {
                  objc_msgSend(v22, "otherMetrics");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v36)
                  {
                    v37 = (void *)objc_opt_new();
                    objc_msgSend(v22, "setOtherMetrics:", v37);

                  }
                  objc_msgSend(v22, "otherMetrics");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "addObject:", v68);

                }
                objc_msgSend(v22, "setAccountMetrics:", v69);
                objc_msgSend(v18, "addObject:", v22);
                goto LABEL_38;
              }
              v20 = v19;
              v64 = i;
              v21 = 0;
              v22 = 0;
              v23 = *(_QWORD *)v75;
              do
              {
                for (j = 0; j != v20; ++j)
                {
                  if (*(_QWORD *)v75 != v23)
                    objc_enumerationMutation(v18);
                  v25 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
                  objc_msgSend(v25, "sharedPlanIdentifier");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v9, "isEqualToString:", v26);

                  if (v27)
                  {
                    v28 = v25;

                    if (objc_msgSend(v69, "localDevice"))
                    {
                      objc_msgSend(v28, "primaryMetrics");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v29)
                      {
                        -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
                        v30 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v88 = v9;
                          _os_log_error_impl(&dword_2161C6000, v30, OS_LOG_TYPE_ERROR, "More than one primary plan for shared plan identifier: %@", buf, 0xCu);
                        }

                      }
                      objc_msgSend(v28, "setPrimaryMetrics:", v68);
                      objc_msgSend(v28, "setAccountMetrics:", v69);
                    }
                    else
                    {
                      objc_msgSend(v28, "otherMetrics");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v31)
                      {
                        v32 = (void *)objc_opt_new();
                        objc_msgSend(v28, "setOtherMetrics:", v32);

                      }
                      objc_msgSend(v28, "otherMetrics");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "addObject:", v68);

                    }
                    v21 = 1;
                    v22 = v28;
                  }
                }
                v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v74, v89, 16);
              }
              while (v20);

              i = v64;
              v34 = v66;
              if ((v21 & 1) == 0)
                goto LABEL_32;
LABEL_38:
              objc_msgSend(v22, "barCategories");
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v39)
              {
                v40 = (void *)objc_opt_new();
                objc_msgSend(v22, "setBarCategories:", v40);

              }
              objc_msgSend(v22, "barCategories");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "addObject:", v65);

            }
            v63 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
          }
          while (v63);
        }

        v4 = v59 + 1;
      }
      while (v59 + 1 != v58);
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
    }
    while (v58);
  }

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v42 = v61;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v71;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v71 != v45)
          objc_enumerationMutation(v42);
        v47 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
        objc_msgSend(v47, "primaryMetrics");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        if (v48)
        {

        }
        else
        {
          objc_msgSend(v47, "otherMetrics");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "count");

          if (v50 == 1)
          {
            objc_msgSend(v47, "otherMetrics");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectAtIndexedSubscript:", 0);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setPrimaryMetrics:", v52);

            objc_msgSend(v47, "setOtherMetrics:", 0);
          }
        }
      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
    }
    while (v44);
  }

  v53 = (void *)objc_msgSend(v42, "copy");
  return v53;
}

- (id)deviceTypeSectionLabelForAccountMetrics:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[16];

  v4 = a3;
  v5 = objc_msgSend(v4, "deviceType");
  switch(v5)
  {
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DEVICE_TYPE_APPLE_WATCH");
      goto LABEL_7;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DEVICE_TYPE_IPAD");
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("DEVICE_TYPE_IPHONE");
LABEL_7:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
  }
  -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEFAULT, "Using network usage label", v12, 2u);
  }

  objc_msgSend(v4, "networkUsageLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v9;
}

- (id)planCategorySectionLabelForPlanMetrics:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "planCategory");
  switch(v4)
  {
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("PLAN_CATEGORY_INTERNATIONAL_ROAMING");
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("PLAN_CATEGORY_DOMESTIC_ROAMING");
      break;
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("PLAN_CATEGORY_DOMESTIC");
      break;
    default:
      objc_msgSend(v3, "planLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v8;
}

- (BOOL)hasMultipleDevicesOfTheSameType
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  int v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[PSUICarrierSpaceUsageController usageCategories](self, "usageCategories");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v25)
  {
    v28 = 0;
    v24 = *(_QWORD *)v34;
    v4 = 0x24BDD1000uLL;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(obj);
        v26 = v5;
        v6 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v5);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v27 = v6;
        v7 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v30 != v9)
                objc_enumerationMutation(v27);
              v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              objc_msgSend(v11, "accountMetrics");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "networkUsageLabel");
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              v14 = v4;
              v15 = *(void **)(v4 + 1760);
              objc_msgSend(v11, "accountMetrics");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v16, "deviceType"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "objectForKeyedSubscript:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18)
                v28 |= objc_msgSend(v18, "isEqualToString:", v13) ^ 1;
              v4 = v14;
              v19 = *(void **)(v14 + 1760);
              objc_msgSend(v11, "accountMetrics");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "deviceType"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v21);

            }
            v8 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v8);
        }

        v5 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v25);
  }
  else
  {
    LOBYTE(v28) = 0;
  }

  return v28 & 1;
}

- (BOOL)hasMultiplePlansOfTheSameTypeInTheSameSectionCategory
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[PSUICarrierSpaceUsageController usageCategories](self, "usageCategories");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v24)
  {
    v27 = 0;
    v23 = *(_QWORD *)v33;
    v2 = 0x24BDD1000uLL;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(obj);
        v25 = v3;
        v4 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v3);
        v5 = (void *)objc_opt_new();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v26 = v4;
        v6 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v29 != v8)
                objc_enumerationMutation(v26);
              v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v10, "primaryMetrics");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "planLabel");
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              v13 = v2;
              v14 = *(void **)(v2 + 1760);
              objc_msgSend(v10, "primaryMetrics");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "planCategory"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "objectForKeyedSubscript:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
                v27 |= objc_msgSend(v17, "isEqualToString:", v12) ^ 1;
              v2 = v13;
              v18 = *(void **)(v13 + 1760);
              objc_msgSend(v10, "primaryMetrics");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "planCategory"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v20);

            }
            v7 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v7);
        }

        v3 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v24);
  }
  else
  {
    LOBYTE(v27) = 0;
  }

  return v27 & 1;
}

- (BOOL)hasMultiplePlansOfSameTypeForNetworkUsageLabel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "usageInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v37;
      v27 = *(_QWORD *)v37;
      v28 = v3;
      do
      {
        v11 = 0;
        v29 = v8;
        do
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v11);
          objc_msgSend(v12, "networkUsageLabel");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v3);

          if (v14)
          {
            v30 = v11;
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            objc_msgSend(v12, "applicablePlans");
            v31 = (id)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v33;
              do
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v33 != v17)
                    objc_enumerationMutation(v31);
                  v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                  v20 = objc_msgSend(v19, "planCategory");
                  objc_msgSend(v19, "planLabel");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "objectForKeyedSubscript:", v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v23)
                    v9 |= objc_msgSend(v23, "isEqualToString:", v21) ^ 1;
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, v24);

                }
                v16 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              }
              while (v16);
            }

            v10 = v27;
            v3 = v28;
            v8 = v29;
            v11 = v30;
          }
          ++v11;
        }
        while (v11 != v8);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v8);
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9 & 1;
}

- (id)specifiers
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint32_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  int v67;
  void *v68;
  _BOOL4 v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  _BOOL4 v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  _BOOL4 v80;
  void *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v93;
  id obj;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _BOOL4 v98;
  void *v99;
  _BOOL4 v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint8_t buf[4];
  uint64_t v118;
  _BYTE v119[128];
  _BYTE v120[128];
  uint64_t v121;

  v121 = *MEMORY[0x24BDAC8D0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v93 = (int)*MEMORY[0x24BE756E0];
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeDataCarrierName");
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    v98 = -[PSUICarrierSpaceUsageController hasMultipleDevicesOfTheSameType](self, "hasMultipleDevicesOfTheSameType");
    v100 = -[PSUICarrierSpaceUsageController hasMultiplePlansOfTheSameTypeInTheSameSectionCategory](self, "hasMultiplePlansOfTheSameTypeInTheSameSectionCategory");
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    -[PSUICarrierSpaceUsageController usageCategories](self, "usageCategories");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v120, 16);
    if (!v96)
      goto LABEL_83;
    v95 = *(_QWORD *)v114;
    v106 = *MEMORY[0x24BE75A68];
    v104 = v4;
    while (1)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v114 != v95)
          objc_enumerationMutation(obj);
        v97 = v6;
        v7 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v6);
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v112 = 0u;
        v103 = v7;
        v8 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v110;
          v11 = 1;
          v101 = *(_QWORD *)v110;
          do
          {
            v12 = 0;
            v102 = v9;
            do
            {
              if (*(_QWORD *)v110 != v10)
                objc_enumerationMutation(v103);
              v13 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v12);
              objc_msgSend(v13, "primaryMetrics");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "accountMetrics");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[PSUICarrierSpaceUsageController shouldShowPlanSection:](self, "shouldShowPlanSection:", v14))
              {
                -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v118 = (uint64_t)v13;
                  _os_log_impl(&dword_2161C6000, v16, OS_LOG_TYPE_DEFAULT, "Next Section: %@", buf, 0xCu);
                }

                v105 = v13;
                if ((v11 & 1) != 0)
                {
                  objc_msgSend(v15, "networkUsageLabel");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = -[PSUICarrierSpaceUsageController hasMultiplePlansOfSameTypeForNetworkUsageLabel:](self, "hasMultiplePlansOfSameTypeForNetworkUsageLabel:", v17);

                  if (v18)
                  {
                    -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
                    v19 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v15, "networkUsageLabel");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v118 = (uint64_t)v20;
                      _os_log_impl(&dword_2161C6000, v19, OS_LOG_TYPE_DEFAULT, "Multiple plans of same type for network usage label:%@, using plan label", buf, 0xCu);

                    }
                    goto LABEL_20;
                  }
                  if (objc_msgSend(v13, "isSharedPlan"))
                  {
                    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("DEVICE_TYPE_SHARED"), &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
                    v21 = objc_claimAutoreleasedReturnValue();

                    -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
                    v22 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      v23 = v22;
                      v24 = "Section is shared plan";
                      goto LABEL_39;
                    }
                    goto LABEL_41;
                  }
                  if (objc_msgSend(v15, "localDevice"))
                  {
                    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("THIS_DEVICE"));
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "localizedStringForKey:value:table:", v30, &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
                    v21 = objc_claimAutoreleasedReturnValue();

                    -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
                    v22 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_41;
                    *(_WORD *)buf = 0;
                    v23 = v22;
                    v24 = "Using THIS_DEVICE name";
                    goto LABEL_39;
                  }
                  if (!v98)
                  {
                    -[PSUICarrierSpaceUsageController deviceTypeSectionLabelForAccountMetrics:](self, "deviceTypeSectionLabelForAccountMetrics:", v15);
                    v21 = objc_claimAutoreleasedReturnValue();
                    -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
                    v22 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_41;
                    *(_WORD *)buf = 0;
                    v23 = v22;
                    v24 = "Device type is not ambiguous, using device type";
                    goto LABEL_39;
                  }
                  objc_msgSend(v15, "networkUsageLabel");
                  v21 = objc_claimAutoreleasedReturnValue();
                  -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_41;
                  *(_DWORD *)buf = 138412290;
                  v118 = (uint64_t)v15;
                  v23 = v22;
                  v24 = "Device type is ambiguous, using network usage label, account metrics: %@";
                  v31 = 12;
                }
                else
                {
LABEL_20:
                  if (v100)
                  {
                    objc_msgSend(v14, "planLabel");
                    v21 = objc_claimAutoreleasedReturnValue();
                    -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
                    v22 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      v23 = v22;
                      v24 = "Plan type is ambiguous, using plan name";
                      goto LABEL_39;
                    }
                    goto LABEL_41;
                  }
                  objc_msgSend(v15, "networkUsageLabel");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = -[PSUICarrierSpaceUsageController hasMultiplePlansOfSameTypeForNetworkUsageLabel:](self, "hasMultiplePlansOfSameTypeForNetworkUsageLabel:", v25);

                  if (v26)
                  {
                    objc_msgSend(v14, "planLabel");
                    v21 = objc_claimAutoreleasedReturnValue();
                    -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
                    v22 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v15, "networkUsageLabel");
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412290;
                      v118 = (uint64_t)v27;
                      _os_log_impl(&dword_2161C6000, v22, OS_LOG_TYPE_DEFAULT, "Multiple same type plans for network usage label:%@, using plan name", buf, 0xCu);

                    }
                    goto LABEL_41;
                  }
                  -[PSUICarrierSpaceUsageController planCategorySectionLabelForPlanMetrics:](self, "planCategorySectionLabelForPlanMetrics:", v14);
                  v21 = objc_claimAutoreleasedReturnValue();
                  -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_41:

                    -[PSUICarrierSpaceUsageController getLogger](self, "getLogger");
                    v32 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v118 = v21;
                      _os_log_impl(&dword_2161C6000, v32, OS_LOG_TYPE_DEFAULT, "Resolved group title: %@", buf, 0xCu);
                    }

                    v107 = (void *)v21;
                    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", v21);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = objc_alloc_init(MEMORY[0x24BDD1500]);
                    objc_msgSend(v34, "setDoesRelativeDateFormatting:", 0);
                    objc_msgSend(v34, "setTimeStyle:", 1);
                    objc_msgSend(v14, "lastUpdatedAt");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();

                    v108 = v33;
                    if (v35)
                    {
                      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v14, "lastUpdatedAt");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      v38 = objc_msgSend(v36, "isDateInToday:", v37);

                      if (v38)
                      {
                        objc_msgSend(v34, "setDateStyle:", 0);
                        objc_msgSend(v14, "lastUpdatedAt");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v34, "stringFromDate:", v39);
                        v40 = (void *)objc_claimAutoreleasedReturnValue();

                        v41 = (void *)MEMORY[0x24BDD17C8];
                        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        v43 = v42;
                        v44 = CFSTR("LAST_UPDATE_FROM_CARRIER_%@_AT_%@");
                      }
                      else
                      {
                        objc_msgSend(v34, "setDateStyle:", 2);
                        objc_msgSend(v14, "lastUpdatedAt");
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v34, "stringFromDate:", v46);
                        v40 = (void *)objc_claimAutoreleasedReturnValue();

                        v41 = (void *)MEMORY[0x24BDD17C8];
                        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        v43 = v42;
                        v44 = CFSTR("LAST_UPDATE_FROM_CARRIER_%@_ON_%@");
                      }
                      objc_msgSend(v42, "localizedStringForKey:value:table:", v44, &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "stringWithFormat:", v47, v99, v40);
                      v45 = (id)objc_claimAutoreleasedReturnValue();

                      v33 = v108;
                      objc_msgSend(v108, "setProperty:forKey:", v45, v106);
                    }
                    else
                    {
                      v45 = 0;
                    }
                    objc_msgSend(v15, "billingCycleEndDate");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v48)
                    {
                      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v15, "billingCycleEndDate");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      v51 = objc_msgSend(v49, "isDateInToday:", v50);

                      if (v51)
                      {
                        objc_msgSend(v34, "setDateStyle:", 0);
                        objc_msgSend(v15, "billingCycleEndDate");
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v34, "stringFromDate:", v52);
                        v53 = (void *)objc_claimAutoreleasedReturnValue();

                        v54 = (void *)MEMORY[0x24BDD17C8];
                        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        v56 = v55;
                        v57 = CFSTR("BILLING_CYCLE_ENDS_AT_%@");
                      }
                      else
                      {
                        objc_msgSend(v34, "setDateStyle:", 2);
                        objc_msgSend(v15, "billingCycleEndDate");
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v34, "stringFromDate:", v58);
                        v53 = (void *)objc_claimAutoreleasedReturnValue();

                        v54 = (void *)MEMORY[0x24BDD17C8];
                        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        v56 = v55;
                        v57 = CFSTR("BILLING_CYCLE_ENDS_ON_%@");
                      }
                      objc_msgSend(v55, "localizedStringForKey:value:table:", v57, &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
                      v59 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v54, "stringWithFormat:", v59, v53);
                      v60 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v45)
                      {
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@\n%@"), v45, v60);
                        v61 = objc_claimAutoreleasedReturnValue();

                        v45 = (id)v61;
                      }
                      else
                      {
                        v45 = v60;
                      }
                      v4 = v104;
                      v33 = v108;
                      objc_msgSend(v108, "setProperty:forKey:", v45, v106);

                    }
                    objc_msgSend(v4, "addObject:", v33);
                    if (-[PSUICarrierSpaceUsageController shouldShowData:](self, "shouldShowData:", v14))
                    {
                      objc_msgSend(v14, "dataUsage");
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v62, "thisDeviceDataUsed");
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      v64 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v63);

                      objc_msgSend(v14, "dataUsage");
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v65, "capacity");
                      v66 = (void *)objc_claimAutoreleasedReturnValue();
                      v67 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v66);

                      if (v64 == 1 && v67 == 1)
                      {
                        -[PSUICarrierSpaceUsageController usageGraphSpecifierForSection:](self, "usageGraphSpecifierForSection:", v105);
                        v68 = (void *)objc_claimAutoreleasedReturnValue();
                        v4 = v104;
                        objc_msgSend(v104, "addObject:", v68);
                      }
                      else
                      {
                        v69 = -[PSUICarrierSpaceUsageController shouldShowOnlyRemainingData:](self, "shouldShowOnlyRemainingData:", v14);
                        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                        v70 = (void *)objc_claimAutoreleasedReturnValue();
                        v71 = v70;
                        if (v69)
                          v72 = CFSTR("REMAINING_DATA");
                        else
                          v72 = CFSTR("DATA");
                        objc_msgSend(v70, "localizedStringForKey:value:table:", v72, &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
                        v68 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v68, self, 0, sel_dataUsageDescription_, 0, 4, 0);
                        v73 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v73, "setProperty:forKey:", v14, CFSTR("PSUICarrierSpaceMetricsKey"));
                        v4 = v104;
                        objc_msgSend(v104, "addObject:", v73);

                      }
                      v33 = v108;
                    }
                    if (-[PSUICarrierSpaceUsageController shouldShowCalls:](self, "shouldShowCalls:", v14))
                    {
                      v74 = -[PSUICarrierSpaceUsageController shouldShowOnlyRemainingCalls:](self, "shouldShowOnlyRemainingCalls:", v14);
                      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      v76 = v75;
                      if (v74)
                        v77 = CFSTR("REMAINING_CALLS");
                      else
                        v77 = CFSTR("CALLS");
                      objc_msgSend(v75, "localizedStringForKey:value:table:", v77, &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
                      v78 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v78, self, 0, sel_callsDescription_, 0, 4, 0);
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v79, "setProperty:forKey:", v14, CFSTR("PSUICarrierSpaceMetricsKey"));
                      objc_msgSend(v4, "addObject:", v79);

                    }
                    if (-[PSUICarrierSpaceUsageController shouldShowMessages:](self, "shouldShowMessages:", v14))
                    {
                      v80 = -[PSUICarrierSpaceUsageController shouldShowOnlyRemainingMessages:](self, "shouldShowOnlyRemainingMessages:", v14);
                      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      v82 = v81;
                      if (v80)
                        v83 = CFSTR("REMAINING_MESSAGES");
                      else
                        v83 = CFSTR("MESSAGES");
                      objc_msgSend(v81, "localizedStringForKey:value:table:", v83, &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
                      v84 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v84, self, 0, sel_messagesDescription_, 0, 4, 0);
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v85, "setProperty:forKey:", v14, CFSTR("PSUICarrierSpaceMetricsKey"));
                      objc_msgSend(v4, "addObject:", v85);

                    }
                    if (-[PSUICarrierSpaceUsageController shouldShowRemainingCredit:](self, "shouldShowRemainingCredit:", v14))
                    {
                      v86 = (void *)MEMORY[0x24BE75590];
                      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v87, "localizedStringForKey:value:table:", CFSTR("REMAINING_CREDIT"), &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
                      v88 = v15;
                      v89 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v86, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v89, self, 0, sel_remainingCreditDescription_, 0, 4, 0);
                      v90 = (void *)objc_claimAutoreleasedReturnValue();

                      v15 = v88;
                      v33 = v108;

                      objc_msgSend(v90, "setProperty:forKey:", v14, CFSTR("PSUICarrierSpaceMetricsKey"));
                      objc_msgSend(v4, "addObject:", v90);

                    }
                    v11 = 0;
                    v10 = v101;
                    v9 = v102;
                    goto LABEL_79;
                  }
                  *(_WORD *)buf = 0;
                  v23 = v22;
                  v24 = "Plan type is not ambiguous, using plan type";
LABEL_39:
                  v31 = 2;
                }
                _os_log_impl(&dword_2161C6000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, v31);
                goto LABEL_41;
              }
LABEL_79:

              ++v12;
            }
            while (v9 != v12);
            v9 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v109, v119, 16);
          }
          while (v9);
        }

        v6 = v97 + 1;
      }
      while (v97 + 1 != v96);
      v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v120, 16);
      if (!v96)
      {
LABEL_83:

        objc_msgSend(MEMORY[0x24BE856B8], "logSpecifiers:origin:", v4, CFSTR("[PSUICarrierSpaceUsageController specifiers] end"));
        v91 = *(Class *)((char *)&self->super.super.super.super.super.isa + v93);
        *(Class *)((char *)&self->super.super.super.super.super.isa + v93) = (Class)v4;

        v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v93);
        return v3;
      }
    }
  }
  return v3;
}

- (id)usageGraphSpecifierForSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  int64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  _BOOL8 v34;
  int64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  PSUICarrierSpaceUsageController *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  uint64_t v53;
  PSUICarrierSpaceUsageController *v54;
  id obj;
  _BOOL4 obja;
  int64_t v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "primaryMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_opt_new();
  v54 = self;
  -[PSUICarrierSpaceUsageController barGraphColors](self, "barGraphColors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v5, "dataUsage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thisDeviceDataUsed");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[PSUICarrierSpaceManager bytesFromString:carrierSpaceUnits:](PSUICarrierSpaceManager, "bytesFromString:carrierSpaceUnits:", v9, objc_msgSend(v10, "units"));

  objc_msgSend(v5, "dataUsage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sharedDataUsed");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = +[PSUICarrierSpaceManager bytesFromString:carrierSpaceUnits:](PSUICarrierSpaceManager, "bytesFromString:carrierSpaceUnits:", v13, objc_msgSend(v14, "units"));

  objc_msgSend(v5, "dataUsage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "capacity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = +[PSUICarrierSpaceManager bytesFromString:carrierSpaceUnits:](PSUICarrierSpaceManager, "bytesFromString:carrierSpaceUnits:", v17, objc_msgSend(v18, "units"));

  v51 = v5;
  objc_msgSend(v5, "dataUsage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sharedDataUsed");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "length"))
    v21 = v15;
  else
    v21 = v11;

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemRedColor");
  v52 = v4;
  v53 = objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  objc_msgSend(v4, "barCategories");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = 0;
    v26 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v60 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        if (v21 <= v57)
        {
          -[PSUICarrierSpaceUsageController barGraphColors](v54, "barGraphColors");
          v29 = v21;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectAtIndexedSubscript:", v24);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setColor:", v31);

          v21 = v29;
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "setColor:", v53);
        }
        objc_msgSend(v58, "addObject:", v28);
        v24 = (v24 + 1) % v7;
        v25 += objc_msgSend(v28, "bytes");
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
    v25 = 0;
  }

  v32 = (void *)objc_opt_new();
  objc_msgSend(v32, "setCapacity:", v57);
  objc_msgSend(v32, "setBytesUsed:", v21);
  objc_msgSend(v32, "setSortStyle:", 0);
  objc_msgSend(v32, "setCategories:", v58);
  v33 = (unint64_t)objc_msgSend(v58, "count") < 2;
  if (v21 > v57)
    v33 = 1;
  obja = v33;
  v34 = v21 > v25;
  v35 = v21;
  v36 = (void *)MEMORY[0x24BE754A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("DATA"), &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "specifierWithTitle:useStandardFontSizeForSizeLabel:", v38, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "setProperty:forKey:", v51, CFSTR("PSUICarrierSpaceMetricsKey"));
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setProperty:forKey:", v40, *MEMORY[0x24BE75928]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v34);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setProperty:forKey:", v41, *MEMORY[0x24BE75930]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", obja);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setProperty:forKey:", v42, *MEMORY[0x24BE75910]);

  if (v35 <= v57)
  {
    v44 = v54;
    -[PSUICarrierSpaceUsageController barGraphColors](v54, "barGraphColors");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectAtIndexedSubscript:", v24);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setProperty:forKey:", v46, *MEMORY[0x24BE75918]);

    v43 = (void *)v53;
  }
  else
  {
    v43 = (void *)v53;
    objc_msgSend(v39, "setProperty:forKey:", v53, *MEMORY[0x24BE75918]);
    v44 = v54;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("OTHER"), &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setProperty:forKey:", v48, *MEMORY[0x24BE75920]);

  -[PSUICarrierSpaceUsageController dataUsageDescription:](v44, "dataUsageDescription:", v39);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setProperty:forKey:", v49, *MEMORY[0x24BE75938]);

  objc_msgSend(v39, "setProperty:forKey:", v32, *MEMORY[0x24BE75908]);
  return v39;
}

- (BOOL)shouldShowPlanSection:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[PSUICarrierSpaceUsageController shouldShowData:](self, "shouldShowData:", v4)
    || -[PSUICarrierSpaceUsageController shouldShowCalls:](self, "shouldShowCalls:", v4)
    || -[PSUICarrierSpaceUsageController shouldShowMessages:](self, "shouldShowMessages:", v4)
    || -[PSUICarrierSpaceUsageController shouldShowRemainingCredit:](self, "shouldShowRemainingCredit:", v4);

  return v5;
}

- (BOOL)shouldShowData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(v3, "dataUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thisDeviceDataUsed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v5);

  objc_msgSend(v3, "dataUsage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "capacity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v8);

  return +[PSUICarrierSpaceManager isCarrierMetricTypeValid:](PSUICarrierSpaceManager, "isCarrierMetricTypeValid:", v6)|| +[PSUICarrierSpaceManager isCarrierMetricTypeValid:](PSUICarrierSpaceManager, "isCarrierMetricTypeValid:", v9);
}

- (BOOL)shouldShowOnlyRemainingData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;

  v3 = a3;
  objc_msgSend(v3, "dataUsage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "thisDeviceDataUsed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v5);

  objc_msgSend(v3, "dataUsage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "capacity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v8);

  return !v6 && v9 == 1;
}

- (id)dataUsageDescription:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "propertyForKey:", CFSTR("PSUICarrierSpaceMetricsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICarrierSpaceManager sharedManager](PSUICarrierSpaceManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionForPlanMetrics:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)shouldShowCalls:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(v3, "voice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minutesUsed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v5);

  objc_msgSend(v3, "voice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "minutesCapacity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v8);

  return +[PSUICarrierSpaceManager isCarrierMetricTypeValid:](PSUICarrierSpaceManager, "isCarrierMetricTypeValid:", v6)|| +[PSUICarrierSpaceManager isCarrierMetricTypeValid:](PSUICarrierSpaceManager, "isCarrierMetricTypeValid:", v9);
}

- (BOOL)shouldShowOnlyRemainingCalls:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;

  v3 = a3;
  objc_msgSend(v3, "voice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minutesUsed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v5);

  objc_msgSend(v3, "voice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "minutesCapacity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v8);

  return !v6 && v9 == 1;
}

- (id)callsDescription:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  objc_msgSend(a3, "propertyForKey:", CFSTR("PSUICarrierSpaceMetricsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "voice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minutesCapacity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v5);

  objc_msgSend(v3, "voice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minutesUsed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v8);

  if (v6 == 1)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v9 == 1)
    {
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("USED_%@_OF_%@_MINUTES"), &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "voice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "minutesUsed");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "voice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "minutesCapacity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v14, v16, v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      goto LABEL_10;
    }
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("%@_MINUTES"), &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "voice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minutesCapacity");
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v16 = (void *)v19;
    objc_msgSend(v12, "stringWithFormat:", v14, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v6 != 2)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("%@_MINUTES"), &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "voice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minutesUsed");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("UNLIMITED"), &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

- (BOOL)shouldShowMessages:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(v3, "messages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "used");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v5);

  objc_msgSend(v3, "messages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "capacity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v8);

  return +[PSUICarrierSpaceManager isCarrierMetricTypeValid:](PSUICarrierSpaceManager, "isCarrierMetricTypeValid:", v6)|| +[PSUICarrierSpaceManager isCarrierMetricTypeValid:](PSUICarrierSpaceManager, "isCarrierMetricTypeValid:", v9);
}

- (BOOL)shouldShowOnlyRemainingMessages:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;

  v3 = a3;
  objc_msgSend(v3, "messages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "used");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v5);

  objc_msgSend(v3, "messages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "capacity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v8);

  return !v6 && v9 == 1;
}

- (id)messagesDescription:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  objc_msgSend(a3, "propertyForKey:", CFSTR("PSUICarrierSpaceMetricsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capacity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v5);

  objc_msgSend(v3, "messages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "used");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v8);

  if (v6 == 1)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v9 == 1)
    {
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("USED_%@_OF_%@_MESSAGES"), &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "messages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "used");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "messages");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "capacity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v14, v16, v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      goto LABEL_10;
    }
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("%@_MESSAGES"), &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "capacity");
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v16 = (void *)v19;
    objc_msgSend(v12, "stringWithFormat:", v14, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v6 != 2)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("%@_MESSAGES"), &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "used");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("UNLIMITED"), &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v11;
}

- (BOOL)shouldShowRemainingCredit:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "remainingBalance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (id)remainingCreditDescription:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "propertyForKey:", CFSTR("PSUICarrierSpaceMetricsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remainingBalance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CarrierSpaceUsageController"));
}

@end
