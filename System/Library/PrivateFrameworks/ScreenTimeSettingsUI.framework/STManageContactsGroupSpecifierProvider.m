@implementation STManageContactsGroupSpecifierProvider

- (STManageContactsGroupSpecifierProvider)init
{
  STManageContactsGroupSpecifierProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STManageContactsGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v8, sel_init);
  v3 = (void *)MEMORY[0x24BE75590];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ManageContactsGroupSpecifierName"), &stru_24DB8A1D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider setGroupSpecifier:](v2, "setGroupSpecifier:", v6);

  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits"));
  v6.receiver = self;
  v6.super_class = (Class)STManageContactsGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits"), 5, "KVOContextManageContactsGroupSpecifierProvider");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a5;
  if (a6 == "KVOContextManageContactsGroupSpecifierProvider")
  {
    v12 = a3;
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");

    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("contentPrivacyCoordinator.viewModel.communicationLimits"));
    if (v13)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STManageContactsGroupSpecifierProvider _communicationLimitsDidChange:](self, "_communicationLimitsDidChange:", v14);

    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STManageContactsGroupSpecifierProvider;
    v11 = a3;
    -[STManageContactsGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v11, a4, v10, a6);

  }
}

- (void)_communicationLimitsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "me");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "contactManagementState");
  if (v7 == 1 && objc_msgSend(v19, "isChild"))
    v8 = objc_msgSend(v19, "isRemoteUser");
  else
    v8 = 1;
  -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", v8);
  -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[STGroupSpecifierProvider isHidden](self, "isHidden"))
  {
    -[STManageContactsGroupSpecifierProvider manageContactsRequestSpecifier](self, "manageContactsRequestSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "containsObject:", v10);

    if ((v11 & 1) == 0)
    {
      +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ManageContactsRequestSpecifierName"), &stru_24DB8A1D0, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, 0, 0, 2, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
      objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CommunicationLimitsSpecifierName"), &stru_24DB8A1D0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE75D28]);

      objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "roundedImageForImageWithName:", CFSTR("Communication"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, *MEMORY[0x24BE75AC8]);

      objc_msgSend(v15, "setControllerLoadAction:", sel__showManageContactsRequestAlert_);
      -[STManageContactsGroupSpecifierProvider setManageContactsRequestSpecifier:](self, "setManageContactsRequestSpecifier:", v15);
      objc_msgSend(v9, "addObject:", v15);

    }
  }

}

- (void)_showManageContactsRequestAlert:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ManageContactsRequestAlertMessage"), &stru_24DB8A1D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sf_isiPad");

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", 0, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ManageContactsRequestApprove"), &stru_24DB8A1D0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __74__STManageContactsGroupSpecifierProvider__showManageContactsRequestAlert___block_invoke;
  v17[3] = &unk_24DB86C88;
  v17[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v9, 0, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v11);

  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ManageContactsRequestDontApprove"), &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __74__STManageContactsGroupSpecifierProvider__showManageContactsRequestAlert___block_invoke_2;
  v16[3] = &unk_24DB86C88;
  v16[4] = self;
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v12, 2, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v13);

  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ConfirmationButtonCancel"), &stru_24DB8A1D0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3A8], "actionWithTitle:style:handler:", v14, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v15);

  -[STGroupSpecifierProvider presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

uint64_t __74__STManageContactsGroupSpecifierProvider__showManageContactsRequestAlert___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContactManagementState:", 2);
}

uint64_t __74__STManageContactsGroupSpecifierProvider__showManageContactsRequestAlert___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContactManagementState:", 0);
}

- (void)_updateContactManagementState:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentPrivacyCoordinator");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "communicationLimits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setContactManagementState:", a3);
  objc_msgSend(v7, "saveCommunicationLimits:completionHandler:", v6, 0);

}

- (PSSpecifier)manageContactsRequestSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 48, 1);
}

- (void)setManageContactsRequestSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manageContactsRequestSpecifier, 0);
}

@end
