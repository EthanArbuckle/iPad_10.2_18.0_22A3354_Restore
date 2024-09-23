@implementation HKSPSleepSchedule

- (HKSPSleepSchedule)init
{
  HKSPSleepSchedule *v2;
  HKSPSleepSchedule *v3;
  HKSPSleepSchedule *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKSPSleepSchedule;
  v2 = -[HKSPSleepSchedule init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_version = 1;
    v2->_enabled = 1;
    v2->_sleepDurationGoal = 0.0;
    v2->_windDownTime = *(double *)&HKSPWindDownMinutesDefault * 60.0;
    v4 = v2;
  }

  return v3;
}

- (id)initFromObject:(id)a3
{
  id v4;
  id v5;
  HKSPSleepSchedule *v6;
  void *v7;
  uint64_t v8;
  HKSPSyncAnchor *syncAnchor;
  HKSPSleepSchedule *v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[HKSPSleepSchedule init](self, "init");
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

  v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (BOOL)isEmptySleepSchedule
{
  return 0;
}

+ (id)emptyScheduleWithSyncAnchor:(id)a3
{
  id v3;
  _HKSPEmptySleepSchedule *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(_HKSPEmptySleepSchedule);
  -[HKSPSleepSchedule objectWithSyncAnchor:](v4, "objectWithSyncAnchor:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HKSPSleepSchedule)initWithCoder:(id)a3
{
  id v4;
  HKSPSleepSchedule *v5;
  HKSPSleepSchedule *v6;
  uint64_t v7;
  HKSPSyncAnchor *syncAnchor;
  HKSPSleepSchedule *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSPSleepSchedule;
  v5 = -[HKSPSleepSchedule init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    HKSPDecodeObjectWithCoder(v5, v4);
    if ((objc_msgSend(v4, "hksp_serializationOptions") & 1) == 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", HKSPSyncAnchorClass(), CFSTR("HKSPScheduleSyncAnchor"));
      v7 = objc_claimAutoreleasedReturnValue();
      syncAnchor = v6->_syncAnchor;
      v6->_syncAnchor = (HKSPSyncAnchor *)v7;

    }
    v9 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  HKSPEncodeObjectWithCoder(self, v4);
  if ((objc_msgSend(v4, "hksp_serializationOptions") & 1) == 0)
    objc_msgSend(v4, "encodeObject:forKey:", self->_syncAnchor, CFSTR("HKSPScheduleSyncAnchor"));

}

- (void)_enumerateDayOccurrencesWithBlock:(id)a3
{
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
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(id, uint64_t, void *);

  v20 = (void (**)(id, uint64_t, void *))a3;
  -[HKSPSleepSchedule mondayOccurrence](self, "mondayOccurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HKSPSleepSchedule mondayOccurrence](self, "mondayOccurrence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, 2, v5);

  }
  -[HKSPSleepSchedule tuesdayOccurrence](self, "tuesdayOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HKSPSleepSchedule tuesdayOccurrence](self, "tuesdayOccurrence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, 3, v7);

  }
  -[HKSPSleepSchedule wednesdayOccurrence](self, "wednesdayOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HKSPSleepSchedule wednesdayOccurrence](self, "wednesdayOccurrence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, 4, v9);

  }
  -[HKSPSleepSchedule thursdayOccurrence](self, "thursdayOccurrence");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HKSPSleepSchedule thursdayOccurrence](self, "thursdayOccurrence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, 5, v11);

  }
  -[HKSPSleepSchedule fridayOccurrence](self, "fridayOccurrence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HKSPSleepSchedule fridayOccurrence](self, "fridayOccurrence");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, 6, v13);

  }
  -[HKSPSleepSchedule saturdayOccurrence](self, "saturdayOccurrence");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HKSPSleepSchedule saturdayOccurrence](self, "saturdayOccurrence");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, 7, v15);

  }
  -[HKSPSleepSchedule sundayOccurrence](self, "sundayOccurrence");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HKSPSleepSchedule sundayOccurrence](self, "sundayOccurrence");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, 1, v17);

  }
  -[HKSPSleepSchedule overrideDayOccurrence](self, "overrideDayOccurrence");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HKSPSleepSchedule overrideDayOccurrence](self, "overrideDayOccurrence");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2](v20, 0, v19);

  }
}

- (id)_unsortedOccurrences
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __41__HKSPSleepSchedule__unsortedOccurrences__block_invoke;
  v18[3] = &unk_1E4E3B8C8;
  v7 = v3;
  v19 = v7;
  v20 = v4;
  v8 = v5;
  v21 = v8;
  v9 = v4;
  -[HKSPSleepSchedule _enumerateDayOccurrencesWithBlock:](self, "_enumerateDayOccurrencesWithBlock:", v18);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __41__HKSPSleepSchedule__unsortedOccurrences__block_invoke_2;
  v15[3] = &unk_1E4E3B8F0;
  v16 = v8;
  v10 = v7;
  v17 = v10;
  v11 = v8;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

void __41__HKSPSleepSchedule__unsortedOccurrences__block_invoke(id *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a3;
  v12 = v5;
  if (a2)
  {
    objc_msgSend(v5, "groupingIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "objectForKeyedSubscript:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v7, v6);
    }
    objc_msgSend(v7, "addObject:", v12);
    objc_msgSend(a1[6], "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    if ((unint64_t)(a2 + 2) > 9)
      v10 = 0;
    else
      v10 = qword_1A4F67010[a2 + 2];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10 | v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v11, v6);

  }
  else
  {
    objc_msgSend(v5, "generateSleepScheduleOccurrenceWithWeekdays:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "addObject:", v6);
  }

}

void __41__HKSPSleepSchedule__unsortedOccurrences__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_msgSend(a3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "generateSleepScheduleOccurrenceWithWeekdays:", objc_msgSend(v7, "unsignedIntegerValue"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
}

- (BOOL)hasOccurrences
{
  void *v2;
  BOOL v3;

  -[HKSPSleepSchedule _unsortedOccurrences](self, "_unsortedOccurrences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isEnabledAndHasOccurrences
{
  _BOOL4 v3;

  v3 = -[HKSPSleepSchedule isEnabled](self, "isEnabled");
  if (v3)
    LOBYTE(v3) = -[HKSPSleepSchedule hasOccurrences](self, "hasOccurrences");
  return v3;
}

- (BOOL)meetsDefaultSleepGoal
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[HKSPSleepSchedule hasOccurrences](self, "hasOccurrences");
  if (v3)
  {
    -[HKSPSleepSchedule occurrences](self, "occurrences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "na_all:", &__block_literal_global_11);

    LOBYTE(v3) = v5;
  }
  return v3;
}

BOOL __42__HKSPSleepSchedule_meetsDefaultSleepGoal__block_invoke(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "generalSleepInterval");
  return v2 >= *(double *)&HKSPSleepDurationGoalHoursDefault * 3600.0;
}

- (BOOL)isDefaultSchedule
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;

  if (!-[HKSPSleepSchedule isEnabled](self, "isEnabled"))
    return 0;
  -[HKSPSleepSchedule occurrencesOnDays:](self, "occurrencesOnDays:", 127);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1
    && (objc_msgSend(v3, "firstObject"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "weekdays"),
        v4,
        v5 == 127))
  {
    objc_msgSend(v3, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "usesDefaultBedtimeAndWakeUpComponents");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)occurrences
{
  void *v2;
  void *v3;

  -[HKSPSleepSchedule _unsortedOccurrences](self, "_unsortedOccurrences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_191_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __32__HKSPSleepSchedule_occurrences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  v5 = a2;
  v6 = objc_msgSend(v5, "isSingleDayOverride");
  if (v6 == objc_msgSend(v4, "isSingleDayOverride"))
  {
    v9 = objc_msgSend(v5, "weekdays");

    v8 = HKSPCompareWeekdaysInCurrentCalendar(v9, objc_msgSend(v4, "weekdays"));
  }
  else
  {
    v7 = objc_msgSend(v5, "isSingleDayOverride");

    if (v7)
      v8 = -1;
    else
      v8 = 1;
  }

  return v8;
}

- (HKSPSleepScheduleOccurrence)overrideOccurrence
{
  void *v2;
  void *v3;

  -[HKSPSleepSchedule overrideDayOccurrence](self, "overrideDayOccurrence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generateSleepScheduleOccurrenceWithWeekdays:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleOccurrence *)v3;
}

- (id)overridenOccurrenceForOverrideOccurrence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  if (objc_msgSend(v4, "isSingleDayOverride"))
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPSleepSchedule occurrences](self, "occurrences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__HKSPSleepSchedule_overridenOccurrenceForOverrideOccurrence___block_invoke;
    v10[3] = &unk_1E4E3B978;
    v11 = v4;
    v12 = v5;
    v7 = v5;
    objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __62__HKSPSleepSchedule_overridenOccurrenceForOverrideOccurrence___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isSingleDayOverride") & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "overrideAppliesToOccurrence:gregorianCalendar:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

- (id)occurrencesAfterDate:(id)a3 gregorianCalendar:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "calendarIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepSchedule.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[gregorianCalendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]"));

  }
  -[HKSPSleepSchedule occurrences](self, "occurrences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__HKSPSleepSchedule_occurrencesAfterDate_gregorianCalendar___block_invoke;
  v17[3] = &unk_1E4E3B978;
  v18 = v8;
  v19 = v7;
  v12 = v7;
  v13 = v8;
  objc_msgSend(v11, "na_filter:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __60__HKSPSleepSchedule_occurrencesAfterDate_gregorianCalendar___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  if (objc_msgSend(v3, "isSingleDayOverride"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "wakeUpComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateFromComponents:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "hksp_isAfterDate:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)mutableOccurrenceTemplate
{
  void *v3;
  void *v4;
  void *v5;
  HKSPSleepScheduleOccurrence *v6;
  HKSPSleepScheduleOccurrence *v7;
  HKSPMutableSleepScheduleOccurrence *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;

  -[HKSPSleepSchedule occurrences](self, "occurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_200);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(HKSPSleepScheduleOccurrence);
  v7 = v6;

  v8 = -[HKSPMutableSleepScheduleOccurrence initWithTemplateOccurrence:]([HKSPMutableSleepScheduleOccurrence alloc], "initWithTemplateOccurrence:", v7);
  -[HKSPMutableSleepScheduleOccurrence setWeekdays:](v8, "setWeekdays:", -[HKSPSleepSchedule weekdaysWithoutOccurrences](self, "weekdaysWithoutOccurrences"));
  -[HKSPSleepScheduleOccurrence bedtimeComponents](v8, "bedtimeComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    -[HKSPMutableSleepScheduleOccurrence setBedtimeComponents:](v8, "setBedtimeComponents:", v10);

  }
  -[HKSPSleepScheduleOccurrence wakeUpComponents](v8, "wakeUpComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    -[HKSPMutableSleepScheduleOccurrence setWakeUpComponents:](v8, "setWakeUpComponents:", v12);

  }
  -[HKSPSleepScheduleOccurrence bedtimeComponents](v8, "bedtimeComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "hour") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 1;
  }
  else
  {
    -[HKSPSleepScheduleOccurrence bedtimeComponents](v8, "bedtimeComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v15, "minute") == 0x7FFFFFFFFFFFFFFFLL;

  }
  -[HKSPSleepScheduleOccurrence wakeUpComponents](v8, "wakeUpComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "hour") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = 1;
  }
  else
  {
    -[HKSPSleepScheduleOccurrence wakeUpComponents](v8, "wakeUpComponents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "minute") == 0x7FFFFFFFFFFFFFFFLL;

  }
  -[HKSPSleepSchedule sleepDurationGoal](self, "sleepDurationGoal");
  v20 = v19;
  if (v14)
  {
    v21 = HKSPBedtimeHourDefault;
    -[HKSPSleepScheduleOccurrence bedtimeComponents](v8, "bedtimeComponents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHour:", v21);

    v23 = HKSPBedtimeMinuteDefault;
    -[HKSPSleepScheduleOccurrence bedtimeComponents](v8, "bedtimeComponents");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setMinute:", v23);

  }
  if (v17)
  {
    if (v20 <= 0.0)
    {
      v31 = HKSPWakeUpHourDefault;
      -[HKSPSleepScheduleOccurrence wakeUpComponents](v8, "wakeUpComponents");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setHour:", v31);

      v33 = HKSPWakeUpMinuteDefault;
      -[HKSPSleepScheduleOccurrence wakeUpComponents](v8, "wakeUpComponents");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setMinute:", v33);
    }
    else
    {
      -[HKSPSleepScheduleOccurrence bedtimeComponents](v8, "bedtimeComponents");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPSleepSchedule _wakeUpComponentsByAddingSleepDurationGoalToBedtimeComponents:](self, "_wakeUpComponentsByAddingSleepDurationGoalToBedtimeComponents:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_msgSend(v26, "hour");
      -[HKSPSleepScheduleOccurrence wakeUpComponents](v8, "wakeUpComponents");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setHour:", v27);

      v29 = objc_msgSend(v26, "minute");
      -[HKSPSleepScheduleOccurrence wakeUpComponents](v8, "wakeUpComponents");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setMinute:", v29);

    }
  }

  return v8;
}

uint64_t __46__HKSPSleepSchedule_mutableOccurrenceTemplate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSingleDayOverride") ^ 1;
}

- (id)_wakeUpComponentsByAddingSleepDurationGoalToBedtimeComponents:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPSleepSchedule sleepDurationGoal](self, "sleepDurationGoal");
  objc_msgSend(v7, "dateByAddingTimeInterval:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 96, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)occurrencesOnDays:(unint64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HKSPSleepSchedule occurrences](self, "occurrences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__HKSPSleepSchedule_occurrencesOnDays___block_invoke;
  v7[3] = &__block_descriptor_40_e37_B16__0__HKSPSleepScheduleOccurrence_8l;
  v7[4] = a3;
  objc_msgSend(v4, "na_filter:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __39__HKSPSleepSchedule_occurrencesOnDays___block_invoke(uint64_t a1, void *a2)
{
  return (*(_QWORD *)(a1 + 32) & objc_msgSend(a2, "weekdays")) != 0;
}

- (id)occurrenceOnDay:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HKSPSleepSchedule occurrences](self, "occurrences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__HKSPSleepSchedule_occurrenceOnDay___block_invoke;
  v7[3] = &__block_descriptor_40_e37_B16__0__HKSPSleepScheduleOccurrence_8l;
  v7[4] = a3;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __37__HKSPSleepSchedule_occurrenceOnDay___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = v3;
  if ((unint64_t)(v2 + 2) > 9)
    v5 = 0;
  else
    v5 = qword_1A4F67010[v2 + 2];
  v6 = objc_msgSend(v3, "weekdays");

  return (v6 & v5) != 0;
}

- (unint64_t)weekdaysWithOccurrences
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HKSPSleepSchedule occurrences](self, "occurrences", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "weekdays") != 0xFFFFFFFFLL)
          v5 |= objc_msgSend(v8, "weekdays");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)weekdaysWithoutOccurrences
{
  return 127 - -[HKSPSleepSchedule weekdaysWithOccurrences](self, "weekdaysWithOccurrences");
}

- (id)allowableRangeForWeekdays:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _BOOL8 v20;
  id v21;
  HKSPSleepScheduleRange *v22;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[5];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;

  HKSPDaysForWeekdays(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v8 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __47__HKSPSleepSchedule_allowableRangeForWeekdays___block_invoke;
  v43[3] = &unk_1E4E3B9E0;
  v9 = v5;
  v44 = v9;
  v10 = v6;
  v45 = v10;
  v11 = v7;
  v46 = v11;
  HKSPWeekdaysEnumerateDays(a3, v43, 0);
  -[HKSPSleepSchedule occurrencesOnDays:](self, "occurrencesOnDays:", HKSPWeekdaysFromDays(v10));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "na_filter:", &__block_literal_global_206);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2;
  v41 = __Block_byref_object_dispose__2;
  v42 = 0;
  v36[0] = v8;
  v36[1] = 3221225472;
  v36[2] = __47__HKSPSleepSchedule_allowableRangeForWeekdays___block_invoke_207;
  v36[3] = &unk_1E4E3BA28;
  v36[4] = &v37;
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "na_each:", v36);
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v9;
  if (v38[5])
  {
    -[HKSPSleepSchedule windDownTime](self, "windDownTime", v9, v10);
    objc_msgSend(v12, "hksp_componentsByAddingTimeInterval:toComponents:", v38[5], -v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v14, "setHour:", 23, v24, v10);
    objc_msgSend(v14, "setMinute:", 59);
  }
  objc_msgSend(v12, "hksp_componentsByAddingTimeInterval:toComponents:", v14, -60.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepSchedule occurrencesOnDays:](self, "occurrencesOnDays:", HKSPWeekdaysFromDays(v11));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__2;
  v34 = __Block_byref_object_dispose__2;
  v35 = 0;
  v29[0] = v8;
  v29[1] = 3221225472;
  v29[2] = __47__HKSPSleepSchedule_allowableRangeForWeekdays___block_invoke_2_209;
  v29[3] = &unk_1E4E3BA28;
  v29[4] = &v30;
  objc_msgSend(v16, "na_each:", v29);
  if (v31[5])
  {
    -[HKSPSleepSchedule windDownTime](self, "windDownTime");
    objc_msgSend(v12, "hksp_componentsByAddingTimeInterval:toComponents:", v31[5]);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend((id)v31[5], "hksp_compareHourAndMinuteComponents:", v17);
    objc_msgSend(v12, "hksp_componentsByAddingTimeInterval:toComponents:", v17, 60.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v18 != 1;
  }
  else
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v21, "setHour:", 0);
    objc_msgSend(v21, "setMinute:", 0);
    v17 = v21;
    v20 = 1;
    v19 = v17;
  }
  v22 = -[HKSPSleepScheduleRange initWithLatestWakeUpComponents:latestBedtimeComponents:earliestWakeUpComponents:earliestBedtimeComponents:earliestBedtimeIsOnPreviousDay:]([HKSPSleepScheduleRange alloc], "initWithLatestWakeUpComponents:latestBedtimeComponents:earliestWakeUpComponents:earliestBedtimeComponents:earliestBedtimeIsOnPreviousDay:", v14, v15, v19, v17, v20);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v37, 8);

  return v22;
}

uint64_t __47__HKSPSleepSchedule_allowableRangeForWeekdays___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  if (a2 == 7)
    v4 = 1;
  else
    v4 = a2 + 1;
  if ((objc_msgSend(a1[4], "containsIndex:", v4) & 1) == 0)
    objc_msgSend(a1[5], "addIndex:", v4);
  if (a2 == 1)
    v5 = 7;
  else
    v5 = a2 - 1;
  result = objc_msgSend(a1[4], "containsIndex:", v5);
  if ((result & 1) == 0)
    return objc_msgSend(a1[6], "addIndex:", v5);
  return result;
}

uint64_t __47__HKSPSleepSchedule_allowableRangeForWeekdays___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "crossesDayBoundary");
}

void __47__HKSPSleepSchedule_allowableRangeForWeekdays___block_invoke_207(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v13 = v3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    goto LABEL_6;
  objc_msgSend(v3, "bedtimeComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hour");
  if (v5 < objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "hour"))
  {

    v3 = v13;
    goto LABEL_6;
  }
  objc_msgSend(v13, "bedtimeComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hour");
  if (v7 != objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "hour"))
  {

    goto LABEL_7;
  }
  objc_msgSend(v13, "bedtimeComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "minute");
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "minute");

  v3 = v13;
  if (v9 < v10)
  {
LABEL_6:
    objc_msgSend(v3, "bedtimeComponents");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
LABEL_7:

    v3 = v13;
  }

}

void __47__HKSPSleepSchedule_allowableRangeForWeekdays___block_invoke_2_209(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v13 = v3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    goto LABEL_6;
  objc_msgSend(v3, "wakeUpComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hour");
  if (v5 > objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "hour"))
  {

    v3 = v13;
    goto LABEL_6;
  }
  objc_msgSend(v13, "wakeUpComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hour");
  if (v7 != objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "hour"))
  {

    goto LABEL_7;
  }
  objc_msgSend(v13, "wakeUpComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "minute");
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "minute");

  v3 = v13;
  if (v9 > v10)
  {
LABEL_6:
    objc_msgSend(v3, "wakeUpComponents");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;
LABEL_7:

    v3 = v13;
  }

}

- (id)allowableRangeForModifiedOccurrence:(id)a3 gregorianCalendar:(id)a4
{
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = -[HKSPSleepSchedule mutableCopy](self, "mutableCopy");
  if (objc_msgSend(v6, "isSingleDayOverride"))
  {
    v9 = objc_msgSend(v6, "overrideDayInCalendar:", v7) + 2;
    if (v9 >= 0xA)
    {
      v10 = 0;
      v11 = 0;
    }
    else
    {
      v10 = qword_1A4F67010[v9];
      v11 = v10;
    }
  }
  else
  {
    objc_msgSend(v6, "changeSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "originalValueForPropertyIdentifier:", CFSTR("HKSPOccurrenceWeekdays"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "unsignedIntegerValue");

    v10 = objc_msgSend(v6, "weekdays");
  }
  objc_msgSend(v8, "_modifyDayOccurrencesForWeekdays:block:", v11, &__block_literal_global_212);
  objc_msgSend(v8, "allowableRangeForWeekdays:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __75__HKSPSleepSchedule_allowableRangeForModifiedOccurrence_gregorianCalendar___block_invoke()
{
  return 0;
}

- (double)maximumAllowableWindDown
{
  void *v3;
  id v4;
  double v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  _QWORD *v10;
  _QWORD v11[3];
  char v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 1;
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HKSPSleepSchedule_maximumAllowableWindDown__block_invoke;
  v7[3] = &unk_1E4E3BA90;
  v7[4] = self;
  v4 = v3;
  v8 = v4;
  v9 = &v13;
  v10 = v11;
  HKSPEnumerateDaysOfWeek(v7, 0);
  v5 = v14[3];

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);
  return v5;
}

void __45__HKSPSleepSchedule_maximumAllowableWindDown__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "occurrenceOnDay:", a2);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (a2 == 7)
    v4 = 1;
  else
    v4 = a2 + 1;
  objc_msgSend(*(id *)(a1 + 32), "occurrenceOnDay:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    objc_msgSend(v19, "wakeUpComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");

    if ((unint64_t)(a2 - 1) >= 7)
      v13 = 0;
    else
      v13 = a2;
    objc_msgSend(v12, "setWeekday:", v13);
    objc_msgSend(v5, "bedtimeComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v14, "copy");

    if (objc_msgSend(v5, "crossesDayBoundary"))
      v15 = a2;
    else
      v15 = v4;
    if ((unint64_t)(v15 - 1) >= 7)
      v16 = 0;
    else
      v16 = v15;
    objc_msgSend(v9, "setWeekday:", v16);
    objc_msgSend(*(id *)(a1 + 40), "hksp_timeIntervalFromComponents:toComponents:", v12, v9);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (v17 >= *(double *)(v18 + 24) && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      goto LABEL_27;
    *(double *)(v18 + 24) = v17;
    v7 = a1 + 56;
LABEL_26:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v7 + 8) + 24) = 0;
LABEL_27:

    goto LABEL_28;
  }
  v7 = a1 + 56;
  if (v19)
    v8 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 0;
  else
    v8 = 1;
  if (!v8)
  {
    objc_msgSend(v19, "wakeUpComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bedtimeComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "hksp_timeIntervalFromComponents:toComponents:", v12, v9);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;
    goto LABEL_26;
  }
LABEL_28:

}

- (unint64_t)windDownMinutes
{
  double v2;

  -[HKSPSleepSchedule windDownTime](self, "windDownTime");
  return (unint64_t)(v2 / 60.0);
}

- (id)emptyCopy
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = -[HKSPSleepSchedule mutableCopy](self, "mutableCopy");
  objc_msgSend(v2, "occurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__HKSPSleepSchedule_emptyCopy__block_invoke;
  v7[3] = &unk_1E4E3BAB8;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "na_each:", v7);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

uint64_t __30__HKSPSleepSchedule_emptyCopy__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeOccurrence:", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)innerClasses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  +[HKSPSleepScheduleDayOccurrence innerClasses](HKSPSleepScheduleDayOccurrence, "innerClasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mutableCopy
{
  return -[HKSPMutableSleepSchedule initFromObject:]([HKSPMutableSleepSchedule alloc], "initFromObject:", self);
}

- (BOOL)isEqual:(id)a3
{
  return HKSPObjectsAreEqual(self, a3);
}

- (BOOL)isEquivalentTo:(id)a3
{
  return HKSPObjectsAreEquivalentWithTransformer(self, a3, &__block_literal_global_286);
}

- (NSString)description
{
  return (NSString *)-[HKSPSleepSchedule descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPSleepSchedule succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepSchedule isEnabled](self, "isEnabled"), CFSTR("enabled"));
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HKSPSleepSchedule occurrences](self, "occurrences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%lu occurrences"), objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("occurrences"));

  -[HKSPSleepSchedule windDownTime](self, "windDownTime");
  v8 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("windDownTime"), 1);
  -[HKSPSleepSchedule sleepDurationGoal](self, "sleepDurationGoal");
  v9 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("sleepDurationGoal"), 1);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSleepSchedule descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "appendBool:withName:", -[HKSPSleepSchedule isEnabled](self, "isEnabled"), CFSTR("enabled"));
  -[HKSPSleepSchedule occurrences](self, "occurrences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendArraySection:withName:multilinePrefix:skipIfEmpty:", v8, CFSTR("occurrences"), v5, 0);

  -[HKSPSleepSchedule windDownTime](self, "windDownTime");
  v9 = (id)objc_msgSend(v6, "appendDouble:withName:decimalPrecision:", CFSTR("windDownTime"), 1);
  -[HKSPSleepSchedule sleepDurationGoal](self, "sleepDurationGoal");
  v10 = (id)objc_msgSend(v6, "appendDouble:withName:decimalPrecision:", CFSTR("sleepDurationGoal"), 1);
  return v6;
}

- (unint64_t)version
{
  return self->_version;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (HKSPSyncAnchor)syncAnchor
{
  return self->_syncAnchor;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (double)windDownTime
{
  return self->_windDownTime;
}

- (HKSPSleepScheduleDayOccurrence)mondayOccurrence
{
  return self->_mondayOccurrence;
}

- (HKSPSleepScheduleDayOccurrence)tuesdayOccurrence
{
  return self->_tuesdayOccurrence;
}

- (HKSPSleepScheduleDayOccurrence)wednesdayOccurrence
{
  return self->_wednesdayOccurrence;
}

- (HKSPSleepScheduleDayOccurrence)thursdayOccurrence
{
  return self->_thursdayOccurrence;
}

- (HKSPSleepScheduleDayOccurrence)fridayOccurrence
{
  return self->_fridayOccurrence;
}

- (HKSPSleepScheduleDayOccurrence)saturdayOccurrence
{
  return self->_saturdayOccurrence;
}

- (HKSPSleepScheduleDayOccurrence)sundayOccurrence
{
  return self->_sundayOccurrence;
}

- (HKSPSleepScheduleDayOccurrence)overrideDayOccurrence
{
  return self->_overrideDayOccurrence;
}

- (double)sleepDurationGoal
{
  return self->_sleepDurationGoal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDayOccurrence, 0);
  objc_storeStrong((id *)&self->_sundayOccurrence, 0);
  objc_storeStrong((id *)&self->_saturdayOccurrence, 0);
  objc_storeStrong((id *)&self->_fridayOccurrence, 0);
  objc_storeStrong((id *)&self->_thursdayOccurrence, 0);
  objc_storeStrong((id *)&self->_wednesdayOccurrence, 0);
  objc_storeStrong((id *)&self->_tuesdayOccurrence, 0);
  objc_storeStrong((id *)&self->_mondayOccurrence, 0);
  objc_storeStrong((id *)&self->_syncAnchor, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
}

@end
