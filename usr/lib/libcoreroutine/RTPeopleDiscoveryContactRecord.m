@implementation RTPeopleDiscoveryContactRecord

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *contactRecord;
  id v5;

  contactRecord = self->_contactRecord;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactRecord, CFSTR("ContactRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ongoingProximityEvent, CFSTR("OngoingProximityEvent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleStartDate, CFSTR("BundleStartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contactScores, CFSTR("ContactScores"));

}

- (void)checkAndCloseProximityEventsIfNeeded:(id)a3
{
  id v5;
  NSDate *bundleStartDate;
  void *v7;
  double v8;
  double v9;
  double maxBundleDuration;
  double v11;
  double v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: referenceDate", (uint8_t *)&v16, 2u);
    }
    goto LABEL_8;
  }
  bundleStartDate = self->_bundleStartDate;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(bundleStartDate) = -[NSDate isEqualToDate:](bundleStartDate, "isEqualToDate:", v7);

  if ((_DWORD)bundleStartDate)
  {
LABEL_15:
    objc_storeStrong((id *)&self->_bundleStartDate, a3);
    goto LABEL_16;
  }
  objc_msgSend(v5, "timeIntervalSinceDate:", self->_bundleStartDate);
  v9 = v8;
  maxBundleDuration = (double)self->_maxBundleDuration;
  if (v8 >= maxBundleDuration)
  {
    if (v8 >= (double)self->_maxBackstopDuration)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 134217984;
        v17 = v9;
        _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEFAULT, "skip closing the proximity event due to stale records, duration %f", (uint8_t *)&v16, 0xCu);
      }

    }
    else
    {
      -[RTPeopleDiscoveryContactRecord closeProximityEvents:bundleEndDate:contactRecords:ongoingProximityEvent:](self, "closeProximityEvents:bundleEndDate:contactRecords:ongoingProximityEvent:", self->_bundleStartDate, v5, self->_contactRecord, self->_ongoingProximityEvent);
    }
    -[RTPeopleDiscoveryContactRecord contactRecord](self, "contactRecord");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeAllObjects");

    -[RTPeopleDiscoveryContactRecord setOngoingProximityEvent:](self, "setOngoingProximityEvent:", 0);
    goto LABEL_15;
  }
  objc_msgSend(v5, "timeIntervalSinceDate:", self->_bundleStartDate);
  v12 = v11;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v16 = 134217984;
    v17 = maxBundleDuration - v12;
    _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "not enough time has passed since last proximity bundle, remainingSeconds %f", (uint8_t *)&v16, 0xCu);
  }
LABEL_8:

LABEL_16:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleDiscoveryContactRecord)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_defaultsManager_);
}

- (RTPeopleDiscoveryContactRecord)initWithQueue:(id)a3
{
  return -[RTPeopleDiscoveryContactRecord initWithQueue:minObservationDuration:maxSeparationDuration:maxBackstopDuration:maxBundleDuration:](self, "initWithQueue:minObservationDuration:maxSeparationDuration:maxBackstopDuration:maxBundleDuration:", a3, 900, 1800, 28800, 3600);
}

- (RTPeopleDiscoveryContactRecord)initWithQueue:(id)a3 defaultsManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  RTPeopleDiscoveryContactRecord *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsPeopleDiscoveryProviderMinimumObservationDuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = (unint64_t)(double)objc_msgSend(v7, "integerValue");
  else
    v8 = 900;
  objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsPeopleDiscoveryProviderMaximumSeparationDuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = (unint64_t)(double)objc_msgSend(v9, "integerValue");
  else
    v10 = 1800;
  objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsPeopleDiscoveryProviderMaximumBackstopDuration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = (unint64_t)(double)objc_msgSend(v11, "integerValue");
  else
    v12 = 28800;
  objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsPeopleDiscoveryProviderProximityBundleDuration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = (unint64_t)(double)objc_msgSend(v13, "integerValue");
  else
    v14 = 3600;
  v15 = -[RTPeopleDiscoveryContactRecord initWithQueue:minObservationDuration:maxSeparationDuration:maxBackstopDuration:maxBundleDuration:](self, "initWithQueue:minObservationDuration:maxSeparationDuration:maxBackstopDuration:maxBundleDuration:", v5, v8, v10, v12, v14);

  return v15;
}

- (RTPeopleDiscoveryContactRecord)initWithQueue:(id)a3 minObservationDuration:(unint64_t)a4 maxSeparationDuration:(unint64_t)a5 maxBackstopDuration:(unint64_t)a6 maxBundleDuration:(unint64_t)a7
{
  RTPeopleDiscoveryContactRecord *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSDate *bundleStartDate;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)RTPeopleDiscoveryContactRecord;
  v11 = -[RTPeopleDiscoveryContactRecord init](&v18, sel_init, a3);
  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[RTPeopleDiscoveryContactRecord setContactRecord:](v11, "setContactRecord:", v12);

    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[RTPeopleDiscoveryContactRecord setContactScores:](v11, "setContactScores:", v13);

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v14 = objc_claimAutoreleasedReturnValue();
    bundleStartDate = v11->_bundleStartDate;
    v11->_bundleStartDate = (NSDate *)v14;

    -[RTPeopleDiscoveryContactRecord setMinObservationDuration:](v11, "setMinObservationDuration:", a4);
    -[RTPeopleDiscoveryContactRecord setMaxSeparationDuration:](v11, "setMaxSeparationDuration:", a5);
    -[RTPeopleDiscoveryContactRecord setMaxBackstopDuration:](v11, "setMaxBackstopDuration:", a6);
    -[RTPeopleDiscoveryContactRecord setMaxBundleDuration:](v11, "setMaxBundleDuration:", a7);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPeopleDiscoveryContactRecord setObservers:](v11, "setObservers:", v16);

  }
  return v11;
}

- (void)updateContactRecordOnAdvertisementReceived:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDate *v9;
  NSDate *v10;
  NSObject *v11;
  NSDate *bundleStartDate;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "contactID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "scanDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "compare:", self->_bundleStartDate);

      objc_msgSend(v5, "scanDate");
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 == -1)
      {
        bundleStartDate = self->_bundleStartDate;
        self->_bundleStartDate = v9;
        v10 = bundleStartDate;
      }
      else
      {
        -[RTPeopleDiscoveryContactRecord checkAndCloseProximityEventsIfNeeded:](self, "checkAndCloseProximityEventsIfNeeded:", v9);
      }

      -[RTPeopleDiscoveryContactRecord contactRecord](self, "contactRecord");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contactID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v11 = objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412290;
        v24 = v16;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryContactRecord receive advertisement, %@", (uint8_t *)&v23, 0xCu);

      }
      if (v11)
      {
        objc_msgSend(v5, "scanDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject latestAdvertisementDate](v11, "latestAdvertisementDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceDate:", v18);
        v20 = v19;
        v21 = (double)-[RTPeopleDiscoveryContactRecord maxSeparationDuration](self, "maxSeparationDuration");

        if (v20 >= v21)
        {
          objc_msgSend(v5, "scanDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject closeInteractionSession:](v11, "closeInteractionSession:", v22);

        }
        else
        {
          -[NSObject updateSingleContactRecordOnAdvReceived:](v11, "updateSingleContactRecordOnAdvReceived:", v5);
        }
      }
      else
      {
        -[RTPeopleDiscoveryContactRecord createSingleContactRecord:](self, "createSingleContactRecord:", v5);
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v23) = 0;
        _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "advertisement is not associated with a contactID", (uint8_t *)&v23, 2u);
      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: advertisement", (uint8_t *)&v23, 2u);
    }
  }

}

- (id)generateRealtimeProximityEventFromDate:(id)a3 endDate:(id)a4 referenceDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v22;
  _BYTE buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      v19 = (void *)MEMORY[0x1E0C9AA60];
LABEL_15:

      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: startDate";
LABEL_18:
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_11;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: endDate";
    goto LABEL_18;
  }
  if (objc_msgSend(v9, "compare:", self->_bundleStartDate) == 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "getFormattedDateString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryContactRecord generating real-time bundle, referenceDate, %@", buf, 0xCu);

    }
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E932C910);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E932C928);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E932C940);
    *(_QWORD *)buf = 0;
    objc_msgSend(v10, "timeIntervalSinceDate:", self->_bundleStartDate);
    -[RTPeopleDiscoveryContactRecord generateProximityEventScores:socialScore:contactRecords:combinedFrequencyScores:combinedRecencyScores:combinedSignificanceScores:](self, "generateProximityEventScores:socialScore:contactRecords:combinedFrequencyScores:combinedRecencyScores:combinedSignificanceScores:", buf, self->_contactRecord, v13, v14, v15);
    v16 = objc_alloc(MEMORY[0x1E0D18458]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithEventID:startDate:endDate:relationship:socialScore:combinedFrequencyScores:combinedRecencyScores:combinedSignificanceScores:", v17, self->_bundleStartDate, 0, 0, v13, v14, *(double *)buf, v15);

    if (v18)
    {
      objc_storeStrong((id *)&self->_ongoingProximityEvent, v18);
      v22 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0C9AA60];
    }

    goto LABEL_15;
  }
  v19 = (void *)MEMORY[0x1E0C9AA60];
LABEL_16:

  return v19;
}

- (id)queryRealTimeEventsByEventIDs:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[16];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (self->_ongoingProximityEvent)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryContactRecord querying real-time events by eventIDs", buf, 2u);
      }

      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
            v13 = (void *)MEMORY[0x1D8231EA8](v8);
            -[RTProximityEvent eventID](self->_ongoingProximityEvent, "eventID", (_QWORD)v17);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v12) = objc_msgSend(v12, "isEqual:", v14);

            if ((_DWORD)v12)
              objc_msgSend(v6, "addObject:", self->_ongoingProximityEvent);
            objc_autoreleasePoolPop(v13);
            ++v11;
          }
          while (v9 != v11);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
          v9 = v8;
        }
        while (v8);
      }

    }
    else
    {
      v6 = (id)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventIDs", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)queryContactScoresWithContactIDs:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[16];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "#RTPeopleDiscoveryContactRecord querying contact scores by contactIDs", buf, 2u);
    }

    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1D8231EA8](v8);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_contactScores, "objectForKeyedSubscript:", v12, (_QWORD)v22);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_contactScores, "objectForKeyedSubscript:", v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v15);

          }
          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        v9 = v8;
      }
      while (v8);
    }

    if (objc_msgSend(v7, "count") == 1
      && (objc_msgSend(v7, "objectAtIndexedSubscript:", 0),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("ALL")),
          v16,
          v17))
    {
      -[NSMutableDictionary allValues](self->_contactScores, "allValues");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = v6;
    }
    v19 = v18;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactIDs", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)getLatestAdvertisementDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_contactRecord, "objectForKeyedSubscript:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "latestAdvertisementDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

    return v5;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactID", v8, 2u);
    }

    return 0;
  }
}

- (id)getFirstObservationDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_contactRecord, "objectForKeyedSubscript:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "firstObservation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

    return v5;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactID", v8, 2u);
    }

    return 0;
  }
}

- (id)getContactScores:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v8[16];

  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_contactScores, "objectForKeyedSubscript:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      v5 = v3;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactID", v8, 2u);
    }

    v4 = 0;
  }
  return v4;
}

- (id)getInteractionSessions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_contactRecord, "objectForKeyedSubscript:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "interactionSessions");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

    return v5;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactID", v8, 2u);
    }

    return 0;
  }
}

- (void)closeProximityEvents:(id)a3 bundleEndDate:(id)a4 contactRecords:(id)a5 ongoingProximityEvent:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[16];
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  double v37[2];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  objc_msgSend(v11, "timeIntervalSinceDate:", v10);
  v15 = v14;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E932C958);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E932C970);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E932C988);
  v37[0] = 0.0;
  -[RTPeopleDiscoveryContactRecord generateProximityEventScores:socialScore:contactRecords:combinedFrequencyScores:combinedRecencyScores:combinedSignificanceScores:](self, "generateProximityEventScores:socialScore:contactRecords:combinedFrequencyScores:combinedRecencyScores:combinedSignificanceScores:", v37, v13, v16, v17, v18, v15);

  if (v37[0] <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "skip storing proximity events due to invalid social score", buf, 2u);
    }
  }
  else
  {
    v30 = v12;
    if (v12)
      objc_msgSend(v12, "eventID", v37[0]);
    else
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID", v37[0]);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0D18458]);
    v21 = (void *)objc_msgSend(v20, "initWithEventID:startDate:endDate:relationship:socialScore:combinedFrequencyScores:combinedRecencyScores:combinedSignificanceScores:", v19, v10, v11, 0, v16, v17, v37[0], v18);
    -[RTPeopleDiscoveryContactRecord notifyObserversOnCloseProximityEvent:](self, "notifyObserversOnCloseProximityEvent:", v21);
    v22 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __106__RTPeopleDiscoveryContactRecord_closeProximityEvents_bundleEndDate_contactRecords_ongoingProximityEvent___block_invoke;
    v35[3] = &unk_1E929BAA0;
    v35[4] = self;
    v36 = v21;
    v29 = v21;
    v23 = (void *)MEMORY[0x1D8232094](v35);
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    v32[0] = v22;
    v32[1] = 3221225472;
    v32[2] = __106__RTPeopleDiscoveryContactRecord_closeProximityEvents_bundleEndDate_contactRecords_ongoingProximityEvent___block_invoke_2;
    v32[3] = &unk_1E929B460;
    v33 = (id)objc_msgSend(v24, "initWithCString:encoding:", RTAnalyticsEventPeopleDiscoveryEvents, 1);
    v34 = v23;
    v25 = v33;
    v26 = v23;
    v27 = (void *)MEMORY[0x1D8232094](v32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEventLazy();

    v12 = v30;
  }

}

uint64_t __106__RTPeopleDiscoveryContactRecord_closeProximityEvents_bundleEndDate_contactRecords_ongoingProximityEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_class(), "computeEventMetrics:", *(_QWORD *)(a1 + 40));
}

id __106__RTPeopleDiscoveryContactRecord_closeProximityEvents_bundleEndDate_contactRecords_ongoingProximityEvent___block_invoke_2(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  log_analytics_submission(*(void **)(a1 + 32), v2);
  return v2;
}

- (void)generateProximityEventScores:(double)a3 socialScore:(double *)a4 contactRecords:(id)a5 combinedFrequencyScores:(id)a6 combinedRecencyScores:(id)a7 combinedSignificanceScores:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  NSObject *v30;
  double *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  double v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (a3 <= 0.0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "receiving invalid bundle duration when computing scores", buf, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEBUG, "computing scores related to current proximity bundle", buf, 2u);
    }
    v31 = a4;
    v32 = v16;
    v33 = v15;
    v34 = v14;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v35 = v13;
    v19 = v13;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v37;
      v23 = 0.0;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v37 != v22)
            objc_enumerationMutation(v19);
          v25 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          v26 = (void *)MEMORY[0x1D8231EA8]();
          objc_msgSend(v19, "objectForKeyedSubscript:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "getTotalInteractionDuration");
          v29 = v28 / a3;
          _rt_log_facility_get_os_log(RTLogFacilityGathering);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v41 = v25;
            v42 = 2048;
            v43 = v29;
            _os_log_debug_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_DEBUG, "social score for contact: %@, score, %f", buf, 0x16u);
          }
          v23 = v23 + v29;

          objc_autoreleasePoolPop(v26);
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v21);
    }
    else
    {
      v23 = 0.0;
    }

    v16 = v32;
    *v31 = v23;
    v14 = v34;
    v13 = v35;
    v15 = v33;
  }

}

- (int64_t)bucketizeFrequencyScore:(double)a3
{
  if (a3 < 0.0 || a3 > 1.0)
    return 0;
  if (a3 >= 0.0 && a3 < 0.4)
    return 3;
  if (a3 >= 0.4 && a3 <= 0.6)
    return 2;
  if (a3 <= 1.0)
    return a3 > 0.6;
  return 0;
}

- (int64_t)bucketizeRecencyScore:(double)a3
{
  if (a3 < 0.0 || a3 > 1.0)
    return 0;
  if (a3 >= 0.0 && a3 < 0.33)
    return 3;
  if (a3 >= 0.33 && a3 <= 0.66)
    return 2;
  if (a3 <= 1.0)
    return a3 > 0.66;
  return 0;
}

- (int64_t)bucketizeSignificanceScore:(double)a3
{
  if (a3 < 0.5)
    return 0;
  if (a3 < 0.667)
    return 3;
  if (a3 > 0.834)
    return a3 <= 1.0;
  return 2;
}

- (void)createSingleContactRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  RTPeopleDiscoverySingleContactRecord *v7;
  void *v8;
  RTPeopleDiscoverySingleContactRecord *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityGathering);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "contactID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "create new contact record: %@", (uint8_t *)&v12, 0xCu);

  }
  v7 = [RTPeopleDiscoverySingleContactRecord alloc];
  objc_msgSend(v4, "contactID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RTPeopleDiscoverySingleContactRecord initWithContactID:withAdvertisement:](v7, "initWithContactID:withAdvertisement:", v8, v4);

  -[RTPeopleDiscoveryContactRecord contactRecord](self, "contactRecord");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v9, v11);

}

- (void)mergeWithAnotherContactRecord:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double maxBackstopDuration;
  RTProximityEvent *ongoingProximityEvent;
  RTProximityEvent *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  RTProximityEvent *v51;
  NSDate *bundleStartDate;
  void *v53;
  void *v54;
  NSDate *v55;
  void *v56;
  void *v57;
  NSDate *v58;
  NSDate *v59;
  NSDate *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t j;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  uint8_t v87[128];
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  void *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v5 = objc_claimAutoreleasedReturnValue();
    v72 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "contactRecord");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      objc_msgSend(v4, "ongoingProximityEvent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contactScores");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      objc_msgSend(v72, "bundleStartDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v89 = v7;
      v90 = 2112;
      v91 = v9;
      v92 = 2048;
      v93 = v11;
      v4 = v72;
      v94 = 2112;
      v95 = v12;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEFAULT, "merging contact record: number of contacts, %lu, ongoing proximity event, %@, number of contact scores, %lu, bundle start time, %@", buf, 0x2Au);

    }
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    objc_msgSend(v4, "contactScores");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v82 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1D8231EA8]();
          -[NSMutableDictionary objectForKeyedSubscript:](self->_contactScores, "objectForKeyedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_contactScores, "objectForKeyedSubscript:", v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "contactScores");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v4 = v72;
            objc_msgSend(v22, "mergeWithAnotherContactScore:", v24);
          }
          else
          {
            objc_msgSend(v4, "contactScores");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v19);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contactScores, "setObject:forKeyedSubscript:", v24, v19);
          }

          objc_autoreleasePoolPop(v20);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleStartDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSinceDate:", v26);
    v28 = v27;
    maxBackstopDuration = (double)self->_maxBackstopDuration;

    if (v28 < maxBackstopDuration)
    {
      ongoingProximityEvent = self->_ongoingProximityEvent;
      if (ongoingProximityEvent)
      {
        v31 = ongoingProximityEvent;
      }
      else
      {
        objc_msgSend(v72, "ongoingProximityEvent");
        v31 = (RTProximityEvent *)objc_claimAutoreleasedReturnValue();
      }
      v51 = self->_ongoingProximityEvent;
      self->_ongoingProximityEvent = v31;

      bundleStartDate = self->_bundleStartDate;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSDate isEqualToDate:](bundleStartDate, "isEqualToDate:", v53))
      {
        v4 = v72;
        objc_msgSend(v72, "bundleStartDate");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          objc_msgSend(v72, "bundleStartDate");
          v55 = (NSDate *)objc_claimAutoreleasedReturnValue();
          v56 = self->_bundleStartDate;
          self->_bundleStartDate = v55;
          goto LABEL_42;
        }
      }
      else
      {

        v4 = v72;
      }
      objc_msgSend(v4, "bundleStartDate");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v56)
      {
        objc_msgSend(v4, "bundleStartDate");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "earlierDate:", self->_bundleStartDate);
        v58 = (NSDate *)objc_claimAutoreleasedReturnValue();
        v59 = self->_bundleStartDate;
        self->_bundleStartDate = v58;

      }
      else
      {
        v60 = self->_bundleStartDate;
        v57 = self->_bundleStartDate;
        self->_bundleStartDate = v60;
      }

LABEL_42:
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      objc_msgSend(v4, "contactRecord");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "allKeys");
      v32 = objc_claimAutoreleasedReturnValue();

      v62 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
      if (v62)
      {
        v63 = v62;
        v64 = *(_QWORD *)v74;
        do
        {
          for (j = 0; j != v63; ++j)
          {
            if (*(_QWORD *)v74 != v64)
              objc_enumerationMutation(v32);
            v66 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j);
            v67 = (void *)MEMORY[0x1D8231EA8]();
            -[NSMutableDictionary objectForKeyedSubscript:](self->_contactRecord, "objectForKeyedSubscript:", v66);
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            if (v68)
            {
              -[NSMutableDictionary objectForKeyedSubscript:](self->_contactRecord, "objectForKeyedSubscript:", v66);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "contactRecord");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "objectForKeyedSubscript:", v66);
              v71 = (void *)objc_claimAutoreleasedReturnValue();

              v4 = v72;
              objc_msgSend(v69, "mergeWithAnotherSingleContactRecord:", v71);
            }
            else
            {
              objc_msgSend(v4, "contactRecord");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "objectForKeyedSubscript:", v66);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_contactRecord, "setObject:forKeyedSubscript:", v71, v66);
            }

            objc_autoreleasePoolPop(v67);
          }
          v63 = -[NSObject countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
        }
        while (v63);
      }
      goto LABEL_52;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "bundleStartDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v89 = (uint64_t)v34;
      v90 = 2112;
      v91 = v35;
      _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_DEFAULT, "closing proximity events for stale records, current time, %@, bundle start time, %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v32 = objc_claimAutoreleasedReturnValue();
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend(v72, "contactRecord");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v78;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v78 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * k);
          objc_msgSend(v72, "contactRecord");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectForKeyedSubscript:", v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "latestAdvertisementDate");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = -[NSObject compare:](v32, "compare:", v44);

          if (v45 == -1)
          {
            objc_msgSend(v43, "latestAdvertisementDate");
            v46 = objc_claimAutoreleasedReturnValue();

            v32 = v46;
          }

        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
      }
      while (v38);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v47 = objc_claimAutoreleasedReturnValue();

    v4 = v72;
    if (v32 != v47)
    {
      objc_msgSend(v72, "bundleStartDate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "contactRecord");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "ongoingProximityEvent");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPeopleDiscoveryContactRecord closeProximityEvents:bundleEndDate:contactRecords:ongoingProximityEvent:](self, "closeProximityEvents:bundleEndDate:contactRecords:ongoingProximityEvent:", v48, v32, v49, v50);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: otherRecord", buf, 2u);
    }
  }
LABEL_52:

}

- (void)updateDailyContactScores
{
  NSMutableDictionary *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;
  double v20;
  double v21;
  float v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v3 = self->_contactScores;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v34;
    *(_QWORD *)&v5 = 134218498;
    v32 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1D8231EA8]();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_contactScores, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "frequencyCount");
        objc_msgSend(v11, "runningMean");
        v14 = v13;
        objc_msgSend(v11, "runningMeanOfSquares");
        v16 = v15;
        objc_msgSend(v11, "frequencyScore");
        v18 = fabs(v17 + 1.0) < 2.22044605e-16;
        v19 = (v14 + (double)v12) * 0.5;
        if (v18)
          v20 = (double)(v12 * v12);
        else
          v20 = (v16 + (double)(v12 * v12)) * 0.5;
        if (v18)
          v21 = (double)v12;
        else
          v21 = v19;
        objc_msgSend(v11, "setRunningMean:", v21, v32, (_QWORD)v33);
        objc_msgSend(v11, "setRunningMeanOfSquares:", v20);
        v22 = -((double)v12 - v21) / (sqrt(v20 - v21 * v21) + 2.22044605e-16);
        objc_msgSend(v11, "setFrequencyScore:", 1.0 / (expf(v22) + 1.0));
        objc_msgSend(v11, "recencyScore");
        v24 = fabs(v23 + 1.0);
        if (v12)
          v25 = 0.0;
        else
          v25 = 1.0;
        v26 = (v23 + v25) * 0.5;
        if (v24 < 2.22044605e-16)
          v26 = v25;
        objc_msgSend(v11, "setRecencyScore:", v26);
        objc_msgSend(v11, "setFrequencyCount:", 0);
        _rt_log_facility_get_os_log(RTLogFacilityGathering);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v11, "frequencyScore");
          v29 = v28;
          objc_msgSend(v11, "recencyScore");
          *(_DWORD *)buf = v32;
          v38 = v29;
          v39 = 2048;
          v40 = v30;
          v41 = 2112;
          v42 = v9;
          _os_log_debug_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_DEBUG, "finish computing frequencyScore, %f and recencyScore, %f for contact %@", buf, 0x20u);
        }

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary allKeys](self->_contactScores, "allKeys");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPeopleDiscoveryContactRecord _fetchAndStoreSignificanceScore:](self, "_fetchAndStoreSignificanceScore:", v31);

}

- (void)_fetchAndStoreSignificanceScore:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  float v13;
  float v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  double v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = objc_alloc_init(MEMORY[0x1E0D70970]);
  objc_msgSend(v18, "contactPriorsForContactIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "priorScore");
        v14 = v13;
        _rt_log_facility_get_os_log(RTLogFacilityGathering);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          v24 = v14;
          v25 = 2112;
          v26 = v11;
          _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "Received significance score %f for contact %@", buf, 0x16u);
        }

        -[NSMutableDictionary objectForKeyedSubscript:](self->_contactScores, "objectForKeyedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v16, "setSignificanceScore:", 1.0 / (expf(-v14) + 1.0));
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityGathering);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Received significance score for unknown contact", buf, 2u);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v8);
  }

}

- (id)_updateContactFrequencyCount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_contactScores, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_contactScores, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFrequencyCount:", objc_msgSend(v6, "frequencyCount") + 1);
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412546;
      v11 = v4;
      v12 = 2048;
      v13 = objc_msgSend(v6, "frequencyCount");
      _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "frequency count updated for contact %@, new count, %lu", (uint8_t *)&v10, 0x16u);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEFAULT, "create new scores for contact %@", (uint8_t *)&v10, 0xCu);
    }

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18358]), "initWithContactID:frequencyScore:recencyScore:significanceScore:frequencyCount:runningMean:runningMeanOfSquares:", v4, 1, -1.0, -1.0, -1.0, 0.0, 0.0);
    -[NSMutableDictionary setObject:forKey:](self->_contactScores, "setObject:forKey:", v6, v4);
  }

  return v6;
}

- (void)injectContactScore:(id)a3
{
  NSMutableDictionary *contactScores;
  id v4;
  id v5;

  contactScores = self->_contactScores;
  v4 = a3;
  objc_msgSend(v4, "contactID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](contactScores, "setObject:forKey:", v4, v5);

}

- (void)ingestEvent:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    -[RTPeopleDiscoveryContactRecord updateContactRecordOnAdvertisementReceived:](self, "updateContactRecordOnAdvertisementReceived:", v4);

}

- (void)cleanUpOngoingContactRecordsAndScores
{
  RTProximityEvent *ongoingProximityEvent;
  NSDate *v4;
  NSDate *bundleStartDate;

  -[NSMutableDictionary removeAllObjects](self->_contactRecord, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_contactScores, "removeAllObjects");
  ongoingProximityEvent = self->_ongoingProximityEvent;
  self->_ongoingProximityEvent = 0;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  bundleStartDate = self->_bundleStartDate;
  self->_bundleStartDate = v4;

}

+ (id)computeEventMetrics:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E9328D30, CFSTR("numOfEventsPerDay"));
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "endDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;

  }
  else
  {
    v9 = -1.0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("duration"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "socialScore");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("socialScore"));

  return v4;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)notifyObserversOnCloseProximityEvent:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_observers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1D8231EA8](v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "didCloseProximityEvent:", v4, (_QWORD)v12);
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = v6;
    }
    while (v6);
  }

}

- (BOOL)isEqual:(id)a3
{
  RTPeopleDiscoveryContactRecord *v4;
  RTPeopleDiscoveryContactRecord *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (RTPeopleDiscoveryContactRecord *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTPeopleDiscoveryContactRecord contactRecord](self, "contactRecord");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPeopleDiscoveryContactRecord contactRecord](v5, "contactRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)descriptionDictionary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[NSMutableDictionary allKeys](self->_contactRecord, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("record: %@"), v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_contactRecord, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "descriptionDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(0, "setObject:forKey:", v12, v10);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v5);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary allKeys](self->_contactScores, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("score: %@"), v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_contactScores, "objectForKeyedSubscript:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "descriptionDictionary");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(0, "setObject:forKey:", v22, v20);

        objc_autoreleasePoolPop(v19);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v15);
  }

  return (id)objc_msgSend(0, "copy");
}

- (id)description
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  objc_class *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[RTPeopleDiscoveryContactRecord descriptionDictionary](self, "descriptionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONStringFromNSDictionary:error:", v2, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (RTPeopleDiscoveryContactRecord)initWithCoder:(id)a3
{
  id v4;
  RTPeopleDiscoveryContactRecord *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *contactRecord;
  uint64_t v12;
  RTProximityEvent *ongoingProximityEvent;
  uint64_t v14;
  NSDate *bundleStartDate;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *contactScores;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)RTPeopleDiscoveryContactRecord;
  v5 = -[RTPeopleDiscoveryContactRecord init](&v23, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("ContactRecord"));
    v10 = objc_claimAutoreleasedReturnValue();
    contactRecord = v5->_contactRecord;
    v5->_contactRecord = (NSMutableDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("OngoingProximityEvent"));
    v12 = objc_claimAutoreleasedReturnValue();
    ongoingProximityEvent = v5->_ongoingProximityEvent;
    v5->_ongoingProximityEvent = (RTProximityEvent *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BundleStartDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    bundleStartDate = v5->_bundleStartDate;
    v5->_bundleStartDate = (NSDate *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("ContactScores"));
    v20 = objc_claimAutoreleasedReturnValue();
    contactScores = v5->_contactScores;
    v5->_contactScores = (NSMutableDictionary *)v20;

  }
  return v5;
}

- (NSDate)bundleStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableDictionary)contactRecord
{
  return self->_contactRecord;
}

- (void)setContactRecord:(id)a3
{
  objc_storeStrong((id *)&self->_contactRecord, a3);
}

- (NSMutableDictionary)contactScores
{
  return self->_contactScores;
}

- (void)setContactScores:(id)a3
{
  objc_storeStrong((id *)&self->_contactScores, a3);
}

- (RTProximityEvent)ongoingProximityEvent
{
  return self->_ongoingProximityEvent;
}

- (void)setOngoingProximityEvent:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingProximityEvent, a3);
}

- (unint64_t)minObservationDuration
{
  return self->_minObservationDuration;
}

- (void)setMinObservationDuration:(unint64_t)a3
{
  self->_minObservationDuration = a3;
}

- (unint64_t)maxSeparationDuration
{
  return self->_maxSeparationDuration;
}

- (void)setMaxSeparationDuration:(unint64_t)a3
{
  self->_maxSeparationDuration = a3;
}

- (unint64_t)maxBackstopDuration
{
  return self->_maxBackstopDuration;
}

- (void)setMaxBackstopDuration:(unint64_t)a3
{
  self->_maxBackstopDuration = a3;
}

- (unint64_t)maxBundleDuration
{
  return self->_maxBundleDuration;
}

- (void)setMaxBundleDuration:(unint64_t)a3
{
  self->_maxBundleDuration = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_ongoingProximityEvent, 0);
  objc_storeStrong((id *)&self->_contactScores, 0);
  objc_storeStrong((id *)&self->_contactRecord, 0);
  objc_storeStrong((id *)&self->_bundleStartDate, 0);
}

@end
