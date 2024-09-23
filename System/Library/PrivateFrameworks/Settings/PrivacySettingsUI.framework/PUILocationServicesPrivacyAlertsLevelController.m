@implementation PUILocationServicesPrivacyAlertsLevelController

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUILocationServicesPrivacyAlertsLevelController;
  -[PUILocationServicesPrivacyAlertsLevelController viewDidLoad](&v4, sel_viewDidLoad);
  PUI_LocalizedStringForLocationServices(CFSTR("PRIVACY_ALERTS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUILocationServicesPrivacyAlertsLevelController setTitle:](self, "setTitle:", v3);

}

- (id)authorizationPromptMapDisplayEnabled:(id)a3
{
  NSNumber *authorizationPromptMapDisplayEnabled;
  NSNumber *v5;
  NSNumber *v6;

  authorizationPromptMapDisplayEnabled = self->_authorizationPromptMapDisplayEnabled;
  if (!authorizationPromptMapDisplayEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(getCLLocationManagerClass_0(), "authorizationPromptMapDisplayEnabled"));
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v6 = self->_authorizationPromptMapDisplayEnabled;
    self->_authorizationPromptMapDisplayEnabled = v5;

    authorizationPromptMapDisplayEnabled = self->_authorizationPromptMapDisplayEnabled;
  }
  return authorizationPromptMapDisplayEnabled;
}

- (void)setAuthorizationPromptMapDisplayEnabled:(id)a3 specifier:(id)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_storeStrong((id *)&self->_authorizationPromptMapDisplayEnabled, a3);
  v7 = objc_msgSend(v6, "BOOLValue");
  _PUILoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[PUILocationServicesPrivacyAlertsLevelController setAuthorizationPromptMapDisplayEnabled:specifier:]";
    v13 = 1024;
    v14 = v7;
    _os_log_impl(&dword_1DB1FB000, v8, OS_LOG_TYPE_DEFAULT, "%s - enable: %d", (uint8_t *)&v11, 0x12u);
  }

  if ((_DWORD)v7 == objc_msgSend(getCLLocationManagerClass_0(), "authorizationPromptMapDisplayEnabled"))
  {
    _PUILoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[PUILocationServicesPrivacyAlertsLevelController setAuthorizationPromptMapDisplayEnabled:specifier:]";
      _os_log_impl(&dword_1DB1FB000, v10, OS_LOG_TYPE_DEFAULT, "%s - authorization prompt map display already enabled.", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    v9 = (id)objc_msgSend(getCLLocationManagerClass_0(), "setAuthorizationPromptMapDisplayEnabled:", v7);
  }

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForLocationServices(CFSTR("MAP_DISPLAY"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, sel_setAuthorizationPromptMapDisplayEnabled_specifier_, sel_authorizationPromptMapDisplayEnabled_, 0, 6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);
    objc_msgSend(v5, "addObject:", v8);
    v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationPromptMapDisplayEnabled, 0);
}

@end
