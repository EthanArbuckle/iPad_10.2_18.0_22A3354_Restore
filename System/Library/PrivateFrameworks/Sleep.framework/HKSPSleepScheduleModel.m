@implementation HKSPSleepScheduleModel

+ (id)sleepScheduleModelWithSleepSchedule:(id)a3 sleepSettings:(id)a4 sleepEventRecord:(id)a5
{
  id v7;
  id v8;
  id v9;
  HKSPSleepScheduleModel *v10;
  uint64_t v11;
  HKSPSleepSchedule *sleepSchedule;
  uint64_t v13;
  HKSPSleepSettings *sleepSettings;
  uint64_t v15;
  HKSPSleepEventRecord *sleepEventRecord;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(HKSPSleepScheduleModel);
  v11 = objc_msgSend(v9, "copy");

  sleepSchedule = v10->_sleepSchedule;
  v10->_sleepSchedule = (HKSPSleepSchedule *)v11;

  v13 = objc_msgSend(v8, "copy");
  sleepSettings = v10->_sleepSettings;
  v10->_sleepSettings = (HKSPSleepSettings *)v13;

  v15 = objc_msgSend(v7, "copy");
  sleepEventRecord = v10->_sleepEventRecord;
  v10->_sleepEventRecord = (HKSPSleepEventRecord *)v15;

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HKSPSleepScheduleModel *v4;
  uint64_t v5;
  HKSPSleepSchedule *sleepSchedule;
  uint64_t v7;
  HKSPSleepSettings *sleepSettings;
  uint64_t v9;
  HKSPSleepEventRecord *sleepEventRecord;

  v4 = objc_alloc_init(HKSPSleepScheduleModel);
  -[HKSPSleepScheduleModel sleepSchedule](self, "sleepSchedule");
  v5 = objc_claimAutoreleasedReturnValue();
  sleepSchedule = v4->_sleepSchedule;
  v4->_sleepSchedule = (HKSPSleepSchedule *)v5;

  -[HKSPSleepScheduleModel sleepSettings](self, "sleepSettings");
  v7 = objc_claimAutoreleasedReturnValue();
  sleepSettings = v4->_sleepSettings;
  v4->_sleepSettings = (HKSPSleepSettings *)v7;

  -[HKSPSleepScheduleModel sleepEventRecord](self, "sleepEventRecord");
  v9 = objc_claimAutoreleasedReturnValue();
  sleepEventRecord = v4->_sleepEventRecord;
  v4->_sleepEventRecord = (HKSPSleepEventRecord *)v9;

  return v4;
}

- (NSDate)lastModifiedDate
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;

  -[HKSPSleepSchedule lastModifiedDate](self->_sleepSchedule, "lastModifiedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (-[HKSPSleepSettings lastModifiedDate](self->_sleepSettings, "lastModifiedDate"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "hksp_isAfterDate:", v3),
        v4,
        v5))
  {
    -[HKSPSleepSettings lastModifiedDate](self->_sleepSettings, "lastModifiedDate");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
    if (!v6)
      goto LABEL_5;
  }
  -[HKSPSleepEventRecord lastModifiedDate](self->_sleepEventRecord, "lastModifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hksp_isAfterDate:", v3);

  if (v8)
  {
LABEL_5:
    -[HKSPSleepEventRecord lastModifiedDate](self->_sleepEventRecord, "lastModifiedDate");
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }
  return (NSDate *)v3;
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[HKSPSleepScheduleModel sleepSchedule](self, "sleepSchedule");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sleepSchedule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEquivalentTo:", v6))
    {
      -[HKSPSleepScheduleModel sleepSettings](self, "sleepSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sleepSettings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEquivalentTo:", v8))
      {
        -[HKSPSleepScheduleModel sleepEventRecord](self, "sleepEventRecord");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sleepEventRecord");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEquivalentTo:", v10);

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

- (BOOL)isEqual:(id)a3
{
  HKSPSleepScheduleModel *v4;
  HKSPSleepScheduleModel *v5;
  void *v6;
  HKSPSleepSchedule *sleepSchedule;
  uint64_t v8;
  HKSPSleepScheduleModel *v9;
  id v10;
  HKSPSleepSettings *sleepSettings;
  HKSPSleepScheduleModel *v12;
  id v13;
  HKSPSleepEventRecord *sleepEventRecord;
  HKSPSleepScheduleModel *v15;
  id v16;
  char v17;
  _QWORD v19[4];
  HKSPSleepScheduleModel *v20;
  _QWORD v21[4];
  HKSPSleepScheduleModel *v22;
  _QWORD v23[4];
  HKSPSleepScheduleModel *v24;

  v4 = (HKSPSleepScheduleModel *)a3;
  if (self == v4)
  {
    v17 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v5, objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      sleepSchedule = self->_sleepSchedule;
      v8 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __34__HKSPSleepScheduleModel_isEqual___block_invoke;
      v23[3] = &unk_1E4E3A8A8;
      v9 = v5;
      v24 = v9;
      v10 = (id)objc_msgSend(v6, "appendObject:counterpart:", sleepSchedule, v23);
      sleepSettings = self->_sleepSettings;
      v21[0] = v8;
      v21[1] = 3221225472;
      v21[2] = __34__HKSPSleepScheduleModel_isEqual___block_invoke_2;
      v21[3] = &unk_1E4E3A8D0;
      v12 = v9;
      v22 = v12;
      v13 = (id)objc_msgSend(v6, "appendObject:counterpart:", sleepSettings, v21);
      sleepEventRecord = self->_sleepEventRecord;
      v19[0] = v8;
      v19[1] = 3221225472;
      v19[2] = __34__HKSPSleepScheduleModel_isEqual___block_invoke_3;
      v19[3] = &unk_1E4E3A8F8;
      v20 = v12;
      v15 = v12;
      v16 = (id)objc_msgSend(v6, "appendObject:counterpart:", sleepEventRecord, v19);
      v17 = objc_msgSend(v6, "isEqual");

    }
    else
    {
      v17 = 0;
    }
  }

  return v17;
}

uint64_t __34__HKSPSleepScheduleModel_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sleepSchedule");
}

uint64_t __34__HKSPSleepScheduleModel_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sleepSettings");
}

uint64_t __34__HKSPSleepScheduleModel_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sleepEventRecord");
}

- (id)nextEventWithIdentifier:(id)a3 dueAfterDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[HKSPSleepEvent standardEventIdentifiers](HKSPSleepEvent, "standardEventIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if ((v9 & 1) != 0)
  {
    -[HKSPSleepScheduleModel upcomingEventsDueAfterDate:](self, "upcomingEventsDueAfterDate:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__HKSPSleepScheduleModel_nextEventWithIdentifier_dueAfterDate___block_invoke;
    v16[3] = &unk_1E4E3A920;
    v17 = v6;
    objc_msgSend(v10, "na_firstObjectPassingTest:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dueDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HKSPLogForCategory(6uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = (id)objc_opt_class();
      v20 = 2114;
      v21 = v6;
      v15 = v19;
      _os_log_error_impl(&dword_1A4F0E000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ not in known identifiers", buf, 0x16u);

    }
    v12 = 0;
  }

  return v12;
}

uint64_t __63__HKSPSleepScheduleModel_nextEventWithIdentifier_dueAfterDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)previousEventWithIdentifier:(id)a3 dueBeforeDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[HKSPSleepEvent standardEventIdentifiers](HKSPSleepEvent, "standardEventIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if ((v9 & 1) != 0)
  {
    -[HKSPSleepScheduleModel _upcomingEventsDueAfterDate:searchBackwards:](self, "_upcomingEventsDueAfterDate:searchBackwards:", v7, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68__HKSPSleepScheduleModel_previousEventWithIdentifier_dueBeforeDate___block_invoke;
    v16[3] = &unk_1E4E3A920;
    v17 = v6;
    objc_msgSend(v10, "na_firstObjectPassingTest:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dueDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HKSPLogForCategory(6uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = (id)objc_opt_class();
      v20 = 2114;
      v21 = v6;
      v15 = v19;
      _os_log_error_impl(&dword_1A4F0E000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] %{public}@ not in known identifiers", buf, 0x16u);

    }
    v12 = 0;
  }

  return v12;
}

uint64_t __68__HKSPSleepScheduleModel_previousEventWithIdentifier_dueBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)closestEventWithIdentifier:(id)a3 dueAroundDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[HKSPSleepScheduleModel nextEventWithIdentifier:dueAfterDate:](self, "nextEventWithIdentifier:dueAfterDate:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepScheduleModel previousEventWithIdentifier:dueBeforeDate:](self, "previousEventWithIdentifier:dueBeforeDate:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  if (v8)
  {
    v10 = v8;
    if (v9)
    {
      objc_msgSend(v8, "timeIntervalSinceDate:", v6);
      v12 = v11;
      objc_msgSend(v6, "timeIntervalSinceDate:", v9);
      if (v12 > v13)
        v10 = v9;
      else
        v10 = v8;
    }
  }
  v14 = v10;

  return v14;
}

- (id)nextEventDueAfterDate:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSleepScheduleModel upcomingEventsDueAfterDate:](self, "upcomingEventsDueAfterDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)upcomingEventsDueAfterDate:(id)a3
{
  return -[HKSPSleepScheduleModel _upcomingEventsDueAfterDate:searchBackwards:](self, "_upcomingEventsDueAfterDate:searchBackwards:", a3, 0);
}

- (id)previousEventsDueBeforeDate:(id)a3
{
  return -[HKSPSleepScheduleModel _upcomingEventsDueAfterDate:searchBackwards:](self, "_upcomingEventsDueAfterDate:searchBackwards:", a3, 1);
}

- (id)_upcomingEventsDueAfterDate:(id)a3 searchBackwards:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  if (!a3)
    return MEMORY[0x1E0C9AA60];
  +[HKSPSleepEventTimelineBuilder builderWithSleepScheduleModel:date:](HKSPSleepEventTimelineBuilder, "builderWithSleepScheduleModel:date:", self, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buildTimelineWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4)
    objc_msgSend(v7, "previousEvents");
  else
    objc_msgSend(v7, "upcomingEvents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__HKSPSleepScheduleModel__upcomingEventsDueAfterDate_searchBackwards___block_invoke;
  v14[3] = &unk_1E4E3A920;
  v15 = v11;
  v12 = v11;
  objc_msgSend(v10, "na_filter:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __70__HKSPSleepScheduleModel__upcomingEventsDueAfterDate_searchBackwards___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  return v6 ^ 1u;
}

- (id)upcomingOccurrenceAfterDate:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSleepScheduleModel upcomingResolvedOccurrenceAfterDate:](self, "upcomingResolvedOccurrenceAfterDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "occurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_computeUpcomingDateIntervalForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "hk_gregorianCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_dateByAddingDays:toDate:", 2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v4, v8);

  return v9;
}

- (id)upcomingResolvedOccurrenceAfterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_computeUpcomingDateIntervalForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPSleepScheduleModel nextResolvedOccurrenceInInterval:](self, "nextResolvedOccurrenceInInterval:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)nextOccurrenceAfterDate:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSleepScheduleModel nextResolvedOccurrenceAfterDate:](self, "nextResolvedOccurrenceAfterDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "occurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nextOccurrenceInInterval:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSleepScheduleModel nextResolvedOccurrenceInInterval:](self, "nextResolvedOccurrenceInInterval:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "occurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nextResolvedOccurrenceAfterDate:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSleepScheduleModel _upcomingResolvedOccurrencesDueAfterDate:searchBackwards:](self, "_upcomingResolvedOccurrencesDueAfterDate:searchBackwards:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)nextResolvedOccurrenceInInterval:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[HKSPSleepSchedule isEnabled](self->_sleepSchedule, "isEnabled"))
  {
    objc_msgSend(v4, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPSleepScheduleModel timelineForDate:](self, "timelineForDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "upcomingResolvedOccurrencesBeforeDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)previousOccurrenceBeforeDate:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSleepScheduleModel previousResolvedOccurrenceBeforeDate:](self, "previousResolvedOccurrenceBeforeDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "occurrence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)previousResolvedOccurrenceBeforeDate:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSleepScheduleModel _upcomingResolvedOccurrencesDueAfterDate:searchBackwards:](self, "_upcomingResolvedOccurrencesDueAfterDate:searchBackwards:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)timelineForDate:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSleepScheduleModel _timelineResultsDueAfterDate:](self, "_timelineResultsDueAfterDate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_timelineResultsDueAfterDate:(id)a3
{
  void *v3;
  void *v4;

  +[HKSPSleepEventTimelineBuilder builderWithSleepScheduleModel:date:](HKSPSleepEventTimelineBuilder, "builderWithSleepScheduleModel:date:", self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buildTimelineWithOptions:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_upcomingResolvedOccurrencesDueAfterDate:(id)a3 searchBackwards:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (-[HKSPSleepSchedule isEnabled](self->_sleepSchedule, "isEnabled"))
  {
    -[HKSPSleepScheduleModel timelineForDate:](self, "timelineForDate:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a4)
      objc_msgSend(v7, "previousResolvedOccurrences");
    else
      objc_msgSend(v7, "upcomingResolvedOccurrences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v9;
}

- (int64_t)alarmStatusForOccurrence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  int v10;
  void *v11;
  unsigned int v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "isSingleDayOverride"))
    {
      -[HKSPSleepScheduleModel sleepSchedule](self, "sleepSchedule");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "overridenOccurrenceForOverrideOccurrence:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v5, "alarmConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEnabled");

    if (v10)
    {
      if (!objc_msgSend(v5, "isSingleDayOverride")
        || v7 && (objc_msgSend(v7, "isAlarmEquivalentToOverrideOccurrence:", v5) & 1) != 0)
      {
        v8 = 3;
      }
      else
      {
        v8 = 2;
      }
    }
    else if (v7)
    {
      objc_msgSend(v7, "alarmConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEnabled");

      v8 = v12;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)templateModelForSchedule:(id)a3
{
  id v3;
  void *v4;
  HKSPSleepSettings *v5;
  HKSPSleepEventRecord *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  v5 = objc_alloc_init(HKSPSleepSettings);
  v6 = objc_alloc_init(HKSPSleepEventRecord);
  objc_msgSend(v4, "sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:", v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)modelByApplyingChangesFromOccurrence:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[HKSPSleepScheduleModel sleepSchedule](self, "sleepSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "saveOccurrence:", v4);
  v7 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "copy");
  -[HKSPSleepScheduleModel sleepSettings](self, "sleepSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepScheduleModel sleepEventRecord](self, "sleepEventRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)description
{
  return (NSString *)-[HKSPSleepScheduleModel descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", &stru_1E4E3E220);
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepScheduleModel sleepSchedule](self, "sleepSchedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[HKSPSleepScheduleModel sleepSettings](self, "sleepSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[HKSPSleepScheduleModel sleepEventRecord](self, "sleepEventRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  v10 = objc_msgSend(v3, "hash");
  return v10;
}

- (HKSPSleepScheduleModel)initWithCoder:(id)a3
{
  id v4;
  HKSPSleepScheduleModel *v5;
  uint64_t v6;
  HKSPSleepSchedule *sleepSchedule;
  uint64_t v8;
  HKSPSleepSettings *sleepSettings;
  uint64_t v10;
  HKSPSleepEventRecord *sleepEventRecord;
  HKSPSleepScheduleModel *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSPSleepScheduleModel;
  v5 = -[HKSPSleepScheduleModel init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sleepSchedule"));
    v6 = objc_claimAutoreleasedReturnValue();
    sleepSchedule = v5->_sleepSchedule;
    v5->_sleepSchedule = (HKSPSleepSchedule *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sleepSettings"));
    v8 = objc_claimAutoreleasedReturnValue();
    sleepSettings = v5->_sleepSettings;
    v5->_sleepSettings = (HKSPSleepSettings *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sleepEventRecord"));
    v10 = objc_claimAutoreleasedReturnValue();
    sleepEventRecord = v5->_sleepEventRecord;
    v5->_sleepEventRecord = (HKSPSleepEventRecord *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  HKSPSleepSchedule *sleepSchedule;
  id v5;

  sleepSchedule = self->_sleepSchedule;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sleepSchedule, CFSTR("sleepSchedule"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sleepSettings, CFSTR("sleepSettings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sleepEventRecord, CFSTR("sleepEventRecord"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[HKSPSleepScheduleModel succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[HKSPSleepScheduleModel descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v8;
  _QWORD v10[4];
  id v11;
  HKSPSleepScheduleModel *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__HKSPSleepScheduleModel_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E4E3A760;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

id __64__HKSPSleepScheduleModel_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("sleepSchedule"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("sleepSettings"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("sleepEventRecord"));
}

- (HKSPSleepSchedule)sleepSchedule
{
  return self->_sleepSchedule;
}

- (HKSPSleepSettings)sleepSettings
{
  return self->_sleepSettings;
}

- (HKSPSleepEventRecord)sleepEventRecord
{
  return self->_sleepEventRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepEventRecord, 0);
  objc_storeStrong((id *)&self->_sleepSettings, 0);
  objc_storeStrong((id *)&self->_sleepSchedule, 0);
}

- (id)computeConfirmedWakeUpUntilDateForEarlyWakeUpDate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  id v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[2];
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HKSPLogForCategory(9uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v43 = (id)objc_opt_class();
    v44 = 2114;
    v45 = v4;
    v6 = v43;
    _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] computing wake up confirmed date for early wake up (%{public}@)", buf, 0x16u);

  }
  -[HKSPSleepScheduleModel nextResolvedOccurrenceAfterDate:](self, "nextResolvedOccurrenceAfterDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wakeUpEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dueDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory(9uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v43 = v11;
    v44 = 2114;
    v45 = v9;
    v12 = v11;
    _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] next wake up is %{public}@", buf, 0x16u);

  }
  objc_msgSend(v7, "scheduledInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsDate:", v4);

  if ((v14 & 1) != 0)
    goto LABEL_23;
  HKSPLogForCategory(9uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v43 = v16;
    v44 = 2114;
    v45 = v4;
    v17 = v16;
    _os_log_impl(&dword_1A4F0E000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] early wake up detected outside of expected interval (%{public}@)", buf, 0x16u);

  }
  -[HKSPSleepScheduleModel sleepEventRecord](self, "sleepEventRecord");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "wakeUpEarlyNotificationConfirmedDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "wakeUpConfirmedUntilDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "hksp_isAfterDate:", v19))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v19, v20);
    if (objc_msgSend(v21, "hksp_containsDate:", v4))
    {
      HKSPLogForCategory(9uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v43 = v23;
        v44 = 2114;
        v45 = v20;
        v24 = v23;
        _os_log_impl(&dword_1A4F0E000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] possible duplicate early wake up detected, using that wake up date (%{public}@)", buf, 0x16u);

      }
      v25 = v20;
      v26 = 1;
      goto LABEL_22;
    }

  }
  v40 = v18;
  -[HKSPSleepScheduleModel previousResolvedOccurrenceBeforeDate:](self, "previousResolvedOccurrenceBeforeDate:", v4, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "wakeUpEvent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dueDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = (void *)MEMORY[0x1E0C99D68];
  v41[0] = v28;
  v41[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "hksp_closestFromDates:toDate:", v30, v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory(9uLL);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v31 == v28)
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v43 = v34;
      v44 = 2114;
      v45 = v28;
      v35 = v34;
      _os_log_impl(&dword_1A4F0E000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] possible late early wake up detected, using previous wake up date (%{public}@)", buf, 0x16u);

    }
    v25 = v28;
    v26 = 1;
  }
  else
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v37 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v43 = v37;
      v38 = v37;
      _os_log_error_impl(&dword_1A4F0E000, v33, OS_LOG_TYPE_ERROR, "[%{public}@] unexpected early wake up detected", buf, 0xCu);

    }
    v26 = 0;
    v25 = v20;
  }
  v18 = v40;

  v19 = v39;
LABEL_22:

  if (!v26)
LABEL_23:
    v25 = v9;

  return v25;
}

- (id)computeConfirmedWakeUpUntilDateForOverrideWakeUpDate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HKSPLogForCategory(9uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = (id)objc_opt_class();
    v11 = 2114;
    v12 = v4;
    v6 = v10;
    _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] computing wake up confirmed date for override wake up (%{public}@)", (uint8_t *)&v9, 0x16u);

  }
  -[HKSPSleepScheduleModel _computeOriginalWakeUpForOverrideDateHelper:](self, "_computeOriginalWakeUpForOverrideDateHelper:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)computeTemplateGenerationDateForCurrentDate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HKSPLogForCategory(9uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = (id)objc_opt_class();
    v11 = 2114;
    v12 = v4;
    v6 = v10;
    _os_log_impl(&dword_1A4F0E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] computing template generation date for current date (%{public}@)", (uint8_t *)&v9, 0x16u);

  }
  -[HKSPSleepScheduleModel _computeOriginalWakeUpForOverrideDateHelper:](self, "_computeOriginalWakeUpForOverrideDateHelper:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_computeOriginalWakeUpForOverrideDateHelper:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKSPSleepScheduleModel previousOccurrenceBeforeDate:](self, "previousOccurrenceBeforeDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepScheduleModel sleepSchedule](self, "sleepSchedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overridenOccurrenceForOverrideOccurrence:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    HKSPLogForCategory(9uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543362;
      v24 = (id)objc_opt_class();
      v17 = v24;
      _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] override occurrence doesn't override anything", (uint8_t *)&v23, 0xCu);

    }
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wakeUpComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject dateFromComponents:](v8, "dateFromComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "nextDateIntervalWithWakeUpAfterDate:gregorianCalendar:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "endDate");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (!-[NSObject date:isSameDayAsDate:](v8, "date:isSameDayAsDate:", v12, v10))
  {
    HKSPLogForCategory(9uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543362;
      v24 = (id)objc_opt_class();
      v18 = v24;
      v19 = "[%{public}@] override occurrence was later than normal occurrence";
      v20 = v14;
      v21 = 12;
LABEL_13:
      _os_log_impl(&dword_1A4F0E000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v23, v21);

    }
LABEL_14:

LABEL_15:
    v12 = v4;
    goto LABEL_16;
  }
  v13 = objc_msgSend(v12, "hksp_isAfterDate:", v4);
  HKSPLogForCategory(9uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v13)
  {
    if (v15)
    {
      v23 = 138543618;
      v24 = (id)objc_opt_class();
      v25 = 2114;
      v26 = v12;
      v18 = v24;
      v19 = "[%{public}@] wake up for override was later than normal occurrence wake up time (%{public}@)";
      v20 = v14;
      v21 = 22;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (v15)
  {
    v23 = 138543618;
    v24 = (id)objc_opt_class();
    v25 = 2114;
    v26 = v12;
    v16 = v24;
    _os_log_impl(&dword_1A4F0E000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up for override was earlier than normal occurrence wake up time (%{public}@)", (uint8_t *)&v23, 0x16u);

  }
LABEL_16:

  return v12;
}

- (id)generateOverrideOccurrenceForCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HKSPSleepSchedule *v10;

  v6 = a3;
  v7 = a4;
  -[HKSPSleepScheduleModel sleepSchedule](self, "sleepSchedule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HKSPSleepScheduleModel generateOverrideOccurrenceForCurrentDate:gregorianCalendar:schedule:](self, "generateOverrideOccurrenceForCurrentDate:gregorianCalendar:schedule:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc_init(HKSPSleepSchedule);
    -[HKSPSleepScheduleModel generateOverrideOccurrenceForCurrentDate:gregorianCalendar:schedule:](self, "generateOverrideOccurrenceForCurrentDate:gregorianCalendar:schedule:", v6, v7, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)generateOverrideOccurrenceForCurrentDate:(id)a3 gregorianCalendar:(id)a4 schedule:(id)a5
{
  void *v5;
  void *v6;

  -[HKSPSleepScheduleModel overrideOccurrenceGenerationResultForCurrentDate:gregorianCalendar:schedule:](self, "overrideOccurrenceGenerationResultForCurrentDate:gregorianCalendar:schedule:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overrideOccurrence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)overrideOccurrenceGenerationResultForCurrentDate:(id)a3 gregorianCalendar:(id)a4 schedule:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  HKSPOverrideOccurrenceGenerationResult *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  HKSPLogForCategory(9uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    objc_msgSend(v8, "hkspDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543874;
    v33 = v12;
    v34 = 2114;
    v35 = v14;
    v36 = 2114;
    v37 = v10;
    _os_log_impl(&dword_1A4F0E000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] generating an override occurrence for current date: %{public}@ from schedule: %{public}@", (uint8_t *)&v32, 0x20u);

  }
  v15 = objc_alloc_init(HKSPOverrideOccurrenceGenerationResult);
  -[HKSPSleepScheduleModel upcomingResolvedOccurrenceAfterDate:](self, "upcomingResolvedOccurrenceAfterDate:", v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory(9uLL);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_opt_class();
    v19 = v18;
    objc_msgSend(v8, "hkspDescription");
    v20 = v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543874;
    v33 = v18;
    v34 = 2114;
    v35 = v21;
    v36 = 2114;
    v37 = v16;
    _os_log_impl(&dword_1A4F0E000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] upcoming resolved occurrence for current date: %{public}@ is: %{public}@", (uint8_t *)&v32, 0x20u);

    v8 = v20;
  }

  HKSPLogForCategory(9uLL);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v23)
    {
      v24 = (void *)objc_opt_class();
      v32 = 138543362;
      v33 = v24;
      v25 = v24;
      _os_log_impl(&dword_1A4F0E000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] generating an override from resolved upcoming occurrence", (uint8_t *)&v32, 0xCu);

    }
    -[HKSPOverrideOccurrenceGenerationResult setWasGeneratedFromTemplate:](v15, "setWasGeneratedFromTemplate:", 0);
    objc_msgSend(v16, "occurrence");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPOverrideOccurrenceGenerationResult setUpcomingOccurrenceWasOverride:](v15, "setUpcomingOccurrenceWasOverride:", objc_msgSend(v26, "isSingleDayOverride"));

    objc_msgSend(v16, "generateOverrideOccurrenceForCurrentDate:gregorianCalendar:", v8, v9);
    v27 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v23)
    {
      v28 = (void *)objc_opt_class();
      v32 = 138543362;
      v33 = v28;
      v29 = v28;
      _os_log_impl(&dword_1A4F0E000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] no upcoming occurrence, generating an override from template", (uint8_t *)&v32, 0xCu);

    }
    -[HKSPOverrideOccurrenceGenerationResult setWasGeneratedFromTemplate:](v15, "setWasGeneratedFromTemplate:", 1);
    -[HKSPOverrideOccurrenceGenerationResult setUpcomingOccurrenceWasOverride:](v15, "setUpcomingOccurrenceWasOverride:", 0);
    -[HKSPSleepScheduleModel generateOverrideOccurrenceFromTemplateForCurrentDate:gregorianCalendar:schedule:](self, "generateOverrideOccurrenceFromTemplateForCurrentDate:gregorianCalendar:schedule:", v8, v9, v10);
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v30 = (void *)v27;
  -[HKSPOverrideOccurrenceGenerationResult setOverrideOccurrence:](v15, "setOverrideOccurrence:", v27);

  return v15;
}

- (id)generateOverrideOccurrenceFromTemplateForCurrentDate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "hk_gregorianCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepScheduleModel generateOverrideOccurrenceFromTemplateForCurrentDate:gregorianCalendar:](self, "generateOverrideOccurrenceFromTemplateForCurrentDate:gregorianCalendar:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)generateOverrideOccurrenceFromTemplateForCurrentDate:(id)a3 gregorianCalendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HKSPSleepSchedule *v10;

  v6 = a3;
  v7 = a4;
  -[HKSPSleepScheduleModel sleepSchedule](self, "sleepSchedule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HKSPSleepScheduleModel generateOverrideOccurrenceFromTemplateForCurrentDate:gregorianCalendar:schedule:](self, "generateOverrideOccurrenceFromTemplateForCurrentDate:gregorianCalendar:schedule:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_alloc_init(HKSPSleepSchedule);
    -[HKSPSleepScheduleModel generateOverrideOccurrenceFromTemplateForCurrentDate:gregorianCalendar:schedule:](self, "generateOverrideOccurrenceFromTemplateForCurrentDate:gregorianCalendar:schedule:", v6, v7, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)generateOverrideOccurrenceFromTemplateForCurrentDate:(id)a3 gregorianCalendar:(id)a4 schedule:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "mutableOccurrenceTemplate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPSleepScheduleModel generateOverrideOccurrenceFromTemplateForCurrentDate:gregorianCalendar:mutableOccurrence:](self, "generateOverrideOccurrenceFromTemplateForCurrentDate:gregorianCalendar:mutableOccurrence:", v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)generateOverrideOccurrenceFromTemplateForCurrentDate:(id)a3 gregorianCalendar:(id)a4 mutableOccurrence:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  -[HKSPSleepScheduleModel computeTemplateGenerationDateForCurrentDate:](self, "computeTemplateGenerationDateForCurrentDate:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "overrideOccurrenceTemplateForCurrentDate:gregorianCalendar:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)goodMorningAlertNotificationEnabled
{
  return -[HKSPSleepScheduleModel goodMorningAlertNotificationsEnabledWithLogObject:](self, "goodMorningAlertNotificationsEnabledWithLogObject:", 0);
}

- (BOOL)goodMorningAlertNotificationsEnabledWithLogObject:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  char v8;
  BOOL v9;
  NSObject *v10;
  const char *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKSPSleepScheduleModel sleepSchedule](self, "sleepSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEnabledAndHasOccurrences") & 1) != 0)
  {
    -[HKSPSleepScheduleModel sleepSettings](self, "sleepSettings");
    v6 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject watchSleepFeaturesEnabled](v6, "watchSleepFeaturesEnabled") & 1) != 0)
    {
      if ((-[NSObject scheduledSleepMode](v6, "scheduledSleepMode") & 1) != 0)
      {
        -[HKSPSleepScheduleModel sleepEventRecord](self, "sleepEventRecord");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = -[NSObject isAnySleepCoachingOnboardingCompleted](v7, "isAnySleepCoachingOnboardingCompleted");
        v9 = v8;
        if (!v4 || (v8 & 1) != 0)
          goto LABEL_21;
        HKSPLogForCategory(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 138543362;
          v14 = v4;
          _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] not posting good morning alert because onboarding hasn't completed", (uint8_t *)&v13, 0xCu);
        }

LABEL_20:
        v9 = 0;
LABEL_21:

LABEL_23:
        goto LABEL_24;
      }
      if (v4)
      {
        HKSPLogForCategory(0);
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        v13 = 138543362;
        v14 = v4;
        v11 = "[%{public}@] not posting morning notification because scheduledSleepMode isn't enabled";
        goto LABEL_19;
      }
    }
    else if (v4)
    {
      HKSPLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v13 = 138543362;
      v14 = v4;
      v11 = "[%{public}@] not posting morning notification because sleep features are disabled for this watch";
LABEL_19:
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);
      goto LABEL_20;
    }
LABEL_22:
    v9 = 0;
    goto LABEL_23;
  }
  if (v4)
  {
    HKSPLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v4;
      _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] not posting morning notification because sleep schedule isn't enabled", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_22;
  }
  v9 = 0;
LABEL_24:

  return v9;
}

- (BOOL)goodMorningScreenEnabled
{
  return -[HKSPSleepScheduleModel goodMorningScreenEnabledWithLogObject:](self, "goodMorningScreenEnabledWithLogObject:", 0);
}

- (BOOL)goodMorningScreenEnabledWithLogObject:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  BOOL v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKSPSleepScheduleModel sleepSchedule](self, "sleepSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEnabledAndHasOccurrences") & 1) == 0)
  {
    if (!v4)
    {
      v9 = 0;
      goto LABEL_17;
    }
    HKSPLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] not showing morning screen because sleep schedule isn't enabled", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_15;
  }
  -[HKSPSleepScheduleModel sleepSettings](self, "sleepSettings");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject scheduledSleepMode](v6, "scheduledSleepMode") & 1) != 0)
  {
    if ((-[NSObject sleepModeOptions](v6, "sleepModeOptions") & 0x4000) != 0)
    {
      v9 = 1;
      goto LABEL_16;
    }
    if (v4)
    {
      HKSPLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543362;
        v12 = v4;
        v8 = "[%{public}@] not showing morning screen because it isn't enabled";
LABEL_13:
        _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0xCu);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
  }
  else if (v4)
  {
    HKSPLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      v8 = "[%{public}@] not showing morning screen because scheduledSleepMode isn't enabled";
      goto LABEL_13;
    }
LABEL_14:

  }
LABEL_15:
  v9 = 0;
LABEL_16:

LABEL_17:
  return v9;
}

- (BOOL)chargingRemindersEnabled
{
  return -[HKSPSleepScheduleModel chargingRemindersEnabledWithLogObject:](self, "chargingRemindersEnabledWithLogObject:", 0);
}

- (BOOL)chargingRemindersEnabledWithLogObject:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  const char *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKSPSleepScheduleModel sleepSchedule](self, "sleepSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEnabledAndHasOccurrences") & 1) != 0)
  {
    -[HKSPSleepScheduleModel sleepSettings](self, "sleepSettings");
    v6 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject watchSleepFeaturesEnabled](v6, "watchSleepFeaturesEnabled") & 1) != 0)
    {
      if ((-[NSObject chargingReminders](v6, "chargingReminders") & 1) != 0)
      {
        v7 = 1;
LABEL_18:

        goto LABEL_19;
      }
      if (v4)
      {
        HKSPLogForCategory(0);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v11 = 138543362;
          v12 = v4;
          v9 = "[%{public}@] not posting charging reminder because charging reminders aren't enabled";
          goto LABEL_15;
        }
        goto LABEL_16;
      }
    }
    else if (v4)
    {
      HKSPLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543362;
        v12 = v4;
        v9 = "[%{public}@] not posting charging reminder because sleep features are disabled for this watch";
LABEL_15:
        _os_log_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
      }
LABEL_16:

    }
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  if (v4)
  {
    HKSPLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] not posting charging reminder because sleep schedule isn't enabled", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_17;
  }
  v7 = 0;
LABEL_19:

  return v7;
}

@end
