@implementation VUIAccountSettingsButtonFactory

+ (id)createLibraryAccountSettingButtonWith:(id)a3
{
  id v3;
  VUIAccountSettingsButton *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (VUIAccountSettingsButton *)v3;
  }
  else
  {
    v4 = -[VUIAccountSettingsButton initWithType:interfaceStyle:]([VUIAccountSettingsButton alloc], "initWithType:interfaceStyle:", 4, 0);
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:", CFSTR("TV.Button.AccountSettings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIAccountSettingsButton setAccessibilityLabel:](v4, "setAccessibilityLabel:", v6);

  }
  -[VUIButton setSelectActionHandler:](v4, "setSelectActionHandler:", &__block_literal_global_8);

  return v4;
}

uint64_t __73__VUIAccountSettingsButtonFactory_createLibraryAccountSettingButtonWith___block_invoke()
{
  +[VUIAccountSettingsButtonFactory recordClickEvent](VUIAccountSettingsButtonFactory, "recordClickEvent");
  return +[VUIAccountSettingsButtonFactory handleAccountSettingButtonSelected](VUIAccountSettingsButtonFactory, "handleAccountSettingButtonSelected");
}

+ (void)handleAccountSettingButtonSelected
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_createAccountSettingsRouterDataSourceWith:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIApplicationRouter handleEvent:targetResponder:appContext:routerDataSource:supplementaryData:extraInfo:](VUIApplicationRouter, "handleEvent:targetResponder:appContext:routerDataSource:supplementaryData:extraInfo:", *MEMORY[0x1E0DB18E8], 0, v4, v5, 0, 0);

}

+ (id)_createAccountSettingsRouterDataSourceWith:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  VUIRouterDataSource *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[3];
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17 = CFSTR("selectEventDataSource");
  v15 = CFSTR("documentDataSource");
  v13[0] = CFSTR("controllerRef");
  v13[1] = CFSTR("documentType");
  v14[0] = CFSTR("AccountSettings");
  v14[1] = CFSTR("default");
  v13[2] = CFSTR("uiConfiguration");
  v11[0] = CFSTR("transitionType");
  v11[1] = CFSTR("viewControllerDocumentId");
  v12[0] = CFSTR("FormSheet");
  v12[1] = CFSTR("AccountSettings");
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[VUIRouterDataSource initWithRouterData:appContext:]([VUIRouterDataSource alloc], "initWithRouterData:appContext:", v8, v4);
  return v9;
}

+ (void)recordClickEvent
{
  void *v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("targetId");
  v4[1] = CFSTR("targetType");
  v5[0] = CFSTR("accountSettings");
  v5[1] = CFSTR("button");
  v4[2] = CFSTR("actionType");
  v5[2] = CFSTR("navigate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordClick:", v2);

}

@end
