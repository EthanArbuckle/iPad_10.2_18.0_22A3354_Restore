@implementation STIntroDowntimeViewController

- (STIntroDowntimeViewController)initWithIntroductionModel:(id)a3 continueHandler:(id)a4
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
  STIntroDowntimeViewController *v15;
  STIntroductionViewModel *model;
  STIntroductionViewModel *v17;
  uint64_t v18;
  id continueHandler;
  objc_super v21;

  v6 = (STIntroductionViewModel *)a3;
  v7 = a4;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("IntroDowntimeTitle"), &stru_24DB8A1D0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("IntroDowntimeDetail"), &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configurationWithHierarchicalColor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("downtime"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21.receiver = self;
  v21.super_class = (Class)STIntroDowntimeViewController;
  v15 = -[OBTableWelcomeController initWithTitle:detailText:icon:](&v21, sel_initWithTitle_detailText_icon_, v9, v10, v14);
  model = v15->_model;
  v15->_model = v6;
  v17 = v6;

  v18 = objc_msgSend(v7, "copy");
  continueHandler = v15->_continueHandler;
  v15->_continueHandler = (id)v18;

  return v15;
}

- (STIntroDowntimeTableViewController)tableViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STIntroDowntimeViewController;
  -[STTableWelcomeController tableViewController](&v3, sel_tableViewController);
  return (STIntroDowntimeTableViewController *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setTableViewController:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STIntroDowntimeViewController.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(tableViewController == nil) || [tableViewController isKindOfClass:[STIntroDowntimeTableViewController class]]"));

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)STIntroDowntimeViewController;
  -[STTableWelcomeController setTableViewController:](&v7, sel_setTableViewController_, v5);

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
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STIntroDowntimeViewController;
  -[OBTableWelcomeController loadView](&v13, sel_loadView);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroDowntimeViewController buttonTray](self, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroDowntimeTurnOnDowntimeButton"), &stru_24DB8A1D0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v6, 0);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__setDowntime_, 0x2000);
  objc_msgSend(v4, "addButton:", v5);
  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroDowntimeSetUpLaterButton"), &stru_24DB8A1D0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__notNow_, 0x2000);
  objc_msgSend(v4, "addButton:", v7);
  v9 = (void *)MEMORY[0x24BEBD9A0];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storyboardWithName:bundle:", CFSTR("STIntroDowntimeTableViewController"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "instantiateInitialViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroDowntimeViewController setTableViewController:](self, "setTableViewController:", v12);

}

- (void)_setDowntime:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);
  id v7;

  -[STIntroDowntimeViewController tableViewController](self, "tableViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bedtime");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setDeviceBedtimeEnabled:", 1);
  -[STIntroDowntimeViewController model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBedtime:", v7);

  -[STIntroDowntimeViewController continueHandler](self, "continueHandler");
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v6[2]();

}

- (void)_notNow:(id)a3
{
  void (**v3)(void);

  -[STIntroDowntimeViewController continueHandler](self, "continueHandler", a3);
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

}

- (STIntroductionViewModel)model
{
  return (STIntroductionViewModel *)objc_getProperty(self, a2, 1240, 1);
}

- (id)continueHandler
{
  return objc_getProperty(self, a2, 1248, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
