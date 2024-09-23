@implementation STWebFilterItemDetailController

- (STWebFilterItemDetailController)init
{
  STWebFilterItemDetailController *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STWebFilterItemDetailController;
  v2 = -[STWebFilterItemDetailController init](&v7, sel_init);
  if (v2)
  {
    +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddWebsiteLabel"), &stru_24DB8A1D0, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[STWebFilterItemDetailController setTitle:](v2, "setTitle:", v5);

  }
  return v2;
}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  objc_class *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v23[2];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddWebsiteLabel"), &stru_24DB8A1D0, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupSpecifierWithID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[STWebFilterItemDetailController isNamedSite](self, "isNamedSite");
  if (v8)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TitleLabel"), &stru_24DB8A1D0, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE755F0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, sel_setPageTitle_, sel_pageTitle, 0, 8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TitlePlaceholderText"), &stru_24DB8A1D0, v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPlaceholder:", v11);

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("URLLabel"), &stru_24DB8A1D0, v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE755F0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, self, sel_setPageURL_, sel_pageURL, 0, 8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("URLPlaceholderText"), &stru_24DB8A1D0, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPlaceholder:", v14);

  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A08]);
  if (v8)
  {
    v24[0] = v7;
    v24[1] = v10;
    v24[2] = v13;
    v15 = (void *)MEMORY[0x24BDBCE30];
    v16 = v24;
    v17 = 3;
  }
  else
  {
    v23[0] = v7;
    v23[1] = v13;
    v15 = (void *)MEMORY[0x24BDBCE30];
    v16 = v23;
    v17 = 2;
  }
  objc_msgSend(v15, "arrayWithObjects:count:", v16, v17);
  v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v19 = (int)*MEMORY[0x24BE756E0];
  v20 = *(Class *)((char *)&self->super.super.super.super.super.isa + v19);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v19) = v18;

  v21 = *(id *)((char *)&self->super.super.super.super.super.isa + v19);
  return v21;
}

- (void)saveFilterItem
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[STWebFilterItemDetailController restriction](self, "restriction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STWebFilterItemDetailController.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.restriction"));

  }
  -[STWebFilterItemDetailController pageURL](self, "pageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    +[STUILog contentPrivacy](STUILog, "contentPrivacy");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[STWebFilterItemDetailController pageURL](self, "pageURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[STWebFilterItemDetailController pageTitle](self, "pageTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v8;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_219AB4000, v7, OS_LOG_TYPE_DEFAULT, "Going to save URL '%@' title '%@'", buf, 0x16u);

    }
    -[STWebFilterItemDetailController coordinator](self, "coordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "valuesByRestriction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[STWebFilterItemDetailController restriction](self, "restriction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      -[STWebFilterItemDetailController restriction](self, "restriction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "defaultValueForRestriction:", v17);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (-[STWebFilterItemDetailController isNamedSite](self, "isNamedSite"))
    {
      v18 = (void *)MEMORY[0x24BE190C0];
      v19 = v16;
      -[STWebFilterItemDetailController pageURL](self, "pageURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[STWebFilterItemDetailController pageTitle](self, "pageTitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "length"))
        -[STWebFilterItemDetailController pageTitle](self, "pageTitle");
      else
        -[STWebFilterItemDetailController pageURL](self, "pageURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "buildWithAddress:withPageTitle:", v20, v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = v16;
      -[STWebFilterItemDetailController pageURL](self, "pageURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "arrayByAddingObject:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[STWebFilterItemDetailController coordinator](self, "coordinator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[STWebFilterItemDetailController restriction](self, "restriction");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __49__STWebFilterItemDetailController_saveFilterItem__block_invoke;
    v29[3] = &unk_24DB866E0;
    v29[4] = self;
    objc_msgSend(v26, "saveRestrictionValue:forItem:completionHandler:", v25, v27, v29);

  }
}

void __49__STWebFilterItemDetailController_saveFilterItem__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "parentWebFilterController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_reloadSpecifiers, 0, 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  id WeakRetained;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STWebFilterItemDetailController;
  -[STWebFilterItemDetailController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE75790]));
  -[STWebFilterItemDetailController setParentWebFilterController:](self, "setParentWebFilterController:", WeakRetained);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STWebFilterItemDetailController.viewDidAppear", v5, 2u);
  }
}

- (void)willResignActive
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STWebFilterItemDetailController;
  -[STWebFilterItemDetailController willResignActive](&v4, sel_willResignActive);
  -[STWebFilterItemDetailController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 0);

  -[STWebFilterItemDetailController saveFilterItem](self, "saveFilterItem");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STWebFilterItemDetailController;
  -[STWebFilterItemDetailController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[STWebFilterItemDetailController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 0);

  -[STWebFilterItemDetailController saveFilterItem](self, "saveFilterItem");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STWebFilterItemDetailController.viewWillDisappear", v5, 2u);
  }
}

- (BOOL)shouldSelectResponderOnAppearance
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)STWebFilterItemDetailController;
  -[STWebFilterItemDetailController tableView:cellForRowAtIndexPath:](&v18, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TitleLabel"), &stru_24DB8A1D0, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  if (v11)
  {
    objc_msgSend(v5, "editableTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAutocapitalizationType:", 1);
    objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);
LABEL_5:
    objc_msgSend(v12, "setClearButtonMode:", 1);
    objc_msgSend(v5, "setControllerDelegate:", self);

    goto LABEL_6;
  }
  objc_msgSend(v5, "specifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("URLLabel"), &stru_24DB8A1D0, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if (v16)
  {
    objc_msgSend(v5, "editableTextField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAutocapitalizationType:", 0);
    objc_msgSend(v12, "setAutocorrectionType:", 1);
    objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v12, "setKeyboardType:", 3);
    objc_msgSend(v12, "setReturnKeyType:", 9);
    goto LABEL_5;
  }
LABEL_6:

  return v5;
}

- (STRestrictionItem)restriction
{
  return self->_restriction;
}

- (void)setRestriction:(id)a3
{
  objc_storeStrong((id *)&self->_restriction, a3);
}

- (BOOL)isNamedSite
{
  return self->_isNamedSite;
}

- (void)setIsNamedSite:(BOOL)a3
{
  self->_isNamedSite = a3;
}

- (NSString)pageURL
{
  return self->_pageURL;
}

- (void)setPageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1392);
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (void)setPageTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1400);
}

- (STContentPrivacyViewModelCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (STWebFilterDetailController)parentWebFilterController
{
  return (STWebFilterDetailController *)objc_loadWeakRetained((id *)&self->_parentWebFilterController);
}

- (void)setParentWebFilterController:(id)a3
{
  objc_storeWeak((id *)&self->_parentWebFilterController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentWebFilterController);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_restriction, 0);
}

@end
