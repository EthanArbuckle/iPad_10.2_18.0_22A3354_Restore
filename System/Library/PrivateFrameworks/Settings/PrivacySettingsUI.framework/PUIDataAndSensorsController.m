@implementation PUIDataAndSensorsController

+ (BOOL)shouldShowDataAndSensors
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "sf_isChinaRegionCellularDevice"))
  {
    PUIAllApplicationsSupportingDisclosureReview();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count") != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIDataAndSensorsController;
  -[PUIDataAndSensorsController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUIDataAndSensorsController provideNavigationDonations](self, "provideNavigationDonations");
}

- (void)provideNavigationDonations
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("DATA_AND_SENSORS"), CFSTR("Privacy"), v6, v4);

  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.PrivacyAndSecurity/DATA_AND_SENSORS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIDataAndSensorsController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.privacy"), v7, v8, v9);

}

- (id)specifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  PUIDataAndSensorsController *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]);
  if (!v3)
  {
    v20 = (int)*MEMORY[0x1E0D80590];
    v26 = self;
    v25 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    PUIAllApplicationsSupportingDisclosureReview();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v29;
      v24 = *MEMORY[0x1E0D80808];
      v22 = *MEMORY[0x1E0D808C0];
      v23 = *MEMORY[0x1E0D808D0];
      v21 = *MEMORY[0x1E0D80990];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v29 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v27 = 0;
          objc_msgSend(v9, "findApplicationRecordWithError:", &v27);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v27;
          if (v11)
          {
            _PUILoggingFacility();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v33 = "-[PUIDataAndSensorsController specifiers]";
              v34 = 2112;
              v35 = v9;
              _os_log_error_impl(&dword_1DB1FB000, v12, OS_LOG_TYPE_ERROR, "%s: error fetching app record for app identity: %@", buf, 0x16u);
            }
          }
          else
          {
            v13 = (void *)MEMORY[0x1E0D804E8];
            objc_msgSend(v10, "localizedName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, v26, 0, 0, 0, 2, 0);
            v12 = objc_claimAutoreleasedReturnValue();

            -[NSObject setButtonAction:](v12, "setButtonAction:", sel_appSpecifierWasTapped_);
            v15 = MEMORY[0x1E0C9AAB0];
            -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v24);
            -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v15, v23);
            objc_msgSend(v10, "bundleIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v16, v22);

            -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v9, v21);
            objc_msgSend(v25, "addObject:", v12);
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v6);
    }

    objc_msgSend(v25, "sortUsingComparator:", &__block_literal_global_9);
    v17 = objc_msgSend(v25, "copy");
    v18 = *(Class *)((char *)&v26->super.super.super.super.super.isa + v20);
    *(Class *)((char *)&v26->super.super.super.super.super.isa + v20) = (Class)v17;

    v3 = *(Class *)((char *)&v26->super.super.super.super.super.isa + v20);
  }
  return v3;
}

uint64_t __41__PUIDataAndSensorsController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)appSpecifierWasTapped:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _Unwind_Exception *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D80990]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v6 = getPDUDisclosureReviewViewControllerForApplicationSymbolLoc_ptr;
  v13 = getPDUDisclosureReviewViewControllerForApplicationSymbolLoc_ptr;
  if (!getPDUDisclosureReviewViewControllerForApplicationSymbolLoc_ptr)
  {
    v7 = (void *)PrivacyDisclosureUILibrary();
    v6 = dlsym(v7, "PDUDisclosureReviewViewControllerForApplication");
    v11[3] = (uint64_t)v6;
    getPDUDisclosureReviewViewControllerForApplicationSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
  {
    v9 = (_Unwind_Exception *)__43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  ((void (*)(id))v6)(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUIDataAndSensorsController showController:](self, "showController:", v8, v10);
}

@end
