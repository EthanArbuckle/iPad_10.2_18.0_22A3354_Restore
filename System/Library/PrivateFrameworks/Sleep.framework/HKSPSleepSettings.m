@implementation HKSPSleepSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSleepSettings descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings watchSleepFeaturesEnabled](self, "watchSleepFeaturesEnabled"), CFSTR("watchSleepFeaturesEnabled"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings scheduledSleepMode](self, "scheduledSleepMode"), CFSTR("scheduledSleepMode"));
  NSStringFromHKSPSleepModeOptions(-[HKSPSleepSettings sleepModeOptions](self, "sleepModeOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("sleepModeOptions"));

  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings sleepTracking](self, "sleepTracking"), CFSTR("sleepTracking"));
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings wakeUpResults](self, "wakeUpResults"), CFSTR("wakeUpResults"));
  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings timeInBedTracking](self, "timeInBedTracking"), CFSTR("timeInBedTracking"));
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings bedtimeReminders](self, "bedtimeReminders"), CFSTR("bedtimeReminders"));
  v12 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings chargingReminders](self, "chargingReminders"), CFSTR("chargingReminders"));
  v13 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSettings shareAcrossDevices](self, "shareAcrossDevices"), CFSTR("shareAcrossDevices"));
  return v3;
}

- (BOOL)watchSleepFeaturesEnabled
{
  return self->_watchSleepFeaturesEnabled;
}

- (BOOL)wakeUpResults
{
  return self->_wakeUpResults;
}

- (BOOL)timeInBedTracking
{
  return self->_timeInBedTracking;
}

- (unint64_t)sleepModeOptions
{
  return self->_sleepModeOptions;
}

- (BOOL)shareAcrossDevices
{
  return self->_shareAcrossDevices;
}

- (BOOL)scheduledSleepMode
{
  return self->_scheduledSleepMode;
}

- (BOOL)chargingReminders
{
  return self->_chargingReminders;
}

- (BOOL)bedtimeReminders
{
  return self->_bedtimeReminders;
}

- (BOOL)isEqual:(id)a3
{
  return HKSPObjectsAreEqual(self, a3);
}

- (BOOL)sleepTracking
{
  return self->_sleepTracking;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  HKSPEncodeObjectWithCoder(self, v4);
  if ((objc_msgSend(v4, "hksp_serializationOptions") & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_syncAnchor, CFSTR("HKSPSettingsSyncAnchor"));

}

- (BOOL)_needsMigrationForCoder:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "hksp_serializationOptions") & 1) != 0
    && (unint64_t)objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("HKSPSettingsVersion")) < 0xB;

  return v4;
}

- (HKSPSleepSettings)initWithCoder:(id)a3
{
  id v4;
  HKSPSleepSettings *v5;
  HKSPSleepSettings *v6;
  uint64_t v7;
  HKSPSyncAnchor *syncAnchor;
  HKSPSleepSettings *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSPSleepSettings;
  v5 = -[HKSPSleepSettings init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    HKSPDecodeObjectWithCoder(v5, v4);
    if ((objc_msgSend(v4, "hksp_serializationOptions") & 1) == 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", HKSPSyncAnchorClass(), CFSTR("HKSPSettingsSyncAnchor"));
      v7 = objc_claimAutoreleasedReturnValue();
      syncAnchor = v6->_syncAnchor;
      v6->_syncAnchor = (HKSPSyncAnchor *)v7;

    }
    if (-[HKSPSleepSettings _needsMigrationForCoder:](v6, "_needsMigrationForCoder:", v4))
      -[HKSPSleepSettings _migrateForCoder:](v6, "_migrateForCoder:", v4);
    v9 = v6;
  }

  return v6;
}

- (unint64_t)version
{
  return self->_version;
}

- (BOOL)springBoardSuggestedPageCreated
{
  return self->_springBoardSuggestedPageCreated;
}

- (BOOL)springBoardGreetingDisabled
{
  return self->_springBoardGreetingDisabled;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSString)description
{
  return (NSString *)-[HKSPSleepSettings descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncAnchor, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
}

- (BOOL)isEqualToFeatureSettingsModel:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  LOBYTE(self) = -[HKSPSleepSettings sleepTrackingFeatureEnabled](self, "sleepTrackingFeatureEnabled");
  v5 = objc_msgSend(v4, "sleepTrackingFeatureEnabled");

  return self ^ v5 ^ 1;
}

- (BOOL)sleepTrackingFeatureEnabled
{
  _BOOL4 v3;

  v3 = -[HKSPSleepSettings sleepTracking](self, "sleepTracking");
  if (v3)
    LOBYTE(v3) = -[HKSPSleepSettings watchSleepFeaturesEnabled](self, "watchSleepFeaturesEnabled");
  return v3;
}

- (HKSPSleepSettings)init
{
  HKSPSleepSettings *v2;
  HKSPSleepSettings *v3;
  HKSPSleepSettings *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKSPSleepSettings;
  v2 = -[HKSPSleepSettings init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 11;
    v2->_watchSleepFeaturesEnabled = 1;
    v2->_sleepModeOptions = 1792;
    v2->_bedtimeReminders = 1;
    v2->_shareAcrossDevices = 1;
    v4 = v2;
  }

  return v3;
}

- (id)initFromObject:(id)a3
{
  id v4;
  id v5;
  HKSPSleepSettings *v6;
  void *v7;
  uint64_t v8;
  HKSPSyncAnchor *syncAnchor;
  HKSPSleepSettings *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[HKSPSleepSettings init](self, "init");
    HKSPCopyFromObject(v5, v6);
    objc_msgSend(v5, "syncAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "copyWithZone:", 0);
    syncAnchor = v6->_syncAnchor;
    v6->_syncAnchor = (HKSPSyncAnchor *)v8;

    self = v6;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)objectWithSyncAnchor:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initFromObject:", self);
  v6 = objc_msgSend(v4, "copyWithZone:", 0);

  v7 = (void *)v5[5];
  v5[5] = v6;

  return v5;
}

- (void)_migrateForCoder:(id)a3
{
  id v4;
  unint64_t version;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t sleepModeOptions;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t buf[16];

  v4 = a3;
  version = self->_version;
  if (version <= 1)
  {
    HKSPLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "Migrating charging reminders", buf, 2u);
    }

    self->_chargingReminders = self->_sleepModeOptions & 1;
    version = self->_version;
  }
  if (version <= 3)
  {
    HKSPLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "Migrating bedtime reminders", v17, 2u);
    }

    self->_bedtimeReminders = 1;
    version = self->_version;
  }
  if (version <= 4)
  {
    HKSPLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "Migrating use watch for sleep", v16, 2u);
    }

    self->_watchSleepFeaturesEnabled = 1;
    version = self->_version;
  }
  if (version <= 8)
  {
    HKSPLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_DEFAULT, "Migrating Legacy Settings", v15, 2u);
    }

    self->_sleepModeOptions |= 0x700uLL;
    version = self->_version;
  }
  if (version <= 9)
  {
    HKSPLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, "Migrating Sleep Lock Screen", v14, 2u);
    }

    sleepModeOptions = self->_sleepModeOptions;
    if ((sleepModeOptions & 0x40) != 0)
      self->_sleepModeOptions = sleepModeOptions | 0x4000;
    version = self->_version;
  }
  if (version <= 0xA)
  {
    HKSPLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1A4F0E000, v12, OS_LOG_TYPE_DEFAULT, "Migrating share across devices", v13, 2u);
    }

    self->_shareAcrossDevices = 1;
  }
  self->_version = 11;

}

- (id)mutableCopy
{
  return -[HKSPMutableSleepSettings initFromObject:]([HKSPMutableSleepSettings alloc], "initFromObject:", self);
}

- (BOOL)isEquivalentTo:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_286);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPSleepSettings succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HKSPSyncAnchor)syncAnchor
{
  return self->_syncAnchor;
}

@end
