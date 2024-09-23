@implementation STIntroCommunicationSafetyViewController

- (STIntroCommunicationSafetyViewController)initWithIntroductionModel:(id)a3 childName:(id)a4 continueHandler:(id)a5
{
  STIntroductionViewModel *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  STIntroCommunicationSafetyViewController *v16;
  STIntroductionViewModel *model;
  STIntroductionViewModel *v18;
  uint64_t v19;
  id continueHandler;
  objc_super v22;

  v7 = (STIntroductionViewModel *)a3;
  v8 = a5;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("IntroCommunicationSafetyTitle"), &stru_24DB8A1D0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CommunicationSafetyEDUFeatureDetails"), &stru_24DB8A1D0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configurationWithHierarchicalColor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("bubble.left.and.exclamationmark.bubble.right.fill"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22.receiver = self;
  v22.super_class = (Class)STIntroCommunicationSafetyViewController;
  v16 = -[STIntroCommunicationSafetyViewController initWithTitle:detailText:icon:contentLayout:](&v22, sel_initWithTitle_detailText_icon_contentLayout_, v10, v11, v15, 2);
  model = v16->_model;
  v16->_model = v7;
  v18 = v7;

  v19 = objc_msgSend(v8, "copy");
  continueHandler = v16->_continueHandler;
  v16->_continueHandler = (id)v19;

  return v16;
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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STIntroCommunicationSafetyViewController;
  -[OBBaseWelcomeController loadView](&v10, sel_loadView);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroCommunicationSafetyViewController buttonTray](self, "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroCommunicationSafetyTurnOnButton"), &stru_24DB8A1D0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:forState:", v6, 0);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__turnOnCommunicationSafety_, 0x2000);
  objc_msgSend(v4, "addButton:", v5);
  objc_msgSend(MEMORY[0x24BE6E400], "accessoryButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroCommunicationSafetyLearnMoreButton"), &stru_24DB8A1D0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:forState:", v8, 0);
  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel__openCommunicationSafetyLearnMoreLink, 64);
  -[STIntroCommunicationSafetyViewController headerView](self, "headerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAccessoryButton:", v7);

}

- (void)_turnOnCommunicationSafety:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[STIntroCommunicationSafetyViewController model](self, "model", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCommunicationSafetyEnabled:", MEMORY[0x24BDBD1C8]);

  -[STIntroCommunicationSafetyViewController continueHandler](self, "continueHandler");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();

}

- (void)_openCommunicationSafetyLearnMoreLink
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/kb/HT212850"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:withOptions:", v2, 0);

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
