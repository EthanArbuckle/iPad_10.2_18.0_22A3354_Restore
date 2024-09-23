@implementation STIntroIdentityViewController

- (STIntroIdentityViewController)initWithIntroductionModel:(id)a3 continueHandler:(id)a4
{
  STIntroductionViewModel *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  STIntroIdentityViewController *v17;
  STIntroductionViewModel *model;
  STIntroductionViewModel *v19;
  uint64_t v20;
  id continueHandler;
  objc_super v23;

  v6 = (STIntroductionViewModel *)a3;
  v7 = a4;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("IntroIdentityTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("IntroIdentityDetail"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v11, &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configurationWithHierarchicalColor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("person.2.fill"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)STIntroIdentityViewController;
  v17 = -[STIntroIdentityViewController initWithTitle:detailText:icon:contentLayout:](&v23, sel_initWithTitle_detailText_icon_contentLayout_, v10, v12, v16, 2);
  model = v17->_model;
  v17->_model = v6;
  v19 = v6;

  v20 = objc_msgSend(v7, "copy");
  continueHandler = v17->_continueHandler;
  v17->_continueHandler = (id)v20;

  return v17;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STIntroIdentityViewController;
  -[OBBaseWelcomeController loadView](&v11, sel_loadView);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroIdentityViewController buttonTray](self, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("IntroIdentityButtonMyDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v6, &stru_24DB8A1D0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setTitle:forState:", v7, 0);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__myDevice_, 0x2000);
  objc_msgSend(v4, "addButton:", v5);
  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("IntroIdentityButtonMyChildsDevice"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v9, &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTitle:forState:", v10, 0);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__myChildsDevice_, 0x2000);
  objc_msgSend(v4, "addButton:", v8);

}

- (void)_myDevice:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[STIntroIdentityViewController model](self, "model", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceForChild:", 0);

  -[STIntroIdentityViewController continueHandler](self, "continueHandler");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();

}

- (void)_myChildsDevice:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[STIntroIdentityViewController model](self, "model", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceForChild:", 1);

  -[STIntroIdentityViewController continueHandler](self, "continueHandler");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();

}

- (STIntroductionViewModel)model
{
  return (STIntroductionViewModel *)objc_getProperty(self, a2, 1176, 1);
}

- (id)continueHandler
{
  return objc_getProperty(self, a2, 1184, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
