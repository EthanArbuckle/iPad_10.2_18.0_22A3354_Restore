@implementation HKSPMutableSleepScheduleOccurrence

- (void)setBackingOccurrence:(id)a3
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HKSPOccurrenceBackingOccurrence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!NAEqualObjects()
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPOccurrenceBackingOccurrence")))
  {
    objc_msgSend(v6, "isRelationshipProperty");
    v8 = (objc_class *)objc_opt_class();
    changeSet = self->_changeSet;
    v10 = (void *)objc_msgSend([v8 alloc], "initWithProperty:changedValue:originalValue:", v6, v11, v7);
    -[HKSPChangeSet addChange:](changeSet, "addChange:", v10);

  }
}

- (HKSPSleepScheduleDayOccurrence)backingOccurrence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend((id)objc_opt_class(), "allProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertiesByIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPOccurrenceBackingOccurrence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPOccurrenceBackingOccurrence")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPOccurrenceBackingOccurrence"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleDayOccurrence *)v6;
}

- (void)setWeekdays:(unint64_t)a3
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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HKSPOccurrenceWeekdays"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  if (v8 != a3
    || -[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPOccurrenceWeekdays")))
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

- (unint64_t)weekdays
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
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HKSPOccurrenceWeekdays"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPChangeSet hasChangeForPropertyIdentifier:](self->_changeSet, "hasChangeForPropertyIdentifier:", CFSTR("HKSPOccurrenceWeekdays")))
  {
    -[HKSPChangeSet changedValueForPropertyIdentifier:](self->_changeSet, "changedValueForPropertyIdentifier:", CFSTR("HKSPOccurrenceWeekdays"));
  }
  else
  {
    -[HKSPObject hksp_valueForProperty:](self->_originalObject, "hksp_valueForProperty:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

- (HKSPMutableSleepScheduleOccurrence)init
{
  HKSPMutableSleepScheduleOccurrence *v2;
  HKSPSleepScheduleOccurrence *v3;
  HKSPObject *originalObject;
  HKSPChangeSet *v5;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepScheduleOccurrence *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKSPMutableSleepScheduleOccurrence;
  v2 = -[HKSPSleepScheduleOccurrence init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HKSPSleepScheduleOccurrence);
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
  HKSPMutableSleepScheduleOccurrence *v6;
  uint64_t v7;
  HKSPObject *originalObject;
  HKSPChangeSet *v9;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepScheduleOccurrence *v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepScheduleOccurrence.m"), 405, CFSTR("object must be a subclass"));

  }
  v14.receiver = self;
  v14.super_class = (Class)HKSPMutableSleepScheduleOccurrence;
  v6 = -[HKSPSleepScheduleOccurrence init](&v14, sel_init);
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

- (HKSPMutableSleepScheduleOccurrence)initWithCoder:(id)a3
{
  id v4;
  HKSPMutableSleepScheduleOccurrence *v5;
  uint64_t v6;
  HKSPObject *originalObject;
  uint64_t v8;
  HKSPChangeSet *changeSet;
  HKSPMutableSleepScheduleOccurrence *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPMutableSleepScheduleOccurrence;
  v5 = -[HKSPSleepScheduleOccurrence init](&v12, sel_init);
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

- (HKSPMutableSleepScheduleOccurrence)initWithTemplateOccurrence:(id)a3
{
  id v4;
  HKSPMutableSleepScheduleOccurrence *v5;
  void *v6;
  void *v7;
  HKSPMutableAlarmConfiguration *v8;
  void *v9;
  HKSPMutableAlarmConfiguration *v10;

  v4 = a3;
  v5 = -[HKSPMutableSleepScheduleOccurrence init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "bedtimeComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPMutableSleepScheduleOccurrence setBedtimeComponents:](v5, "setBedtimeComponents:", v6);

    objc_msgSend(v4, "wakeUpComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPMutableSleepScheduleOccurrence setWakeUpComponents:](v5, "setWakeUpComponents:", v7);

    -[HKSPMutableSleepScheduleOccurrence setWeekdays:](v5, "setWeekdays:", objc_msgSend(v4, "weekdays"));
    v8 = [HKSPMutableAlarmConfiguration alloc];
    objc_msgSend(v4, "alarmConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HKSPMutableAlarmConfiguration initWithTemplateAlarmConfiguration:](v8, "initWithTemplateAlarmConfiguration:", v9);
    -[HKSPMutableSleepScheduleOccurrence setAlarmConfiguration:](v5, "setAlarmConfiguration:", v10);

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
  return -[HKSPSleepScheduleOccurrence initFromObject:]([HKSPSleepScheduleOccurrence alloc], "initFromObject:", self);
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
  -[HKSPMutableSleepScheduleOccurrence originalObject](self, "originalObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copyWithZone:", 0);
  v6 = (void *)v3[4];
  v3[4] = v5;

  -[HKSPMutableSleepScheduleOccurrence changeSet](self, "changeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deepCopy");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v3[5];
  v3[5] = v8;

  return v3;
}

- (void)freeze
{
  HKSPObject *v3;
  HKSPObject *originalObject;

  v3 = -[HKSPSleepScheduleOccurrence initFromObject:]([HKSPSleepScheduleOccurrence alloc], "initFromObject:", self);
  originalObject = self->_originalObject;
  self->_originalObject = v3;

  -[HKSPMutableSleepScheduleOccurrence revert](self, "revert");
}

- (void)revert
{
  -[HKSPChangeSet removeAllChanges](self->_changeSet, "removeAllChanges");
}

- (void)turnOnWeekdays:(unint64_t)a3
{
  -[HKSPMutableSleepScheduleOccurrence setWeekdays:](self, "setWeekdays:", -[HKSPMutableSleepScheduleOccurrence weekdays](self, "weekdays") | a3);
}

- (void)turnOffWeekdays:(unint64_t)a3
{
  -[HKSPMutableSleepScheduleOccurrence setWeekdays:](self, "setWeekdays:", -[HKSPMutableSleepScheduleOccurrence weekdays](self, "weekdays") & ~a3);
}

- (void)turnOnAlarm
{
  void *v3;
  id v4;

  -[HKSPMutableSleepScheduleOccurrence alarmConfiguration](self, "alarmConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setEnabled:", 1);
  -[HKSPMutableSleepScheduleOccurrence setAlarmConfiguration:](self, "setAlarmConfiguration:", v4);

}

- (void)turnOffAlarm
{
  void *v3;
  id v4;

  -[HKSPMutableSleepScheduleOccurrence alarmConfiguration](self, "alarmConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setEnabled:", 0);
  -[HKSPMutableSleepScheduleOccurrence setAlarmConfiguration:](self, "setAlarmConfiguration:", v4);

}

- (void)setWakeUpComponents:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKSPMutableSleepScheduleOccurrence backingOccurrence](self, "backingOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setWakeUpComponents:", v4);
  -[HKSPMutableSleepScheduleOccurrence setBackingOccurrence:](self, "setBackingOccurrence:", v6);

}

- (void)setBedtimeComponents:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKSPMutableSleepScheduleOccurrence backingOccurrence](self, "backingOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setBedtimeComponents:", v4);
  -[HKSPMutableSleepScheduleOccurrence setBackingOccurrence:](self, "setBackingOccurrence:", v6);

}

- (HKSPAlarmConfiguration)alarmConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  -[HKSPMutableSleepScheduleOccurrence backingOccurrence](self, "backingOccurrence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alarmConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return (HKSPAlarmConfiguration *)v4;
}

- (void)setAlarmConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HKSPMutableSleepScheduleOccurrence backingOccurrence](self, "backingOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setAlarmConfiguration:", v4);
  -[HKSPMutableSleepScheduleOccurrence setBackingOccurrence:](self, "setBackingOccurrence:", v6);

}

- (void)applyHourAndMinuteFromBedtimeComponents:(id)a3 wakeUpComponents:(id)a4 gregorianCalendar:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v9 = a4;
  v10 = a5;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepScheduleOccurrence.m"), 506, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bedtimeComponents != nil"));

    if (v9)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepScheduleOccurrence.m"), 507, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("wakeUpComponents != nil"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_12;
LABEL_3:
  if (-[HKSPSleepScheduleOccurrence isSingleDayOverride](self, "isSingleDayOverride")
    && (-[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents"),
        (v11 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v12 = (void *)v11,
        -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v12,
        v13))
  {
    -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    objc_msgSend(v15, "setHour:", objc_msgSend(v9, "hour"));
    objc_msgSend(v15, "setMinute:", objc_msgSend(v9, "minute"));
    objc_msgSend(v10, "dateFromComponents:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v17, "setHour:", objc_msgSend(v23, "hour"));
      objc_msgSend(v17, "setMinute:", objc_msgSend(v23, "minute"));
      objc_msgSend(v10, "hksp_previousDateBeforeDate:matchingComponents:", v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "components:fromDate:", 124, v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPMutableSleepScheduleOccurrence setWakeUpComponents:](self, "setWakeUpComponents:", v19);

      objc_msgSend(v10, "components:fromDate:", 124, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPMutableSleepScheduleOccurrence setBedtimeComponents:](self, "setBedtimeComponents:", v20);

    }
  }
  else
  {
    -[HKSPMutableSleepScheduleOccurrence setBedtimeComponents:](self, "setBedtimeComponents:", v23);
    -[HKSPMutableSleepScheduleOccurrence setWakeUpComponents:](self, "setWakeUpComponents:", v9);
  }

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
