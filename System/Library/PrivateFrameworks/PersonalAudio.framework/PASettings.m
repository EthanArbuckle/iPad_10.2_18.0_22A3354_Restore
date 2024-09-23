@implementation PASettings

- (BOOL)shouldStoreLocally
{
  return 1;
}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  return (id)*MEMORY[0x1E0DDE1A8];
}

- (BOOL)personalMediaEnabled
{
  return -[PASettings personalMediaEnabledForRouteUID:](self, "personalMediaEnabledForRouteUID:", CFSTR("PAConfigurationWildcard"));
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  return (id)sharedInstance_Settings;
}

- (PAConfiguration)personalMediaConfiguration
{
  return (PAConfiguration *)-[PASettings personalMediaConfigurationForRouteUID:](self, "personalMediaConfigurationForRouteUID:", CFSTR("PAConfigurationWildcard"));
}

void __28__PASettings_sharedInstance__block_invoke()
{
  PASettings *v0;
  void *v1;

  v0 = objc_alloc_init(PASettings);
  v1 = (void *)sharedInstance_Settings;
  sharedInstance_Settings = (uint64_t)v0;

}

- (id)preferenceKeyForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  if (preferenceKeyForSelector__onceToken != -1)
    dispatch_once(&preferenceKeyForSelector__onceToken, &__block_literal_global_18);
  v5 = (void *)preferenceKeyForSelector__SelectorMap;
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PASettings;
    -[HCSettings preferenceKeyForSelector:](&v11, sel_preferenceKeyForSelector_, a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

void __39__PASettings_preferenceKeyForSelector___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  NSStringFromSelector(sel_personalMediaEnabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0DDE360];
  NSStringFromSelector(sel_personalMediaConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_personalMediaDebugMode);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_audiogramConfiguration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_personalMediaAutomationSkipHeadphoneRequirement);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v0, "initWithObjectsAndKeys:", CFSTR("PersonalMediaEnabled"), v8, v1, v2, CFSTR("PersonalMediaDebug"), v3, CFSTR("PersonalMediaAudiogram"), v4, CFSTR("PersonalMediaAutomationSkipHeadphoneRequirementPreference"), v5, 0);
  v7 = (void *)preferenceKeyForSelector__SelectorMap;
  preferenceKeyForSelector__SelectorMap = v6;

}

- (id)keysToSync
{
  if (keysToSync_onceToken != -1)
    dispatch_once(&keysToSync_onceToken, &__block_literal_global_30);
  return (id)keysToSync_KeysToSync;
}

void __24__PASettings_keysToSync__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0DDE360];
  NSStringFromSelector(sel_personalAudioAccommodationTypes);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_personalMediaConfigurationByRouteUID);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_accommodationTypesByRouteUID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithObjects:", v1, v6, v2, v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)keysToSync_KeysToSync;
  keysToSync_KeysToSync = v4;

}

- (void)logMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PASettings logMessage:]", 90, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v10 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (NSDictionary)personalMediaEnabledByRouteUID
{
  return (NSDictionary *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("personalMediaEnabledByRouteUID"), objc_opt_class(), 0);
}

- (void)setPersonalMediaEnabledByRouteUID:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("personalMediaEnabledByRouteUID"));
}

- (NSDictionary)personalMediaConfigurationByRouteUID
{
  return (NSDictionary *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("personalMediaConfigurationByRouteUID"), objc_opt_class(), 0);
}

- (void)setPersonalMediaConfigurationByRouteUID:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("personalMediaConfigurationByRouteUID"));
}

- (NSDictionary)audiogramConfigurationByRouteUID
{
  return (NSDictionary *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("audiogramConfigurationByRouteUID"), objc_opt_class(), 0);
}

- (void)setAudiogramConfigurationByRouteUID:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("audiogramConfigurationByRouteUID"));
}

- (NSDictionary)accommodationTypesByRouteUID
{
  return (NSDictionary *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("accommodationTypesByRouteUID"), objc_opt_class(), 0);
}

- (void)setAccommodationTypesByRouteUID:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("accommodationTypesByRouteUID"));
}

- (unint64_t)currentEnrollmentProgress
{
  return -[HCSettings integerValueForKey:withDefaultValue:](self, "integerValueForKey:withDefaultValue:", CFSTR("currentEnrollmentProgress"), 0);
}

- (void)setCurrentEnrollmentProgress:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("currentEnrollmentProgress"));

}

- (BOOL)configurationCameFromEnrollment
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("configurationCameFromEnrollment"), 0);
}

- (void)setConfigurationCameFromEnrollment:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("configurationCameFromEnrollment"));

}

- (BOOL)configurationCameFromUser
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("configurationCameFromUser"), 0);
}

- (void)setConfigurationCameFromUser:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("configurationCameFromUser"));

}

- (BOOL)shouldUpdateAccessory
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("shouldUpdateAccessory"), 1);
}

- (void)setShouldUpdateAccessory:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("shouldUpdateAccessory"));

}

- (NSDictionary)transparencyCustomized
{
  return (NSDictionary *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("transparencyCustomized"), objc_opt_class(), 0);
}

- (void)setTransparencyCustomized:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("transparencyCustomized"));
}

- (NSDictionary)transparencyAmplification
{
  return (NSDictionary *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("transparencyAmplification"), objc_opt_class(), 0);
}

- (void)setTransparencyAmplification:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("transparencyAmplification"));
}

- (NSDictionary)transparencyBalance
{
  return (NSDictionary *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("transparencyBalance"), objc_opt_class(), 0);
}

- (void)setTransparencyBalance:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("transparencyBalance"));
}

- (NSDictionary)transparencyTone
{
  return (NSDictionary *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("transparencyTone"), objc_opt_class(), 0);
}

- (void)setTransparencyTone:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("transparencyTone"));
}

- (NSDictionary)transparencyBeamforming
{
  return (NSDictionary *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("transparencyBeamforming"), objc_opt_class(), 0);
}

- (void)setTransparencyBeamforming:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("transparencyBeamforming"));
}

- (NSDictionary)transparencyNoiseSupressor
{
  return (NSDictionary *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("transparencyNoiseSupressor"), objc_opt_class(), 0);
}

- (void)setTransparencyNoiseSupressor:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("transparencyNoiseSupressor"));
}

- (NSDictionary)sslEnabled
{
  return (NSDictionary *)-[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", CFSTR("sslEnabled"), objc_opt_class(), 0);
}

- (void)setSslEnabled:(id)a3
{
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", a3, CFSTR("sslEnabled"));
}

- (void)setPersonalMediaEnabled:(BOOL)a3
{
  -[PASettings setPersonalMediaEnabled:forRouteUID:](self, "setPersonalMediaEnabled:forRouteUID:", a3, CFSTR("PAConfigurationWildcard"));
}

- (unint64_t)personalAudioAccommodationTypes
{
  return -[PASettings accommodationTypesForRouteUID:](self, "accommodationTypesForRouteUID:", CFSTR("PAConfigurationWildcard"));
}

- (void)setPersonalAudioAccommodationTypes:(unint64_t)a3
{
  -[PASettings setAccommodationTypes:forRouteUID:](self, "setAccommodationTypes:forRouteUID:", a3, CFSTR("PAConfigurationWildcard"));
}

- (id)configurationFromData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v11[5];

  v11[4] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a3;
  v11[0] = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, v11);
  v5 = v11[0];
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, *MEMORY[0x1E0CB2CD0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)archivedDataFromConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v4, "encodeObject:forKey:", v3, *MEMORY[0x1E0CB2CD0]);
    objc_msgSend(v4, "finishEncoding");
    objc_msgSend(v4, "encodedData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)sanitizedRouteUID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("-"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)valueForRouteUID:(id)a3 fromCombinedValue:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend(v5, "valueForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "valueForKey:", CFSTR("PAConfigurationWildcard"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)setPersonalMediaConfiguration:(id)a3
{
  -[PASettings setPersonalMediaConfiguration:forRouteUID:](self, "setPersonalMediaConfiguration:forRouteUID:", a3, CFSTR("PAConfigurationWildcard"));
  -[PASettings setPersonalMediaEnabled:](self, "setPersonalMediaEnabled:", -[PASettings personalMediaEnabled](self, "personalMediaEnabled"));
}

- (PAConfiguration)audiogramConfiguration
{
  return (PAConfiguration *)-[PASettings audiogramConfigurationForRouteUID:](self, "audiogramConfigurationForRouteUID:", CFSTR("PAConfigurationWildcard"));
}

- (void)setAudiogramConfiguration:(id)a3
{
  -[PASettings setAudiogramConfiguration:forRouteUID:](self, "setAudiogramConfiguration:forRouteUID:", a3, CFSTR("PAConfigurationWildcard"));
}

- (BOOL)personalMediaEnabledForRouteUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[PASettings sanitizedRouteUID:](self, "sanitizedRouteUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[PASettings personalMediaEnabledByRouteUID](self, "personalMediaEnabledByRouteUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PASettings valueForRouteUID:fromCombinedValue:](self, "valueForRouteUID:fromCombinedValue:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v7 = objc_msgSend(v6, "BOOLValue");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setPersonalMediaEnabled:(BOOL)a3 forRouteUID:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[PASettings sanitizedRouteUID:](self, "sanitizedRouteUID:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)MEMORY[0x1E0C99E08];
    -[PASettings personalMediaEnabledByRouteUID](self, "personalMediaEnabledByRouteUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v10, v6);

    -[PASettings setPersonalMediaEnabledByRouteUID:](self, "setPersonalMediaEnabledByRouteUID:", v9);
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Updating enabled %@"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PASettings setPersonalMediaEnabled:forRouteUID:]", 253, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_retainAutorelease(v12);
      v15 = v13;
      *(_DWORD *)buf = 136446210;
      v17 = objc_msgSend(v14, "UTF8String");
      _os_log_impl(&dword_1DE3BE000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

- (id)personalMediaConfigurationForRouteUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PASettings sanitizedRouteUID:](self, "sanitizedRouteUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[PASettings personalMediaConfigurationByRouteUID](self, "personalMediaConfigurationByRouteUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PASettings valueForRouteUID:fromCombinedValue:](self, "valueForRouteUID:fromCombinedValue:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[PASettings configurationFromData:](self, "configurationFromData:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setPersonalMediaConfiguration:(id)a3 forRouteUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PASettings sanitizedRouteUID:](self, "sanitizedRouteUID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PASettings archivedDataFromConfiguration:](self, "archivedDataFromConfiguration:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length") && objc_msgSend(v8, "length"))
  {
    v9 = (void *)MEMORY[0x1E0C99E08];
    -[PASettings personalMediaConfigurationByRouteUID](self, "personalMediaConfigurationByRouteUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setValue:forKey:", v8, v7);
    -[PASettings setPersonalMediaConfigurationByRouteUID:](self, "setPersonalMediaConfigurationByRouteUID:", v11);
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Updating configs %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PASettings setPersonalMediaConfiguration:forRouteUID:]", 284, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v13);
      v16 = v14;
      *(_DWORD *)buf = 136446210;
      v18 = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_1DE3BE000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

- (id)audiogramConfigurationForRouteUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PASettings sanitizedRouteUID:](self, "sanitizedRouteUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[PASettings audiogramConfigurationByRouteUID](self, "audiogramConfigurationByRouteUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PASettings valueForRouteUID:fromCombinedValue:](self, "valueForRouteUID:fromCombinedValue:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[PASettings configurationFromData:](self, "configurationFromData:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setAudiogramConfiguration:(id)a3 forRouteUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  -[PASettings sanitizedRouteUID:](self, "sanitizedRouteUID:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PASettings archivedDataFromConfiguration:](self, "archivedDataFromConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "length") && objc_msgSend(v7, "length"))
  {
    v8 = (void *)MEMORY[0x1E0C99E08];
    -[PASettings audiogramConfigurationByRouteUID](self, "audiogramConfigurationByRouteUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithDictionary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setValue:forKey:", v7, v11);
    -[PASettings setAudiogramConfigurationByRouteUID:](self, "setAudiogramConfigurationByRouteUID:", v10);

  }
}

- (unint64_t)accommodationTypesForRouteUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[PASettings sanitizedRouteUID:](self, "sanitizedRouteUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[PASettings accommodationTypesByRouteUID](self, "accommodationTypesByRouteUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PASettings valueForRouteUID:fromCombinedValue:](self, "valueForRouteUID:fromCombinedValue:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v7 = objc_msgSend(v6, "unsignedIntegerValue");
    else
      v7 = 6;

  }
  else
  {
    v7 = 6;
  }

  return v7;
}

- (void)setAccommodationTypes:(unint64_t)a3 forRouteUID:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PASettings sanitizedRouteUID:](self, "sanitizedRouteUID:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)MEMORY[0x1E0C99E08];
    -[PASettings accommodationTypesByRouteUID](self, "accommodationTypesByRouteUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v10, v6);

    -[PASettings setAccommodationTypesByRouteUID:](self, "setAccommodationTypesByRouteUID:", v9);
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Updating types %@"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PASettings setAccommodationTypes:forRouteUID:]", 343, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_retainAutorelease(v12);
      v15 = v13;
      *(_DWORD *)buf = 136446210;
      v17 = objc_msgSend(v14, "UTF8String");
      _os_log_impl(&dword_1DE3BE000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }

}

- (BOOL)transparencyCustomizedForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[PASettings transparencyCustomized](self, "transparencyCustomized");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v7 = objc_msgSend(v6, "BOOLValue");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setTransparencyCustomized:(BOOL)a3 forAddress:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  if (objc_msgSend(v10, "length"))
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    -[PASettings transparencyCustomized](self, "transparencyCustomized");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, v10);

    -[PASettings setTransparencyCustomized:](self, "setTransparencyCustomized:", v8);
  }

}

- (double)transparencyAmplificationForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[PASettings transparencyAmplification](self, "transparencyAmplification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0.5;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "doubleValue");
        v7 = v8;
      }
    }

  }
  else
  {
    v7 = 0.5;
  }

  return v7;
}

- (void)setTransparencyAmplification:(double)a3 forAddress:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "length"))
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    -[PASettings transparencyAmplification](self, "transparencyAmplification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, v10);

    -[PASettings setTransparencyAmplification:](self, "setTransparencyAmplification:", v8);
  }

}

- (double)transparencyBalanceForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[PASettings transparencyBalance](self, "transparencyBalance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0.5;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "doubleValue");
        v7 = v8;
      }
    }

  }
  else
  {
    v7 = 0.5;
  }

  return v7;
}

- (void)setTransparencyBalance:(double)a3 forAddress:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "length"))
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    -[PASettings transparencyBalance](self, "transparencyBalance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, v10);

    -[PASettings setTransparencyBalance:](self, "setTransparencyBalance:", v8);
  }

}

- (double)transparencyToneForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[PASettings transparencyTone](self, "transparencyTone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0.5;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "doubleValue");
        v7 = v8;
      }
    }

  }
  else
  {
    v7 = 0.5;
  }

  return v7;
}

- (void)setTransparencyTone:(double)a3 forAddress:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "length"))
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    -[PASettings transparencyTone](self, "transparencyTone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, v10);

    -[PASettings setTransparencyTone:](self, "setTransparencyTone:", v8);
  }

}

- (BOOL)transparencyBeamformingForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[PASettings transparencyBeamforming](self, "transparencyBeamforming");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v7 = objc_msgSend(v6, "BOOLValue");
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setTransparencyBeamforming:(BOOL)a3 forAddress:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  if (objc_msgSend(v10, "length"))
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    -[PASettings transparencyBeamforming](self, "transparencyBeamforming");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, v10);

    -[PASettings setTransparencyBeamforming:](self, "setTransparencyBeamforming:", v8);
  }

}

- (double)transparencyNoiseSupressorForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[PASettings transparencyNoiseSupressor](self, "transparencyNoiseSupressor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0.0;
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "doubleValue");
        v7 = v8;
      }
    }

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (void)setTransparencyNoiseSupressor:(double)a3 forAddress:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "length"))
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    -[PASettings transparencyNoiseSupressor](self, "transparencyNoiseSupressor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, v10);

    -[PASettings setTransparencyNoiseSupressor:](self, "setTransparencyNoiseSupressor:", v8);
  }

}

- (BOOL)sslEnabledForAddress:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D03410];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deviceFromAddressString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "getSSLMode") == 1;
  return (char)v5;
}

- (void)setSslEnabled:(BOOL)a3 forAddress:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  v13 = a4;
  if (objc_msgSend(v13, "length"))
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    -[PASettings sslEnabled](self, "sslEnabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, v13);

    -[PASettings setSslEnabled:](self, "setSslEnabled:", v8);
    objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deviceFromAddressString:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v12 = 1;
    else
      v12 = 2;
    objc_msgSend(v11, "setSSLMode:", v12);

  }
}

- (BOOL)personalSoundVisible
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("personalSoundVisible"), 1);
}

- (void)setPersonalSoundVisible:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("personalSoundVisible"));

}

- (BOOL)personalMediaDebugMode
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("PersonalMediaDebug"), 0);
}

- (void)setPersonalMediaDebugMode:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("PersonalMediaDebug"));

}

- (BOOL)personalMediaAutomationSkipHeadphoneRequirement
{
  return -[HCSettings BOOLValueForPreferenceKey:withDefaultValue:](self, "BOOLValueForPreferenceKey:withDefaultValue:", CFSTR("PersonalMediaAutomationSkipHeadphoneRequirementPreference"), 0);
}

- (void)setPersonalMediaAutomationSkipHeadphoneRequirement:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", v4, CFSTR("PersonalMediaAutomationSkipHeadphoneRequirementPreference"));

}

- (void)updateConfiguration:(id *)a3 forRouteID:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  os_log_t *v10;
  void *v11;
  void *v12;
  os_log_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  os_log_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  os_log_t v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[PASettings setShouldUpdateAccessory:](self, "setShouldUpdateAccessory:", 0);
    +[PAConfiguration configurationWithLeftMediaLoss:rightMediaLoss:leftSpeechLoss:andRightSpeechLoss:](PAConfiguration, "configurationWithLeftMediaLoss:rightMediaLoss:leftSpeechLoss:andRightSpeechLoss:", a3->var4, a3->var5, a3->var2, a3->var3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v8, "personalMediaConfigurationForRouteUID:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v8) = objc_msgSend(v9, "isEqual:", v7);
    PAInitializeLogging();
    v10 = (os_log_t *)MEMORY[0x1E0D2F9A8];
    if ((v8 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping update. Configuration didn't change %@ = %@"), v6, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PASettings updateConfiguration:forRouteID:]", 557, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_retainAutorelease(v12);
        v15 = v13;
        v16 = v14;
        v10 = (os_log_t *)MEMORY[0x1E0D2F9A8];
        *(_DWORD *)buf = 136446210;
        v33 = objc_msgSend(v16, "UTF8String");
        _os_log_impl(&dword_1DE3BE000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Updating config for %@ = %@"), v6, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PASettings updateConfiguration:forRouteID:]", 552, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_retainAutorelease(v18);
        v21 = v19;
        v22 = v20;
        v10 = (os_log_t *)MEMORY[0x1E0D2F9A8];
        *(_DWORD *)buf = 136446210;
        v33 = objc_msgSend(v22, "UTF8String");
        _os_log_impl(&dword_1DE3BE000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
      -[PASettings setPersonalMediaConfiguration:forRouteUID:](self, "setPersonalMediaConfiguration:forRouteUID:", v7, v6);
    }
    if (a3->var1)
      v23 = (2 * a3->var0) | 4;
    else
      v23 = 2 * a3->var0;
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "accommodationTypesForRouteUID:", v6);

    if (v25 == v23)
    {
      PAInitializeLogging();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping update. Types didn't change"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PASettings updateConfiguration:forRouteID:]", 576, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        v29 = objc_retainAutorelease(v27);
        v30 = v28;
        v31 = objc_msgSend(v29, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v33 = v31;
        _os_log_impl(&dword_1DE3BE000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

      }
    }
    else
    {
      -[PASettings setAccommodationTypes:forRouteUID:](self, "setAccommodationTypes:forRouteUID:", v23, v6);
    }
    -[PASettings setShouldUpdateAccessory:](self, "setShouldUpdateAccessory:", 1);

  }
}

@end
