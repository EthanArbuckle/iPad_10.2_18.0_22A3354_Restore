@implementation PGMemoryTrigger

- (PGMemoryTrigger)init
{
  void *v3;
  void *v4;
  PGMemoryTrigger *v5;

  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loggingConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PGMemoryTrigger initWithLoggingConnection:](self, "initWithLoggingConnection:", v4);

  return v5;
}

- (PGMemoryTrigger)initWithLoggingConnection:(id)a3
{
  id v5;
  PGMemoryTrigger *v6;
  PGMemoryTrigger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGMemoryTrigger;
  v6 = -[PGMemoryTrigger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_loggingConnection, a3);

  return v7;
}

- (BOOL)supportsFutureLookup
{
  return 1;
}

- (unint64_t)triggerType
{
  id v2;

  PGAbstractMethodException(self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)resultsTriggeredWithContext:(id)a3 inGraph:(id)a4 progressReporter:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  PGAbstractMethodException(self, a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v12);
}

- (id)relevantFeatureNodesInFeatureNodes:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  PGAbstractMethodException(self, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

+ (id)validityIntervalForLocalStartDate:(id)a3 localEndDate:(id)a4 timeZone:(id)a5
{
  id v7;
  id v8;
  id v9;
  PGMemoryDate *v10;
  void *v11;
  PGMemoryDate *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PGMemoryDate initWithLocalDate:]([PGMemoryDate alloc], "initWithLocalDate:", v9);

  -[PGMemoryDate universalDateInTimeZone:](v10, "universalDateInTimeZone:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PGMemoryDate initWithLocalDate:]([PGMemoryDate alloc], "initWithLocalDate:", v8);

  -[PGMemoryDate universalDateInTimeZone:](v12, "universalDateInTimeZone:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "laterDate:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToDate:", v11);

  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      v19 = 138412546;
      v20 = v11;
      v21 = 2112;
      v22 = v13;
      _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[PGMemoryTrigger] Start date %@ cannot be later in time than end date %@. Setting universalEndDate = universalStartDate", (uint8_t *)&v19, 0x16u);
    }
    v16 = v11;

    v13 = v16;
  }
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v11, v13);

  return v17;
}

+ (id)singleDayValidityIntervalWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "localDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "startOfDayForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "endOfDayForDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "validityIntervalForLocalStartDate:localEndDate:timeZone:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)memoryTriggerResultsForMemoryNodes:(id)a3 withValidityInterval:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "memoryTriggerResultsForMemoryNodesArray:withValidityInterval:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)memoryTriggerResultsForMemoryNodesArray:(id)a3 withValidityInterval:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PGMemoryTriggerResult *v14;
  PGMemoryTriggerResult *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v14 = [PGMemoryTriggerResult alloc];
        v15 = -[PGMemoryTriggerResult initWithMemoryNode:validityInterval:](v14, "initWithMemoryNode:validityInterval:", v13, v6, (_QWORD)v17);
        objc_msgSend(v7, "addObject:", v15);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

+ (unint64_t)triggerTypeFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeHoliday")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypePersonBirthday")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeFeatureCentricHoliday")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeSameDayInHistory")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeEndOfYear")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeBeginningOfMonth")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeSameWeekInHistory")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeBeginningOfSeason")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeSeasonInHistory")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeRecentMomentWithPerson")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeThrowbackWeekInHistory")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeRecentHolidayCelebration")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeRecentMomentWithSocialGroup")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeRecentTrip")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypePersonAnniversary")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeRecentHighlights")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeRecentSyndicatedAssets")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeUpcomingHoliday")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeRecentMeaningfulEvent")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeUpcomingCalendarEvent")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeLastWeekend")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeLastWeek")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeRecentBreakoutOfRoutine")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeUpcomingPersonCentricHoliday")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeUpcomingBirthday")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeUpcomingAnniversary")) & 1) != 0)
  {
    v4 = 25;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PGMemoryTriggerTypeRecentTrendsMoment")))
  {
    v4 = 27;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)stringFromTriggerType:(unint64_t)a3
{
  if (a3 - 1 > 0x1A)
    return CFSTR("PGMemoryTriggerTypeUnknown");
  else
    return off_1E84276A8[a3 - 1];
}

+ (id)localDateIntervalFromLocalDate:(id)a3 startDayOffset:(int64_t)a4 endDayOffset:(int64_t)a5 inTimeZone:(id)a6
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = (void *)MEMORY[0x1E0D4B130];
  v10 = a6;
  objc_msgSend(v9, "universalDateFromLocalDate:inTimeZone:", a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", a4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", a5, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:inTimeZone:", v12, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:inTimeZone:", v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v14, v15);
  return v16;
}

+ (id)dateNodesInGraph:(id)a3 startDayOffset:(int64_t)a4 endDayOffset:(int64_t)a5 fromLocalDate:(id)a6 inTimeZone:(id)a7
{
  id v12;
  void *v13;
  void *v14;

  v12 = a3;
  objc_msgSend(a1, "localDateIntervalFromLocalDate:startDayOffset:endDayOffset:inTimeZone:", a6, a4, a5, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateNodesForLocalDateInterval:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)monthDayCalendarUnitValuesForLocalDateInterval:(id)a3
{
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  objc_msgSend(v3, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9;

  while (v7 <= v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4B130], "dateComponentsWithLocalDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[PGGraphCalendarUnitNode encodedMonthDayForMonth:day:](PGGraphCalendarUnitNode, "encodedMonthDayForMonth:day:", objc_msgSend(v12, "month"), objc_msgSend(v12, "day"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);

    v7 = v7 + 86400.0;
  }

  return v4;
}

+ (id)monthDayNodesInGraph:(id)a3 startDayOffset:(int64_t)a4 endDayOffset:(int64_t)a5 fromLocalDate:(id)a6 inTimeZone:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v12 = a3;
  objc_msgSend(a1, "localDateIntervalFromLocalDate:startDayOffset:endDayOffset:inTimeZone:", a6, a4, a5, a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "monthDayCalendarUnitValuesForLocalDateInterval:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphCalendarUnitNodeCollection calendarUnitNodesForUnitValues:inGraph:](PGGraphMonthDayNodeCollection, "calendarUnitNodesForUnitValues:inGraph:", v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
