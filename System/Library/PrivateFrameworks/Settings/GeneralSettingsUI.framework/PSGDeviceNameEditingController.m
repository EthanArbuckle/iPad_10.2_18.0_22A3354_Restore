@implementation PSGDeviceNameEditingController

- (id)specifiers
{
  uint64_t v2;
  void *v3;
  id v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  id v13;

  v2 = (int)*MEMORY[0x24BE756E0];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, 0);

    v9 = (void *)MEMORY[0x24BE75590];
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x24BE75790]));
    objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, WeakRetained, sel_setDeviceName_specifier_, sel_deviceName_, 0, 8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A08]);
    objc_msgSend(v8, "addObject:", v11);
    v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v2) = (Class)v8;
    v13 = v8;

    v4 = *(id *)((char *)&self->super.super.super.super.super.isa + v2);
  }
  return v4;
}

- (void)suspend
{
  void *v3;
  objc_super v4;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

  v4.receiver = self;
  v4.super_class = (Class)PSGDeviceNameEditingController;
  -[PSGDeviceNameEditingController suspend](&v4, sel_suspend);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSGDeviceNameEditingController;
  -[PSGDeviceNameEditingController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE63740];
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__PSGDeviceNameEditingController_viewWillAppear___block_invoke;
  v8[3] = &unk_24F9C7CD8;
  v8[4] = self;
  objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v5, 0, v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGDeviceNameEditingController setEffectiveSettingsChangedNotificationObserver:](self, "setEffectiveSettingsChangedNotificationObserver:", v7);

}

void __49__PSGDeviceNameEditingController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  if ((_isDeviceNameEditable() & 1) == 0)
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2 == v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_editedDeviceName");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "originalDeviceName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "isEqualToString:", v10);

        if ((v6 & 1) == 0)
        {
          +[PSSpecifierDataSource sharedInstance](PSGAboutDataSource, "sharedInstance");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setDeviceNameToIgnoreOnce:", v10);

        }
      }
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSGDeviceNameEditingController;
  -[PSGDeviceNameEditingController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[PSGDeviceNameEditingController _editedDeviceName](self, "_editedDeviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGDeviceNameEditingController setOriginalDeviceName:](self, "setOriginalDeviceName:", v4);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resignFirstResponder");

  v6.receiver = self;
  v6.super_class = (Class)PSGDeviceNameEditingController;
  -[PSGDeviceNameEditingController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSGDeviceNameEditingController;
  -[PSGDeviceNameEditingController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGDeviceNameEditingController effectiveSettingsChangedNotificationObserver](self, "effectiveSettingsChangedNotificationObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", v5);

  -[PSGDeviceNameEditingController setEffectiveSettingsChangedNotificationObserver:](self, "setEffectiveSettingsChangedNotificationObserver:", 0);
}

- (BOOL)shouldSelectResponderOnAppearance
{
  return 1;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PSGDeviceNameEditingController;
  -[PSGDeviceNameEditingController tableView:cellForRowAtIndexPath:](&v9, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "tag") == 8)
  {
    DeviceName();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAutocapitalizationType:", 2);
    objc_msgSend(v7, "setAutocorrectionType:", 1);
    objc_msgSend(v7, "setAutoresizesTextToFit:", 1);
    objc_msgSend(v7, "setTextAlignment:", 4);
    objc_msgSend(v7, "setReturnKeyType:", 9);
    objc_msgSend(v7, "setClearButtonMode:", 3);
    objc_msgSend(v7, "setPlaceholder:", v6);
    objc_msgSend(v5, "setControllerDelegate:", self);

  }
  return v5;
}

- (id)_editedDeviceName
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "firstResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)effectiveSettingsChangedNotificationObserver
{
  return self->_effectiveSettingsChangedNotificationObserver;
}

- (void)setEffectiveSettingsChangedNotificationObserver:(id)a3
{
  objc_storeStrong(&self->_effectiveSettingsChangedNotificationObserver, a3);
}

- (NSString)originalDeviceName
{
  return self->_originalDeviceName;
}

- (void)setOriginalDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_originalDeviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalDeviceName, 0);
  objc_storeStrong(&self->_effectiveSettingsChangedNotificationObserver, 0);
}

@end
