@implementation HKSPMutableSleepSettings

- (void)setLastModifiedDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  HKSPChangeSet *changeSet;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPSettingsLastModifiedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSettingsLastModifiedDate")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithProperty:changedValue:originalValue:", v6, v11, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v10);

  }
}

- (NSDate)lastModifiedDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPSettingsLastModifiedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSettingsLastModifiedDate")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPSettingsLastModifiedDate"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (void)setWatchSleepFeaturesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPChange *v10;
  void *v11;
  void *v12;
  HKSPChange *v13;
  id v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPWatchSleepFeaturesEnabled"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v8 != v3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWatchSleepFeaturesEnabled")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (BOOL)watchSleepFeaturesEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPWatchSleepFeaturesEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWatchSleepFeaturesEnabled")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPWatchSleepFeaturesEnabled"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setScheduledSleepMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPChange *v10;
  void *v11;
  void *v12;
  HKSPChange *v13;
  id v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPScheduledSleepMode"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v8 != v3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPScheduledSleepMode")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (BOOL)scheduledSleepMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPScheduledSleepMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPScheduledSleepMode")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPScheduledSleepMode"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setSleepModeOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPChange *v10;
  void *v11;
  void *v12;
  HKSPChange *v13;
  id v14;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPSleepModeOptions"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v8 != a3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepModeOptions")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (unint64_t)sleepModeOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPSleepModeOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepModeOptions")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPSleepModeOptions"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

- (void)setSleepTracking:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPChange *v10;
  void *v11;
  void *v12;
  HKSPChange *v13;
  id v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPSleepTracking"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v8 != v3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepTracking")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (BOOL)sleepTracking
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPSleepTracking"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepTracking")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPSleepTracking"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setWakeUpResults:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPChange *v10;
  void *v11;
  void *v12;
  HKSPChange *v13;
  id v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPWakeUpResults"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v8 != v3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWakeUpResults")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (BOOL)wakeUpResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPWakeUpResults"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWakeUpResults")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPWakeUpResults"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setTimeInBedTracking:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPChange *v10;
  void *v11;
  void *v12;
  HKSPChange *v13;
  id v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPTimeInBedTracking"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v8 != v3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPTimeInBedTracking")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (BOOL)timeInBedTracking
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPTimeInBedTracking"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPTimeInBedTracking")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPTimeInBedTracking"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setBedtimeReminders:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPChange *v10;
  void *v11;
  void *v12;
  HKSPChange *v13;
  id v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPBedtimeReminders"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v8 != v3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPBedtimeReminders")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (BOOL)bedtimeReminders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPBedtimeReminders"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPBedtimeReminders")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPBedtimeReminders"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setChargingReminders:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPChange *v10;
  void *v11;
  void *v12;
  HKSPChange *v13;
  id v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPChargingReminders"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v8 != v3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPChargingReminders")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (BOOL)chargingReminders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPChargingReminders"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPChargingReminders")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPChargingReminders"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setShareAcrossDevices:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPChange *v10;
  void *v11;
  void *v12;
  HKSPChange *v13;
  id v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPShareAcrossDevices"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v8 != v3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPShareAcrossDevices")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (BOOL)shareAcrossDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPShareAcrossDevices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPShareAcrossDevices")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPShareAcrossDevices"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setSpringBoardGreetingDisabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPChange *v10;
  void *v11;
  void *v12;
  HKSPChange *v13;
  id v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPSpringBoardGreetingDisabled"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v8 != v3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSpringBoardGreetingDisabled")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (BOOL)springBoardGreetingDisabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPSpringBoardGreetingDisabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSpringBoardGreetingDisabled")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPSpringBoardGreetingDisabled"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setSpringBoardSuggestedPageCreated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPChange *v10;
  void *v11;
  void *v12;
  HKSPChange *v13;
  id v14;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPSpringBoardSuggestedPageCreated"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v8 != v3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSpringBoardSuggestedPageCreated")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (BOOL)springBoardSuggestedPageCreated
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPSpringBoardSuggestedPageCreated"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSpringBoardSuggestedPageCreated")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPSpringBoardSuggestedPageCreated"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (HKSPMutableSleepSettings)init
{
  HKSPMutableSleepSettings *v2;
  HKSPSleepSettings *v3;
  HKSPObject *originalObject;
  HKSPChangeSet *v5;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepSettings *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKSPMutableSleepSettings;
  v2 = -[HKSPSleepSettings init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HKSPSleepSettings);
    originalObject = v2->_originalObject;
    v2->_originalObject = (HKSPObject *)v3;

    v5 = objc_alloc_init(HKSPChangeSet);
    changeSet = v2->_changeSet;
    v2->_changeSet = v5;

    v7 = v2;
  }

  return v2;
}

- (id)initFromObject:(id)a3
{
  id v5;
  HKSPMutableSleepSettings *v6;
  uint64_t v7;
  HKSPObject *originalObject;
  HKSPChangeSet *v9;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepSettings *v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepSettings.m"), 245, CFSTR("object must be a subclass"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HKSPMutableSleepSettings;
  v6 = -[HKSPSleepSettings init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copyWithZone:", 0);
    originalObject = v6->_originalObject;
    v6->_originalObject = (HKSPObject *)v7;

    v9 = objc_alloc_init(HKSPChangeSet);
    changeSet = v6->_changeSet;
    v6->_changeSet = v9;

    v11 = v6;
  }

  return v6;
}

- (HKSPMutableSleepSettings)initWithCoder:(id)a3
{
  id v4;
  HKSPMutableSleepSettings *v5;
  uint64_t v6;
  HKSPObject *originalObject;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepSettings *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPMutableSleepSettings;
  v5 = -[HKSPSleepSettings init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKSPOriginalObject"));
    v6 = objc_claimAutoreleasedReturnValue();
    originalObject = v5->_originalObject;
    v5->_originalObject = (HKSPObject *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HKSPChangeSet"));
    v8 = objc_claimAutoreleasedReturnValue();
    changeSet = v5->_changeSet;
    v5->_changeSet = (HKSPChangeSet *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  HKSPObject *originalObject;
  id v5;

  originalObject = self->_originalObject;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originalObject, CFSTR("HKSPOriginalObject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_changeSet, CFSTR("HKSPChangeSet"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[HKSPSleepSettings initFromObject:]([HKSPSleepSettings alloc], "initFromObject:", self);
}

- (id)mutableCopy
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = objc_alloc_init((Class)objc_opt_class());
  -[HKSPMutableSleepSettings originalObject](self, "originalObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copyWithZone:", 0);
  v6 = (void *)v3[7];
  v3[7] = v5;

  -[HKSPMutableSleepSettings changeSet](self, "changeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deepCopy");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v3[8];
  v3[8] = v8;

  return v3;
}

- (void)freeze
{
  HKSPObject *v3;
  HKSPObject *originalObject;

  v3 = -[HKSPSleepSettings initFromObject:]([HKSPSleepSettings alloc], "initFromObject:", self);
  originalObject = self->_originalObject;
  self->_originalObject = v3;

  -[HKSPMutableSleepSettings revert](self, "revert");
}

- (void)revert
{
  -[HKSPChangeSet removeAllChanges](self->_changeSet, "removeAllChanges");
}

- (HKSPObject)originalObject
{
  return self->_originalObject;
}

- (HKSPChangeSet)changeSet
{
  return self->_changeSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeSet, 0);
  objc_storeStrong((id *)&self->_originalObject, 0);
}

@end
