@implementation HKSPSleepScheduleOccurrence

- (HKSPSleepScheduleOccurrence)init
{
  char *v2;
  HKSPSleepScheduleOccurrence *v3;
  HKSPSleepScheduleDayOccurrence *v4;
  HKSPSleepScheduleDayOccurrence *backingOccurrence;
  HKSPSleepScheduleOccurrence *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKSPSleepScheduleOccurrence;
  v2 = -[HKSPSleepScheduleOccurrence init](&v8, sel_init);
  v3 = (HKSPSleepScheduleOccurrence *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 8) = xmmword_1A4F66FF0;
    v4 = objc_alloc_init(HKSPSleepScheduleDayOccurrence);
    backingOccurrence = v3->_backingOccurrence;
    v3->_backingOccurrence = v4;

    v6 = v3;
  }

  return v3;
}

- (id)initFromObject:(id)a3
{
  id v4;
  id v5;
  HKSPSleepScheduleOccurrence *v6;
  HKSPSleepScheduleOccurrence *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[HKSPSleepScheduleOccurrence init](self, "init");
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

- (HKSPSleepScheduleOccurrence)initWithCoder:(id)a3
{
  id v4;
  HKSPSleepScheduleOccurrence *v5;
  HKSPSleepScheduleOccurrence *v6;
  HKSPSleepScheduleOccurrence *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKSPSleepScheduleOccurrence;
  v5 = -[HKSPSleepScheduleOccurrence init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    HKSPDecodeObjectWithCoder(v5, v4);
    v7 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  HKSPEncodeObjectWithCoder(self, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutableCopy
{
  return -[HKSPMutableSleepScheduleOccurrence initFromObject:]([HKSPMutableSleepScheduleOccurrence alloc], "initFromObject:", self);
}

- (NSDateComponents)bedtimeComponents
{
  void *v2;
  void *v3;

  -[HKSPSleepScheduleOccurrence backingOccurrence](self, "backingOccurrence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bedtimeComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v3;
}

- (NSDateComponents)wakeUpComponents
{
  void *v2;
  void *v3;

  -[HKSPSleepScheduleOccurrence backingOccurrence](self, "backingOccurrence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wakeUpComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDateComponents *)v3;
}

- (HKSPAlarmConfiguration)alarmConfiguration
{
  void *v2;
  void *v3;

  -[HKSPSleepScheduleOccurrence backingOccurrence](self, "backingOccurrence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alarmConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPAlarmConfiguration *)v3;
}

- (BOOL)isRepeating
{
  _BOOL4 v3;

  v3 = -[HKSPSleepScheduleOccurrence isInitialized](self, "isInitialized");
  if (v3)
    LOBYTE(v3) = !-[HKSPSleepScheduleOccurrence isSingleDayOverride](self, "isSingleDayOverride");
  return v3;
}

- (BOOL)isSingleDayOverride
{
  BOOL v3;
  void *v4;

  if (-[HKSPSleepScheduleOccurrence weekdays](self, "weekdays"))
    return 0;
  -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "year") != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (BOOL)usesDefaultBedtimeAndWakeUpComponents
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hour");
  if (v4 == HKSPBedtimeHourDefault)
  {
    -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "minute");
    if (v6 == HKSPBedtimeMinuteDefault)
    {
      -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hour");
      if (v8 == HKSPWakeUpHourDefault)
      {
        -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "minute");
        v11 = v10 == HKSPWakeUpMinuteDefault;

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isInitialized
{
  return -[HKSPSleepScheduleOccurrence weekdays](self, "weekdays") != 0xFFFFFFFF;
}

- (id)overrideOccurrenceWithWakeUpComponents:(id)a3 bedtimeComponents:(id)a4
{
  id v6;
  id v7;
  HKSPMutableSleepScheduleOccurrence *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[HKSPMutableSleepScheduleOccurrence initWithTemplateOccurrence:]([HKSPMutableSleepScheduleOccurrence alloc], "initWithTemplateOccurrence:", self);
  -[HKSPMutableSleepScheduleOccurrence setWeekdays:](v8, "setWeekdays:", 0);
  -[HKSPMutableSleepScheduleOccurrence setWakeUpComponents:](v8, "setWakeUpComponents:", v7);

  -[HKSPMutableSleepScheduleOccurrence setBedtimeComponents:](v8, "setBedtimeComponents:", v6);
  return v8;
}

- (id)overrideOccurrenceTemplateForCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  HKSPMutableSleepScheduleOccurrence *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "calendarIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepScheduleOccurrence.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[gregorianCalendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]"));

  }
  if (-[HKSPSleepScheduleOccurrence isSingleDayOverride](self, "isSingleDayOverride"))
  {
    v11 = -[HKSPMutableSleepScheduleOccurrence initWithTemplateOccurrence:]([HKSPMutableSleepScheduleOccurrence alloc], "initWithTemplateOccurrence:", self);
  }
  else
  {
    -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hksp_nextDateAfterDate:matchingComponents:", v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKSPSleepScheduleOccurrence bedtimeDateForWakeUpDate:gregorianCalendar:](self, "bedtimeDateForWakeUpDate:gregorianCalendar:", v13, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "components:fromDate:", 124, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "components:fromDate:", 124, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPSleepScheduleOccurrence overrideOccurrenceWithWakeUpComponents:bedtimeComponents:](self, "overrideOccurrenceWithWakeUpComponents:bedtimeComponents:", v15, v16);
    v11 = (HKSPMutableSleepScheduleOccurrence *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)convertToScheduledOccurrenceOnSameDaysAsOccurrence:(id)a3
{
  id v4;
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
  id v15;

  v4 = a3;
  if (-[HKSPSleepScheduleOccurrence isSingleDayOverride](self, "isSingleDayOverride"))
  {
    -[HKSPSleepScheduleOccurrence backingOccurrence](self, "backingOccurrence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hksp_timeComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWakeUpComponents:", v8);

    -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hksp_timeComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBedtimeComponents:", v10);

    objc_msgSend(v4, "backingOccurrence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    HKSPGenerateChangeSetBetweenObjects(v12, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPApplyChangesToObject(v12, v13);
    objc_msgSend(v12, "generateSleepScheduleOccurrenceWithWeekdays:", objc_msgSend(v4, "weekdays"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "mutableCopy");

  }
  else
  {
    v15 = -[HKSPSleepScheduleOccurrence mutableCopy](self, "mutableCopy");
  }

  return v15;
}

- (id)changesFromOccurrence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HKSPSleepScheduleOccurrence backingOccurrence](self, "backingOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backingOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "changesFromOccurrence:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)occurrenceWithWeekdays:(unint64_t)a3 backingOccurrence:(id)a4
{
  id v5;
  HKSPMutableSleepScheduleOccurrence *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = objc_alloc_init(HKSPMutableSleepScheduleOccurrence);
  v7 = (void *)objc_msgSend(v5, "copy");

  -[HKSPMutableSleepScheduleOccurrence setBackingOccurrence:](v6, "setBackingOccurrence:", v7);
  -[HKSPMutableSleepScheduleOccurrence setWeekdays:](v6, "setWeekdays:", a3);
  v8 = (void *)-[HKSPMutableSleepScheduleOccurrence copy](v6, "copy");

  return v8;
}

- (BOOL)overridesWakeUpForOccurrenceOnDate:(id)a3 gregorianCalendar:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "calendarIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepScheduleOccurrence.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[gregorianCalendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]"));

  }
  if (-[HKSPSleepScheduleOccurrence isSingleDayOverride](self, "isSingleDayOverride"))
  {
    objc_msgSend(v8, "startOfDayForDate:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFromComponents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "startOfDayForDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToDate:", v11);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)overrideAppliesToOccurrence:(id)a3 gregorianCalendar:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  void *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "calendarIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepScheduleOccurrence.m"), 175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[gregorianCalendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]"));

  }
  if (-[HKSPSleepScheduleOccurrence isSingleDayOverride](self, "isSingleDayOverride"))
  {
    v11 = -[HKSPSleepScheduleOccurrence overrideDayInCalendar:](self, "overrideDayInCalendar:", v8);
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v12 = objc_msgSend(v7, "weekdays");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77__HKSPSleepScheduleOccurrence_overrideAppliesToOccurrence_gregorianCalendar___block_invoke;
    v16[3] = &unk_1E4E3B7D8;
    v16[4] = &v17;
    v16[5] = v11;
    HKSPWeekdaysEnumerateDays(v12, v16, 0);
    v13 = *((_BYTE *)v18 + 24) != 0;
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __77__HKSPSleepScheduleOccurrence_overrideAppliesToOccurrence_gregorianCalendar___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)(result + 40) == a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (int64_t)overrideDayInCalendar:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "calendarIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepScheduleOccurrence.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[gregorianCalendar.calendarIdentifier isEqualToString:NSCalendarIdentifierGregorian]"));

  }
  if (-[HKSPSleepScheduleOccurrence isSingleDayOverride](self, "isSingleDayOverride"))
  {
    -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateFromComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_msgSend(v5, "component:fromDate:", 512, v9);
      if ((unint64_t)(v10 - 1) >= 7)
        v11 = 0;
      else
        v11 = v10;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)nextDateIntervalWithWakeUpAfterDate:(id)a3 gregorianCalendar:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "calendarIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C996C8]);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepScheduleOccurrence.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[gregorianCalendar calendarIdentifier] isEqualToString:NSCalendarIdentifierGregorian]"));

  }
  if (-[HKSPSleepScheduleOccurrence isSingleDayOverride](self, "isSingleDayOverride"))
  {
    -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFromComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateFromComponents:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKSPSleepScheduleOccurrence wakeUpDateForDate:searchBackwards:gregorianCalendar:](self, "wakeUpDateForDate:searchBackwards:gregorianCalendar:", v7, 0, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPSleepScheduleOccurrence bedtimeDateForWakeUpDate:gregorianCalendar:](self, "bedtimeDateForWakeUpDate:gregorianCalendar:", v12, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v14, v12);

  return v15;
}

- (id)wakeUpDateForDate:(id)a3 day:(int64_t)a4 searchBackwards:(BOOL)a5 gregorianCalendar:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  objc_msgSend(v13, "setSecond:", 0);
  if (!-[HKSPSleepScheduleOccurrence isSingleDayOverride](self, "isSingleDayOverride"))
  {
    if ((unint64_t)(a4 - 1) >= 7)
      v14 = 0;
    else
      v14 = a4;
    objc_msgSend(v13, "setWeekday:", v14);
  }
  if (v7)
    objc_msgSend(v11, "hksp_previousDateBeforeDate:matchingComponents:", v10, v13);
  else
    objc_msgSend(v11, "hksp_nextDateAfterDate:matchingComponents:", v10, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)wakeUpDateForDate:(id)a3 searchBackwards:(BOOL)a4 gregorianCalendar:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t *v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  v24 = __Block_byref_object_dispose__1;
  if (a4)
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[HKSPSleepScheduleOccurrence weekdays](self, "weekdays");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__HKSPSleepScheduleOccurrence_wakeUpDateForDate_searchBackwards_gregorianCalendar___block_invoke;
  v15[3] = &unk_1E4E3B7B0;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v19 = a4;
  v12 = v9;
  v17 = v12;
  v18 = &v20;
  HKSPWeekdaysEnumerateDays(v10, v15, a4);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __83__HKSPSleepScheduleOccurrence_wakeUpDateForDate_searchBackwards_gregorianCalendar___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "wakeUpDateForDate:day:searchBackwards:gregorianCalendar:", *(_QWORD *)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v6 = v3;
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v3, "laterDate:", v4);
  else
    objc_msgSend(v3, "earlierDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v5);

}

- (id)bedtimeDateForWakeUpDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v9, "setSecond:", 0);
  objc_msgSend(v6, "hksp_previousDateBeforeDate:matchingComponents:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isValidOccurrence
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  const char *v19;
  BOOL v20;
  id v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    HKSPLogForCategory(5uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v23 = 138543362;
    v24 = (id)objc_opt_class();
    v18 = v24;
    v19 = "[%{public}@] nil date components found";
    goto LABEL_25;
  }
  -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hour") >= 24)
  {

    goto LABEL_16;
  }
  -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hour");

  if (v8 >= 24)
  {
LABEL_16:
    HKSPLogForCategory(5uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v23 = 138543362;
    v24 = (id)objc_opt_class();
    v18 = v24;
    v19 = "[%{public}@] invalid date components found";
    goto LABEL_25;
  }
  if (-[HKSPSleepScheduleOccurrence weekdays](self, "weekdays"))
  {
    -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "year") == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "year");

      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_8;
    }
    else
    {

    }
    HKSPLogForCategory(5uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v23 = 138543362;
    v24 = (id)objc_opt_class();
    v18 = v24;
    v19 = "[%{public}@] invalid components for repeating occurrence";
LABEL_25:
    _os_log_error_impl(&dword_1A4F0E000, v12, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v23, 0xCu);

    goto LABEL_17;
  }
LABEL_8:
  if (!-[HKSPSleepScheduleOccurrence isSingleDayOverride](self, "isSingleDayOverride"))
    return 1;
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v12 = objc_claimAutoreleasedReturnValue();
  -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject dateFromComponents:](v12, "dateFromComponents:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject dateFromComponents:](v12, "dateFromComponents:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v16, "hksp_isAfterOrSameAsDate:", v14))
  {

    v20 = 1;
    goto LABEL_18;
  }
  HKSPLogForCategory(5uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v23 = 138543362;
    v24 = (id)objc_opt_class();
    v22 = v24;
    _os_log_error_impl(&dword_1A4F0E000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] bedtime is after wakeup", (uint8_t *)&v23, 0xCu);

  }
LABEL_17:
  v20 = 0;
LABEL_18:

  return v20;
}

- (BOOL)crossesDayBoundary
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hour");
  -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 <= objc_msgSend(v5, "hour"))
  {
    -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hour");
    -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == objc_msgSend(v9, "hour"))
    {
      -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "minute");
      -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11 > objc_msgSend(v12, "minute");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)isEquivalentToOverrideOccurrence:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;
  void *v11;

  v5 = a3;
  if (-[HKSPSleepScheduleOccurrence isSingleDayOverride](self, "isSingleDayOverride"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepScheduleOccurrence.m"), 299, CFSTR("This should not be called on an override occurrence"));

  }
  if ((objc_msgSend(v5, "isSingleDayOverride") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepScheduleOccurrence.m"), 300, CFSTR("overrideOccurrence should be an actual override occurrence"));

  }
  -[HKSPSleepScheduleOccurrence backingOccurrence](self, "backingOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingOccurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEquivalentToOccurrenceIgnoringDates:", v7);

  return v8;
}

- (BOOL)isAlarmEquivalentToOverrideOccurrence:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;
  void *v11;

  v5 = a3;
  if (-[HKSPSleepScheduleOccurrence isSingleDayOverride](self, "isSingleDayOverride"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepScheduleOccurrence.m"), 305, CFSTR("This should not be called on an override occurrence"));

  }
  if ((objc_msgSend(v5, "isSingleDayOverride") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSPSleepScheduleOccurrence.m"), 306, CFSTR("overrideOccurrence should be an actual override occurrence"));

  }
  -[HKSPSleepScheduleOccurrence backingOccurrence](self, "backingOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backingOccurrence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isAlarmEquivalentToOccurrenceIgnoringDates:", v7);

  return v8;
}

- (double)actualSleepInterval
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepScheduleOccurrence nextDateIntervalWithWakeUpAfterDate:gregorianCalendar:](self, "nextDateIntervalWithWakeUpAfterDate:gregorianCalendar:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "duration");
  v7 = v6;

  return v7;
}

- (double)generalSleepInterval
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  _BOOL4 v11;
  double v12;

  -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)objc_msgSend(v3, "hour");
  -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)objc_msgSend(v5, "minute") * 60.0 + v4 * 3600.0;

  -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (double)objc_msgSend(v7, "hour");
  -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (double)objc_msgSend(v9, "minute") * 60.0;

  v11 = -[HKSPSleepScheduleOccurrence crossesDayBoundary](self, "crossesDayBoundary");
  v12 = 86400.0 - (v10 + v8 * 3600.0);
  if (!v11)
    v12 = -(v10 + v8 * 3600.0);
  return v6 + v12;
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
  return (NSString *)-[HKSPSleepScheduleOccurrence descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPSleepScheduleOccurrence succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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
  const __CFString *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepScheduleOccurrence bedtimeComponents](self, "bedtimeComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hksp_description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("bedtime"));

  -[HKSPSleepScheduleOccurrence wakeUpComponents](self, "wakeUpComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hksp_description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("wakeUp"));

  if (-[HKSPSleepScheduleOccurrence weekdays](self, "weekdays") == 0xFFFFFFFF)
  {
    v8 = CFSTR("(unset)");
LABEL_6:
    objc_msgSend(v3, "appendString:withName:", v8, CFSTR("weekdays"));
    goto LABEL_7;
  }
  if (!-[HKSPSleepScheduleOccurrence weekdays](self, "weekdays"))
  {
    v8 = CFSTR("None");
    goto LABEL_6;
  }
  NSStringFromHKSPWeekdays(-[HKSPSleepScheduleOccurrence weekdays](self, "weekdays"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v9, CFSTR("weekdays"));

LABEL_7:
  -[HKSPSleepScheduleOccurrence alarmConfiguration](self, "alarmConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(v10, "isEnabled"), CFSTR("alarm"));

  return v3;
}

- (unint64_t)version
{
  return self->_version;
}

- (unint64_t)weekdays
{
  return self->_weekdays;
}

- (HKSPSleepScheduleDayOccurrence)backingOccurrence
{
  return self->_backingOccurrence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingOccurrence, 0);
}

@end
