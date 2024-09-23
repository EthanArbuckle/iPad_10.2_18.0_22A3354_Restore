@implementation DBSExternalDisplayPreferencesController

- (DBSExternalDisplayPreferencesController)init
{
  DBSExternalDisplayPreferencesController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DBSExternalDisplayPreferencesController;
  v2 = -[DBSExternalDisplayPreferencesController init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_connectedDisplayDidUpdate_, DBSExternalDisplayManagerCurrentModeDidChange[0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_externalBrightnessDidUpdate_, DBSExternalDisplayManagerExternalBrightnessValueDidChange[0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_handleDBSExternalDisplayManagerExternalBrightnessAvailablityDidChangeNotification_, DBSExternalDisplayManagerExternalBrightnessAvailablityDidChange[0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessAvailablityDidChangeNotification_, DBSExternalDisplayManagerExternalAutoBrightnessAvailablityDidChange[0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessValueDidChangeNotification_, DBSExternalDisplayManagerExternalAutoBrightnessValueDidChange[0], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, DBSExternalDisplayManagerCurrentModeDidChange[0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, DBSExternalDisplayManagerExternalBrightnessValueDidChange[0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, DBSExternalDisplayManagerExternalBrightnessAvailablityDidChange[0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, DBSExternalDisplayManagerExternalAutoBrightnessAvailablityDidChange[0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, DBSExternalDisplayManagerExternalAutoBrightnessValueDidChange[0], 0);

  v8.receiver = self;
  v8.super_class = (Class)DBSExternalDisplayPreferencesController;
  -[DBSExternalDisplayPreferencesController dealloc](&v8, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)DBSExternalDisplayPreferencesController;
  -[DBSExternalDisplayPreferencesController viewDidLoad](&v2, sel_viewDidLoad);
  ADClientAddValueForScalarKey();
}

- (id)getProModeEnabled
{
  return (id)MEMORY[0x24BDBD1C0];
}

- (BOOL)proModeSupported
{
  return 0;
}

- (SBSConnectedDisplayInfo)externalDisplayInfo
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[DBSExternalDisplayPreferencesController parentController](self, "parentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[DBSExternalDisplayPreferencesController parentController](self, "parentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "externalDisplayInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (SBSConnectedDisplayInfo *)v6;
}

- (unint64_t)supportedZoomModesCount
{
  void *v2;
  unint64_t v3;

  -[DBSExternalDisplayPreferencesController externalDisplayInfo](self, "externalDisplayInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedScales");

  return ((v3 >> 1) & 1) + (v3 & 1) + ((v3 >> 2) & 1);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "externalDisplayBrightnessAvailable");

    if (v7)
    {
      -[DBSExternalDisplayPreferencesController externalBrightnessSpecifiers](self, "externalBrightnessSpecifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v8);

    }
    if (DBSReverseZoomEnabled()
      && DBSChamoisEnabled()
      && -[DBSExternalDisplayPreferencesController supportedZoomModesCount](self, "supportedZoomModesCount") >= 2)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(v9, "setDelegate:", self);
      objc_msgSend(v9, "specifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v9, "specifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

      }
      -[DBSExternalDisplayPreferencesController set_zoomAndProSpecifierVendor:](self, "set_zoomAndProSpecifierVendor:", v9);

    }
    -[DBSExternalDisplayPreferencesController displayModeSpecifiers](self, "displayModeSpecifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v12);

    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    DBS_LocalizedStringForConnectedDisplays(CFSTR("MATCH_CONTENT_FOOTER"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE75A68]);

    objc_msgSend(v5, "addObject:", v13);
    v15 = (void *)MEMORY[0x24BE75590];
    DBS_LocalizedStringForConnectedDisplays(CFSTR("MATCH_CONTENT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, self, sel_setMatchContentEnabled_specifier_, sel_matchContentEnabled_, 0, 6, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("MATCH_CONTENT"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v5, "addObject:", v17);
    v18 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
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
  void *v25;
  void *v26;
  NSObject *v27;
  objc_super v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id location[4];

  location[3] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DBSExternalDisplayPreferencesController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSExternalDisplayPreferencesController specifierForID:](self, "specifierForID:", CFSTR("COLOR_SETTING"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HDRMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentHDRMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", v10);

  if ((v13 & 1) == 0)
  {
    +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferredHDRModes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "containsObject:", v10))
    {
      +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCurrentHDRMode:", v10);

      if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDE58F8])
        || objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDE5900])
        || objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDE5908]))
      {
        ADClientAddValueForScalarKey();
      }
      else
      {
        DBSLogForCategory(0);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(location[0]) = 138543362;
          *(id *)((char *)location + 4) = self;
          _os_log_impl(&dword_227A37000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: unexcepted HDR mode.", (uint8_t *)location, 0xCu);
        }

      }
      objc_msgSend(v9, "setProperty:forKey:", v8, *MEMORY[0x24BE75C20]);
      -[DBSExternalDisplayPreferencesController reloadSpecifier:](self, "reloadSpecifier:", v9);
    }
    else if (v10)
    {
      v17 = (void *)MEMORY[0x24BEBD3B0];
      DBS_LocalizedStringForConnectedDisplays(CFSTR("LIMIT_REFRESH_RATE_TITLE"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      DBS_LocalizedStringForConnectedDisplays(CFSTR("LIMIT_REFRESH_RATE_MESSAGE"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v18, v19, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_initWeak(location, self);
      v21 = (void *)MEMORY[0x24BEBD3A8];
      DBS_LocalizedStringForConnectedDisplays(CFSTR("LIMIT_REFRESH_RATE_CONFIRM"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __77__DBSExternalDisplayPreferencesController_tableView_didSelectRowAtIndexPath___block_invoke;
      v29[3] = &unk_24F025EF0;
      objc_copyWeak(&v33, location);
      v30 = v10;
      v31 = v9;
      v32 = v8;
      objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 0, v29);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addAction:", v23);

      v24 = (void *)MEMORY[0x24BEBD3A8];
      DBS_LocalizedStringForConnectedDisplays(CFSTR("LIMIT_REFRESH_RATE_CANCEL"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "actionWithTitle:style:handler:", v25, 1, &__block_literal_global_1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addAction:", v26);

      -[DBSExternalDisplayPreferencesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);
      objc_destroyWeak(&v33);
      objc_destroyWeak(location);

    }
  }
  v28.receiver = self;
  v28.super_class = (Class)DBSExternalDisplayPreferencesController;
  -[DBSExternalDisplayPreferencesController tableView:didSelectRowAtIndexPath:](&v28, sel_tableView_didSelectRowAtIndexPath_, v6, v7);

}

void __77__DBSExternalDisplayPreferencesController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentHDRMode:", *(_QWORD *)(a1 + 32));

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BDE58F8]))
  {
    ADClientAddValueForScalarKey();
  }
  else
  {
    DBSLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = WeakRetained;
      _os_log_impl(&dword_227A37000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: unexcepted limited refresh rate HDR mode.", (uint8_t *)&v5, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "setProperty:forKey:", *(_QWORD *)(a1 + 48), *MEMORY[0x24BE75C20]);
  objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 40));

}

uint64_t __77__DBSExternalDisplayPreferencesController_tableView_didSelectRowAtIndexPath___block_invoke_70()
{
  return ADClientAddValueForScalarKey();
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[DBSExternalDisplayPreferencesController specifierAtIndexPath:](self, "specifierAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE75AC0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("MATCH_CONTENT"));

  if ((v10 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)DBSExternalDisplayPreferencesController;
    v11 = -[DBSExternalDisplayPreferencesController tableView:shouldHighlightRowAtIndexPath:](&v13, sel_tableView_shouldHighlightRowAtIndexPath_, v6, v7);
  }

  return v11;
}

- (id)matchContentEnabled:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "matchContent"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setMatchContentEnabled:(id)a3 specifier:(id)a4
{
  id v4;
  void *v5;

  v4 = a3;
  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMatchContent:", objc_msgSend(v4, "BOOLValue"));

  objc_msgSend(v4, "BOOLValue");
  ADClientAddValueForScalarKey();
}

- (void)connectedDisplayDidUpdate:(id)a3
{
  void *v4;
  char v5;
  _QWORD block[5];

  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "externalDisplayAvailable");

  if ((v5 & 1) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__DBSExternalDisplayPreferencesController_connectedDisplayDidUpdate___block_invoke;
    block[3] = &unk_24F025E70;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __69__DBSExternalDisplayPreferencesController_connectedDisplayDidUpdate___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

- (id)externalBrightnessSpecifiers
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "externalDisplayBrightnessAvailable");

  if (v5)
  {
    v6 = (int)*MEMORY[0x24BE756E0];
    if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v6)
      || (-[DBSExternalDisplayPreferencesController specifierForID:](self, "specifierForID:", CFSTR("BRIGHTNESS_GROUP")),
          (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("BRIGHTNESS_GROUP"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      DBS_LocalizedStringForConnectedDisplays(CFSTR("BRIGHTNESS_GROUP"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setName:", v8);

    }
    objc_msgSend(v3, "addObject:", v7);
    if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v6)
      || (-[DBSExternalDisplayPreferencesController specifierForID:](self, "specifierForID:", CFSTR("EXTERNAL_BRIGHTNESS")), (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, sel_setExternalBrightnessValue_specifier_, sel_externalBrightnessValueForSpecifier_, 0, 5, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("EXTERNAL_BRIGHTNESS"), *MEMORY[0x24BE75AC0]);
      objc_msgSend(MEMORY[0x24BEBD640], "dbs_minSliderImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75C90]);

      objc_msgSend(MEMORY[0x24BEBD640], "dbs_maxSliderImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75CA0]);

      objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24F02FB88, *MEMORY[0x24BE759B0]);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24F02FB98, *MEMORY[0x24BE759A8]);
      objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75C80]);
    }
    objc_msgSend(v3, "addObject:", v9);
    +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "externalDisplayAutoBrightnessAvailable");

    if (v13)
    {
      if (!*(Class *)((char *)&self->super.super.super.super.super.isa + v6)
        || (-[DBSExternalDisplayPreferencesController specifierForID:](self, "specifierForID:", CFSTR("EXTERNAL_AUTO_BRIGHTNESS")), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v15 = (void *)MEMORY[0x24BE75590];
        DBS_LocalizedStringForConnectedDisplays(CFSTR("EXTERNAL_AUTO_BRIGHTNESS"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, self, sel_setExternalAutoBrightnessValue_specifier_, sel_externalAutoBrightnessValueForSpecifier_, 0, 6, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("EXTERNAL_AUTO_BRIGHTNESS"), *MEMORY[0x24BE75AC0]);
      }
      objc_msgSend(v3, "addObject:", v14);

    }
  }
  return v3;
}

- (void)externalBrightnessDidUpdate:(id)a3
{
  id v4;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[DBSExternalDisplayPreferencesController specifierForID:](self, "specifierForID:", CFSTR("EXTERNAL_BRIGHTNESS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSExternalDisplayPreferencesController reloadSpecifier:](self, "reloadSpecifier:", v5);

  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __71__DBSExternalDisplayPreferencesController_externalBrightnessDidUpdate___block_invoke;
    block[3] = &unk_24F025F38;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __71__DBSExternalDisplayPreferencesController_externalBrightnessDidUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "externalBrightnessDidUpdate:", *(_QWORD *)(a1 + 32));

}

- (id)externalBrightnessValueForSpecifier:(id)a3
{
  void *v3;
  void *v4;

  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalDisplayBrightness");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setExternalBrightnessValue:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  -[DBSExternalDisplayPreferencesController indexPathForSpecifier:](self, "indexPathForSpecifier:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[DBSExternalDisplayPreferencesController table](self, "table");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "control");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setExternalDisplayBrightness:shouldCommit:", v6, objc_msgSend(v9, "isTracking") ^ 1);

  ADClientAddValueForScalarKey();
}

- (id)externalAutoBrightnessValueForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "autoBrightnessEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setExternalAutoBrightnessValue:(id)a3 specifier:(id)a4
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v6, "setAutoBrightnessEnabled:", v5);
}

- (void)insertExternalBrightnessSpecifiers
{
  void *v3;
  id v4;

  -[DBSExternalDisplayPreferencesController externalBrightnessSpecifiers](self, "externalBrightnessSpecifiers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[DBSExternalDisplayPreferencesController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v4, 0);
  -[DBSExternalDisplayPreferencesController externalBrightnessSpecifiers](self, "externalBrightnessSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSExternalDisplayPreferencesController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v3, 0, 1);

}

- (void)removeExternalBrightnessSpecifiers
{
  id v3;

  -[DBSExternalDisplayPreferencesController externalBrightnessSpecifiers](self, "externalBrightnessSpecifiers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[DBSExternalDisplayPreferencesController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v3, 1);

}

- (void)handleDBSExternalDisplayManagerExternalBrightnessAvailablityDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "externalDisplayBrightnessAvailable");

    if (v6)
      -[DBSExternalDisplayPreferencesController insertExternalBrightnessSpecifiers](self, "insertExternalBrightnessSpecifiers");
    else
      -[DBSExternalDisplayPreferencesController removeExternalBrightnessSpecifiers](self, "removeExternalBrightnessSpecifiers");
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __125__DBSExternalDisplayPreferencesController_handleDBSExternalDisplayManagerExternalBrightnessAvailablityDidChangeNotification___block_invoke;
    block[3] = &unk_24F025F38;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __125__DBSExternalDisplayPreferencesController_handleDBSExternalDisplayManagerExternalBrightnessAvailablityDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleDBSExternalDisplayManagerExternalBrightnessAvailablityDidChangeNotification:", *(_QWORD *)(a1 + 32));

}

- (void)handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessAvailablityDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "externalDisplayAutoBrightnessAvailable");

    if (v6)
      -[DBSExternalDisplayPreferencesController insertExternalBrightnessSpecifiers](self, "insertExternalBrightnessSpecifiers");
    else
      -[DBSExternalDisplayPreferencesController removeExternalBrightnessSpecifiers](self, "removeExternalBrightnessSpecifiers");
  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __168__DBSExternalDisplayPreferencesController_handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessAvailablityDidChangeNotification___block_invoke;
    block[3] = &unk_24F025F38;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __168__DBSExternalDisplayPreferencesController_handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessAvailablityDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessAvailablityDidChangeNotification:", *(_QWORD *)(a1 + 32));

}

- (void)handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessValueDidChangeNotification:(id)a3
{
  id v4;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[DBSExternalDisplayPreferencesController specifierForID:](self, "specifierForID:", CFSTR("EXTERNAL_AUTO_BRIGHTNESS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[DBSExternalDisplayPreferencesController reloadSpecifier:](self, "reloadSpecifier:", v5);

  }
  else
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __162__DBSExternalDisplayPreferencesController_handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessValueDidChangeNotification___block_invoke;
    block[3] = &unk_24F025F38;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __162__DBSExternalDisplayPreferencesController_handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessValueDidChangeNotification___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleDBSExternalDBSDisplayPreferencesControllerExternalDisplayManagerExternalAutoBrightnessValueDidChangeNotification:", *(_QWORD *)(a1 + 32));

}

- (id)displayModeSpecifiers
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  int v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  unint64_t v42;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _QWORD v51[3];
  _QWORD v52[5];

  v52[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x24BDE58F8];
  v51[0] = *MEMORY[0x24BDE58F8];
  DBS_LocalizedStringForConnectedDisplays(CFSTR("DOLBY_VISION"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v3;
  v35 = *MEMORY[0x24BDE5900];
  v51[1] = *MEMORY[0x24BDE5900];
  DBS_LocalizedStringForConnectedDisplays(CFSTR("HIGH_DYNAMIC_RANGE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v4;
  v40 = *MEMORY[0x24BDE5908];
  v51[2] = *MEMORY[0x24BDE5908];
  DBS_LocalizedStringForConnectedDisplays(CFSTR("STANDARD_DYNAMIC_RANGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "supportedHDRModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredHDRModes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "count");
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("COLOR_SETTING"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B28]);
  v42 = v9;
  if (v9 < 2)
  {
    DBS_LocalizedStringForConnectedDisplays(CFSTR("COLOR_SETTING"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setName:", v13);

    v12 = CFSTR("SDR_COLOR_SETTING_FOOTER");
  }
  else
  {
    DBS_LocalizedStringForConnectedDisplays(CFSTR("PREFERRED_COLOR_SETTING"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setName:", v11);

    if (objc_msgSend(v7, "containsObject:", v2))
      v12 = CFSTR("DOLBY_COLOR_SETTING_FOOTER");
    else
      v12 = CFSTR("HDR_COLOR_SETTING_FOOTER");
  }
  DBS_LocalizedStringForConnectedDisplays(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE75A68]);

  v34 = v10;
  objc_msgSend(v45, "addObject:", v10);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v7;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  if (v15)
  {
    v16 = v15;
    v37 = v2;
    v17 = 0;
    v18 = *(_QWORD *)v47;
    v19 = *MEMORY[0x24BE75948];
    v39 = *MEMORY[0x24BE75A18];
    v38 = *MEMORY[0x24BE75DA0];
    while (1)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v47 != v18)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v22 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(v44, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v23, self, 0, sel_valueForSpecifier_, 0, 4, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "setObject:forKeyedSubscript:", v21, CFSTR("HDRMode"));
        objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_opt_class(), v19);
        if (v42 < 2)
        {
          objc_msgSend(v24, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v39);
          goto LABEL_24;
        }
        if (objc_msgSend(v21, "isEqualToString:", v40))
        {
          v25 = CFSTR("MOST_COMPATIBLE");
        }
        else
        {
          if ((objc_msgSend(obj, "containsObject:", v37) & 1) == 0
            && objc_msgSend(v21, "isEqualToString:", v35))
          {
LABEL_22:
            v25 = CFSTR("RECOMMENDED");
            goto LABEL_23;
          }
          v26 = objc_msgSend(v36, "containsObject:", v37);
          v27 = objc_msgSend(v21, "isEqualToString:", v37);
          if (v26)
          {
            if (v27)
              goto LABEL_22;
            v25 = CFSTR("GOOD");
          }
          else
          {
            if (!v27)
              goto LABEL_22;
            v25 = CFSTR("REFRESH_RATE_LIMITED");
          }
        }
LABEL_23:
        DBS_LocalizedStringForConnectedDisplays(v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, v38);

LABEL_24:
        +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "currentHDRMode");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", v21);

        if (v31)
        {
          v32 = v24;

          v17 = v32;
        }
        objc_msgSend(v45, "addObject:", v24);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (!v16)
        goto LABEL_30;
    }
  }
  v17 = 0;
LABEL_30:

  objc_msgSend(v34, "setProperty:forKey:", v17, *MEMORY[0x24BE75C20]);
  return v45;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BE75DA0]);
}

- (void)presentModalMagnifyController
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = objc_alloc_init(MEMORY[0x24BE75588]);
  v3 = (int)*MEMORY[0x24BE757A8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x24BE75C60]);

  objc_msgSend(v12, "setSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.isa + v3));
  objc_msgSend(v12, "setParentController:", self);
  objc_msgSend(v12, "setupController");
  objc_msgSend(v12, "setModalPresentationStyle:", 2);
  objc_msgSend(v12, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSExternalDisplayPreferencesController parentController](self, "parentController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v3) = objc_opt_isKindOfClass();

  if ((v3 & 1) != 0)
  {
    -[DBSExternalDisplayPreferencesController parentController](self, "parentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayService:", v10);

    objc_msgSend(v9, "externalDisplayInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExternalDisplayInfo:", v11);

  }
  objc_msgSend(v7, "setDelegate:", self);
  -[DBSExternalDisplayPreferencesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

}

- (id)localizedMagnifyModeName
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;

  -[DBSExternalDisplayPreferencesController externalDisplayInfo](self, "externalDisplayInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayModeSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scale");

  if (v4 > 2)
  {
    v5 = 0;
  }
  else
  {
    DBS_LocalizedStringForMagnify(off_24F025F58[v4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)displayZoomDidUpdate
{
  void *v3;
  char isKindOfClass;
  void *v5;
  _QWORD v6[5];

  -[DBSExternalDisplayPreferencesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[DBSExternalDisplayPreferencesController parentController](self, "parentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[DBSExternalDisplayPreferencesController parentController](self, "parentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __63__DBSExternalDisplayPreferencesController_displayZoomDidUpdate__block_invoke;
    v6[3] = &unk_24F025E70;
    v6[4] = self;
    objc_msgSend(v5, "updateExternalDisplayInfoWithCompletionHandler:", v6);

  }
}

uint64_t __63__DBSExternalDisplayPreferencesController_displayZoomDidUpdate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (id)connectedDisplayName
{
  void *v2;
  void *v3;

  +[DBSExternalDisplayManager defaultManager](DBSExternalDisplayManager, "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (DBSZoomAndProSpecifiers)_zoomAndProSpecifierVendor
{
  return self->__zoomAndProSpecifierVendor;
}

- (void)set_zoomAndProSpecifierVendor:(id)a3
{
  objc_storeStrong((id *)&self->__zoomAndProSpecifierVendor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__zoomAndProSpecifierVendor, 0);
}

@end
