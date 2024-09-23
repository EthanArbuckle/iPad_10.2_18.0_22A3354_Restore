@implementation HKSPSleepScheduleDayOccurrence

- (HKSPSleepScheduleDayOccurrence)init
{
  HKSPSleepScheduleDayOccurrence *v2;
  HKSPSleepScheduleDayOccurrence *v3;
  HKSPAlarmConfiguration *v4;
  HKSPAlarmConfiguration *alarmConfiguration;
  HKSPSleepScheduleDayOccurrence *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKSPSleepScheduleDayOccurrence;
  v2 = -[HKSPSleepScheduleDayOccurrence init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v4 = objc_alloc_init(HKSPAlarmConfiguration);
    alarmConfiguration = v3->_alarmConfiguration;
    v3->_alarmConfiguration = v4;

    v6 = v3;
  }

  return v3;
}

- (NSDateComponents)bedtimeComponents
{
  return (NSDateComponents *)(id)-[NSDateComponents copy](self->_bedtimeComponents, "copy");
}

- (NSDateComponents)wakeUpComponents
{
  return (NSDateComponents *)(id)-[NSDateComponents copy](self->_wakeUpComponents, "copy");
}

- (id)initFromObject:(id)a3
{
  id v4;
  id v5;
  HKSPSleepScheduleDayOccurrence *v6;
  HKSPSleepScheduleDayOccurrence *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[HKSPSleepScheduleDayOccurrence init](self, "init");
    HKSPCopyFromObject(v5, v6);

    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HKSPSleepScheduleDayOccurrence)initWithCoder:(id)a3
{
  id v4;
  HKSPSleepScheduleDayOccurrence *v5;
  HKSPSleepScheduleDayOccurrence *v6;
  uint64_t v7;
  NSDateComponents *bedtimeComponents;
  uint64_t v9;
  NSDateComponents *wakeUpComponents;
  HKSPSleepScheduleDayOccurrence *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSPSleepScheduleDayOccurrence;
  v5 = -[HKSPSleepScheduleDayOccurrence init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    HKSPDecodeObjectWithCoder(v5, v4);
    if ((objc_msgSend(v4, "hksp_serializationOptions") & 1) != 0)
    {
      -[HKSPSleepScheduleDayOccurrence _decodeComponentsForPersistenceWithCoder:key:](v6, "_decodeComponentsForPersistenceWithCoder:key:", v4, CFSTR("HKSPDayOccurrenceBedtimeComponents"));
      v7 = objc_claimAutoreleasedReturnValue();
      bedtimeComponents = v6->_bedtimeComponents;
      v6->_bedtimeComponents = (NSDateComponents *)v7;

      -[HKSPSleepScheduleDayOccurrence _decodeComponentsForPersistenceWithCoder:key:](v6, "_decodeComponentsForPersistenceWithCoder:key:", v4, CFSTR("HKSPDayOccurrenceWakeUpComponents"));
      v9 = objc_claimAutoreleasedReturnValue();
      wakeUpComponents = v6->_wakeUpComponents;
      v6->_wakeUpComponents = (NSDateComponents *)v9;

    }
    v11 = v6;
  }

  return v6;
}

- (id)_decodeComponentsForPersistenceWithCoder:(id)a3 key:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a4;
  v7 = a3;
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v8, v21, v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HKSPDayOccurrenceHour"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHour:", objc_msgSend(v12, "integerValue"));

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HKSPDayOccurrenceMinute"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMinute:", objc_msgSend(v13, "integerValue"));

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HKSPDayOccurrenceYear"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HKSPDayOccurrenceYear"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setYear:", objc_msgSend(v15, "integerValue"));

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HKSPDayOccurrenceMonth"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HKSPDayOccurrenceMonth"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMonth:", objc_msgSend(v17, "integerValue"));

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HKSPDayOccurrenceDay"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HKSPDayOccurrenceDay"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDay:", objc_msgSend(v19, "integerValue"));

  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  HKSPEncodeObjectWithCoder(self, v4);
  if ((objc_msgSend(v4, "hksp_serializationOptions") & 1) != 0)
  {
    -[HKSPSleepScheduleDayOccurrence _encodeComponentsForPersistence:coder:key:](self, "_encodeComponentsForPersistence:coder:key:", self->_bedtimeComponents, v4, CFSTR("HKSPDayOccurrenceBedtimeComponents"));
    -[HKSPSleepScheduleDayOccurrence _encodeComponentsForPersistence:coder:key:](self, "_encodeComponentsForPersistence:coder:key:", self->_wakeUpComponents, v4, CFSTR("HKSPDayOccurrenceWakeUpComponents"));
  }

}

- (void)_encodeComponentsForPersistence:(id)a3 coder:(id)a4 key:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "hour"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("HKSPDayOccurrenceHour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "minute"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("HKSPDayOccurrenceMinute"));

  if (objc_msgSend(v17, "year") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "year"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("HKSPDayOccurrenceYear"));

  }
  if (objc_msgSend(v17, "month") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "month"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("HKSPDayOccurrenceMonth"));

  }
  if (objc_msgSend(v17, "day") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v17, "day"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("HKSPDayOccurrenceDay"));

  }
  v16 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v9, "encodeObject:forKey:", v16, v8);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)innerClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (id)mutableCopy
{
  return -[HKSPMutableSleepScheduleDayOccurrence initFromObject:]([HKSPMutableSleepScheduleDayOccurrence alloc], "initFromObject:", self);
}

- (id)generateSleepScheduleOccurrenceWithWeekdays:(unint64_t)a3
{
  HKSPMutableSleepScheduleOccurrence *v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(HKSPMutableSleepScheduleOccurrence);
  -[HKSPMutableSleepScheduleOccurrence setWeekdays:](v5, "setWeekdays:", a3);
  v6 = (void *)-[HKSPSleepScheduleDayOccurrence copy](self, "copy");
  -[HKSPMutableSleepScheduleOccurrence setBackingOccurrence:](v5, "setBackingOccurrence:", v6);

  v7 = (void *)-[HKSPMutableSleepScheduleOccurrence copy](v5, "copy");
  return v7;
}

- (id)changesFromOccurrence:(id)a3
{
  return HKSPGenerateChangeSetBetweenObjects(self, a3);
}

- (BOOL)isEqual:(id)a3
{
  return HKSPObjectsAreEqual(self, a3);
}

- (BOOL)isEquivalentTo:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_286);
}

- (BOOL)isEquivalentToOccurrenceIgnoringDates:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_24);
}

id __72__HKSPSleepScheduleDayOccurrence_isEquivalentToOccurrenceIgnoringDates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("HKSPDayOccurrenceWakeUpComponents")))
  {

  }
  else
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("HKSPDayOccurrenceBedtimeComponents"));

    if (!v8)
    {
      v9 = v5;
      goto LABEL_6;
    }
  }
  objc_msgSend(v5, "hksp_timeComponents");
  v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = v9;

  return v10;
}

- (BOOL)isAlarmEquivalentToOccurrenceIgnoringDates:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_194);
}

id __77__HKSPSleepScheduleDayOccurrence_isAlarmEquivalentToOccurrenceIgnoringDates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("HKSPDayOccurrenceWakeUpComponents"));

  if (v7)
  {
    objc_msgSend(v5, "hksp_timeComponents");
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = v8;
    goto LABEL_7;
  }
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("HKSPDayOccurrenceBedtimeComponents"));

  if ((v10 & 1) == 0)
  {
    v8 = v5;
    goto LABEL_6;
  }
  v11 = (void *)MEMORY[0x1E0C9AAB0];
LABEL_7:

  return v11;
}

- (NSString)groupingIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepScheduleDayOccurrence bedtimeComponents](self, "bedtimeComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[HKSPSleepScheduleDayOccurrence wakeUpComponents](self, "wakeUpComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[HKSPSleepScheduleDayOccurrence alarmConfiguration](self, "alarmConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  v10 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSString)description
{
  return (NSString *)-[HKSPSleepScheduleDayOccurrence descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", &stru_1E4E3E220);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPSleepScheduleDayOccurrence succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepScheduleDayOccurrence bedtimeComponents](self, "bedtimeComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hksp_description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("bedtime"));

  -[HKSPSleepScheduleDayOccurrence wakeUpComponents](self, "wakeUpComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hksp_description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("wakeUp"));

  -[HKSPSleepScheduleDayOccurrence alarmConfiguration](self, "alarmConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(v8, "isEnabled"), CFSTR("alarm"));

  return v3;
}

- (unint64_t)version
{
  return self->_version;
}

- (HKSPAlarmConfiguration)alarmConfiguration
{
  return self->_alarmConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmConfiguration, 0);
  objc_storeStrong((id *)&self->_wakeUpComponents, 0);
  objc_storeStrong((id *)&self->_bedtimeComponents, 0);
}

@end
