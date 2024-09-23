@implementation HKSPMutableSleepEventRecord

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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPEventRecordLastModifiedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPEventRecordLastModifiedDate")))
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
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPEventRecordLastModifiedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPEventRecordLastModifiedDate")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPEventRecordLastModifiedDate"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (void)setWakeUpEarlyNotificationConfirmedDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  HKSPChangeSet *changeSet;
  void *v11;
  id v12;
  id v13;

  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPWakeUpEarlyNotificationConfirmedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (id)v8;
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWakeUpEarlyNotificationConfirmedDate")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v9 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v11 = (void *)objc_msgSend([v9 alloc], "initWithProperty:changedValue:originalValue:", v6, v13, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v11);

  }
}

- (NSDate)wakeUpEarlyNotificationConfirmedDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPWakeUpEarlyNotificationConfirmedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWakeUpEarlyNotificationConfirmedDate")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPWakeUpEarlyNotificationConfirmedDate"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (void)setWakeUpConfirmedUntilDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  HKSPChangeSet *changeSet;
  void *v11;
  id v12;
  id v13;

  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPWakeUpConfirmedUntilDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (id)v8;
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWakeUpConfirmedUntilDate")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v9 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v11 = (void *)objc_msgSend([v9 alloc], "initWithProperty:changedValue:originalValue:", v6, v13, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v11);

  }
}

- (NSDate)wakeUpConfirmedUntilDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPWakeUpConfirmedUntilDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWakeUpConfirmedUntilDate")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPWakeUpConfirmedUntilDate"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (void)setWakeUpAlarmDismissedDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  HKSPChangeSet *changeSet;
  void *v11;
  id v12;
  id v13;

  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPWakeUpAlarmDismissedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (id)v8;
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWakeUpAlarmDismissedDate")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v9 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v11 = (void *)objc_msgSend([v9 alloc], "initWithProperty:changedValue:originalValue:", v6, v13, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v11);

  }
}

- (NSDate)wakeUpAlarmDismissedDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPWakeUpAlarmDismissedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWakeUpAlarmDismissedDate")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPWakeUpAlarmDismissedDate"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (void)setWakeUpOverriddenDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  HKSPChangeSet *changeSet;
  void *v11;
  id v12;
  id v13;

  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPWakeUpOverriddenDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (id)v8;
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWakeUpOverriddenDate")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v9 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v11 = (void *)objc_msgSend([v9 alloc], "initWithProperty:changedValue:originalValue:", v6, v13, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v11);

  }
}

- (NSDate)wakeUpOverriddenDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPWakeUpOverriddenDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWakeUpOverriddenDate")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPWakeUpOverriddenDate"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (void)setWakeUpAlarmSnoozedUntilDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  HKSPChangeSet *changeSet;
  void *v11;
  id v12;
  id v13;

  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPWakeUpAlarmSnoozedUntilDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (id)v8;
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWakeUpAlarmSnoozedUntilDate")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v9 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v11 = (void *)objc_msgSend([v9 alloc], "initWithProperty:changedValue:originalValue:", v6, v13, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v11);

  }
}

- (NSDate)wakeUpAlarmSnoozedUntilDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPWakeUpAlarmSnoozedUntilDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWakeUpAlarmSnoozedUntilDate")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPWakeUpAlarmSnoozedUntilDate"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (void)setGoodMorningDismissedDate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  HKSPChangeSet *changeSet;
  void *v11;
  id v12;
  id v13;

  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPGoodMorningDismissedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (id)v8;
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPGoodMorningDismissedDate")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v9 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v11 = (void *)objc_msgSend([v9 alloc], "initWithProperty:changedValue:originalValue:", v6, v13, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v11);

  }
}

- (NSDate)goodMorningDismissedDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPGoodMorningDismissedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPGoodMorningDismissedDate")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPGoodMorningDismissedDate"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (void)setSleepCoachingOnboardingCompletedVersion:(int64_t)a3
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPSleepCoachingOnboardingCompletedVersion"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 != a3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepCoachingOnboardingCompletedVersion")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (int64_t)sleepCoachingOnboardingCompletedVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPSleepCoachingOnboardingCompletedVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepCoachingOnboardingCompletedVersion")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPSleepCoachingOnboardingCompletedVersion"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (void)setSleepCoachingOnboardingFirstCompletedDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  HKSPChangeSet *changeSet;
  void *v14;
  id v15;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPSleepCoachingOnboardingFirstCompletedDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "copy");
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v4;
  v15 = v11;

  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepCoachingOnboardingFirstCompletedDate")))
  {
    objc_msgSend(v7, "isRelationshipProperty");
    v12 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v14 = (void *)objc_msgSend([v12 alloc], "initWithProperty:changedValue:originalValue:", v7, v15, v8);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v14);

  }
}

- (NSDate)sleepCoachingOnboardingFirstCompletedDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPSleepCoachingOnboardingFirstCompletedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepCoachingOnboardingFirstCompletedDate")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPSleepCoachingOnboardingFirstCompletedDate"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (void)setSleepTrackingOnboardingCompletedVersion:(int64_t)a3
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPSleepTrackingOnboardingCompletedVersion"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 != a3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepTrackingOnboardingCompletedVersion")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (int64_t)sleepTrackingOnboardingCompletedVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPSleepTrackingOnboardingCompletedVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepTrackingOnboardingCompletedVersion")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPSleepTrackingOnboardingCompletedVersion"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (void)setSleepTrackingOnboardingFirstCompletedDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  HKSPChangeSet *changeSet;
  void *v14;
  id v15;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPSleepTrackingOnboardingFirstCompletedDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "copy");
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v4;
  v15 = v11;

  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepTrackingOnboardingFirstCompletedDate")))
  {
    objc_msgSend(v7, "isRelationshipProperty");
    v12 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v14 = (void *)objc_msgSend([v12 alloc], "initWithProperty:changedValue:originalValue:", v7, v15, v8);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v14);

  }
}

- (NSDate)sleepTrackingOnboardingFirstCompletedDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPSleepTrackingOnboardingFirstCompletedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepTrackingOnboardingFirstCompletedDate")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPSleepTrackingOnboardingFirstCompletedDate"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (void)setSleepWindDownShortcutsOnboardingCompletedVersion:(int64_t)a3
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPSleepWindDownShortcutsOnboardingCompletedVersion"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 != a3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepWindDownShortcutsOnboardingCompletedVersion")))
  {
    changeSet = self->_changeSet;
    v10 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKSPChange initWithProperty:changedValue:originalValue:](v10, "initWithProperty:changedValue:originalValue:", v14, v11, v12);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v13);

  }
}

- (int64_t)sleepWindDownShortcutsOnboardingCompletedVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPSleepWindDownShortcutsOnboardingCompletedVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepWindDownShortcutsOnboardingCompletedVersion")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPSleepWindDownShortcutsOnboardingCompletedVersion"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (void)setSleepWindDownShortcutsOnboardingFirstCompletedDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  HKSPChangeSet *changeSet;
  void *v14;
  id v15;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPSleepWindDownShortcutsOnboardingFirstCompletedDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "copy");
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v4;
  v15 = v11;

  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepWindDownShortcutsOnboardingFirstCompletedDate")))
  {
    objc_msgSend(v7, "isRelationshipProperty");
    v12 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v14 = (void *)objc_msgSend([v12 alloc], "initWithProperty:changedValue:originalValue:", v7, v15, v8);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v14);

  }
}

- (NSDate)sleepWindDownShortcutsOnboardingFirstCompletedDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPSleepWindDownShortcutsOnboardingFirstCompletedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepWindDownShortcutsOnboardingFirstCompletedDate")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPSleepWindDownShortcutsOnboardingFirstCompletedDate"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (HKSPMutableSleepEventRecord)init
{
  HKSPMutableSleepEventRecord *v2;
  HKSPSleepEventRecord *v3;
  HKSPObject *originalObject;
  HKSPChangeSet *v5;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepEventRecord *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKSPMutableSleepEventRecord;
  v2 = -[HKSPSleepEventRecord init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HKSPSleepEventRecord);
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
  HKSPMutableSleepEventRecord *v6;
  uint64_t v7;
  HKSPObject *originalObject;
  HKSPChangeSet *v9;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepEventRecord *v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepEventRecord.m"), 264, CFSTR("object must be a subclass"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HKSPMutableSleepEventRecord;
  v6 = -[HKSPSleepEventRecord init](&v14, sel_init);
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

- (HKSPMutableSleepEventRecord)initWithCoder:(id)a3
{
  id v4;
  HKSPMutableSleepEventRecord *v5;
  uint64_t v6;
  HKSPObject *originalObject;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepEventRecord *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPMutableSleepEventRecord;
  v5 = -[HKSPSleepEventRecord init](&v12, sel_init);
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
  return -[HKSPSleepEventRecord initFromObject:]([HKSPSleepEventRecord alloc], "initFromObject:", self);
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
  -[HKSPMutableSleepEventRecord originalObject](self, "originalObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copyWithZone:", 0);
  v6 = (void *)v3[16];
  v3[16] = v5;

  -[HKSPMutableSleepEventRecord changeSet](self, "changeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deepCopy");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v3[17];
  v3[17] = v8;

  return v3;
}

- (void)freeze
{
  HKSPObject *v3;
  HKSPObject *originalObject;

  v3 = -[HKSPSleepEventRecord initFromObject:]([HKSPSleepEventRecord alloc], "initFromObject:", self);
  originalObject = self->_originalObject;
  self->_originalObject = v3;

  -[HKSPMutableSleepEventRecord revert](self, "revert");
}

- (void)revert
{
  -[HKSPChangeSet removeAllChanges](self->_changeSet, "removeAllChanges");
}

- (void)updateSleepCoachingOnboardingCompletedVersion:(int64_t)a3 completedDate:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if (!a3)
  {
    -[HKSPMutableSleepEventRecord setSleepCoachingOnboardingCompletedVersion:](self, "setSleepCoachingOnboardingCompletedVersion:", 0);
    -[HKSPMutableSleepEventRecord setSleepCoachingOnboardingFirstCompletedDate:](self, "setSleepCoachingOnboardingFirstCompletedDate:", 0);
    goto LABEL_10;
  }
  if (-[HKSPMutableSleepEventRecord sleepCoachingOnboardingCompletedVersion](self, "sleepCoachingOnboardingCompletedVersion"))
  {
    -[HKSPMutableSleepEventRecord sleepCoachingOnboardingFirstCompletedDate](self, "sleepCoachingOnboardingFirstCompletedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_8;
  }
  else
  {
    -[HKSPMutableSleepEventRecord setSleepCoachingOnboardingCompletedVersion:](self, "setSleepCoachingOnboardingCompletedVersion:", a3);
  }
  -[HKSPMutableSleepEventRecord setSleepCoachingOnboardingFirstCompletedDate:](self, "setSleepCoachingOnboardingFirstCompletedDate:", v7);
LABEL_8:
  if (-[HKSPMutableSleepEventRecord sleepCoachingOnboardingCompletedVersion](self, "sleepCoachingOnboardingCompletedVersion") < a3)-[HKSPMutableSleepEventRecord setSleepCoachingOnboardingCompletedVersion:](self, "setSleepCoachingOnboardingCompletedVersion:", a3);
LABEL_10:

}

- (void)updateSleepTrackingOnboardingCompletedVersion:(int64_t)a3 completedDate:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if (!a3)
  {
    -[HKSPMutableSleepEventRecord setSleepTrackingOnboardingCompletedVersion:](self, "setSleepTrackingOnboardingCompletedVersion:", 0);
    -[HKSPMutableSleepEventRecord setSleepTrackingOnboardingFirstCompletedDate:](self, "setSleepTrackingOnboardingFirstCompletedDate:", 0);
    goto LABEL_10;
  }
  if (-[HKSPMutableSleepEventRecord sleepTrackingOnboardingCompletedVersion](self, "sleepTrackingOnboardingCompletedVersion"))
  {
    -[HKSPMutableSleepEventRecord sleepTrackingOnboardingFirstCompletedDate](self, "sleepTrackingOnboardingFirstCompletedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_8;
  }
  else
  {
    -[HKSPMutableSleepEventRecord setSleepTrackingOnboardingCompletedVersion:](self, "setSleepTrackingOnboardingCompletedVersion:", a3);
  }
  -[HKSPMutableSleepEventRecord setSleepTrackingOnboardingFirstCompletedDate:](self, "setSleepTrackingOnboardingFirstCompletedDate:", v7);
LABEL_8:
  if (-[HKSPMutableSleepEventRecord sleepTrackingOnboardingCompletedVersion](self, "sleepTrackingOnboardingCompletedVersion") < a3)-[HKSPMutableSleepEventRecord setSleepTrackingOnboardingCompletedVersion:](self, "setSleepTrackingOnboardingCompletedVersion:", a3);
LABEL_10:

}

- (void)updateSleepWindDownShortcutsOnboardingCompletedVersion:(int64_t)a3 completedDate:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  if (!a3)
  {
    -[HKSPMutableSleepEventRecord setSleepWindDownShortcutsOnboardingCompletedVersion:](self, "setSleepWindDownShortcutsOnboardingCompletedVersion:", 0);
    -[HKSPMutableSleepEventRecord setSleepWindDownShortcutsOnboardingFirstCompletedDate:](self, "setSleepWindDownShortcutsOnboardingFirstCompletedDate:", 0);
    goto LABEL_10;
  }
  if (-[HKSPMutableSleepEventRecord sleepWindDownShortcutsOnboardingCompletedVersion](self, "sleepWindDownShortcutsOnboardingCompletedVersion"))
  {
    -[HKSPMutableSleepEventRecord sleepWindDownShortcutsOnboardingFirstCompletedDate](self, "sleepWindDownShortcutsOnboardingFirstCompletedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_8;
  }
  else
  {
    -[HKSPMutableSleepEventRecord setSleepWindDownShortcutsOnboardingCompletedVersion:](self, "setSleepWindDownShortcutsOnboardingCompletedVersion:", a3);
  }
  -[HKSPMutableSleepEventRecord setSleepWindDownShortcutsOnboardingFirstCompletedDate:](self, "setSleepWindDownShortcutsOnboardingFirstCompletedDate:", v7);
LABEL_8:
  if (-[HKSPMutableSleepEventRecord sleepWindDownShortcutsOnboardingCompletedVersion](self, "sleepWindDownShortcutsOnboardingCompletedVersion") < a3)-[HKSPMutableSleepEventRecord setSleepWindDownShortcutsOnboardingCompletedVersion:](self, "setSleepWindDownShortcutsOnboardingCompletedVersion:", a3);
LABEL_10:

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
