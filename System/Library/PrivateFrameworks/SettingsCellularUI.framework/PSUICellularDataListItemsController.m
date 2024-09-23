@implementation PSUICellularDataListItemsController

- (PSUICellularDataListItemsController)init
{
  PSUICellularDataListItemsController *v2;
  RadiosPreferences *v3;
  RadiosPreferences *radioPreferences;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSUICellularDataListItemsController;
  v2 = -[PSUICellularDataListItemsController init](&v8, sel_init);
  if (v2)
  {
    v3 = (RadiosPreferences *)objc_alloc_init(MEMORY[0x24BE04788]);
    radioPreferences = v2->_radioPreferences;
    v2->_radioPreferences = v3;

    -[RadiosPreferences setNotifyForExternalChangeOnly:](v2->_radioPreferences, "setNotifyForExternalChangeOnly:", 1);
    -[RadiosPreferences setDelegate:](v2->_radioPreferences, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_reloadCache, CFSTR("PSUICellularPlanChanged"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_reloadCache, *MEMORY[0x24BEBE008], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSUICellularDataListItemsController;
  -[PSListItemsController dealloc](&v4, sel_dealloc);
}

- (void)airplaneModeChanged
{
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[PSUICellularDataListItemsController getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[PSUICellularDataListItemsController airplaneModeChanged]";
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s Received airplane mode changed", buf, 0xCu);
  }

  v4 = *(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]);
  if (objc_msgSend(v4, "isDetailControllerNeeded"))
  {
    -[PSUICellularDataListItemsController radioPreferences](self, "radioPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "airplaneMode");

    if (v6)
    {
      -[PSUICellularDataListItemsController getLogger](self, "getLogger");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2161C6000, v7, OS_LOG_TYPE_DEFAULT, "Airplane mode is enabled", buf, 2u);
      }

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__PSUICellularDataListItemsController_airplaneModeChanged__block_invoke;
      block[3] = &unk_24D501660;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }

}

void __58__PSUICellularDataListItemsController_airplaneModeChanged__block_invoke(uint64_t a1)
{
  id v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BE757A0]));
  v1 = (id)objc_msgSend(WeakRetained, "popViewControllerAnimated:", 1);

}

- (void)reloadCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__PSUICellularDataListItemsController_reloadCache__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __50__PSUICellularDataListItemsController_reloadCache__block_invoke(uint64_t a1)
{
  int v2;
  char *v3;
  void *v4;
  id WeakRetained;
  id v6;
  id v7;

  v7 = *(id *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x24BE757A8]);
  objc_msgSend(v7, "updateCachedState");
  v2 = objc_msgSend(v7, "isDetailControllerNeeded");
  v3 = *(char **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "reloadSpecifiers");
    v4 = v7;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&v3[*MEMORY[0x24BE757A0]]);

    v6 = (id)objc_msgSend(WeakRetained, "popViewControllerAnimated:", 1);
    v4 = WeakRetained;
  }

}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  PSUICellularDataFallbackSwitchSpecifier *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (!v3)
  {
    v30 = (int)*MEMORY[0x24BE756E0];
    v41.receiver = self;
    v41.super_class = (Class)PSUICellularDataListItemsController;
    -[PSListItemsController specifiers](&v41, sel_specifiers);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DATA_SWITCHING_FOOTER"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    v31 = v6;
    if (v7)
    {
      v8 = v7;
      v36 = 0;
      v9 = 0;
      v10 = *(_QWORD *)v38;
      v34 = *MEMORY[0x24BE75948];
      v32 = *MEMORY[0x24BE75CE8];
      v33 = *MEMORY[0x24BE75950];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v12, "cellType"))
          {
            v13 = (int)*MEMORY[0x24BE757A8];
            objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v13), "planItemForListItem:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              objc_msgSend(v12, "setProperty:forKey:", objc_opt_class(), v34);
              -[PSUICellularDataListItemsController getLogger](self, "getLogger");
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v43 = v14;
                _os_log_impl(&dword_2161C6000, v15, OS_LOG_TYPE_DEFAULT, "Setting plan item: %@", buf, 0xCu);
              }

              objc_msgSend(v12, "setProperty:forKey:", v14, v33);
              objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v13), "subscriptionContextForListItem:", v12);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
                objc_msgSend(v12, "setProperty:forKey:", v16, v32);
              v17 = objc_msgSend(v14, "isSelected");
              if (-[PSUICellularDataListItemsController _isDataSwitchAutomatic:](self, "_isDataSwitchAutomatic:", v14))
              {
                v18 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CELLULAR_DATA_SWITCHING_FOOTER_PNW"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "stringWithFormat:", v20);
                v21 = objc_claimAutoreleasedReturnValue();

                v9 = 1;
                v35 = (void *)v21;
                v6 = v31;
              }
              v36 += v17;

            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      }
      while (v8);
    }
    else
    {
      v36 = 0;
      v9 = 0;
    }

    -[PSUICellularDataListItemsController getLogger](self, "getLogger");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v43) = v36;
      _os_log_impl(&dword_2161C6000, v22, OS_LOG_TYPE_DEFAULT, "Lines turned on: %d", buf, 8u);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("CELLULAR_DATA_SWITCHING_GROUP"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setProperty:forKey:", v35, *MEMORY[0x24BE75A68]);
    objc_msgSend(v23, "addObject:", v24);
    if ((v9 & 1) == 0)
    {
      v25 = -[PSUICellularDataFallbackSwitchSpecifier initWithHostController:]([PSUICellularDataFallbackSwitchSpecifier alloc], "initWithHostController:", self);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v36 > 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSUICellularDataFallbackSwitchSpecifier setProperty:forKey:](v25, "setProperty:forKey:", v26, *MEMORY[0x24BE75A18]);

      v6 = v31;
      objc_msgSend(v23, "addObject:", v25);

    }
    objc_msgSend(MEMORY[0x24BE856B8], "logSpecifiers:origin:", v23, CFSTR("[PSUICellularDataListItemsController specifiers] end"));
    v27 = (objc_class *)objc_msgSend(v23, "copy");
    v28 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v30);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v30) = v27;

    v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v30);
  }
  return v3;
}

- (BOOL)_isDataSwitchAutomatic:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "isSelected")
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v3, "settingsMode") == 1;

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "section"))
  {
    objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PSUICellularDataListItemsController;
    -[PSListItemsController tableView:didSelectRowAtIndexPath:](&v8, sel_tableView_didSelectRowAtIndexPath_, v7, v6);
  }

}

- (void)setSpecifier:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PSUICellularDataListItemsController;
  -[PSUICellularDataListItemsController setSpecifier:](&v5, sel_setSpecifier_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setDetailController:", self);

}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CellularDataListItemsController"));
}

- (RadiosPreferences)radioPreferences
{
  return self->_radioPreferences;
}

- (void)setRadioPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_radioPreferences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radioPreferences, 0);
}

@end
