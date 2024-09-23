@implementation DBSMainDisplayPreferencesController

- (DBSMainDisplayPreferencesController)init
{
  DBSMainDisplayPreferencesController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DBSMainDisplayPreferencesController;
  v2 = -[DBSMainDisplayPreferencesController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_isReferenceLimited);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v2, v4, 1, 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isReferenceLimited);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, v4);

  v5.receiver = self;
  v5.super_class = (Class)DBSMainDisplayPreferencesController;
  -[DBSMainDisplayPreferencesController dealloc](&v5, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DBSMainDisplayPreferencesController;
  -[DBSMainDisplayPreferencesController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  +[DBSBrightnessManager defaultManager](DBSBrightnessManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[DBSMainDisplayPreferencesController updateReferenceDependentUIElements](self, "updateReferenceDependentUIElements");
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[DBSBrightnessManager defaultManager](DBSBrightnessManager, "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mainDisplayBrightnessSpecifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObjectsFromArray:", v7);
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setDelegate:", self);
    objc_msgSend(v8, "specifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v8, "specifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v10);

    }
    -[DBSMainDisplayPreferencesController set_zoomAndProSpecifierVendor:](self, "set_zoomAndProSpecifierVendor:", v8);
    v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)presentModalMagnifyController
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x24BE75588]);
  v3 = (int)*MEMORY[0x24BE757A8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x24BE75C60]);

  objc_msgSend(v7, "setSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.isa + v3));
  objc_msgSend(v7, "setParentController:", self);
  objc_msgSend(v7, "setupController");
  objc_msgSend(v7, "setModalPresentationStyle:", 2);
  -[DBSMainDisplayPreferencesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (id)connectedDisplayName
{
  return 0;
}

- (BOOL)proModeSupported
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "availablePresets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)updateReferenceDependentUIElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  -[DBSMainDisplayPreferencesController specifiers](self, "specifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specifierForID:", CFSTR("BRIGHTNESS"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[DBSMainDisplayPreferencesController specifiers](self, "specifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "specifierForID:", CFSTR("WHITE_BALANCE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DBSMainDisplayPreferencesController specifiers](self, "specifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "specifierForID:", CFSTR("ADVANCED"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isReference");

  v10 = *MEMORY[0x24BE75A18];
  if (v9)
    v11 = MEMORY[0x24BDBD1C0];
  else
    v11 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75A18]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v10);
  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isReferenceLimited"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("brightnessLimited"));

  -[DBSMainDisplayPreferencesController reloadSpecifier:](self, "reloadSpecifier:", v15);
  -[DBSMainDisplayPreferencesController reloadSpecifier:](self, "reloadSpecifier:", v5);
  if (v7)
    -[DBSMainDisplayPreferencesController reloadSpecifier:](self, "reloadSpecifier:", v7);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x24BDE5660], "mainDisplay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqual:", v11))
  {
    -[DBSMainDisplayPreferencesController specifiers](self, "specifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "specifierForID:", CFSTR("BRIGHTNESS"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v13, "isReferenceLimited"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("brightnessLimited"));

    -[DBSMainDisplayPreferencesController reloadSpecifier:](self, "reloadSpecifier:", v15);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)DBSMainDisplayPreferencesController;
    -[DBSMainDisplayPreferencesController observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

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
