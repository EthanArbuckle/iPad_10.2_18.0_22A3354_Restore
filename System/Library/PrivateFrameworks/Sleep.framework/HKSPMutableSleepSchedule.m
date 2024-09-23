@implementation HKSPMutableSleepSchedule

- (void)setEnabled:(BOOL)a3
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPScheduleEnabled"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((_DWORD)v8 != v3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPScheduleEnabled")))
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

- (BOOL)isEnabled
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
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPScheduleEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPScheduleEnabled")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPScheduleEnabled"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (void)setWindDownTime:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  HKSPChangeSet *changeSet;
  HKSPChange *v11;
  void *v12;
  void *v13;
  HKSPChange *v14;
  id v15;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPWindDownTimeInterval"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  if (v9 != a3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWindDownTimeInterval")))
  {
    changeSet = self->_changeSet;
    v11 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HKSPChange initWithProperty:changedValue:originalValue:](v11, "initWithProperty:changedValue:originalValue:", v15, v12, v13);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v14);

  }
}

- (double)windDownTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPWindDownTimeInterval"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWindDownTimeInterval")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPWindDownTimeInterval"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

- (void)setSleepDurationGoal:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  HKSPChangeSet *changeSet;
  HKSPChange *v11;
  void *v12;
  void *v13;
  HKSPChange *v14;
  id v15;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPSleepDurationGoal"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  if (v9 != a3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepDurationGoal")))
  {
    changeSet = self->_changeSet;
    v11 = [HKSPChange alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HKSPChange initWithProperty:changedValue:originalValue:](v11, "initWithProperty:changedValue:originalValue:", v15, v12, v13);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v14);

  }
}

- (double)sleepDurationGoal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPSleepDurationGoal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepDurationGoal")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPSleepDurationGoal"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  return v8;
}

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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPScheduleLastModifiedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPScheduleLastModifiedDate")))
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
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPScheduleLastModifiedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPScheduleLastModifiedDate")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPScheduleLastModifiedDate"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v6;
}

- (void)setMondayOccurrence:(id)a3
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPMondayOccurrence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPMondayOccurrence")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithProperty:changedValue:originalValue:", v6, v11, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v10);

  }
}

- (HKSPSleepScheduleDayOccurrence)mondayOccurrence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPMondayOccurrence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPMondayOccurrence")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPMondayOccurrence"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setTuesdayOccurrence:(id)a3
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPTuesdayOccurrence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPTuesdayOccurrence")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithProperty:changedValue:originalValue:", v6, v11, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v10);

  }
}

- (HKSPSleepScheduleDayOccurrence)tuesdayOccurrence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPTuesdayOccurrence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPTuesdayOccurrence")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPTuesdayOccurrence"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setWednesdayOccurrence:(id)a3
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPWednesdayOccurrence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWednesdayOccurrence")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithProperty:changedValue:originalValue:", v6, v11, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v10);

  }
}

- (HKSPSleepScheduleDayOccurrence)wednesdayOccurrence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPWednesdayOccurrence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWednesdayOccurrence")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPWednesdayOccurrence"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setThursdayOccurrence:(id)a3
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPThursdayOccurrence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPThursdayOccurrence")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithProperty:changedValue:originalValue:", v6, v11, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v10);

  }
}

- (HKSPSleepScheduleDayOccurrence)thursdayOccurrence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPThursdayOccurrence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPThursdayOccurrence")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPThursdayOccurrence"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setFridayOccurrence:(id)a3
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPFridayOccurrence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPFridayOccurrence")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithProperty:changedValue:originalValue:", v6, v11, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v10);

  }
}

- (HKSPSleepScheduleDayOccurrence)fridayOccurrence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPFridayOccurrence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPFridayOccurrence")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPFridayOccurrence"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setSaturdayOccurrence:(id)a3
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPSaturdayOccurrence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSaturdayOccurrence")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithProperty:changedValue:originalValue:", v6, v11, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v10);

  }
}

- (HKSPSleepScheduleDayOccurrence)saturdayOccurrence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPSaturdayOccurrence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSaturdayOccurrence")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPSaturdayOccurrence"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setSundayOccurrence:(id)a3
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPSundayOccurrence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSundayOccurrence")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithProperty:changedValue:originalValue:", v6, v11, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v10);

  }
}

- (HKSPSleepScheduleDayOccurrence)sundayOccurrence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPSundayOccurrence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSundayOccurrence")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPSundayOccurrence"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setOverrideDayOccurrence:(id)a3
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPOverrideOccurrence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPOverrideOccurrence")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithProperty:changedValue:originalValue:", v6, v11, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v10);

  }
}

- (HKSPSleepScheduleDayOccurrence)overrideDayOccurrence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPOverrideOccurrence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPOverrideOccurrence")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPOverrideOccurrence"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (HKSPMutableSleepSchedule)init
{
  HKSPMutableSleepSchedule *v2;
  HKSPSleepSchedule *v3;
  HKSPObject *originalObject;
  HKSPChangeSet *v5;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepSchedule *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKSPMutableSleepSchedule;
  v2 = -[HKSPSleepSchedule init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HKSPSleepSchedule);
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
  HKSPMutableSleepSchedule *v6;
  uint64_t v7;
  HKSPObject *originalObject;
  HKSPChangeSet *v9;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepSchedule *v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepSchedule.m"), 627, CFSTR("object must be a subclass"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HKSPMutableSleepSchedule;
  v6 = -[HKSPSleepSchedule init](&v14, sel_init);
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

- (HKSPMutableSleepSchedule)initWithCoder:(id)a3
{
  id v4;
  HKSPMutableSleepSchedule *v5;
  uint64_t v6;
  HKSPObject *originalObject;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepSchedule *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPMutableSleepSchedule;
  v5 = -[HKSPSleepSchedule init](&v12, sel_init);
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
  return -[HKSPSleepSchedule initFromObject:]([HKSPSleepSchedule alloc], "initFromObject:", self);
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
  -[HKSPMutableSleepSchedule originalObject](self, "originalObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copyWithZone:", 0);
  v6 = (void *)v3[15];
  v3[15] = v5;

  -[HKSPMutableSleepSchedule changeSet](self, "changeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deepCopy");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v3[16];
  v3[16] = v8;

  return v3;
}

- (void)freeze
{
  HKSPObject *v3;
  HKSPObject *originalObject;

  v3 = -[HKSPSleepSchedule initFromObject:]([HKSPSleepSchedule alloc], "initFromObject:", self);
  originalObject = self->_originalObject;
  self->_originalObject = v3;

  -[HKSPMutableSleepSchedule revert](self, "revert");
}

- (void)revert
{
  -[HKSPChangeSet removeAllChanges](self->_changeSet, "removeAllChanges");
}

- (void)saveOccurrence:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _BYTE v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isSingleDayOverride"))
  {
    -[HKSPMutableSleepSchedule _updateOverrideOccurrenceForOccurrence:](self, "_updateOverrideOccurrenceForOccurrence:", v4);
  }
  else
  {
    -[HKSPMutableSleepSchedule _updateBackingOccurrencesForOccurrence:](self, "_updateBackingOccurrencesForOccurrence:", v4);
    -[HKSPSleepSchedule overrideOccurrence](self, "overrideOccurrence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && -[HKSPMutableSleepSchedule _shouldRemoveOverrideOccurrence:](self, "_shouldRemoveOverrideOccurrence:", v5))
    {
      HKSPLogForCategory(5uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v8 = 138543618;
        *(_QWORD *)&v8[4] = objc_opt_class();
        *(_WORD *)&v8[12] = 2114;
        *(_QWORD *)&v8[14] = v5;
        v7 = *(id *)&v8[4];
        _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing override occurrence %{public}@", v8, 0x16u);

      }
      -[HKSPMutableSleepSchedule removeOccurrence:](self, "removeOccurrence:", v5);
    }

  }
  -[HKSPMutableSleepSchedule _freezeSavedOccurrence:](self, "_freezeSavedOccurrence:", v4, *(_OWORD *)v8, *(_QWORD *)&v8[16], v9);

}

- (void)_updateOverrideOccurrenceForOccurrence:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HKSPMutableSleepSchedule _shouldRemoveOverrideOccurrence:](self, "_shouldRemoveOverrideOccurrence:", v4))
  {
    HKSPLogForCategory(5uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543618;
      v19 = (id)objc_opt_class();
      v20 = 2114;
      v21 = v4;
      v6 = v19;
      _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing override occurrence %{public}@", (uint8_t *)&v18, 0x16u);

    }
    -[HKSPMutableSleepSchedule removeOccurrence:](self, "removeOccurrence:", v4);
  }
  else
  {
    objc_msgSend(v4, "backingOccurrence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    -[HKSPMutableSleepSchedule overrideDayOccurrence](self, "overrideDayOccurrence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HKSPMutableSleepSchedule overrideDayOccurrence](self, "overrideDayOccurrence");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      -[HKSPMutableSleepSchedule overrideDayOccurrence](self, "overrideDayOccurrence");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HKSPGenerateChangeSetBetweenObjects(v12, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      HKSPApplyChangesToObject(v11, v13);
      v8 = v11;
    }
    HKSPLogForCategory(5uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      v16 = v15;
      objc_msgSend(v8, "changeSet");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v15;
      v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_1A4F0E000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] saved override occurrence changes %{public}@", (uint8_t *)&v18, 0x16u);

    }
    -[HKSPMutableSleepSchedule setOverrideDayOccurrence:](self, "setOverrideDayOccurrence:", v8);

  }
}

- (void)_freezeSavedOccurrence:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "freeze");

}

- (BOOL)_shouldRemoveOverrideOccurrence:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HKSPSleepSchedule overridenOccurrenceForOverrideOccurrence:](self, "overridenOccurrenceForOverrideOccurrence:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEquivalentToOverrideOccurrence:", v4);

  return v6;
}

- (void)_updateBackingOccurrencesForOccurrence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  objc_msgSend(v4, "backingOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasChangeForPropertyIdentifier:", CFSTR("HKSPOccurrenceWeekdays"));
  v8 = MEMORY[0x1E0C809B0];
  if ((v7 & 1) == 0)
  {

LABEL_6:
    v13 = -1;
    goto LABEL_7;
  }
  objc_msgSend(v4, "changeSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "originalValueForPropertyIdentifier:", CFSTR("HKSPOccurrenceWeekdays"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  if (v11 == 0xFFFFFFFFLL || v11 == objc_msgSend(v4, "weekdays"))
    goto LABEL_6;
  -[HKSPMutableSleepSchedule _modifyDayOccurrencesForWeekdays:block:](self, "_modifyDayOccurrencesForWeekdays:block:", v11 & ~objc_msgSend(v4, "weekdays"), &__block_literal_global_434);
  v12 = objc_msgSend(v4, "weekdays") & ~v11;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __67__HKSPMutableSleepSchedule__updateBackingOccurrencesForOccurrence___block_invoke_2;
  v18[3] = &unk_1E4E3BB00;
  v18[4] = self;
  v19 = v5;
  -[HKSPMutableSleepSchedule _modifyDayOccurrencesForWeekdays:block:](self, "_modifyDayOccurrencesForWeekdays:block:", v12, v18);

  v13 = ~v12;
LABEL_7:
  v14 = objc_msgSend(v4, "weekdays") & v13;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __67__HKSPMutableSleepSchedule__updateBackingOccurrencesForOccurrence___block_invoke_3;
  v16[3] = &unk_1E4E3BB00;
  v16[4] = self;
  v17 = v5;
  v15 = v5;
  -[HKSPMutableSleepSchedule _modifyDayOccurrencesForWeekdays:block:](self, "_modifyDayOccurrencesForWeekdays:block:", v14, v16);

}

uint64_t __67__HKSPMutableSleepSchedule__updateBackingOccurrencesForOccurrence___block_invoke()
{
  return 0;
}

uint64_t __67__HKSPMutableSleepSchedule__updateBackingOccurrencesForOccurrence___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatedDayOccurrence:withDayOccurrence:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __67__HKSPMutableSleepSchedule__updateBackingOccurrencesForOccurrence___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatedDayOccurrence:withDayOccurrence:", a2, *(_QWORD *)(a1 + 40));
}

- (id)_updatedDayOccurrence:(id)a3 withDayOccurrence:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    HKSPGenerateChangeSetBetweenObjects(v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    HKSPApplyChangesToObject(v8, v9);
    v7 = v9;
  }
  else
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
  }

  return v8;
}

- (void)removeOccurrence:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "weekdays") != 0xFFFFFFFFLL)
  {
    objc_msgSend(v5, "wakeUpComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (objc_msgSend(v5, "isSingleDayOverride"))
        -[HKSPMutableSleepSchedule setOverrideDayOccurrence:](self, "setOverrideDayOccurrence:", 0);
      else
        -[HKSPMutableSleepSchedule _modifyDayOccurrencesForWeekdays:block:](self, "_modifyDayOccurrencesForWeekdays:block:", objc_msgSend(v5, "weekdays"), &__block_literal_global_435);
    }
  }

}

uint64_t __45__HKSPMutableSleepSchedule_removeOccurrence___block_invoke()
{
  return 0;
}

- (void)_modifyDayOccurrencesForWeekdays:(unint64_t)a3 block:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  if (a3 != 0xFFFFFFFF)
  {
    v8[1] = 3221225472;
    v8[2] = __67__HKSPMutableSleepSchedule__modifyDayOccurrencesForWeekdays_block___block_invoke;
    v8[3] = &unk_1E4E3BB48;
    v8[4] = self;
    v7 = v6;
    v8[0] = MEMORY[0x1E0C809B0];
    v9 = v6;
    HKSPWeekdaysEnumerateDays(a3, v8, 0);

    v6 = v7;
  }

}

void __67__HKSPMutableSleepSchedule__modifyDayOccurrencesForWeekdays_block___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  switch(a2)
  {
    case 1:
      v3 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "sundayOccurrence");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t))(v3 + 16))(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSundayOccurrence:", v4);
      goto LABEL_9;
    case 2:
      v5 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "mondayOccurrence");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t))(v5 + 16))(v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setMondayOccurrence:", v4);
      goto LABEL_9;
    case 3:
      v6 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "tuesdayOccurrence");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t))(v6 + 16))(v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setTuesdayOccurrence:", v4);
      goto LABEL_9;
    case 4:
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "wednesdayOccurrence");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t))(v7 + 16))(v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setWednesdayOccurrence:", v4);
      goto LABEL_9;
    case 5:
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "thursdayOccurrence");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t))(v8 + 16))(v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setThursdayOccurrence:", v4);
      goto LABEL_9;
    case 6:
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "fridayOccurrence");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t))(v9 + 16))(v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setFridayOccurrence:", v4);
      goto LABEL_9;
    case 7:
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "saturdayOccurrence");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t))(v10 + 16))(v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSaturdayOccurrence:", v4);
LABEL_9:

      break;
    default:
      return;
  }
}

- (void)setWindDownMinutes:(unint64_t)a3
{
  -[HKSPMutableSleepSchedule setWindDownTime:](self, "setWindDownTime:", (double)a3 * 60.0);
}

- (BOOL)hasChangeToSleepDurationGoal
{
  void *v2;
  char v3;

  -[HKSPMutableSleepSchedule changeSet](self, "changeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasChangeForPropertyIdentifier:", CFSTR("HKSPSleepDurationGoal"));

  return v3;
}

- (BOOL)hasChangeToWindDownTime
{
  void *v2;
  char v3;

  -[HKSPMutableSleepSchedule changeSet](self, "changeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasChangeForPropertyIdentifier:", CFSTR("HKSPWindDownTimeInterval"));

  return v3;
}

- (BOOL)_hasChangeToScheduleEnabled
{
  void *v2;
  char v3;

  -[HKSPMutableSleepSchedule changeSet](self, "changeSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasChangeForPropertyIdentifier:", CFSTR("HKSPScheduleEnabled"));

  return v3;
}

- (BOOL)hasChangeAffectingScheduling
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[HKSPMutableSleepSchedule hasChangeToWindDownTime](self, "hasChangeToWindDownTime")
    || -[HKSPMutableSleepSchedule _hasChangeToScheduleEnabled](self, "_hasChangeToScheduleEnabled"))
  {
    return 1;
  }
  -[HKSPMutableSleepSchedule mondayOccurrence](self, "mondayOccurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKSPMutableSleepSchedule _hasChangeForDayOccurrenceKey:dayOccurrence:](self, "_hasChangeForDayOccurrenceKey:dayOccurrence:", CFSTR("HKSPMondayOccurrence"), v4))
  {
    v3 = 1;
  }
  else
  {
    -[HKSPMutableSleepSchedule tuesdayOccurrence](self, "tuesdayOccurrence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HKSPMutableSleepSchedule _hasChangeForDayOccurrenceKey:dayOccurrence:](self, "_hasChangeForDayOccurrenceKey:dayOccurrence:", CFSTR("HKSPTuesdayOccurrence"), v5))
    {
      v3 = 1;
    }
    else
    {
      -[HKSPMutableSleepSchedule wednesdayOccurrence](self, "wednesdayOccurrence");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HKSPMutableSleepSchedule _hasChangeForDayOccurrenceKey:dayOccurrence:](self, "_hasChangeForDayOccurrenceKey:dayOccurrence:", CFSTR("HKSPWednesdayOccurrence"), v6))
      {
        v3 = 1;
      }
      else
      {
        -[HKSPMutableSleepSchedule thursdayOccurrence](self, "thursdayOccurrence");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[HKSPMutableSleepSchedule _hasChangeForDayOccurrenceKey:dayOccurrence:](self, "_hasChangeForDayOccurrenceKey:dayOccurrence:", CFSTR("HKSPThursdayOccurrence"), v7))
        {
          v3 = 1;
        }
        else
        {
          -[HKSPMutableSleepSchedule fridayOccurrence](self, "fridayOccurrence");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[HKSPMutableSleepSchedule _hasChangeForDayOccurrenceKey:dayOccurrence:](self, "_hasChangeForDayOccurrenceKey:dayOccurrence:", CFSTR("HKSPFridayOccurrence"), v8))
          {
            v3 = 1;
          }
          else
          {
            -[HKSPMutableSleepSchedule saturdayOccurrence](self, "saturdayOccurrence");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[HKSPMutableSleepSchedule _hasChangeForDayOccurrenceKey:dayOccurrence:](self, "_hasChangeForDayOccurrenceKey:dayOccurrence:", CFSTR("HKSPSaturdayOccurrence"), v9))
            {
              v3 = 1;
            }
            else
            {
              -[HKSPMutableSleepSchedule sundayOccurrence](self, "sundayOccurrence");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (-[HKSPMutableSleepSchedule _hasChangeForDayOccurrenceKey:dayOccurrence:](self, "_hasChangeForDayOccurrenceKey:dayOccurrence:", CFSTR("HKSPSundayOccurrence"), v10))
              {
                v3 = 1;
              }
              else
              {
                -[HKSPMutableSleepSchedule overrideDayOccurrence](self, "overrideDayOccurrence");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v3 = -[HKSPMutableSleepSchedule _hasChangeForDayOccurrenceKey:dayOccurrence:](self, "_hasChangeForDayOccurrenceKey:dayOccurrence:", CFSTR("HKSPOverrideOccurrence"), v11);

              }
            }

          }
        }

      }
    }

  }
  return v3;
}

- (BOOL)_hasChangeForDayOccurrenceKey:(id)a3 dayOccurrence:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  -[HKSPMutableSleepSchedule changeSet](self, "changeSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasChangeForPropertyIdentifier:", v6);

  if (v9)
  {
    if (v7
      && (-[HKSPMutableSleepSchedule changeSet](self, "changeSet"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "originalValueForPropertyIdentifier:", v6),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      v12 = objc_msgSend(v7, "hasChangeAffectingScheduling");
    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)hasOverrideOccurrenceRemoval
{
  void *v3;
  BOOL v4;

  -[HKSPMutableSleepSchedule overrideDayOccurrence](self, "overrideDayOccurrence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 0;
  else
    v4 = -[HKSPMutableSleepSchedule _hasChangeForDayOccurrenceKey:dayOccurrence:](self, "_hasChangeForDayOccurrenceKey:dayOccurrence:", CFSTR("HKSPOverrideOccurrence"), 0);

  return v4;
}

- (id)lastOverrideOccurrenceWakeUpComponents
{
  void *v3;
  void *v4;
  void *v5;

  if (-[HKSPMutableSleepSchedule hasOverrideOccurrenceRemoval](self, "hasOverrideOccurrenceRemoval"))
  {
    -[HKSPMutableSleepSchedule changeSet](self, "changeSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "originalValueForPropertyIdentifier:", CFSTR("HKSPOverrideOccurrence"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKSPSleepSchedule overrideOccurrence](self, "overrideOccurrence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "wakeUpComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
