@implementation ATXModeCalendarFeaturizer

- (ATXModeCalendarFeaturizer)initWithLocationManager:(id)a3
{
  id v4;
  ATXModeCalendarFeaturizer *v5;
  uint64_t v6;
  NSHashTable *timers;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _PASSimpleCoalescingTimer *featureUpdateTimer;
  ATXMicrolocationLocalization *v13;
  ATXMicrolocationLocalization *microlocationLocalization;
  uint64_t v15;
  EKEventStore *eventStore;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;
  Boolean keyExistsAndHasValidFormat;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ATXModeCalendarFeaturizer;
  v5 = -[ATXModeCalendarFeaturizer init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    timers = v5->_timers;
    v5->_timers = (NSHashTable *)v6;

    objc_initWeak(&location, v5);
    v8 = objc_alloc(MEMORY[0x1E0D81618]);
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __53__ATXModeCalendarFeaturizer_initWithLocationManager___block_invoke;
    v18[3] = &unk_1E942DA58;
    objc_copyWeak(&v19, &location);
    v11 = objc_msgSend(v8, "initWithQueue:operation:", v9, v18);
    featureUpdateTimer = v5->_featureUpdateTimer;
    v5->_featureUpdateTimer = (_PASSimpleCoalescingTimer *)v11;

    v5->_calendarRefreshCoalesceTimerIsEnabled = 1;
    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    {
      keyExistsAndHasValidFormat = 0;
      if (CFPreferencesGetAppBooleanValue(CFSTR("RemoveCalendarRefreshCoalesce"), (CFStringRef)*MEMORY[0x1E0CF9510], &keyExistsAndHasValidFormat))
      {
        v5->_calendarRefreshCoalesceTimerIsEnabled = 0;
      }
    }
    v13 = objc_alloc_init(ATXMicrolocationLocalization);
    microlocationLocalization = v5->_microlocationLocalization;
    v5->_microlocationLocalization = v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CAA078]), "initWithEKOptions:", 128);
    eventStore = v5->_eventStore;
    v5->_eventStore = (EKEventStore *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __53__ATXModeCalendarFeaturizer_initWithLocationManager___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFeatures");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ATXModeCalendarFeaturizer;
  -[ATXModeCalendarFeaturizer dealloc](&v4, sel_dealloc);
}

- (void)_eventsDidChange:(id)a3
{
  double v3;

  v3 = 120.0;
  if (!self->_calendarRefreshCoalesceTimerIsEnabled)
    v3 = 0.0;
  -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_featureUpdateTimer, "runAfterDelaySeconds:coalescingBehavior:", 1, v3);
}

- (void)_updateFeatures
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  __atxlog_handle_modes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2C00000, v3, OS_LOG_TYPE_DEFAULT, "ATXModeCalendarClassifier: Refreshing due to event change", v6, 2u);
  }

  -[ATXModeCalendarFeaturizer provideFeatures](self, "provideFeatures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeCalendarFeaturizer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featurizer:didUpdateFeatures:", self, v4);

}

+ (BOOL)isCalendarLikelyWork:(id)a3
{
  id v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "localizedCaseInsensitiveContainsString:", CFSTR("work"));

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && objc_msgSend(v7, "supportsLocationDirectorySearches"))
      v6 = objc_msgSend(v3, "isAffectingAvailability");
    else
      v6 = 0;

  }
  return v6;
}

- (void)_setFeaturesForEventsCurrentlyIn:(id)a3 now:(id)a4 featureSet:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__7;
  v56 = __Block_byref_object_dispose__7;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__7;
  v50 = __Block_byref_object_dispose__7;
  v51 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__7;
  v40 = __Block_byref_object_dispose__7;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__7;
  v34 = __Block_byref_object_dispose__7;
  v35 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__ATXModeCalendarFeaturizer__setFeaturesForEventsCurrentlyIn_now_featureSet___block_invoke;
  v21[3] = &unk_1E942E188;
  v21[4] = self;
  v25 = &v52;
  v26 = &v46;
  v27 = &v42;
  v12 = v10;
  v22 = v12;
  v13 = v11;
  v23 = v13;
  v28 = &v36;
  v14 = v9;
  v24 = v14;
  v29 = &v30;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v21);
  objc_msgSend(v13, "setValue:forBinaryFeatureOfType:", -[ATXModeCalendarFeaturizer _shouldStayInWorkModeInBetweenMostRecentWorkEvent:andUpcomingWorkEvent:](self, "_shouldStayInWorkModeInBetweenMostRecentWorkEvent:andUpcomingWorkEvent:", v37[5], v31[5]), 27);
  if (-[ATXModeCalendarFeaturizer _shouldInitiateMicrolocationLocalizationWithMostRecentWorkEvent:upcomingWorkEvent:now:](self, "_shouldInitiateMicrolocationLocalizationWithMostRecentWorkEvent:upcomingWorkEvent:now:", v37[5], v31[5], v12))
  {
    __atxlog_handle_modes();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (id)objc_opt_class();
      NSStringFromSelector(a2);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v37[5], "startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v31[5], "startDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v59 = v16;
      v60 = 2112;
      v61 = v17;
      v62 = 2112;
      v63 = v18;
      v64 = 2112;
      v65 = v19;
      _os_log_impl(&dword_1D2C00000, v15, OS_LOG_TYPE_DEFAULT, "[%@][%@] Last work event just ended at %@, and the next one doesn't start until %@, initiating microlocation localization", buf, 0x2Au);

    }
    -[ATXMicrolocationLocalization initiateLocalization](self->_microlocationLocalization, "initiateLocalization");
  }
  if (v53[5]
    && v47[5]
    && -[ATXModeCalendarFeaturizer _isDate:betweenStartDate:andEndDate:](self, "_isDate:betweenStartDate:andEndDate:", v12))
  {
    objc_msgSend(v13, "setValue:forBinaryFeatureOfType:", 1, 13);
    v20 = *((_BYTE *)v43 + 24) != 0;
  }
  else
  {
    objc_msgSend(v13, "setValue:forBinaryFeatureOfType:", 0, 13);
    v20 = 0;
  }
  objc_msgSend(v13, "setValue:forBinaryFeatureOfType:", v20, 14);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
}

void __77__ATXModeCalendarFeaturizer__setFeaturesForEventsCurrentlyIn_now_featureSet___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
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
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  id *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  uint64_t v38;
  id v39;
  int v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldConsiderEventBasedOnParticipantStatus:", objc_msgSend(v5, "participationStatus")) & 1) != 0)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "earlierDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      objc_msgSend(v5, "startDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v9);
    if (!v8)

    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(v5, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "laterDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      objc_msgSend(v5, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v13);
    if (!v12)

    objc_msgSend(v5, "calendar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) |= objc_msgSend((id)objc_opt_class(), "isCalendarLikelyWork:", v14);
    v15 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v5, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "_isDate:betweenStartDate:andEndDate:", v16, v17, v18))
    {
      v19 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);

      if (v19)
      {
        v20 = (id *)(a1 + 48);
        v21 = 1;
        goto LABEL_19;
      }
    }
    else
    {

    }
    v20 = (id *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 48), "valueForFeatureType:", 26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
LABEL_20:
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
        || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
      {
        goto LABEL_27;
      }
      objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
      v25 = v24;
      objc_msgSend(v5, "endDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceReferenceDate");
      if (v25 > v27 + -120.0)
      {
        v28 = a3 + 1;
        v29 = objc_msgSend(*(id *)(a1 + 56), "count");

        if (v28 >= v29)
          goto LABEL_27;
        objc_msgSend(*(id *)(a1 + 56), "objectAtIndex:", v28);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
        v32 = *(void **)(v31 + 40);
        *(_QWORD *)(v31 + 40) = v30;

        objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
        v34 = v33;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "startDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "timeIntervalSinceReferenceDate");
        v37 = v36;

        if (v34 >= v37)
          goto LABEL_27;
        v38 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v39 = v5;
        v26 = *(void **)(v38 + 40);
        *(_QWORD *)(v38 + 40) = v39;
      }

LABEL_27:
      goto LABEL_28;
    }
    v21 = 0;
LABEL_19:
    objc_msgSend(*v20, "setValue:forBinaryFeatureOfType:", v21, 26);
    goto LABEL_20;
  }
  __atxlog_handle_modes();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v40 = 134217984;
    v41 = objc_msgSend(v5, "participationStatus");
    _os_log_impl(&dword_1D2C00000, v22, OS_LOG_TYPE_DEFAULT, "ATXModeCalendarClassifier: skipping event due to participation status: %lu", (uint8_t *)&v40, 0xCu);
  }

LABEL_28:
}

- (BOOL)_shouldStayInWorkModeInBetweenMostRecentWorkEvent:(id)a3 andUpcomingWorkEvent:(id)a4
{
  BOOL result;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  result = 0;
  if (a3 && a4)
  {
    v6 = a3;
    objc_msgSend(a4, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = v8;
    objc_msgSend(v6, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = v9 - v11;

    return v12 <= 4500.0 && v12 > 0.0;
  }
  return result;
}

- (BOOL)_shouldInitiateMicrolocationLocalizationWithMostRecentWorkEvent:(id)a3 upcomingWorkEvent:(id)a4 now:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;

  v8 = a4;
  v9 = a5;
  v10 = 0;
  if (a3 && v8)
  {
    v11 = a3;
    objc_msgSend(v11, "endDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v11, "endDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:", v15 + 120.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ATXModeCalendarFeaturizer _isDate:betweenStartDate:andEndDate:](self, "_isDate:betweenStartDate:andEndDate:", v9, v12, v16))
    {
      objc_msgSend(v8, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
      v19 = v18;
      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      v10 = v19 - v20 > 1800.0;

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (BOOL)_isDate:(id)a3 betweenStartDate:(id)a4 andEndDate:(id)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;

  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v10 = v9;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v12 = v11;

  if (v10 >= v12)
  {
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v13 = v10 < v14;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_shouldConsiderEventBasedOnParticipantStatus:(int64_t)a3
{
  _BOOL4 v4;
  NSObject *v5;

  if ((unint64_t)a3 >= 8)
  {
    __atxlog_handle_modes();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXModeCalendarFeaturizer _shouldConsiderEventBasedOnParticipantStatus:].cold.1(a3, v5);

    LOBYTE(v4) = 0;
  }
  else
  {
    return (0xC4u >> a3) & 1;
  }
  return v4;
}

- (id)_fetchEligibleEventsForDay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startOfDayForDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, 1, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore predicateForEventsWithStartDate:endDate:calendars:](self->_eventStore, "predicateForEventsWithStartDate:endDate:calendars:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore eventsMatchingPredicate:](self->_eventStore, "eventsMatchingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_pas_filteredArrayWithTest:", &__block_literal_global_8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __55__ATXModeCalendarFeaturizer__fetchEligibleEventsForDay__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v9;
  char isKindOfClass;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 3
    || (objc_msgSend(v2, "isAllDay") & 1) != 0
    || !objc_msgSend(v2, "hasAttendees"))
  {
    goto LABEL_6;
  }
  objc_msgSend(v2, "attendees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 1)
  {

    goto LABEL_9;
  }
  objc_msgSend(v2, "attendees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCurrentUser");

  if ((v6 & 1) == 0)
  {
LABEL_9:
    objc_msgSend(v2, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v7 = isKindOfClass ^ 1;
    goto LABEL_7;
  }
LABEL_6:
  v7 = 0;
LABEL_7:

  return v7 & 1;
}

- (void)_addTimerForDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSHashTable *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "earlierDate:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v4)
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1D2C00000, v7, OS_LOG_TYPE_DEFAULT, "ATXModeCalendarClassifier: Scheduling calendar refresh timer for: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v8 = (void *)MEMORY[0x1E0CF9500];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__ATXModeCalendarFeaturizer__addTimerForDate___block_invoke;
    v11[3] = &unk_1E942DA58;
    objc_copyWeak(&v12, (id *)buf);
    objc_msgSend(v8, "fireAtDate:block:", v4, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_timers;
    objc_sync_enter(v10);
    -[NSHashTable addObject:](self->_timers, "addObject:", v9);
    objc_sync_exit(v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }

}

void __46__ATXModeCalendarFeaturizer__addTimerForDate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    __atxlog_handle_modes();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D2C00000, v2, OS_LOG_TYPE_DEFAULT, "ATXModeCalendarClassifier: Refreshing due to event start / end date passing", v5, 2u);
    }

    objc_msgSend(WeakRetained, "provideFeatures");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "featurizer:didUpdateFeatures:", WeakRetained, v3);

  }
}

- (void)beginListening
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__eventsDidChange_, *MEMORY[0x1E0CA9F88], 0);

}

- (id)provideFeatures
{
  NSHashTable *v3;
  void *v4;
  void *v5;
  ATXModeFeatureSet *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = self->_timers;
  objc_sync_enter(v3);
  -[NSHashTable removeAllObjects](self->_timers, "removeAllObjects");
  objc_sync_exit(v3);

  v4 = (void *)objc_opt_new();
  -[ATXModeCalendarFeaturizer _fetchEligibleEventsForDay](self, "_fetchEligibleEventsForDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(ATXModeFeatureSet);
  -[ATXModeFeatureSet setValue:forBinaryFeatureOfType:](v6, "setValue:forBinaryFeatureOfType:", objc_msgSend(v5, "count") != 0, 12);
  -[ATXModeCalendarFeaturizer _setFeaturesForEventsCurrentlyIn:now:featureSet:](self, "_setFeaturesForEventsCurrentlyIn:now:featureSet:", v5, v4, v6);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "startDate", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          -[ATXModeCalendarFeaturizer _addTimerForDate:](self, "_addTimerForDate:", v12);
        objc_msgSend(v11, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          -[ATXModeCalendarFeaturizer _addTimerForDate:](self, "_addTimerForDate:", v13);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v6;
}

- (ATXModeFeaturizerDelegate)delegate
{
  return (ATXModeFeaturizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)calendarRefreshCoalesceTimerIsEnabled
{
  return self->_calendarRefreshCoalesceTimerIsEnabled;
}

- (void)setCalendarRefreshCoalesceTimerIsEnabled:(BOOL)a3
{
  self->_calendarRefreshCoalesceTimerIsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_microlocationLocalization, 0);
  objc_storeStrong((id *)&self->_featureUpdateTimer, 0);
  objc_storeStrong((id *)&self->_timers, 0);
}

- (void)_shouldConsiderEventBasedOnParticipantStatus:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1D2C00000, a2, OS_LOG_TYPE_FAULT, "ATXModeCalendarClassifier: unknown participation status: %lu", (uint8_t *)&v2, 0xCu);
}

@end
