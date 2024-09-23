@implementation HKSPMutableSleepScheduleDayOccurrence

- (void)setBedtimeComponents:(id)a3
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPDayOccurrenceBedtimeComponents"));
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
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPDayOccurrenceBedtimeComponents")))
  {
    objc_msgSend(v7, "isRelationshipProperty");
    v12 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v14 = (void *)objc_msgSend([v12 alloc], "initWithProperty:changedValue:originalValue:", v7, v15, v8);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v14);

  }
}

- (NSDateComponents)bedtimeComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPDayOccurrenceBedtimeComponents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPDayOccurrenceBedtimeComponents")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPDayOccurrenceBedtimeComponents"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v6;
}

- (void)setWakeUpComponents:(id)a3
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPDayOccurrenceWakeUpComponents"));
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
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPDayOccurrenceWakeUpComponents")))
  {
    objc_msgSend(v7, "isRelationshipProperty");
    v12 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v14 = (void *)objc_msgSend([v12 alloc], "initWithProperty:changedValue:originalValue:", v7, v15, v8);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v14);

  }
}

- (NSDateComponents)wakeUpComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPDayOccurrenceWakeUpComponents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPDayOccurrenceWakeUpComponents")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPDayOccurrenceWakeUpComponents"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v6;
}

- (void)setAlarmConfiguration:(id)a3
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPDayOccurrenceAlarm"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPDayOccurrenceAlarm")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithProperty:changedValue:originalValue:", v6, v11, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v10);

  }
}

- (HKSPAlarmConfiguration)alarmConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPDayOccurrenceAlarm"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPDayOccurrenceAlarm")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPDayOccurrenceAlarm"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPAlarmConfiguration *)v6;
}

- (HKSPMutableSleepScheduleDayOccurrence)init
{
  HKSPMutableSleepScheduleDayOccurrence *v2;
  HKSPSleepScheduleDayOccurrence *v3;
  HKSPObject *originalObject;
  HKSPChangeSet *v5;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepScheduleDayOccurrence *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKSPMutableSleepScheduleDayOccurrence;
  v2 = -[HKSPSleepScheduleDayOccurrence init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HKSPSleepScheduleDayOccurrence);
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
  HKSPMutableSleepScheduleDayOccurrence *v6;
  uint64_t v7;
  HKSPObject *originalObject;
  HKSPChangeSet *v9;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepScheduleDayOccurrence *v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepScheduleDayOccurrence.m"), 251, CFSTR("object must be a subclass"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HKSPMutableSleepScheduleDayOccurrence;
  v6 = -[HKSPSleepScheduleDayOccurrence init](&v14, sel_init);
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

- (HKSPMutableSleepScheduleDayOccurrence)initWithCoder:(id)a3
{
  id v4;
  HKSPMutableSleepScheduleDayOccurrence *v5;
  uint64_t v6;
  HKSPObject *originalObject;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepScheduleDayOccurrence *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPMutableSleepScheduleDayOccurrence;
  v5 = -[HKSPSleepScheduleDayOccurrence init](&v12, sel_init);
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
  return -[HKSPSleepScheduleDayOccurrence initFromObject:]([HKSPSleepScheduleDayOccurrence alloc], "initFromObject:", self);
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
  -[HKSPMutableSleepScheduleDayOccurrence originalObject](self, "originalObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copyWithZone:", 0);
  v6 = (void *)v3[5];
  v3[5] = v5;

  -[HKSPMutableSleepScheduleDayOccurrence changeSet](self, "changeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deepCopy");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v3[6];
  v3[6] = v8;

  return v3;
}

- (void)freeze
{
  HKSPObject *v3;
  HKSPObject *originalObject;

  v3 = -[HKSPSleepScheduleDayOccurrence initFromObject:]([HKSPSleepScheduleDayOccurrence alloc], "initFromObject:", self);
  originalObject = self->_originalObject;
  self->_originalObject = v3;

  -[HKSPMutableSleepScheduleDayOccurrence revert](self, "revert");
}

- (void)revert
{
  -[HKSPChangeSet removeAllChanges](self->_changeSet, "removeAllChanges");
}

- (id)generateSleepScheduleOccurrenceWithWeekdays:(unint64_t)a3
{
  HKSPMutableSleepScheduleOccurrence *v5;
  void *v6;
  id v7;

  v5 = objc_alloc_init(HKSPMutableSleepScheduleOccurrence);
  -[HKSPMutableSleepScheduleOccurrence setWeekdays:](v5, "setWeekdays:", a3);
  -[HKSPMutableSleepScheduleDayOccurrence originalObject](self, "originalObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPMutableSleepScheduleOccurrence setBackingOccurrence:](v5, "setBackingOccurrence:", v6);

  -[HKSPMutableSleepScheduleOccurrence freeze](v5, "freeze");
  v7 = -[HKSPMutableSleepScheduleDayOccurrence mutableCopy](self, "mutableCopy");
  -[HKSPMutableSleepScheduleOccurrence setBackingOccurrence:](v5, "setBackingOccurrence:", v7);

  return v5;
}

- (BOOL)hasChangeAffectingScheduling
{
  void *v3;
  char v4;
  void *v5;

  -[HKSPMutableSleepScheduleDayOccurrence changeSet](self, "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasChangeForPropertyIdentifier:", CFSTR("HKSPDayOccurrenceBedtimeComponents")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[HKSPMutableSleepScheduleDayOccurrence changeSet](self, "changeSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hasChangeForPropertyIdentifier:", CFSTR("HKSPDayOccurrenceWakeUpComponents"));

  }
  return v4;
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
