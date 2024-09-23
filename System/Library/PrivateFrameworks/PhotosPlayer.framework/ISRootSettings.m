@implementation ISRootSettings

- (ISVitalitySettings)vitalitySettings
{
  return self->_vitalitySettings;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__ISRootSettings_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2453 != -1)
    dispatch_once(&sharedInstance_onceToken_2453, block);
  return (id)sharedInstance_sharedInstance;
}

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISRootSettings;
  -[PTSettings setDefaultValues](&v6, sel_setDefaultValues);
  -[ISRootSettings playerSettings](self, "playerSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

  -[ISRootSettings vitalitySettings](self, "vitalitySettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultValues");

  -[ISRootSettings performanceDiagnosticsSettings](self, "performanceDiagnosticsSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDefaultValues");

}

- (void)save
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("SettingsVersionKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("SettingsArchiveKey");
  v9[0] = v3;
  -[PTSettings archiveDictionary](self, "archiveDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultsKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v5, v7);

}

- (ISPlayerSettings)playerSettings
{
  return self->_playerSettings;
}

- (void)setPlayerSettings:(id)a3
{
  objc_storeStrong((id *)&self->_playerSettings, a3);
}

- (void)setVitalitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_vitalitySettings, a3);
}

- (ISPerformanceDiagnosticsSettings)performanceDiagnosticsSettings
{
  return self->_performanceDiagnosticsSettings;
}

- (void)setPerformanceDiagnosticsSettings:(id)a3
{
  objc_storeStrong((id *)&self->_performanceDiagnosticsSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceDiagnosticsSettings, 0);
  objc_storeStrong((id *)&self->_vitalitySettings, 0);
  objc_storeStrong((id *)&self->_playerSettings, 0);
}

+ (id)settingsControllerModule
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  void *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Player"), CFSTR("playerSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Vitality"), CFSTR("vitalitySettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v4;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Performance Diagnostics"), CFSTR("performanceDiagnosticsSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83078];
  v9 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:action:", CFSTR("Restore All Defaults"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionWithRows:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83078];
  v18[0] = v7;
  v18[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("PhotosPlayer"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __32__ISRootSettings_sharedInstance__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  ISRootSettings *v10;
  void *v11;

  if (PFOSVariantHasInternalUI())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_defaultsKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SettingsVersionKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "integerValue") == 12)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SettingsArchiveKey"));
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        objc_msgSend(*(id *)(a1 + 32), "settingsFromArchiveDictionary:", v6);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)sharedInstance_sharedInstance;
        sharedInstance_sharedInstance = v8;

      }
    }

  }
  if (!sharedInstance_sharedInstance)
  {
    v10 = -[PTSettings initWithDefaultValues]([ISRootSettings alloc], "initWithDefaultValues");
    v11 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v10;

  }
}

@end
