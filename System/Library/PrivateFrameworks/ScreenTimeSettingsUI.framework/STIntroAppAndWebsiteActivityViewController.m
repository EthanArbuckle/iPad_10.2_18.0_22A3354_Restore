@implementation STIntroAppAndWebsiteActivityViewController

- (STIntroAppAndWebsiteActivityViewController)initWithIntroductionModel:(id)a3 childName:(id)a4 continueHandler:(id)a5
{
  STIntroductionViewModel *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  STIntroAppAndWebsiteActivityViewController *v24;
  STIntroductionViewModel *model;
  STIntroductionViewModel *v26;
  uint64_t v27;
  id continueHandler;
  objc_super v30;

  v8 = (STIntroductionViewModel *)a3;
  v9 = a4;
  v10 = a5;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("IntroAppAndWebsiteActivityTitleChild"), &stru_24DB8A1D0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithFormat:locale:", v12, v14, v9);

    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("IntroAppAndWebsiteActivityDetailChild"), &stru_24DB8A1D0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithFormat:locale:", v16, v18, v9);

  }
  else
  {
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("IntroAppAndWebsiteActivityTitleGenericChild"), &stru_24DB8A1D0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("IntroAppAndWebsiteActivityDetailGenericChild"), &stru_24DB8A1D0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "configurationWithHierarchicalColor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("person.badge.hourglass.fill"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30.receiver = self;
  v30.super_class = (Class)STIntroAppAndWebsiteActivityViewController;
  v24 = -[STIntroAppAndWebsiteActivityViewController initWithTitle:detailText:icon:contentLayout:](&v30, sel_initWithTitle_detailText_icon_contentLayout_, v15, v19, v23, 2);
  model = v24->_model;
  v24->_model = v8;
  v26 = v8;

  v27 = objc_msgSend(v10, "copy");
  continueHandler = v24->_continueHandler;
  v24->_continueHandler = (id)v27;

  return v24;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)STIntroAppAndWebsiteActivityViewController;
  -[OBBaseWelcomeController loadView](&v19, sel_loadView);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationPreferringMonochrome");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("chart.line.uptrend.xyaxis"), v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("downtime"), v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("hourglass"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroAppAndWebsiteActivityScreenTimeInsightsTitle"), &stru_24DB8A1D0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroAppAndWebsiteActivityScreenTimeInsightsDetail"), &stru_24DB8A1D0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroAppAndWebsiteActivityViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v17, v16, v18);
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroAppAndWebsiteActivityScheduledDowntimeTitle"), &stru_24DB8A1D0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroAppAndWebsiteActivityScheduledDowntimeDetail"), &stru_24DB8A1D0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroAppAndWebsiteActivityViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v14, v13, v15);
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroAppAndWebsiteActivityAppLimitsTitle"), &stru_24DB8A1D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroAppAndWebsiteActivityAppLimitsDetail"), &stru_24DB8A1D0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroAppAndWebsiteActivityViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v5, v6, v12);
  -[STIntroAppAndWebsiteActivityViewController buttonTray](self, "buttonTray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroAppAndWebsiteActivityTurnOnButton"), &stru_24DB8A1D0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:forState:", v9, 0);
  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel__turnOnAppAndWebsiteActivity_, 0x2000);
  objc_msgSend(v7, "addButton:", v8);
  objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroAppAndWebsiteActivitySetUpLaterButton"), &stru_24DB8A1D0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:forState:", v11, 0);
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__setUpLater_, 0x2000);
  objc_msgSend(v7, "addButton:", v10);

}

- (void)_turnOnAppAndWebsiteActivity:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[STIntroAppAndWebsiteActivityViewController model](self, "model", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppAndWebsiteActivityEnabled:", MEMORY[0x24BDBD1C8]);

  -[STIntroAppAndWebsiteActivityViewController continueHandler](self, "continueHandler");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();

}

- (void)_setUpLater:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[STIntroAppAndWebsiteActivityViewController model](self, "model", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAppAndWebsiteActivityEnabled:", MEMORY[0x24BDBD1C0]);

  -[STIntroAppAndWebsiteActivityViewController continueHandler](self, "continueHandler");
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
