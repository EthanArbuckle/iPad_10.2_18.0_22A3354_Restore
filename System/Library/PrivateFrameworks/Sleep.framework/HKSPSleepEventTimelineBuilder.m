@implementation HKSPSleepEventTimelineBuilder

+ (id)builderWithSleepScheduleModel:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSleepScheduleModel:date:", v7, v6);

  return v8;
}

- (HKSPSleepEventTimelineBuilder)initWithSleepScheduleModel:(id)a3 date:(id)a4
{
  id v7;
  id v8;
  HKSPSleepEventTimelineBuilder *v9;
  HKSPSleepEventTimelineBuilder *v10;
  uint64_t v11;
  NSCalendar *calendar;
  HKSPSleepEventTimelineBuilder *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKSPSleepEventTimelineBuilder;
  v9 = -[HKSPSleepEventTimelineBuilder init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sleepScheduleModel, a3);
    objc_storeStrong((id *)&v10->_date, a4);
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v11 = objc_claimAutoreleasedReturnValue();
    calendar = v10->_calendar;
    v10->_calendar = (NSCalendar *)v11;

    v13 = v10;
  }

  return v10;
}

- (id)buildTimelineWithOptions:(unint64_t)a3
{
  HKSPSleepEventTimelineResults *v5;
  HKSPSleepEventTimelineResults *results;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKSPSleepEventTimeline *v11;
  void *v12;
  unint64_t options;
  unint64_t v14;

  v5 = objc_alloc_init(HKSPSleepEventTimelineResults);
  results = self->_results;
  self->_results = v5;

  self->_options = a3;
  if ((a3 & 4) != 0)
  {
    -[HKSPSleepScheduleModel sleepSchedule](self->_sleepScheduleModel, "sleepSchedule");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPSleepEventTimelineResults setOriginalSleepSchedule:](self->_results, "setOriginalSleepSchedule:", v7);

    -[HKSPSleepScheduleModel sleepSchedule](self->_sleepScheduleModel, "sleepSchedule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "emptyCopy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    -[HKSPSleepEventTimelineResults setMutableValidSleepSchedule:](self->_results, "setMutableValidSleepSchedule:", v10);

  }
  v11 = -[HKSPSleepEventTimeline initWithOriginDate:]([HKSPSleepEventTimeline alloc], "initWithOriginDate:", self->_date);
  -[HKSPSleepEventTimelineResults setTimeline:](self->_results, "setTimeline:", v11);

  -[HKSPSleepScheduleModel sleepSchedule](self->_sleepScheduleModel, "sleepSchedule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEnabled") & 1) != 0)
  {

  }
  else
  {
    options = self->_options;

    if ((options & 2) == 0)
      return self->_results;
  }
  -[HKSPSleepEventTimelineBuilder _gatherSessions](self, "_gatherSessions");
  v14 = self->_options;
  if ((v14 & 2) != 0)
  {
    -[HKSPSleepEventTimelineBuilder _validateSessionAdjustments](self, "_validateSessionAdjustments");
  }
  else if ((v14 & 1) == 0)
  {
    -[HKSPSleepEventTimelineBuilder _adjustSessions](self, "_adjustSessions");
  }
  return self->_results;
}

- (void)_gatherSessions
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  char v13;

  v3 = (LOBYTE(self->_options) >> 1) & 1;
  -[HKSPSleepScheduleModel sleepSchedule](self->_sleepScheduleModel, "sleepSchedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideOccurrence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPSleepScheduleModel sleepSchedule](self->_sleepScheduleModel, "sleepSchedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "occurrences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__HKSPSleepEventTimelineBuilder__gatherSessions__block_invoke;
  v11[3] = &unk_1E4E3CFB8;
  v13 = v3;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v7, "na_each:", v11);

  -[HKSPSleepEventTimelineResults timeline](self->_results, "timeline");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[HKSPSleepEventTimelineResults setUnadjustedTimeline:](self->_results, "setUnadjustedTimeline:", v9);

}

void __48__HKSPSleepEventTimelineBuilder__gatherSessions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isValidOccurrence"))
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v4, "_gatherSessionsForValidationForOccurrence:overrideOccurrence:", v3, v5);
    else
      objc_msgSend(v4, "_gatherSessionsForOccurrence:overrideOccurrence:", v3, v5);
  }
  else if (*(_BYTE *)(a1 + 48))
  {
    HKSPLogForCategory(6uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v3;
      _os_log_error_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] occurrence is invalid %{public}@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setSleepScheduleInvalid:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setSleepScheduleInvalidReason:", 1);
  }

}

- (void)_gatherSessionsForValidationForOccurrence:(id)a3 overrideOccurrence:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSCalendar *calendar;
  void *v14;
  void *v15;
  NSCalendar *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, void *, char);
  void *v26;
  id v27;
  HKSPSleepEventTimelineBuilder *v28;
  id v29;
  id v30;
  _QWORD *v31;
  uint64_t *v32;
  _QWORD v33[5];
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v6 = a3;
  v7 = a4;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__10;
  v33[4] = __Block_byref_object_dispose__10;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __94__HKSPSleepEventTimelineBuilder__gatherSessionsForValidationForOccurrence_overrideOccurrence___block_invoke;
  v26 = &unk_1E4E3D008;
  v9 = v6;
  v27 = v9;
  v28 = self;
  v31 = v33;
  v32 = &v35;
  v10 = v7;
  v29 = v10;
  v11 = v8;
  v30 = v11;
  v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A85ABD18](&v23);
  if ((objc_msgSend(v9, "isSingleDayOverride", v23, v24, v25, v26) & 1) != 0)
  {
    calendar = self->_calendar;
    objc_msgSend(v10, "wakeUpComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar dateFromComponents:](calendar, "dateFromComponents:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = self->_calendar;
    objc_msgSend(v10, "bedtimeComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar dateFromComponents:](v16, "dateFromComponents:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKSPSleepEventTimelineBuilder _windDownDateForBedtimeDate:](self, "_windDownDateForBedtimeDate:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPSleepEventTimelineBuilder _addSessionToTimelineWithWakeUpDate:bedtimeDate:windDownDate:occurrence:](self, "_addSessionToTimelineWithWakeUpDate:bedtimeDate:windDownDate:occurrence:", v15, v18, v19, v10);
    if ((self->_options & 4) != 0)
    {
      -[HKSPSleepEventTimelineResults mutableValidSleepSchedule](self->_results, "mutableValidSleepSchedule");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "saveOccurrence:", v11);

    }
    goto LABEL_11;
  }
  ((void (**)(_QWORD, uint64_t, NSDate *, _QWORD))v12)[2](v12, objc_msgSend(v9, "weekdays"), self->_date, 0);
  v21 = HKSPPreviousDayInWeekdays(v36[3], objc_msgSend(v9, "weekdays"));
  if ((unint64_t)(v21 + 2) > 9)
    v22 = 0;
  else
    v22 = qword_1A4F670A0[v21 + 2];
  ((void (**)(_QWORD, uint64_t, NSDate *, uint64_t))v12)[2](v12, v22, self->_date, 1);
  if ((self->_options & 4) != 0 && objc_msgSend(v11, "weekdays"))
  {
    -[HKSPSleepEventTimelineResults mutableValidSleepSchedule](self->_results, "mutableValidSleepSchedule");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "saveOccurrence:", v11);
LABEL_11:

  }
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(&v35, 8);
}

void __94__HKSPSleepEventTimelineBuilder__gatherSessionsForValidationForOccurrence_overrideOccurrence___block_invoke(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  __int128 v16;
  char v17;

  v7 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__HKSPSleepEventTimelineBuilder__gatherSessionsForValidationForOccurrence_overrideOccurrence___block_invoke_2;
  v10[3] = &unk_1E4E3CFE0;
  v11 = *(id *)(a1 + 32);
  v12 = v7;
  v17 = a4;
  v8 = *(void **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 40);
  v16 = *(_OWORD *)(a1 + 64);
  v14 = v8;
  v15 = *(id *)(a1 + 56);
  v9 = v7;
  HKSPWeekdaysEnumerateDays(a2, v10, 0);

}

void __94__HKSPSleepEventTimelineBuilder__gatherSessionsForValidationForOccurrence_overrideOccurrence___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  HKSPResolvedSleepScheduleOccurrence *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  HKSPResolvedSleepScheduleOccurrence *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "wakeUpDateForDate:day:searchBackwards:gregorianCalendar:", *(_QWORD *)(a1 + 40), a2, *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hksp_isBeforeDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v4);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = a2;
  }
  if ((objc_msgSend(*(id *)(a1 + 56), "overridesWakeUpForOccurrenceOnDate:gregorianCalendar:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "bedtimeDateForWakeUpDate:gregorianCalendar:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_windDownDateForBedtimeDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [HKSPResolvedSleepScheduleOccurrence alloc];
    v8 = *(_QWORD *)(a1 + 32);
    +[HKSPSleepEvent sleepEventWithIdentifier:dueDate:](HKSPSleepEvent, "sleepEventWithIdentifier:dueDate:", CFSTR("HKSPSleepEventIdentifierWakeUp"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKSPSleepEvent sleepEventWithIdentifier:dueDate:](HKSPSleepEvent, "sleepEventWithIdentifier:dueDate:", CFSTR("HKSPSleepEventIdentifierBedtime"), v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[HKSPSleepEvent sleepEventWithIdentifier:dueDate:](HKSPSleepEvent, "sleepEventWithIdentifier:dueDate:", CFSTR("HKSPSleepEventIdentifierWindDown"), v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HKSPResolvedSleepScheduleOccurrence initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:](v7, "initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:", v8, v9, v10, v11);

    }
    else
    {
      v12 = -[HKSPResolvedSleepScheduleOccurrence initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:](v7, "initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:", v8, v9, v10, 0);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "timeline");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resolvedOccurrenceOverlappingOccurrence:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "occurrence");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isSingleDayOverride");

      if (v16)
      {
        objc_msgSend(v14, "occurrence");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "wakeUpComponents");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 32), "dateFromComponents:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "hksp_isBeforeDate:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24)))
        {
          HKSPLogForCategory(6uLL);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = *(_QWORD *)(a1 + 48);
            objc_msgSend(v14, "occurrence");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 138543618;
            v28 = v21;
            v29 = 2114;
            v30 = v22;
            _os_log_impl(&dword_1A4F0E000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring overlap with expired override occurrence %{public}@", (uint8_t *)&v27, 0x16u);

          }
          goto LABEL_22;
        }

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "setSleepScheduleInvalid:", 1);
      objc_msgSend(v14, "occurrence");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "isSingleDayOverride"))
        v25 = 3;
      else
        v25 = 2;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "setSleepScheduleInvalidReason:", v25);

      if ((unint64_t)(a2 + 2) > 9)
        v26 = 0;
      else
        v26 = qword_1A4F670A0[a2 + 2];
      objc_msgSend(*(id *)(a1 + 64), "turnOffWeekdays:", v26);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "timeline");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addResolvedOccurrence:", v12);

    }
LABEL_22:

  }
}

- (void)_gatherSessionsForOccurrence:(id)a3 overrideOccurrence:(id)a4
{
  id v6;
  NSCalendar *calendar;
  void *v8;
  void *v9;
  NSCalendar *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v6 = a4;
  if (objc_msgSend(v24, "isSingleDayOverride"))
  {
    calendar = self->_calendar;
    objc_msgSend(v24, "wakeUpComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar dateFromComponents:](calendar, "dateFromComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = self->_calendar;
    objc_msgSend(v24, "bedtimeComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar dateFromComponents:](v10, "dateFromComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKSPSleepEventTimelineBuilder _windDownDateForBedtimeDate:](self, "_windDownDateForBedtimeDate:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPSleepEventTimelineBuilder _addSessionToTimelineWithWakeUpDate:bedtimeDate:windDownDate:occurrence:](self, "_addSessionToTimelineWithWakeUpDate:bedtimeDate:windDownDate:occurrence:", v9, v12, v13, v24);
  }
  else
  {
    objc_msgSend(v24, "wakeUpDateForDate:searchBackwards:gregorianCalendar:", self->_date, 0, self->_calendar);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "overridesWakeUpForOccurrenceOnDate:gregorianCalendar:", v9, self->_calendar) & 1) == 0)
    {
      objc_msgSend(v24, "bedtimeDateForWakeUpDate:gregorianCalendar:", v9, self->_calendar);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPSleepEventTimelineBuilder _windDownDateForBedtimeDate:](self, "_windDownDateForBedtimeDate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPSleepEventTimelineBuilder _addSessionToTimelineWithWakeUpDate:bedtimeDate:windDownDate:occurrence:](self, "_addSessionToTimelineWithWakeUpDate:bedtimeDate:windDownDate:occurrence:", v9, v14, v15, v24);

    }
    objc_msgSend(v24, "wakeUpDateForDate:searchBackwards:gregorianCalendar:", v9, 0, self->_calendar);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "overridesWakeUpForOccurrenceOnDate:gregorianCalendar:", v12, self->_calendar) & 1) == 0)
    {
      objc_msgSend(v24, "bedtimeDateForWakeUpDate:gregorianCalendar:", v12, self->_calendar);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPSleepEventTimelineBuilder _windDownDateForBedtimeDate:](self, "_windDownDateForBedtimeDate:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPSleepEventTimelineBuilder _addSessionToTimelineWithWakeUpDate:bedtimeDate:windDownDate:occurrence:](self, "_addSessionToTimelineWithWakeUpDate:bedtimeDate:windDownDate:occurrence:", v12, v16, v17, v24);

    }
    -[NSDate dateByAddingTimeInterval:](self->_date, "dateByAddingTimeInterval:", 1.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "wakeUpDateForDate:searchBackwards:gregorianCalendar:", v18, 1, self->_calendar);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "overridesWakeUpForOccurrenceOnDate:gregorianCalendar:", v13, self->_calendar) & 1) == 0)
    {
      objc_msgSend(v24, "bedtimeDateForWakeUpDate:gregorianCalendar:", v13, self->_calendar);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPSleepEventTimelineBuilder _windDownDateForBedtimeDate:](self, "_windDownDateForBedtimeDate:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPSleepEventTimelineBuilder _addSessionToTimelineWithWakeUpDate:bedtimeDate:windDownDate:occurrence:](self, "_addSessionToTimelineWithWakeUpDate:bedtimeDate:windDownDate:occurrence:", v13, v19, v20, v24);

    }
    objc_msgSend(v24, "wakeUpDateForDate:searchBackwards:gregorianCalendar:", v13, 1, self->_calendar);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "overridesWakeUpForOccurrenceOnDate:gregorianCalendar:", v21, self->_calendar) & 1) == 0)
    {
      objc_msgSend(v24, "bedtimeDateForWakeUpDate:gregorianCalendar:", v21, self->_calendar);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPSleepEventTimelineBuilder _windDownDateForBedtimeDate:](self, "_windDownDateForBedtimeDate:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSPSleepEventTimelineBuilder _addSessionToTimelineWithWakeUpDate:bedtimeDate:windDownDate:occurrence:](self, "_addSessionToTimelineWithWakeUpDate:bedtimeDate:windDownDate:occurrence:", v21, v22, v23, v24);

    }
  }

}

- (void)_addSessionToTimelineWithWakeUpDate:(id)a3 bedtimeDate:(id)a4 windDownDate:(id)a5 occurrence:(id)a6
{
  id v10;
  id v11;
  id v12;
  HKSPResolvedSleepScheduleOccurrence *v13;
  void *v14;
  void *v15;
  void *v16;
  HKSPResolvedSleepScheduleOccurrence *v17;
  void *v18;
  id v19;

  v19 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = [HKSPResolvedSleepScheduleOccurrence alloc];
  +[HKSPSleepEvent sleepEventWithIdentifier:dueDate:](HKSPSleepEvent, "sleepEventWithIdentifier:dueDate:", CFSTR("HKSPSleepEventIdentifierWakeUp"), v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKSPSleepEvent sleepEventWithIdentifier:dueDate:](HKSPSleepEvent, "sleepEventWithIdentifier:dueDate:", CFSTR("HKSPSleepEventIdentifierBedtime"), v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[HKSPSleepEvent sleepEventWithIdentifier:dueDate:](HKSPSleepEvent, "sleepEventWithIdentifier:dueDate:", CFSTR("HKSPSleepEventIdentifierWindDown"), v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HKSPResolvedSleepScheduleOccurrence initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:](v13, "initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:", v10, v14, v15, v16);

  }
  else
  {
    v17 = -[HKSPResolvedSleepScheduleOccurrence initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:](v13, "initWithOccurrence:wakeUpEvent:bedtimeEvent:windDownEvent:", v10, v14, v15, 0);
  }

  -[HKSPSleepEventTimelineResults timeline](self->_results, "timeline");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addResolvedOccurrence:", v17);

}

- (id)_windDownDateForBedtimeDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[HKSPSleepScheduleModel sleepSchedule](self->_sleepScheduleModel, "sleepSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windDownTime");
  v7 = (uint64_t)v6;

  if (v7)
  {
    -[NSCalendar dateByAddingUnit:value:toDate:options:](self->_calendar, "dateByAddingUnit:value:toDate:options:", 128, -v7, v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_adjustSessions
{
  -[HKSPSleepEventTimelineBuilder _adjustSessionForSnoozedWakeUpAlarm](self, "_adjustSessionForSnoozedWakeUpAlarm");
  -[HKSPSleepEventTimelineBuilder _adjustSessionForConfirmedWakeUp](self, "_adjustSessionForConfirmedWakeUp");
}

- (void)_adjustSessionForSnoozedWakeUpAlarm
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  HKSPSleepEventTimelineBuilder *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HKSPSleepScheduleModel sleepEventRecord](self->_sleepScheduleModel, "sleepEventRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wakeUpAlarmSnoozedUntilDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (HKSPIsValidDate(v4))
  {
    -[HKSPSleepEventTimelineResults unadjustedTimeline](self->_results, "unadjustedTimeline");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolvedOccurrencePrecedingDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "occurrence");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "alarmConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "isEnabled"))
      {
        HKSPLogForCategory(6uLL);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v12 = 138543618;
          v13 = self;
          v14 = 2114;
          v15 = v4;
          _os_log_debug_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] snoozed wake up alarm until %{public}@", (uint8_t *)&v12, 0x16u);
        }

        +[HKSPSleepEvent sleepEventWithIdentifier:dueDate:type:](HKSPSleepEvent, "sleepEventWithIdentifier:dueDate:type:", CFSTR("HKSPSleepEventIdentifierWakeUp"), v4, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKSPSleepEventTimelineResults timeline](self->_results, "timeline");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "adjustResolvedOccurrence:withEvent:", v6, v10);

      }
    }

  }
}

- (void)_adjustSessionForConfirmedWakeUp
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  HKSPSleepEventTimelineBuilder *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[HKSPSleepScheduleModel sleepEventRecord](self->_sleepScheduleModel, "sleepEventRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wakeUpAlarmDismissedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPSleepScheduleModel sleepEventRecord](self->_sleepScheduleModel, "sleepEventRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wakeUpConfirmedUntilDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if ((HKSPIsValidDate(v4) & 1) != 0 || HKSPIsValidDate(v6))
  {
    if (HKSPIsValidDate(v4) && HKSPIsValidDate(v6))
    {
      objc_msgSend(v4, "laterDate:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (HKSPIsValidDate(v4))
        v8 = v4;
      else
        v8 = v6;
      v7 = v8;
    }
    v9 = v7;
    if (v7 == v6)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[HKSPSleepScheduleModel sleepEventRecord](self->_sleepScheduleModel, "sleepEventRecord");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "wakeUpEarlyNotificationConfirmedDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "na_safeAddObject:", v13);
      -[HKSPSleepScheduleModel sleepEventRecord](self->_sleepScheduleModel, "sleepEventRecord");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "wakeUpOverriddenDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "na_safeAddObject:", v15);
      objc_msgSend(MEMORY[0x1E0C99D68], "hksp_latestFromDates:", v11);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = v4;
    }
    if (HKSPIsValidDate(v10))
    {
      -[HKSPSleepEventTimelineResults unadjustedTimeline](self->_results, "unadjustedTimeline");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "resolvedOccurrenceContainingOrPrecedingDate:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v17, "wakeUpEvent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dueDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v9, "hksp_isAfterOrSameAsDate:", v19);

        HKSPLogForCategory(6uLL);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
        if (v20)
        {
          if (v22)
          {
            v31 = 138543874;
            v32 = self;
            v33 = 2114;
            v34 = v10;
            v35 = 2114;
            v36 = v9;
            _os_log_debug_impl(&dword_1A4F0E000, v21, OS_LOG_TYPE_DEBUG, "[%{public}@] confirmed wake up at %{public}@ until %{public}@", (uint8_t *)&v31, 0x20u);
          }

          -[HKSPSleepEventTimelineResults timeline](self->_results, "timeline");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "resolvedOccurrenceContainingOrPrecedingDate:", v9);
          v21 = objc_claimAutoreleasedReturnValue();

          -[NSObject bedtimeEvent](v21, "bedtimeEvent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "dueDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "hksp_isAfterDate:", v10);

          if (v26)
          {
            HKSPLogForCategory(6uLL);
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              -[NSObject bedtimeEvent](v21, "bedtimeEvent");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "dueDate");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = 138543618;
              v32 = self;
              v33 = 2114;
              v34 = v29;
              _os_log_debug_impl(&dword_1A4F0E000, v27, OS_LOG_TYPE_DEBUG, "[%{public}@] ignoring confirmed wake up because bedtime event was at %{public}@", (uint8_t *)&v31, 0x16u);

            }
          }
          else
          {
            +[HKSPSleepEvent sleepEventWithIdentifier:dueDate:](HKSPSleepEvent, "sleepEventWithIdentifier:dueDate:", CFSTR("HKSPSleepEventIdentifierWakeUp"), v10);
            v27 = objc_claimAutoreleasedReturnValue();
            -[HKSPSleepEventTimelineResults timeline](self->_results, "timeline");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "adjustResolvedOccurrence:withEvent:", v17, v27);

          }
        }
        else if (v22)
        {
          v31 = 138543362;
          v32 = self;
          _os_log_debug_impl(&dword_1A4F0E000, v21, OS_LOG_TYPE_DEBUG, "[%{public}@] not adjusting occurrence because wake up date is after confirmed until date", (uint8_t *)&v31, 0xCu);
        }

      }
    }

  }
}

- (void)_validateSessionAdjustmentForSnoozedWakeUpAlarm
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  HKSPSleepEventTimelineBuilder *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HKSPSleepScheduleModel sleepEventRecord](self->_sleepScheduleModel, "sleepEventRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wakeUpAlarmSnoozedUntilDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HKSPSleepEventTimelineResults unadjustedTimeline](self->_results, "unadjustedTimeline");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolvedOccurrencePrecedingDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "occurrence");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "alarmConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v8, "isEnabled") & 1) == 0)
      {
        HKSPLogForCategory(6uLL);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v10 = 138543618;
          v11 = self;
          v12 = 2114;
          v13 = v4;
          _os_log_debug_impl(&dword_1A4F0E000, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] snoozed wake up alarm for %{public}@ is for disabled alarm", (uint8_t *)&v10, 0x16u);
        }

        -[HKSPSleepEventTimelineResults setSnoozeFireDateNeedsReset:](self->_results, "setSnoozeFireDateNeedsReset:", 1);
      }

    }
  }

}

- (HKSPSleepEventTimelineResults)results
{
  return self->_results;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  return self->_sleepScheduleModel;
}

- (NSDate)date
{
  return self->_date;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_sleepScheduleModel, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
