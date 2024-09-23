@implementation RTEventManager

- (RTEventManager)init
{
  RTTransientObject *v3;
  RTEventManager *v4;

  v3 = -[RTTransientObject initWithCreationBlock:timeout:]([RTTransientObject alloc], "initWithCreationBlock:timeout:", &__block_literal_global_115, 60.0);
  v4 = -[RTEventManager initWithEventStore:](self, "initWithEventStore:", v3);

  return v4;
}

id __22__RTEventManager_init__block_invoke()
{
  return (id)objc_opt_new();
}

- (RTEventManager)initWithEventStore:(id)a3
{
  id v5;
  RTEventManager *v6;
  RTEventManager *v7;
  uint64_t v8;
  RTInvocationDispatcher *v9;
  void *v10;
  uint64_t v11;
  RTInvocationDispatcher *invocationDispatcher;
  RTEventManager *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)RTEventManager;
    v6 = -[RTNotifier init](&v16, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong(&v6->_eventStore, a3);
      v8 = objc_opt_class();
      if (v8 == objc_opt_class())
        objc_msgSend(v5, "setTransientObjectDelegate:", v7);
      v9 = [RTInvocationDispatcher alloc];
      -[RTNotifier queue](v7, "queue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[RTInvocationDispatcher initWithQueue:](v9, "initWithQueue:", v10);
      invocationDispatcher = v7->_invocationDispatcher;
      v7->_invocationDispatcher = (RTInvocationDispatcher *)v11;

    }
    self = v7;
    v13 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTEventManager initWithEventStore:]";
      v19 = 1024;
      v20 = 123;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventStore (in %s:%d)", buf, 0x12u);
    }

    v13 = 0;
  }

  return v13;
}

- (void)_shutdownWithHandler:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)transientObjectDidCreateBackingObject:(id)a3
{
  id v4;
  id eventStore;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (objc_msgSend(v4, "isEqual:", self->_eventStore))
  {
    eventStore = self->_eventStore;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__RTEventManager_transientObjectDidCreateBackingObject___block_invoke;
    v6[3] = &unk_1E92A4DA8;
    objc_copyWeak(&v7, &location);
    objc_msgSend(eventStore, "requestAccessToEntityType:completion:", 0, v6);
    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);

}

void __56__RTEventManager_transientObjectDidCreateBackingObject___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  void *v11;
  char v12;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__RTEventManager_transientObjectDidCreateBackingObject___block_invoke_2;
    block[3] = &unk_1E9297D30;
    v12 = a2;
    v10 = v5;
    v11 = v7;
    dispatch_async(v8, block);

  }
}

void __56__RTEventManager_transientObjectDidCreateBackingObject___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityEvent);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "access to event entity type granted, %@, error, %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setAccessToEventsGranted:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "invocationDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "invocationsPending");

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "invocationDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dispatchPendingInvocations");

  }
}

- (void)transientObjectDidReleaseBackingObject:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTEventManager *v9;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__RTEventManager_transientObjectDidReleaseBackingObject___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __57__RTEventManager_transientObjectDidReleaseBackingObject___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 32) = 0;
  return result;
}

- (id)eventsBetweenStartDate:(id)a3 andEndDate:(id)a4 calendars:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[RTEventManager accessToEventsGranted](self, "accessToEventsGranted"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315394;
      v22 = "-[RTEventManager eventsBetweenStartDate:andEndDate:calendars:]";
      v23 = 1024;
      LODWORD(v24) = 189;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "no access to event store (in %s:%d)", (uint8_t *)&v21, 0x12u);
    }

  }
  v12 = 0;
  if (v8 && v9)
  {
    -[RTEventManager eventStore](self, "eventStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateForEventsWithStartDate:endDate:calendars:", v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTEventManager eventStore](self, "eventStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "eventsMatchingPredicate:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityEvent);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v18 = objc_msgSend(v12, "count");
      objc_msgSend(v8, "stringFromDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 134218498;
      v22 = (const char *)v18;
      v23 = 2112;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "%lu events between start date, %@, and end date, %@", (uint8_t *)&v21, 0x20u);

    }
  }

  return v12;
}

- (id)eventsBetweenStartDate:(id)a3 andEndDate:(id)a4
{
  return -[RTEventManager eventsBetweenStartDate:andEndDate:calendars:](self, "eventsBetweenStartDate:andEndDate:calendars:", a3, a4, 0);
}

- (id)eventsSortedByEndDateBetweenStartDate:(id)a3 andEndDate:(id)a4
{
  void *v4;
  void *v5;

  -[RTEventManager eventsBetweenStartDate:andEndDate:](self, "eventsBetweenStartDate:andEndDate:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_49);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __67__RTEventManager_eventsSortedByEndDateBetweenStartDate_andEndDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)eventsSortedByStartDateBetweenStartDate:(id)a3 andEndDate:(id)a4
{
  void *v4;
  void *v5;

  -[RTEventManager eventsBetweenStartDate:andEndDate:](self, "eventsBetweenStartDate:andEndDate:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_50_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __69__RTEventManager_eventsSortedByStartDateBetweenStartDate_andEndDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareStartDateWithEvent:");
}

- (id)eventsSortedByStartDateBetweenStartDate:(id)a3 andEndDate:(id)a4 calendars:(id)a5
{
  void *v5;
  void *v6;

  -[RTEventManager eventsBetweenStartDate:andEndDate:calendars:](self, "eventsBetweenStartDate:andEndDate:calendars:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_51);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __79__RTEventManager_eventsSortedByStartDateBetweenStartDate_andEndDate_calendars___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareStartDateWithEvent:");
}

- (id)calendars
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!-[RTEventManager accessToEventsGranted](self, "accessToEventsGranted"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "-[RTEventManager calendars]";
      v9 = 1024;
      v10 = 247;
      _os_log_error_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_ERROR, "no access to event store (in %s:%d)", (uint8_t *)&v7, 0x12u);
    }

  }
  -[RTEventManager eventStore](self, "eventStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarsForEntityType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)calendarsExcludingSuggested
{
  void *v2;
  void *v3;
  void *v4;

  -[RTEventManager calendars](self, "calendars");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_54_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __45__RTEventManager_calendarsExcludingSuggested__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSuggestedEventCalendar") ^ 1;
}

- (void)_fetchCurrentlyInEventWithHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  SEL v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  const __CFString *v25;
  _BYTE v26[24];
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (-[RTEventManager accessToEventsGranted](self, "accessToEventsGranted"))
    {
      *(_QWORD *)v26 = 0;
      *(_QWORD *)&v26[8] = v26;
      *(_QWORD *)&v26[16] = 0x2020000000;
      v27 = 0;
      objc_msgSend(MEMORY[0x1E0C99D68], "startOfDay");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "endOfDay");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTEventManager eventsSortedByStartDateBetweenStartDate:andEndDate:](self, "eventsSortedByStartDateBetweenStartDate:andEndDate:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __52__RTEventManager__fetchCurrentlyInEventWithHandler___block_invoke_62;
      v18[3] = &unk_1E929CB08;
      v18[4] = v26;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v18);

      _rt_log_facility_get_os_log(RTLogFacilityEvent);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        if (*(_BYTE *)(*(_QWORD *)&v26[8] + 24))
          v10 = CFSTR("YES");
        else
          v10 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v25 = v10;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "Currently in event, %@", buf, 0xCu);
      }

      (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, *(unsigned __int8 *)(*(_QWORD *)&v26[8] + 24), 0);
      _Block_object_dispose(v26, 8);
    }
    else
    {
      -[RTEventManager invocationDispatcher](self, "invocationDispatcher");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __52__RTEventManager__fetchCurrentlyInEventWithHandler___block_invoke;
      v22[3] = &unk_1E9297650;
      v22[4] = self;
      v23 = v5;
      v19[0] = v13;
      v19[1] = 3221225472;
      v19[2] = __52__RTEventManager__fetchCurrentlyInEventWithHandler___block_invoke_2;
      v19[3] = &unk_1E9298E88;
      v19[4] = self;
      v21 = a2;
      v20 = v23;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "enqueueBlock:failureBlock:description:", v22, v19, CFSTR("%@-%@"), v15, v16);

      -[RTEventManager eventStore](self, "eventStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "touch");

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v26 = 136315394;
      *(_QWORD *)&v26[4] = "-[RTEventManager _fetchCurrentlyInEventWithHandler:]";
      *(_WORD *)&v26[12] = 1024;
      *(_DWORD *)&v26[14] = 266;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v26, 0x12u);
    }

  }
}

uint64_t __52__RTEventManager__fetchCurrentlyInEventWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCurrentlyInEventWithHandler:", *(_QWORD *)(a1 + 40));
}

void __52__RTEventManager__fetchCurrentlyInEventWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, %@, failed invoking pending invocation"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityEvent);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 40);
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0D18598];
  v13 = *MEMORY[0x1E0CB2D50];
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v12);

}

void __52__RTEventManager__fetchCurrentlyInEventWithHandler___block_invoke_62(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "laterDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqual:", v6) & 1) != 0)
  {
    objc_msgSend(v13, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "laterDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (v12)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {

  }
}

- (void)fetchCurrentlyInEventWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__RTEventManager_fetchCurrentlyInEventWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __51__RTEventManager_fetchCurrentlyInEventWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchCurrentlyInEventWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchNextFreeStartDateWithHandler:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  id v22;
  SEL v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    if (-[RTEventManager accessToEventsGranted](self, "accessToEventsGranted"))
    {
      *(_QWORD *)v28 = 0;
      *(_QWORD *)&v28[8] = v28;
      *(_QWORD *)&v28[16] = 0x3032000000;
      v29 = __Block_byref_object_copy__156;
      v30 = __Block_byref_object_dispose__156;
      v31 = 0;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(*(_QWORD *)&v28[8] + 40);
      *(_QWORD *)(*(_QWORD *)&v28[8] + 40) = v6;

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "endOfDay");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTEventManager eventsSortedByStartDateBetweenStartDate:andEndDate:](self, "eventsSortedByStartDateBetweenStartDate:andEndDate:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __53__RTEventManager__fetchNextFreeStartDateWithHandler___block_invoke_64;
      v20[3] = &unk_1E92A4E90;
      v20[4] = v28;
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v20);

      _rt_log_facility_get_os_log(RTLogFacilityEvent);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(*(_QWORD *)&v28[8] + 40), "stringFromDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v12;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "next free start date, %@", buf, 0xCu);

      }
      (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, *(_QWORD *)(*(_QWORD *)&v28[8] + 40), 0);
      _Block_object_dispose(v28, 8);

    }
    else
    {
      -[RTEventManager invocationDispatcher](self, "invocationDispatcher");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __53__RTEventManager__fetchNextFreeStartDateWithHandler___block_invoke;
      v24[3] = &unk_1E9297650;
      v24[4] = self;
      v25 = v5;
      v21[0] = v15;
      v21[1] = 3221225472;
      v21[2] = __53__RTEventManager__fetchNextFreeStartDateWithHandler___block_invoke_2;
      v21[3] = &unk_1E9298E88;
      v21[4] = self;
      v23 = a2;
      v22 = v25;
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "enqueueBlock:failureBlock:description:", v24, v21, CFSTR("%@-%@"), v17, v18);

      -[RTEventManager eventStore](self, "eventStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "touch");

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v28 = 136315394;
      *(_QWORD *)&v28[4] = "-[RTEventManager _fetchNextFreeStartDateWithHandler:]";
      *(_WORD *)&v28[12] = 1024;
      *(_DWORD *)&v28[14] = 319;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", v28, 0x12u);
    }

  }
}

uint64_t __53__RTEventManager__fetchNextFreeStartDateWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchNextFreeStartDateWithHandler:", *(_QWORD *)(a1 + 40));
}

void __53__RTEventManager__fetchNextFreeStartDateWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, %@, failed invoking pending invocation"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityEvent);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 40);
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0D18598];
  v13 = *MEMORY[0x1E0CB2D50];
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v12);

}

void __53__RTEventManager__fetchNextFreeStartDateWithHandler___block_invoke_64(uint64_t a1, void *a2, uint64_t a3)
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
  uint64_t v17;
  id v18;

  v5 = a2;
  if (!a3)
  {
    v18 = v5;
    goto LABEL_9;
  }
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v6)
  {
    v18 = v5;
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "compare:", v7))
    {

      v5 = v18;
      goto LABEL_9;
    }
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v18, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "earlierDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v11)
    {

LABEL_10:
      v5 = v18;
      goto LABEL_11;
    }
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(v18, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "laterDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v18;
    if (v14 == v15)
    {
LABEL_9:
      objc_msgSend(v5, "endDate");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)fetchNextFreeStartDateWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__RTEventManager_fetchNextFreeStartDateWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __52__RTEventManager_fetchNextFreeStartDateWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchNextFreeStartDateWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchLastEventEndDateWithHandler:(id)a3
{
  void (**v5)(id, void *, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  void (**v21)(id, void *, _QWORD);
  SEL v22;
  _QWORD v23[5];
  void (**v24)(id, void *, _QWORD);
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *, _QWORD))a3;
  if (v5)
  {
    if (-[RTEventManager accessToEventsGranted](self, "accessToEventsGranted"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "endOfDay");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTEventManager eventsSortedByEndDateBetweenStartDate:andEndDate:](self, "eventsSortedByEndDateBetweenStartDate:andEndDate:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "endDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityEvent);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "stringFromDate");
        v12 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v12;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "last event end date, %@", buf, 0xCu);

      }
      v5[2](v5, v10, 0);

    }
    else
    {
      -[RTEventManager invocationDispatcher](self, "invocationDispatcher");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __52__RTEventManager__fetchLastEventEndDateWithHandler___block_invoke;
      v23[3] = &unk_1E9297650;
      v23[4] = self;
      v24 = v5;
      v20[0] = v15;
      v20[1] = 3221225472;
      v20[2] = __52__RTEventManager__fetchLastEventEndDateWithHandler___block_invoke_2;
      v20[3] = &unk_1E9298E88;
      v20[4] = self;
      v22 = a2;
      v21 = v24;
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "enqueueBlock:failureBlock:description:", v23, v20, CFSTR("%@-%@"), v17, v18);

      -[RTEventManager eventStore](self, "eventStore");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "touch");

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTEventManager _fetchLastEventEndDateWithHandler:]";
      v27 = 1024;
      v28 = 372;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

uint64_t __52__RTEventManager__fetchLastEventEndDateWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLastEventEndDateWithHandler:", *(_QWORD *)(a1 + 40));
}

void __52__RTEventManager__fetchLastEventEndDateWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, %@, failed invoking pending invocation"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityEvent);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 40);
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0D18598];
  v13 = *MEMORY[0x1E0CB2D50];
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v12);

}

- (void)fetchLastEventEndDateWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__RTEventManager_fetchLastEventEndDateWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __51__RTEventManager_fetchLastEventEndDateWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchLastEventEndDateWithHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_fetchFreeDateIntervalsBetweenStartDate:(id)a3 endDate:(id)a4 filterAllDayEvents:(BOOL)a5 filterFreeTimeEvents:(BOOL)a6 handler:(id)a7
{
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  void (**v37)(id, _QWORD, void *);
  BOOL v38;
  BOOL v39;
  _QWORD v40[5];
  void (**v41)(id, _QWORD, void *);
  SEL v42;
  _QWORD v43[5];
  id v44;
  id v45;
  void (**v46)(id, _QWORD, void *);
  BOOL v47;
  BOOL v48;
  uint64_t v49;
  const __CFString *v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = (void (**)(id, _QWORD, void *))a7;
  if (v15)
  {
    objc_msgSend(v13, "laterDate:", v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16 == v13)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0D18598];
      v49 = *MEMORY[0x1E0CB2D50];
      v50 = CFSTR("Requires start date to be before end date.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 7, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, 0, v22);

LABEL_16:
      goto LABEL_17;
    }
    if (-[RTEventManager accessToEventsGranted](self, "accessToEventsGranted"))
    {
      if (v13)
      {
        v17 = v13;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v17 = (id)objc_claimAutoreleasedReturnValue();
      }
      v29 = v17;
      if (v14)
      {
        v30 = v14;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v30 = (id)objc_claimAutoreleasedReturnValue();
      }
      v31 = v30;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke_68;
      v34[3] = &unk_1E92A4F40;
      v38 = a5;
      v39 = a6;
      v35 = v29;
      v36 = v30;
      v37 = v15;
      v32 = v31;
      v21 = v29;
      v33 = (void *)MEMORY[0x1D8232094](v34);
      -[RTEventManager _fetchEventsBetweenStartDate:endDate:handler:](self, "_fetchEventsBetweenStartDate:endDate:handler:", v21, v32, v33);

      goto LABEL_16;
    }
    -[RTEventManager invocationDispatcher](self, "invocationDispatcher");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke;
    v43[3] = &unk_1E92A4EB8;
    v43[4] = self;
    v44 = v13;
    v45 = v14;
    v47 = a5;
    v48 = a6;
    v46 = v15;
    v40[0] = v24;
    v40[1] = 3221225472;
    v40[2] = __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke_2;
    v40[3] = &unk_1E9298E88;
    v40[4] = self;
    v42 = a2;
    v41 = v46;
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "enqueueBlock:failureBlock:description:", v43, v40, CFSTR("%@-%@"), v26, v27);

    -[RTEventManager eventStore](self, "eventStore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "touch");

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v52 = "-[RTEventManager _fetchFreeDateIntervalsBetweenStartDate:endDate:filterAllDayEvents:filterFreeTimeEvents:handler:]";
      v53 = 1024;
      v54 = 428;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_17:

}

uint64_t __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchFreeDateIntervalsBetweenStartDate:endDate:filterAllDayEvents:filterFreeTimeEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 56));
}

void __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, %@, failed invoking pending invocation"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityEvent);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 40);
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0D18598];
  v13 = *MEMORY[0x1E0CB2D50];
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v12);

}

void __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke_68(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v7;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_71);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (*(_BYTE *)(a1 + 57))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_72_1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredArrayUsingPredicate:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  objc_msgSend(MEMORY[0x1E0CB3588], "dateIntervalFromEvents:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3588], "invertDateIntervals:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB3588], "dateIntervals:intersectingDateInterval:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityAction);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = 138412290;
    v18 = v15;
    _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "free date intervals, %@", (uint8_t *)&v17, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke_2_69(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAllDay") ^ 1;
}

BOOL __114__RTEventManager__fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "availability") != -1 && objc_msgSend(v2, "availability") != 1;

  return v3;
}

- (void)fetchFreeDateIntervalsBetweenStartDate:(id)a3 endDate:(id)a4 filterAllDayEvents:(BOOL)a5 filterFreeTimeEvents:(BOOL)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  BOOL v23;
  BOOL v24;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  -[RTNotifier queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __113__RTEventManager_fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke;
  block[3] = &unk_1E92A4EB8;
  block[4] = self;
  v20 = v12;
  v23 = a5;
  v24 = a6;
  v21 = v13;
  v22 = v14;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_async(v15, block);

}

uint64_t __113__RTEventManager_fetchFreeDateIntervalsBetweenStartDate_endDate_filterAllDayEvents_filterFreeTimeEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchFreeDateIntervalsBetweenStartDate:endDate:filterAllDayEvents:filterFreeTimeEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 56));
}

- (void)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withHandler:(id)a5
{
  -[RTEventManager fetchEventsBetweenStartDate:andEndDate:includeSuggestions:withHandler:](self, "fetchEventsBetweenStartDate:andEndDate:includeSuggestions:withHandler:", a3, a4, 1, a5);
}

- (void)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 includeSuggestions:(BOOL)a5 withHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[RTNotifier queue](self, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__RTEventManager_fetchEventsBetweenStartDate_andEndDate_includeSuggestions_withHandler___block_invoke;
  v16[3] = &unk_1E9297EB8;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  dispatch_async(v12, v16);

}

uint64_t __88__RTEventManager_fetchEventsBetweenStartDate_andEndDate_includeSuggestions_withHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchEventsBetweenStartDate:andEndDate:includeSuggestions:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 56));
}

- (void)_fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 includeSuggestions:(BOOL)a5 withHandler:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  void (**v29)(id, _QWORD, void *);
  SEL v30;
  _QWORD v31[5];
  id v32;
  id v33;
  void (**v34)(id, _QWORD, void *);
  BOOL v35;
  uint64_t v36;
  const __CFString *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, _QWORD, void *))a6;
  if (v13)
  {
    objc_msgSend(v11, "laterDate:", v12);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 == v11)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D18598];
      v36 = *MEMORY[0x1E0CB2D50];
      v37 = CFSTR("Requires start date to be before end date.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 7, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2](v13, 0, v20);

    }
    else if (-[RTEventManager accessToEventsGranted](self, "accessToEventsGranted"))
    {
      if (a5)
      {
        v15 = 0;
      }
      else
      {
        -[RTEventManager calendarsExcludingSuggested](self, "calendarsExcludingSuggested");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[RTEventManager eventsBetweenStartDate:andEndDate:calendars:](self, "eventsBetweenStartDate:andEndDate:calendars:", v11, v12, v15);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v13)[2](v13, v27, 0);

    }
    else
    {
      -[RTEventManager invocationDispatcher](self, "invocationDispatcher");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __89__RTEventManager__fetchEventsBetweenStartDate_andEndDate_includeSuggestions_withHandler___block_invoke;
      v31[3] = &unk_1E9298FA0;
      v31[4] = self;
      v32 = v11;
      v33 = v12;
      v35 = a5;
      v34 = v13;
      v28[0] = v22;
      v28[1] = 3221225472;
      v28[2] = __89__RTEventManager__fetchEventsBetweenStartDate_andEndDate_includeSuggestions_withHandler___block_invoke_2;
      v28[3] = &unk_1E9298E88;
      v28[4] = self;
      v30 = a2;
      v29 = v34;
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "enqueueBlock:failureBlock:description:", v31, v28, CFSTR("%@-%@"), v24, v25);

      -[RTEventManager eventStore](self, "eventStore");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "touch");

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[RTEventManager _fetchEventsBetweenStartDate:andEndDate:includeSuggestions:withHandler:]";
      v40 = 1024;
      v41 = 556;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

uint64_t __89__RTEventManager__fetchEventsBetweenStartDate_andEndDate_includeSuggestions_withHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchEventsBetweenStartDate:andEndDate:includeSuggestions:withHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

void __89__RTEventManager__fetchEventsBetweenStartDate_andEndDate_includeSuggestions_withHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, %@, failed invoking pending invocation"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityEvent);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 40);
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0D18598];
  v13 = *MEMORY[0x1E0CB2D50];
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v12);

}

- (void)_fetchEventsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, void *);
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  RTCalendarEvent *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString **v30;
  uint64_t *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  void (**v40)(id, _QWORD, void *);
  id v41;
  id v42;
  id obj;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  RTCalendarEvent *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  void (**v56)(id, _QWORD, void *);
  SEL v57;
  _QWORD v58[5];
  id v59;
  id v60;
  void (**v61)(id, _QWORD, void *);
  _BYTE v62[128];
  uint64_t v63;
  const __CFString *v64;
  uint64_t v65;
  _QWORD v66[3];

  v66[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  if (!v11)
    goto LABEL_19;
  if (!v9)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0D18598];
    v65 = *MEMORY[0x1E0CB2D50];
    v66[0] = CFSTR("requires a valid startDate.");
    v29 = (void *)MEMORY[0x1E0C99D80];
    v30 = (const __CFString **)v66;
    v31 = &v65;
LABEL_17:
    objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 0, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, 0, v33);

    goto LABEL_19;
  }
  if (!v10)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0D18598];
    v63 = *MEMORY[0x1E0CB2D50];
    v64 = CFSTR("requires a valid endDate.");
    v29 = (void *)MEMORY[0x1E0C99D80];
    v30 = &v64;
    v31 = &v63;
    goto LABEL_17;
  }
  if (-[RTEventManager accessToEventsGranted](self, "accessToEventsGranted"))
  {
    v40 = v11;
    v41 = v10;
    v42 = v9;
    -[RTEventManager eventsBetweenStartDate:andEndDate:](self, "eventsBetweenStartDate:andEndDate:", v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = v12;
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    if (v46)
    {
      v45 = *(_QWORD *)v52;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v52 != v45)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v13);
          v15 = objc_alloc(MEMORY[0x1E0D183B0]);
          objc_msgSend(v14, "structuredLocation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "geoLocation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)objc_msgSend(v15, "initWithCLLocation:", v17);

          v49 = [RTCalendarEvent alloc];
          objc_msgSend(v14, "eventIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v14, "isAllDay");
          objc_msgSend(v14, "startDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "endDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v14, "participantStatus");
          v21 = objc_msgSend(v14, "availability");
          objc_msgSend(v14, "structuredLocation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "title");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "structuredLocation");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "mapKitHandle");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[RTCalendarEvent initWithEventIdentifier:allDay:startDate:endDate:participantStatus:availability:location:locationTitle:locationMapItemHandle:](v49, "initWithEventIdentifier:allDay:startDate:endDate:participantStatus:availability:location:locationTitle:locationMapItemHandle:", v18, v48, v19, v20, v47, v21, v50, v23, v25);

          if (v26)
            objc_msgSend(v44, "addObject:", v26);

          ++v13;
        }
        while (v46 != v13);
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      }
      while (v46);
    }

    v11 = v40;
    ((void (**)(id, void *, void *))v40)[2](v40, v44, 0);

    v10 = v41;
    v9 = v42;
  }
  else
  {
    -[RTEventManager invocationDispatcher](self, "invocationDispatcher");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __63__RTEventManager__fetchEventsBetweenStartDate_endDate_handler___block_invoke;
    v58[3] = &unk_1E9297EB8;
    v58[4] = self;
    v59 = v9;
    v60 = v10;
    v61 = v11;
    v55[0] = v35;
    v55[1] = 3221225472;
    v55[2] = __63__RTEventManager__fetchEventsBetweenStartDate_endDate_handler___block_invoke_2;
    v55[3] = &unk_1E9298E88;
    v55[4] = self;
    v57 = a2;
    v56 = v61;
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "enqueueBlock:failureBlock:description:", v58, v55, CFSTR("%@-%@"), v37, v38);

    -[RTEventManager eventStore](self, "eventStore");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "touch");

  }
LABEL_19:

}

uint64_t __63__RTEventManager__fetchEventsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchEventsBetweenStartDate:endDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __63__RTEventManager__fetchEventsBetweenStartDate_endDate_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, %@, failed invoking pending invocation"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityEvent);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 40);
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0D18598];
  v13 = *MEMORY[0x1E0CB2D50];
  v14 = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v12);

}

- (void)fetchEventsBetweenStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__RTEventManager_fetchEventsBetweenStartDate_endDate_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __62__RTEventManager_fetchEventsBetweenStartDate_endDate_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchEventsBetweenStartDate:endDate:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (RTInvocationDispatcher)invocationDispatcher
{
  return self->_invocationDispatcher;
}

- (void)setInvocationDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_invocationDispatcher, a3);
}

- (id)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
  objc_storeStrong(&self->_eventStore, a3);
}

- (BOOL)accessToEventsGranted
{
  return self->_accessToEventsGranted;
}

- (void)setAccessToEventsGranted:(BOOL)a3
{
  self->_accessToEventsGranted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_invocationDispatcher, 0);
}

@end
