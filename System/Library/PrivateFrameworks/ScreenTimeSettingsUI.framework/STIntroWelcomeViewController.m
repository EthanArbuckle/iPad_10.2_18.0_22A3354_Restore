@implementation STIntroWelcomeViewController

- (STIntroWelcomeViewController)initWithChildName:(id)a3 forceParentalControls:(BOOL)a4 continueHandler:(id)a5 endHandler:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  STIntroWelcomeViewController *v24;
  uint64_t v25;
  NSString *childName;
  uint64_t v27;
  id continueHandler;
  uint64_t v29;
  id endHandler;
  objc_super v32;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  v12 = a5;
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v8)
  {
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("IntroWelcomeTitle"), &stru_24DB8A1D0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("AADC_IntroWelcomeDetail");
    v19 = v14;
LABEL_6:
    objc_msgSend(v19, "localizedStringForKey:value:table:", v18, &stru_24DB8A1D0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("IntroWelcomeTitleChild"), &stru_24DB8A1D0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {
    v18 = CFSTR("AADC_IntroWelcomeDetailGenericChild");
    v19 = v14;
    goto LABEL_6;
  }
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AADC_IntroWelcomeDetailChild"), &stru_24DB8A1D0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@ %@"), 0, v10, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v20 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBD4B8], "tintColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "configurationWithHierarchicalColor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("hourglass"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32.receiver = self;
  v32.super_class = (Class)STIntroWelcomeViewController;
  v24 = -[STIntroWelcomeViewController initWithTitle:detailText:icon:contentLayout:](&v32, sel_initWithTitle_detailText_icon_contentLayout_, v15, v17, v23, 2);
  v25 = objc_msgSend(v10, "copy");
  childName = v24->_childName;
  v24->_childName = (NSString *)v25;

  v24->_forceParentalControls = v8;
  v27 = objc_msgSend(v12, "copy");

  continueHandler = v24->_continueHandler;
  v24->_continueHandler = (id)v27;

  v29 = objc_msgSend(v11, "copy");
  endHandler = v24->_endHandler;
  v24->_endHandler = (id)v29;

  return v24;
}

- (void)loadView
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)STIntroWelcomeViewController;
  -[OBBaseWelcomeController loadView](&v29, sel_loadView);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD660], "configurationPreferringMonochrome");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("chart.bar.xaxis"), v4);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("figure.and.child.holdinghands"), v4);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("downtime"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroWelcomeContentPrivacyTitle"), &stru_24DB8A1D0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroWelcomeContentPrivacyDetail"), &stru_24DB8A1D0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v8;
  v28 = (void *)v6;
  -[STIntroWelcomeViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v8);
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroWelcomeWeeklyReportsTitle"), &stru_24DB8A1D0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[STIntroWelcomeViewController forceParentalControls](self, "forceParentalControls"))
  {
    v18 = CFSTR("IntroWelcomeWeeklyReportsDetail");
LABEL_6:
    objc_msgSend(v3, "localizedStringForKey:value:table:", v18, &stru_24DB8A1D0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[STIntroWelcomeViewController childName](self, "childName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (!v11)
  {
    v18 = CFSTR("IntroWelcomeWeeklyReportsDetailGenericChild");
    goto LABEL_6;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroWelcomeWeeklyReportsDetailChild"), &stru_24DB8A1D0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v24 = v9;
  v14 = v5;
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroWelcomeViewController childName](self, "childName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithFormat:locale:", v12, v15, v16);

  v5 = v14;
  v9 = v24;

LABEL_7:
  v25 = (void *)v5;
  -[STIntroWelcomeViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v9, v17, v5);
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroWelcomeDowntimeTitle"), &stru_24DB8A1D0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroWelcomeDowntimeDetail"), &stru_24DB8A1D0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[STIntroWelcomeViewController addBulletedListItemWithTitle:description:image:](self, "addBulletedListItemWithTitle:description:image:", v19, v20, v7);
  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("IntroButtonTurnOnScreenTime"), &stru_24DB8A1D0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTitle:forState:", v22, 0);
  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel__turnOnScreenTime_, 0x2000);
  -[STIntroWelcomeViewController buttonTray](self, "buttonTray");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addButton:", v21);

}

- (void)_turnOnScreenTime:(id)a3
{
  void (**v3)(void);

  -[STIntroWelcomeViewController continueHandler](self, "continueHandler", a3);
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();

}

- (NSString)childName
{
  return (NSString *)objc_getProperty(self, a2, 1184, 1);
}

- (BOOL)forceParentalControls
{
  return self->_forceParentalControls;
}

- (id)continueHandler
{
  return objc_getProperty(self, a2, 1192, 1);
}

- (id)endHandler
{
  return objc_getProperty(self, a2, 1200, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_endHandler, 0);
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong((id *)&self->_childName, 0);
}

@end
