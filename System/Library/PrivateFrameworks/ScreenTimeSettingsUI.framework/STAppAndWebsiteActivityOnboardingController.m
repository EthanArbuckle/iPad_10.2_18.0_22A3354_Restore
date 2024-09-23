@implementation STAppAndWebsiteActivityOnboardingController

- (void)presentOverViewController:(id)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  -[STAppAndWebsiteActivityOnboardingController setCompletionBlock:](self, "setCompletionBlock:", a4);
  -[STAppAndWebsiteActivityOnboardingController _createAppAndWebsiteActivityController](self, "_createAppAndWebsiteActivityController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E420]), "initWithRootViewController:", v7);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (!v10)
    objc_msgSend(v8, "setSupportedInterfaceOrientations:", 2);
  objc_msgSend(v8, "setModalPresentationStyle:", 2);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __89__STAppAndWebsiteActivityOnboardingController_presentOverViewController_completionBlock___block_invoke;
  v12[3] = &unk_24DB86588;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v6, "presentViewController:animated:completion:", v11, 1, v12);

}

uint64_t __89__STAppAndWebsiteActivityOnboardingController_presentOverViewController_completionBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNavigationController:", *(_QWORD *)(a1 + 40));
}

- (id)_createAppAndWebsiteActivityController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AppAndWebsiteActivityEDUFeatureTitle"), &stru_24DB8A1D0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AppAndWebsiteActivityEDUFeatureDetails"), &stru_24DB8A1D0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithHierarchicalColor:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("person.badge.hourglass.fill"), v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E458]), "initWithTitle:detailText:icon:", v20, v19, v17);
  objc_msgSend(MEMORY[0x24BEBD660], "configurationPreferringMonochrome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("chart.line.uptrend.xyaxis"), v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("downtime"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("hourglass"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AppAndWebsiteActivityEDUWeeklyReportsTitle"), &stru_24DB8A1D0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AppAndWebsiteActivityEDUWeeklyReportsDetail"), &stru_24DB8A1D0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addBulletedListItemWithTitle:description:image:", v15, v14, v16);
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AppAndWebsiteActivityEDUDowntimeTitle"), &stru_24DB8A1D0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AppAndWebsiteActivityEDUDowntimeDetail"), &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addBulletedListItemWithTitle:description:image:", v9, v10, v7);
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AppAndWebsiteActivityEDUAppLimitsTitle"), &stru_24DB8A1D0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("AppAndWebsiteActivityEDUAppLimitsDetail"), &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addBulletedListItemWithTitle:description:image:", v11, v12, v8);
  -[STAppAndWebsiteActivityOnboardingController _addTrayButtonToWelcomeController:localizationKey:action:isBold:](self, "_addTrayButtonToWelcomeController:localizationKey:action:isBold:", v5, CFSTR("AppAndWebsiteActivityEDUTurnOnButton"), sel__turnOnAppAndWebsiteActivitySelected, 1);
  -[STAppAndWebsiteActivityOnboardingController _addTrayButtonToWelcomeController:localizationKey:action:isBold:](self, "_addTrayButtonToWelcomeController:localizationKey:action:isBold:", v5, CFSTR("AppAndWebsiteActivityEDUNotNowButton"), sel__notNowSelected, 0);

  return v5;
}

- (void)_turnOnAppAndWebsiteActivitySelected
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  -[STAppAndWebsiteActivityOnboardingController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  -[STAppAndWebsiteActivityOnboardingController completionBlock](self, "completionBlock");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v4[2](v4, 1);
    v4 = (void (**)(_QWORD, _QWORD))v5;
  }

}

- (void)_notNowSelected
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  -[STAppAndWebsiteActivityOnboardingController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  -[STAppAndWebsiteActivityOnboardingController completionBlock](self, "completionBlock");
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    v4[2](v4, 0);
    v4 = (void (**)(_QWORD, _QWORD))v5;
  }

}

- (void)_addTrayButtonToWelcomeController:(id)a3 localizationKey:(id)a4 action:(SEL)a5 isBold:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v10 = a4;
  v11 = a3;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (a6)
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  else
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", v10, &stru_24DB8A1D0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setTitle:forState:", v13, 0);
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, a5, 0x2000);
  objc_msgSend(v11, "buttonTray");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addButton:", v12);
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNavigationController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
