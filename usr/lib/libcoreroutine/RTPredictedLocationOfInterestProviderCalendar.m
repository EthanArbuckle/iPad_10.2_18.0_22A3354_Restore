@implementation RTPredictedLocationOfInterestProviderCalendar

- (RTPredictedLocationOfInterestProviderCalendar)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithEventManager_eventModelProvider_learnedLocationManager_mapServiceManager_);
}

- (RTPredictedLocationOfInterestProviderCalendar)initWithEventManager:(id)a3 eventModelProvider:(id)a4 learnedLocationManager:(id)a5 mapServiceManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RTPredictedLocationOfInterestProviderCalendar *v15;
  RTPredictedLocationOfInterestProviderCalendar *v16;
  RTPredictedLocationOfInterestProviderCalendar *v17;
  RTPredictedLocationOfInterestProviderCalendar *v18;
  const char *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *queue;
  id v28;
  NSObject *attr;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[RTPredictedLocationOfInterestProviderCalendar initWithEventManager:eventModelProvider:learnedLocationManag"
            "er:mapServiceManager:]";
      v34 = 1024;
      v35 = 114;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventManager (in %s:%d)", buf, 0x12u);
    }

    if (v12)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_17:
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "-[RTPredictedLocationOfInterestProviderCalendar initWithEventManager:eventModelProvider:learnedLocationMan"
              "ager:mapServiceManager:]";
        v34 = 1024;
        v35 = 116;
        _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationManager (in %s:%d)", buf, 0x12u);
      }

      if (v14)
        goto LABEL_5;
      goto LABEL_20;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[RTPredictedLocationOfInterestProviderCalendar initWithEventManager:eventModelProvider:learnedLocationManager"
          ":mapServiceManager:]";
    v34 = 1024;
    v35 = 115;
    _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: eventModelProvider (in %s:%d)", buf, 0x12u);
  }

  if (!v13)
    goto LABEL_17;
LABEL_4:
  if (v14)
  {
LABEL_5:
    v15 = 0;
    if (v11 && v12 && v13)
    {
      v31.receiver = self;
      v31.super_class = (Class)RTPredictedLocationOfInterestProviderCalendar;
      v16 = -[RTPredictedLocationOfInterestProviderCalendar init](&v31, sel_init);
      v17 = v16;
      if (v16)
      {
        v30 = a5;
        v18 = v16;
        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        attr = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = (const char *)-[RTPredictedLocationOfInterestProviderCalendar UTF8String](objc_retainAutorelease(v18), "UTF8String");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v18);
          v28 = a6;
          v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v19 = (const char *)objc_msgSend(v24, "UTF8String");

          a6 = v28;
        }
        v25 = dispatch_queue_create(v19, attr);

        queue = v18->_queue;
        v18->_queue = (OS_dispatch_queue *)v25;

        objc_storeStrong((id *)&v18->_eventManager, a3);
        objc_storeStrong((id *)&v18->_eventModelProvider, a4);
        objc_storeStrong((id *)&v18->_learnedLocationManager, v30);
        objc_storeStrong((id *)&v18->_mapServiceManager, a6);
      }
      self = v17;
      v15 = self;
    }
    goto LABEL_26;
  }
LABEL_20:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[RTPredictedLocationOfInterestProviderCalendar initWithEventManager:eventModelProvider:learnedLocationManager"
          ":mapServiceManager:]";
    v34 = 1024;
    v35 = 117;
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapServiceManager (in %s:%d)", buf, 0x12u);
  }

  v15 = 0;
LABEL_26:

  return v15;
}

+ (BOOL)reasonableDistanceBetweenEventLocation:(id)a3 andLocation:(id)a4
{
  id v5;
  id v6;
  double v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "latitude");
  objc_msgSend(v6, "longitude");

  objc_msgSend(v5, "latitude");
  objc_msgSend(v5, "longitude");

  RTCommonCalculateDistance();
  return v7 < 321868.0 && v7 > 700.0;
}

- (void)fetchNextPredictedLocationsOfInterestFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 clientIdentifier:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  RTPredictedLocationOfInterestProviderCalendar *v20;
  id v21;
  id v22;
  id v23;
  double v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    -[RTPredictedLocationOfInterestProviderCalendar queue](self, "queue");
    v16 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke;
    v18[3] = &unk_1E92975D8;
    v24 = a5;
    v19 = v13;
    v20 = self;
    v23 = v15;
    v21 = v14;
    v22 = v12;
    dispatch_async(v16, v18);

    v17 = v19;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTPredictedLocationOfInterestProviderCalendar fetchNextPredictedLocationsOfInterestFromLocation:startDate:"
            "timeInterval:clientIdentifier:handler:]";
      v27 = 1024;
      v28 = 158;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }

}

void __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  void *v2;
  dispatch_semaphore_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_group_t v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  _QWORD block[4];
  id v35;
  id v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  NSObject *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _BYTE buf[12];
  __int16 v60;
  id v61;
  __int16 v62;
  void *v63;
  _QWORD v64[4];

  v64[1] = *MEMORY[0x1E0C80C00];
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "dateByAddingTimeInterval:", *(double *)(a1 + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  v54 = &v53;
  v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__136;
  v57 = __Block_byref_object_dispose__136;
  v58 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__136;
  v51 = __Block_byref_object_dispose__136;
  v52 = 0;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
    goto LABEL_9;
  v3 = dispatch_semaphore_create(0);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_18;
  v43[3] = &unk_1E9296EE0;
  v45 = &v47;
  v46 = &v53;
  v6 = v3;
  v44 = v6;
  objc_msgSend(v5, "fetchEventsBetweenStartDate:andEndDate:includeSuggestions:withHandler:", v4, v2, 0, v43);
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v7, v9))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", v8);
    v12 = v11;
    v13 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_105);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "filteredArrayUsingPredicate:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "submitToCoreAnalytics:type:duration:", v17, 1, v12);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v19 = (void *)MEMORY[0x1E0CB35C8];
    v64[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v64, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
  }

  if (v54[5])
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
LABEL_9:
    v22 = dispatch_group_create();
    _rt_log_facility_get_os_log(RTLogFacilityEvent);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = objc_msgSend((id)v48[5], "count");
      objc_msgSend(*(id *)(a1 + 32), "stringFromDate");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringFromDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v24;
      v60 = 2112;
      v61 = v25;
      v62 = 2112;
      v63 = v26;
      _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "found %lu events between %@ and %@", buf, 0x20u);

    }
    v27 = (void *)v48[5];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_20;
    v37[3] = &unk_1E92A3818;
    v28 = v22;
    v29 = *(_QWORD *)(a1 + 40);
    v30 = *(void **)(a1 + 48);
    v38 = v28;
    v39 = v29;
    v40 = v30;
    v41 = *(id *)(a1 + 56);
    v31 = v33;
    v42 = v31;
    objc_msgSend(v27, "enumerateObjectsUsingBlock:", v37);
    objc_msgSend(*(id *)(a1 + 40), "queue");
    v32 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_27;
    block[3] = &unk_1E9297650;
    v35 = v31;
    v36 = *(id *)(a1 + 64);
    dispatch_group_notify(v28, v32, block);

  }
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
}

void __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_20(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityEvent);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v17 = a3 + 1;
    v18 = 2112;
    v19 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "event %lu, %@", buf, 0x16u);
  }

  v7 = objc_msgSend(v5, "participationStatus");
  if (v7 == 4 || v7 == 2)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_21;
    v10[3] = &unk_1E92A37F0;
    v10[4] = v8;
    v11 = *(id *)(a1 + 56);
    v15 = a3;
    v12 = v5;
    v13 = *(id *)(a1 + 64);
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v8, "_fetchLocationOfInterestForEvent:clientIdentifier:handler:", v12, v9, v10);

  }
}

void __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_21(uint64_t a1, void *a2)
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
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  NSObject *v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D183B0]);
    objc_msgSend(v3, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "latitude");
    v7 = v6;
    objc_msgSend(v3, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "longitude");
    v10 = v9;
    objc_msgSend(v3, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "horizontalUncertainty");
    v13 = v12;
    objc_msgSend(v3, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "altitude");
    v16 = v15;
    objc_msgSend(v3, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "verticalUncertainty");
    v19 = objc_msgSend(v4, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:speed:", 0, 0, v7, v10, v13, v16, v18, 0.0);

    LODWORD(v8) = objc_msgSend((id)objc_opt_class(), "reasonableDistanceBetweenEventLocation:andLocation:", v19, *(_QWORD *)(a1 + 40));
    _rt_log_facility_get_os_log(RTLogFacilityEvent);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if ((_DWORD)v8)
    {
      if (v21)
      {
        v22 = *(_QWORD *)(a1 + 72) + 1;
        v23 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 134218498;
        v34 = v22;
        v35 = 2112;
        v36 = v23;
        v37 = 2112;
        v38 = v3;
        _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "event %lu, %@, at locationOfInterest, %@", buf, 0x20u);
      }

      v24 = objc_alloc(MEMORY[0x1E0D18450]);
      objc_msgSend(*(id *)(a1 + 48), "startDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184A8]), "initWithEvent:", *(_QWORD *)(a1 + 48));
      v32 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v24, "initWithLocationOfInterest:confidence:nextEntryTime:modeOfTransportation:sources:", v3, v25, 0, v27, 1.0);

      objc_msgSend(*(id *)(a1 + 56), "addObject:", v20);
    }
    else if (v21)
    {
      v30 = *(_QWORD *)(a1 + 72) + 1;
      v31 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      v34 = v30;
      v35 = 2112;
      v36 = v31;
      v37 = 2112;
      v38 = v3;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "event %lu, %@, at locationOfInterest, %@, is not a reasonable distance from the current location to suggest", buf, 0x20u);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityEvent);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v28 = *(_QWORD *)(a1 + 72) + 1;
      v29 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      v34 = v28;
      v35 = 2112;
      v36 = v29;
      v37 = 2112;
      v38 = 0;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "event %lu, %@, locationOfInterest, %@", buf, 0x20u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

uint64_t __147__RTPredictedLocationOfInterestProviderCalendar_fetchNextPredictedLocationsOfInterestFromLocation_startDate_timeInterval_clientIdentifier_handler___block_invoke_27(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("nextEntryTime"), 1);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortUsingDescriptors:", v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_fetchPredictedLocationsOfInterestOnDate:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "dateByAddingTimeInterval:", -7200.0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingTimeInterval:", 7200.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTPredictedLocationOfInterestProviderCalendar _fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:handler:](self, "_fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:handler:", v12, v11, v9, v8);
}

- (void)fetchPredictedLocationsOfInterestOnDate:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[RTPredictedLocationOfInterestProviderCalendar queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __114__RTPredictedLocationOfInterestProviderCalendar_fetchPredictedLocationsOfInterestOnDate_clientIdentifier_handler___block_invoke;
    v13[3] = &unk_1E9297EB8;
    v13[4] = self;
    v14 = v8;
    v15 = v9;
    v16 = v10;
    dispatch_async(v11, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTPredictedLocationOfInterestProviderCalendar fetchPredictedLocationsOfInterestOnDate:clientIdentifier:handler:]";
      v19 = 1024;
      v20 = 282;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

uint64_t __114__RTPredictedLocationOfInterestProviderCalendar_fetchPredictedLocationsOfInterestOnDate_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPredictedLocationsOfInterestOnDate:clientIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_fetchLocationOfInterestForEvent:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  RTLearnedLocationManager *learnedLocationManager;
  RTEventModelProvider *eventModelProvider;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  id v27;
  objc_class *v28;
  void *v29;
  void *v30;
  RTMapServiceManager *mapServiceManager;
  void *v32;
  void *v33;
  NSObject *v34;
  _QWORD block[4];
  id v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD v40[4];
  id v41;
  NSObject *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD v45[4];
  NSObject *v46;
  NSObject *v47;
  _QWORD *v48;
  uint8_t buf[16];
  _QWORD v50[4];
  id v51;
  NSObject *v52;
  _QWORD *v53;
  _QWORD v54[5];
  id v55;
  _QWORD v56[5];
  id v57;
  _QWORD v58[5];
  id v59;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
    goto LABEL_15;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__136;
  v58[4] = __Block_byref_object_dispose__136;
  v59 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__136;
  v56[4] = __Block_byref_object_dispose__136;
  v57 = 0;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__136;
  v54[4] = __Block_byref_object_dispose__136;
  v55 = 0;
  v11 = dispatch_group_create();
  objc_msgSend(v8, "structuredLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "geoLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (self->_eventModelProvider)
    {
      dispatch_group_enter(v11);
      eventModelProvider = self->_eventModelProvider;
      objc_msgSend(v8, "title");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "location");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "calendar");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "calendarIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_34;
      v45[3] = &unk_1E929BBF8;
      v48 = v58;
      v46 = v8;
      v47 = v11;
      -[RTEventModelProvider fetchLocationsOfInterestAssociatedToTitle:location:calendarIdentifier:withHandler:](eventModelProvider, "fetchLocationsOfInterestAssociatedToTitle:location:calendarIdentifier:withHandler:", v20, v21, v23, v45);

      v17 = v46;
      goto LABEL_12;
    }
    _rt_log_facility_get_os_log(RTLogFacilityEvent);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v24 = "Event model provider unavailable";
LABEL_11:
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, v24, buf, 2u);
    goto LABEL_12;
  }
  if (!self->_learnedLocationManager)
  {
    _rt_log_facility_get_os_log(RTLogFacilityEvent);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v24 = "Device location predictor unavailable";
    goto LABEL_11;
  }
  dispatch_group_enter(v11);
  v14 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v8, "structuredLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "geoLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "initWithCLLocation:", v16);

  learnedLocationManager = self->_learnedLocationManager;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke;
  v50[3] = &unk_1E92A3840;
  v53 = v58;
  v51 = v8;
  v52 = v11;
  -[RTLearnedLocationManager fetchLocationOfInterestAtLocation:handler:](learnedLocationManager, "fetchLocationOfInterestAtLocation:handler:", v17, v50);

LABEL_12:
  objc_msgSend(v8, "structuredLocation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mapKitHandle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    dispatch_group_enter(v11);
    v27 = objc_alloc(MEMORY[0x1E0D183F8]);
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v27, "initWithUseBackgroundTraits:analyticsIdentifier:clientIdentifier:", 1, v29, v9);

    mapServiceManager = self->_mapServiceManager;
    objc_msgSend(v8, "structuredLocation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "mapKitHandle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_37;
    v40[3] = &unk_1E92A3890;
    v41 = v8;
    v43 = v56;
    v44 = v54;
    v42 = v11;
    -[RTMapServiceManager fetchMapItemFromHandle:options:handler:](mapServiceManager, "fetchMapItemFromHandle:options:handler:", v33, v30, v40);

  }
  -[RTPredictedLocationOfInterestProviderCalendar queue](self, "queue");
  v34 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_39;
  block[3] = &unk_1E92A38B8;
  v36 = v8;
  v38 = v58;
  v39 = v56;
  v37 = v10;
  dispatch_group_notify(v11, v34, block);

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(v56, 8);

  _Block_object_dispose(v58, 8);
LABEL_15:

}

void __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (objc_class *)MEMORY[0x1E0D183C0];
    v4 = a2;
    v5 = objc_msgSend([v3 alloc], "initWithLearnedLocationOfInterest:", v4);

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    _rt_log_facility_get_os_log(RTLogFacilityEvent);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "found loi, %@, at location of event, %@", (uint8_t *)&v11, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_34(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_2;
  v6[3] = &unk_1E92A3868;
  v6[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(a2, "enumerateObjectsUsingBlock:", v6);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    _rt_log_facility_get_os_log(RTLogFacilityEvent);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "inferred loi, %@, for event, %@", buf, 0x16u);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "visits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "visits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 > v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

void __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityEvent);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138413058;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "resolved mapItem from event, %@, to address, \"%@\", error, %@, resolvedMapItem, %@", (uint8_t *)&v16, 0x2Au);

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;
  v12 = v5;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v6;
  v15 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __107__RTPredictedLocationOfInterestProviderCalendar__fetchLocationOfInterestForEvent_clientIdentifier_handler___block_invoke_39(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  objc_msgSend(*(id *)(a1 + 32), "structuredLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geoLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    goto LABEL_4;
  }
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);

  if (v4)
  {
LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "structuredLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "geoLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "structuredLocation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "geoLocation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "coordinate");
      v10 = v9;

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "latitude");
      v10 = v11;
    }

    objc_msgSend(*(id *)(a1 + 32), "structuredLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "geoLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "structuredLocation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "geoLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "coordinate");
      v17 = v16;

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "location");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "longitude");
      v17 = v18;
    }

    objc_msgSend(*(id *)(a1 + 32), "structuredLocation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "geoLocation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 32), "structuredLocation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "geoLocation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "horizontalAccuracy");
      v24 = v23;

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "location");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "horizontalUncertainty");
      v24 = v25;
    }

    v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v26)
    {
      v27 = v26;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "mapItem");
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v28 = v27;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      v31 = v29;
    }
    else
    {
      v32 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v32, "initWithUUIDString:", v33);
      v35 = v34;
      if (v34)
      {
        v36 = v34;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v36 = (id)objc_claimAutoreleasedReturnValue();
      }
      v31 = v36;

    }
    v37 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v37)
    {
      v38 = objc_msgSend(v37, "type");
      v39 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v39)
      {
        v40 = objc_msgSend(v39, "typeSource");
        v41 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        if (v41)
        {
          objc_msgSend(v41, "visits");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          if (v43)
          {
            objc_msgSend(v43, "customLabel");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
            v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v10, v17, v24);
            v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D183C0]), "initWithLocation:confidence:identifier:type:typeSource:visits:customLabel:mapItem:", v45, v31, v38, v40, v42, v44, 1.0, v28);

            goto LABEL_33;
          }
        }
        else
        {
          v42 = 0;
        }
      }
      else
      {
        v42 = 0;
        v40 = 0;
      }
      v44 = 0;
      goto LABEL_32;
    }
    v42 = 0;
    v40 = 0;
    v44 = 0;
    v38 = -1;
    goto LABEL_32;
  }
  v46 = 0;
LABEL_33:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_fetchPredictedLocationOfInterestAtEvent:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __115__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationOfInterestAtEvent_clientIdentifier_handler___block_invoke;
    v10[3] = &unk_1E92A38E0;
    v11 = v8;
    v12 = v9;
    -[RTPredictedLocationOfInterestProviderCalendar _fetchLocationOfInterestForEvent:clientIdentifier:handler:](self, "_fetchLocationOfInterestForEvent:clientIdentifier:handler:", v11, a4, v10);

  }
}

void __115__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationOfInterestAtEvent_clientIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    v6 = (objc_class *)MEMORY[0x1E0D18450];
    v7 = a2;
    v8 = [v6 alloc];
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D184A8]), "initWithEvent:", *(_QWORD *)(a1 + 32));
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithLocationOfInterest:confidence:nextEntryTime:modeOfTransportation:sources:", v7, v9, 0, v11, 1.0);

  }
  else
  {
    v12 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 clientIdentifier:(id)a5 handler:(id)a6
{
  void (**v10)(id, _QWORD);
  char **__ptr32 *v11;
  uint64_t v12;
  dispatch_semaphore_t v13;
  RTEventManager *eventManager;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  dispatch_time_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  dispatch_group_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD block[4];
  id v42;
  void (**v43)(id, _QWORD);
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, void *);
  void *v47;
  NSObject *v48;
  RTPredictedLocationOfInterestProviderCalendar *v49;
  id v50;
  id v51;
  _QWORD v52[4];
  NSObject *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  uint64_t v68;
  uint8_t buf[16];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v40 = a4;
  v37 = a5;
  v10 = (void (**)(id, _QWORD))a6;
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v62 = 0;
  v63 = &v62;
  v64 = 0x3032000000;
  v65 = __Block_byref_object_copy__136;
  v66 = __Block_byref_object_dispose__136;
  v67 = 0;
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__136;
  v60 = __Block_byref_object_dispose__136;
  v61 = 0;
  v11 = &off_1D1EEC000;
  v12 = MEMORY[0x1E0C809B0];
  if (!self->_eventManager)
    goto LABEL_10;
  v13 = dispatch_semaphore_create(0);
  eventManager = self->_eventManager;
  v52[0] = v12;
  v52[1] = 3221225472;
  v52[2] = __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke;
  v52[3] = &unk_1E9296EE0;
  v54 = &v56;
  v55 = &v62;
  v15 = v13;
  v53 = v15;
  -[RTEventManager fetchEventsBetweenStartDate:andEndDate:withHandler:](eventManager, "fetchEventsBetweenStartDate:andEndDate:withHandler:", v39, v40, v52, v37, v38);
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v16, v18))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", v17);
    v21 = v20;
    v22 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_105);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "filteredArrayUsingPredicate:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "submitToCoreAnalytics:type:duration:", v26, 1, v21);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v28 = (void *)MEMORY[0x1E0CB35C8];
    v68 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v68, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
  }

  v12 = MEMORY[0x1E0C809B0];
  v11 = &off_1D1EEC000;
  if (v63[5])
  {
    if (v10)
      v10[2](v10, 0);
  }
  else
  {
LABEL_10:
    v31 = dispatch_group_create();
    v32 = (void *)v57[5];
    v44 = v12;
    v45 = *((_QWORD *)v11 + 369);
    v33 = v45;
    v46 = __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_2;
    v47 = &unk_1E92A2E60;
    v34 = v31;
    v48 = v34;
    v49 = self;
    v50 = v37;
    v35 = v38;
    v51 = v35;
    objc_msgSend(v32, "enumerateObjectsUsingBlock:", &v44);
    -[RTPredictedLocationOfInterestProviderCalendar queue](self, "queue");
    v36 = objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = v33;
    block[2] = __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_4;
    block[3] = &unk_1E9297678;
    v43 = v10;
    v42 = v35;
    dispatch_group_notify(v34, v36, block);

  }
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
}

void __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = *(NSObject **)(a1 + 32);
  v4 = a2;
  dispatch_group_enter(v3);
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_3;
  v7[3] = &unk_1E92A3908;
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v5, "_fetchPredictedLocationOfInterestAtEvent:clientIdentifier:handler:", v4, v6, v7);

}

void __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3880];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_5;
  v8[3] = &unk_1E929B988;
  v9 = v2;
  v4 = v2;
  objc_msgSend(v3, "predicateWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "filteredArrayUsingPredicate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

}

uint64_t __133__RTPredictedLocationOfInterestProviderCalendar__fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "locationOfInterest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityEvent);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v3;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "LOI doesn't have an identifier, dropping LOI, %@", (uint8_t *)&v15, 0xCu);
    }

    goto LABEL_7;
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v3, "locationOfInterest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v6, "containsObject:", v8);

  if ((v6 & 1) != 0)
  {
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v3, "locationOfInterest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v11);

  v12 = 1;
LABEL_8:

  return v12;
}

- (void)fetchPredictedLocationsOfInterestBetweenStartDate:(id)a3 endDate:(id)a4 clientIdentifier:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    -[RTPredictedLocationOfInterestProviderCalendar queue](self, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __132__RTPredictedLocationOfInterestProviderCalendar_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke;
    block[3] = &unk_1E9297F08;
    block[4] = self;
    v17 = v10;
    v18 = v11;
    v19 = v12;
    v20 = v13;
    dispatch_async(v14, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[RTPredictedLocationOfInterestProviderCalendar fetchPredictedLocationsOfInterestBetweenStartDate:endDate:cl"
            "ientIdentifier:handler:]";
      v23 = 1024;
      v24 = 514;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

uint64_t __132__RTPredictedLocationOfInterestProviderCalendar_fetchPredictedLocationsOfInterestBetweenStartDate_endDate_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (BOOL)requiresRoutineEnablement
{
  return 0;
}

- (void)fetchNextPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "referenceLocation");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "referenceDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowDuration");
  v10 = v9;
  objc_msgSend(v7, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTPredictedLocationOfInterestProviderCalendar fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:clientIdentifier:handler:](self, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:clientIdentifier:handler:", v12, v8, v11, v6, v10);
}

- (void)fetchPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "referenceDate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowDuration");
  objc_msgSend(v11, "dateByAddingTimeInterval:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "referenceDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTPredictedLocationOfInterestProviderCalendar fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:handler:](self, "fetchPredictedLocationsOfInterestBetweenStartDate:endDate:clientIdentifier:handler:", v9, v8, v10, v6);
}

- (void)fetchPredictedExitDatesWithCriteria:(id)a3 handler:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (RTEventManager)eventManager
{
  return self->_eventManager;
}

- (void)setEventManager:(id)a3
{
  objc_storeStrong((id *)&self->_eventManager, a3);
}

- (RTEventModelProvider)eventModelProvider
{
  return self->_eventModelProvider;
}

- (void)setEventModelProvider:(id)a3
{
  objc_storeStrong((id *)&self->_eventModelProvider, a3);
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationManager, a3);
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (void)setMapServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapServiceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_eventModelProvider, 0);
  objc_storeStrong((id *)&self->_eventManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
