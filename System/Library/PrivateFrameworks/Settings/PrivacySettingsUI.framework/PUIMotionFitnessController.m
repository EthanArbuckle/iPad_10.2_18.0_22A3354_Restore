@implementation PUIMotionFitnessController

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  SRRelatedSettingsProvider *v16;
  SRRelatedSettingsProvider *sensorKitSpecifiersProvider;
  void *v18;
  void *v19;
  objc_class *v20;
  objc_super v22;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = -[PUIMotionFitnessController isFitnessTrackingEnabledFromTCC](self, "isFitnessTrackingEnabledFromTCC");
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D80868];
    objc_msgSend(v6, "setProperty:forKey:", CFSTR("FITNESS_TRACKING_GROUP"), *MEMORY[0x1E0D80868]);
    PUI_LocalizedStringForPrivacy(CFSTR("FITNESS_TRACKING_PRIVACY"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v8, *MEMORY[0x1E0D80848]);

    v9 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForPrivacy(CFSTR("FITNESS_TRACKING"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, sel_setFitnessTrackingEnabled_forSpecifier_, sel_isFitnessTrackingEnabled_, 0, 6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setProperty:forKey:", CFSTR("FITNESS_TRACKING_MASTER"), v7);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProperty:forKey:", v12, *MEMORY[0x1E0D80990]);

    if (v5)
    {
      v22.receiver = self;
      v22.super_class = (Class)PUIMotionFitnessController;
      -[PUITCCAccessController specifiers](&v22, sel_specifiers);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        -[PUIMotionFitnessController specifiers].cold.1();
      objc_msgSend(v13, "insertObject:atIndex:", v6, 0);
      objc_msgSend(v13, "insertObject:atIndex:", v11, 1);
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "sf_isiPhone");

      if (v15)
      {
        -[PUIMotionFitnessController loadSensorKitSpecifiersProvider](self, "loadSensorKitSpecifiersProvider");
        v16 = (SRRelatedSettingsProvider *)objc_claimAutoreleasedReturnValue();
        sensorKitSpecifiersProvider = self->_sensorKitSpecifiersProvider;
        self->_sensorKitSpecifiersProvider = v16;

        -[SRRelatedSettingsProvider specifiersForRelatedSettings:](self->_sensorKitSpecifiersProvider, "specifiersForRelatedSettings:", CFSTR("Motion"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v13, "addObjectsFromArray:", v18);

      }
      v19 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v13;
    }
    else
    {
      v20 = (objc_class *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v6, v11, 0);
      v19 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
      *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v20;
    }

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIMotionFitnessController;
  -[PUITCCAccessController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUIMotionFitnessController provideNavigationDonations](self, "provideNavigationDonations");
}

- (void)provideNavigationDonations
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("MOTION"), CFSTR("Privacy"), v6, v4);

  v8 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKey:table:locale:bundleURL:", CFSTR("PRIVACY"), CFSTR("Privacy"), v9, v4);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/MOTION"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIMotionFitnessController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.motion-and-fitness"), v7, v11, v12);

}

- (id)loadSensorKitSpecifiersProvider
{
  void *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  id v7;

  PSBundlePathForPreferenceBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (v5 = (objc_class *)objc_msgSend(v3, "classNamed:", CFSTR("SRRelatedSpecifiers"))) != 0)
  {
    v6 = objc_alloc_init(v5);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x1E0D80990]);
}

- (id)_appSpecifiers
{
  uint64_t v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = (objc_class *)*(id *)((char *)&self->super.super.super.super.super.super.isa + v3);
  v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = 0;

  v9.receiver = self;
  v9.super_class = (Class)PUIMotionFitnessController;
  -[PUITCCAccessController specifiers](&v9, sel_specifiers);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = v4;

  return v6;
}

- (BOOL)isFitnessTrackingEnabledFromTCC
{
  void *v2;
  int Override;
  NSObject *v4;
  uint8_t v6[15];
  char v7;

  v7 = 0;
  -[PUITCCAccessController serviceKey](self, "serviceKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  Override = TCCAccessGetOverride();

  if (!Override)
  {
    _PUILoggingFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1DB1FB000, v4, OS_LOG_TYPE_DEFAULT, "### Failed to get Fitness Tracking override value", v6, 2u);
    }

  }
  return v7 == 0;
}

- (id)isFitnessTrackingEnabled:(id)a3
{
  return (id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x1E0D80990]);
}

- (void)setFitnessTrackingEnabled:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  uint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0D80990];
  objc_msgSend(v7, "propertyForKey:", *MEMORY[0x1E0D80990]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", v9) & 1) == 0)
  {
    v10 = objc_msgSend(v6, "BOOLValue");
    _PUILoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315394;
      v20 = "-[PUIMotionFitnessController setFitnessTrackingEnabled:forSpecifier:]";
      v21 = 1024;
      v22 = v10;
      _os_log_impl(&dword_1DB1FB000, v11, OS_LOG_TYPE_DEFAULT, "%s - enable: %d", (uint8_t *)&v19, 0x12u);
    }

    -[PUITCCAccessController serviceKey](self, "serviceKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = TCCAccessSetOverride();

    if (v13)
    {
      objc_msgSend(v7, "setProperty:forKey:", v6, v8);
      if (v10)
      {
        -[PUIMotionFitnessController _appSpecifiers](self, "_appSpecifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUIMotionFitnessController insertContiguousSpecifiers:afterSpecifier:animated:](self, "insertContiguousSpecifiers:afterSpecifier:animated:", v14, v7, 1);
      }
      else
      {
        v18 = -[PUIMotionFitnessController indexOfSpecifier:](self, "indexOfSpecifier:", v7) + 1;
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]), "subarrayWithRange:", v18, objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]), "count")- v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUIMotionFitnessController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v14, 1);
      }
      goto LABEL_15;
    }
    _PUILoggingFacility();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if ((v10 & 1) != 0)
    {
      if (v16)
      {
        LOWORD(v19) = 0;
        v17 = "### Failed to remove Fitness Tracking override";
LABEL_13:
        _os_log_impl(&dword_1DB1FB000, v15, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v19, 2u);
      }
    }
    else if (v16)
    {
      LOWORD(v19) = 0;
      v17 = "### Failed to override Fitness Tracking";
      goto LABEL_13;
    }

    objc_msgSend(v7, "propertyForKey:", *MEMORY[0x1E0D807D0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setOn:animated:", objc_msgSend(v9, "BOOLValue"), 1);
LABEL_15:

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensorKitSpecifiersProvider, 0);
}

- (void)specifiers
{
  __assert_rtn("-[PUIMotionFitnessController specifiers]", "PUIMotionFitnessController.m", 53, "[specifiers isKindOfClass:[NSMutableArray class]]");
}

@end
