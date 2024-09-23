@implementation RTPredictedLocationOfInterestProviderMaps

- (RTPredictedLocationOfInterestProviderMaps)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMapsSupportManager_);
}

- (RTPredictedLocationOfInterestProviderMaps)initWithMapsSupportManager:(id)a3
{
  id v5;
  RTPredictedLocationOfInterestProviderMaps *v6;
  RTPredictedLocationOfInterestProviderMaps *v7;
  RTPredictedLocationOfInterestProviderMaps *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  RTPredictedLocationOfInterestProviderMaps *v12;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)RTPredictedLocationOfInterestProviderMaps;
    v6 = -[RTPredictedLocationOfInterestProviderMaps init](&v17, sel_init);
    v7 = v6;
    if (v6)
    {
      v8 = v6;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = (const char *)-[RTPredictedLocationOfInterestProviderMaps UTF8String](objc_retainAutorelease(v8), "UTF8String");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v8);
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v10 = (const char *)objc_msgSend(v13, "UTF8String");

      }
      v14 = dispatch_queue_create(v10, v9);

      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v14;

      objc_storeStrong((id *)&v8->_mapsSupportManager, a3);
    }
    self = v7;
    v12 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[RTPredictedLocationOfInterestProviderMaps initWithMapsSupportManager:]";
      v20 = 1024;
      v21 = 146;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapsSupportManager (in %s:%d)", buf, 0x12u);
    }

    v12 = 0;
  }

  return v12;
}

- (id)_getNextPredictedLocationsOfInterestBackedByHistortyEntryRouteFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 historyEntryRoutes:(id)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v7 = a3;
  v8 = a6;
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __162__RTPredictedLocationOfInterestProviderMaps__getNextPredictedLocationsOfInterestBackedByHistortyEntryRouteFromLocation_startDate_timeInterval_historyEntryRoutes___block_invoke;
  v19[3] = &unk_1E92A4BF0;
  v20 = v10;
  v21 = v11;
  v22 = v7;
  v12 = v9;
  v23 = v12;
  v13 = v7;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v19);

  v16 = v23;
  v17 = v12;

  return v17;
}

void __162__RTPredictedLocationOfInterestProviderMaps__getNextPredictedLocationsOfInterestBackedByHistortyEntryRouteFromLocation_startDate_timeInterval_historyEntryRoutes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  NSObject *v27;
  _BYTE *v28;
  uint64_t v29;
  id v30;
  _BYTE buf[24];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "usageDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if (v10 >= 7200.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2048;
      v32 = 0x40BC200000000000;
      _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "historyEntryRoute, %@, used %.2f seconds ago. exceeds max time interval since used threshold, %.2f", buf, 0x20u);
    }
  }
  else
  {
    objc_msgSend(v6, "destinationLocation");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(a1 + 48);
    v30 = 0;
    objc_msgSend(v12, "distanceFromLocation:toLocation:error:", v13, v11, &v30);
    v15 = v14;
    v16 = v30;
    if (v16)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v16;
        _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
      }

    }
    if (v15 <= 100.0 || v15 >= 288000.0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 48), "coordinateToString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        *(_QWORD *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2048;
        v32 = *(_QWORD *)&v15;
        v33 = 2112;
        v34 = v24;
        v35 = 2048;
        v36 = 0x4059000000000000;
        v37 = 2048;
        v38 = 0x4111940000000000;
        _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "historyEntryRoute, %@, location, %@, %.2fm from location, %@. not within min/max distance threshold, %.2f/%.2f", buf, 0x3Eu);

      }
    }
    else
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18450]), "initWithHistoryEntryRoute:", v6);
      v19 = v18;
      if (v18)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        LOBYTE(v32) = 1;
        -[NSObject sources](v18, "sources");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "navigationWasInterrupted");

        if (v22)
        {
          v23 = *(void **)(a1 + 56);
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __162__RTPredictedLocationOfInterestProviderMaps__getNextPredictedLocationsOfInterestBackedByHistortyEntryRouteFromLocation_startDate_timeInterval_historyEntryRoutes___block_invoke_12;
          v25[3] = &unk_1E92A4BC8;
          v26 = v23;
          v28 = buf;
          v29 = a4;
          v27 = v19;
          objc_msgSend(v26, "enumerateObjectsUsingBlock:", v25);

        }
        if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          objc_msgSend(*(id *)(a1 + 56), "addObject:", v19);
        _Block_object_dispose(buf, 8);
      }
    }

  }
}

void __162__RTPredictedLocationOfInterestProviderMaps__getNextPredictedLocationsOfInterestBackedByHistortyEntryRouteFromLocation_startDate_timeInterval_historyEntryRoutes___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "sources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "navigationWasInterrupted");

  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v16 = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v3;
      v9 = "ignoring prediction for interrupted HistoryEntryRoute, %@. another interrupted HistoryEntryRoute is already b"
           "eing predicted, %@";
LABEL_7:
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v16, 0x16u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 40), "locationOfInterest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mapItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationOfInterest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mapItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "isEqualToMapItem:", v13);

  if (v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 138412546;
      v17 = v15;
      v18 = 2112;
      v19 = v3;
      v9 = "ignoring prediction for interrupted HistoryEntryRoute, %@. another HistoryEntryRoute is already being predict"
           "ed to the same destination, %@";
      goto LABEL_7;
    }
LABEL_8:

    **(_BYTE **)(a1 + 56) = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

- (id)_getNextPredictedLocationsOfInterestBackedByHistortyEntryPlaceDisplayFromLocation:(id)a3 startDate:(id)a4 timeInterval:(double)a5 historyEntryPlaceDisplays:(id)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a6;
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __176__RTPredictedLocationOfInterestProviderMaps__getNextPredictedLocationsOfInterestBackedByHistortyEntryPlaceDisplayFromLocation_startDate_timeInterval_historyEntryPlaceDisplays___block_invoke;
  v17[3] = &unk_1E92A4C18;
  v18 = v10;
  v19 = v7;
  v11 = v9;
  v20 = v11;
  v12 = v7;
  v13 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v17);

  v14 = v20;
  v15 = v11;

  return v15;
}

void __176__RTPredictedLocationOfInterestProviderMaps__getNextPredictedLocationsOfInterestBackedByHistortyEntryPlaceDisplayFromLocation_startDate_timeInterval_historyEntryPlaceDisplays___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  double v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "usageDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  v7 = v6;

  if (v7 >= 3600.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v3;
      v20 = 2048;
      v21 = v7;
      v22 = 2048;
      v23 = 0x40AC200000000000;
      _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "historyEntryPlaceDisplay, %@, used %.2f seconds ago. exceeds max time interval since used threshold, %.2f", buf, 0x20u);
    }
  }
  else
  {
    objc_msgSend(v3, "location");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    v10 = *(_QWORD *)(a1 + 40);
    v17 = 0;
    objc_msgSend(v9, "distanceFromLocation:toLocation:error:", v10, v8, &v17);
    v12 = v11;
    v13 = v17;
    if (v13)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v13;
        _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
      }

    }
    if (v12 <= 100.0 || v12 >= 288000.0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 40), "coordinateToString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v19 = v3;
        v20 = 2112;
        v21 = *(double *)&v8;
        v22 = 2048;
        v23 = *(_QWORD *)&v12;
        v24 = 2112;
        v25 = v16;
        v26 = 2048;
        v27 = 0x4059000000000000;
        v28 = 2048;
        v29 = 0x4111940000000000;
        _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "historyEntryPlaceDisplay, %@, location, %@, %.2fm from location, %@. not within min/max distance threshold, %.2f/%.2f", buf, 0x3Eu);

      }
    }
    else
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18450]), "initWithHistoryEntryPlaceDisplay:", v3);
      if (v15)
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);
    }

  }
}

- (BOOL)requiresRoutineEnablement
{
  return 0;
}

- (void)fetchNextPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  double v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  RTMapsSupportOptions *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  RTMapsSupportOptions *v24;
  _QWORD block[4];
  id v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  NSObject *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  NSObject *v37;
  _QWORD *v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = dispatch_group_create();
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x3032000000;
    v41[3] = __Block_byref_object_copy__152;
    v41[4] = __Block_byref_object_dispose__152;
    v42 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__152;
    v39[4] = __Block_byref_object_dispose__152;
    v40 = 0;
    dispatch_group_enter(v8);
    objc_msgSend(v6, "referenceDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windowDuration");
    objc_msgSend(v9, "dateByAddingTimeInterval:", v10 * -0.5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v6, "windowDuration");
    objc_msgSend(v11, "dateByAddingTimeInterval:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithStartDate:endDate:", v11, v13);

    v24 = -[RTMapsSupportOptions initWithDateInterval:]([RTMapsSupportOptions alloc], "initWithDateInterval:", v14);
    -[RTPredictedLocationOfInterestProviderMaps mapsSupportManager](self, "mapsSupportManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke;
    v34[3] = &unk_1E92A4C40;
    v38 = v39;
    v34[4] = self;
    v16 = v6;
    v35 = v16;
    v17 = v11;
    v36 = v17;
    v18 = v8;
    v37 = v18;
    objc_msgSend(v15, "fetchHistoryEntryRoutesWithOptions:handler:", v24, v34);

    dispatch_group_enter(v18);
    v19 = -[RTMapsSupportOptions initWithDateInterval:]([RTMapsSupportOptions alloc], "initWithDateInterval:", v14);
    -[RTPredictedLocationOfInterestProviderMaps mapsSupportManager](self, "mapsSupportManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_2;
    v29[3] = &unk_1E92A4C40;
    v33 = v41;
    v29[4] = self;
    v30 = v16;
    v21 = v17;
    v31 = v21;
    v22 = v18;
    v32 = v22;
    objc_msgSend(v20, "fetchHistoryEntryPlaceDisplaysWithOptions:handler:", v19, v29);

    -[RTPredictedLocationOfInterestProviderMaps queue](self, "queue");
    v23 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_3;
    block[3] = &unk_1E92A4CB8;
    v27 = v39;
    v28 = v41;
    v26 = v7;
    dispatch_group_notify(v22, v23, block);

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(v41, 8);

  }
}

void __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "referenceLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "windowDuration");
  objc_msgSend(v3, "_getNextPredictedLocationsOfInterestBackedByHistortyEntryRouteFromLocation:startDate:timeInterval:historyEntryRoutes:", v6, v7, v5);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "referenceLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "windowDuration");
  objc_msgSend(v3, "_getNextPredictedLocationsOfInterestBackedByHistortyEntryPlaceDisplayFromLocation:startDate:timeInterval:historyEntryPlaceDisplays:", v6, v7, v5);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_3(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[5];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_4;
  v9[3] = &unk_1E92A4C90;
  v9[4] = a1[5];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "filteredArrayUsingPredicate:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
  objc_msgSend(v6, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 134217984;
    v11 = v8;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%lu next predicted locations of interest", buf, 0xCu);
  }

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a2;
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_5;
  v11[3] = &unk_1E92A4C68;
  v8 = v5;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  v9 = *((unsigned __int8 *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __103__RTPredictedLocationOfInterestProviderMaps_fetchNextPredictedLocationsOfInterestWithCriteria_handler___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "locationOfInterest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationOfInterest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToMapItem:", v10);

  if (v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityMapsSupport);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 138412546;
      v15 = v13;
      v16 = 2112;
      v17 = v6;
      _os_log_debug_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEBUG, "dropping PLOI backed by historyEntryPlaceDisplay, %@, because it is also predicted by PLOI backed by historyEntryRoute, %@", (uint8_t *)&v14, 0x16u);
    }

    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (void)fetchPredictedLocationsOfInterestWithCriteria:(id)a3 handler:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (void)fetchPredictedExitDatesWithCriteria:(id)a3 handler:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, 0, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (RTMapsSupportManager)mapsSupportManager
{
  return self->_mapsSupportManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsSupportManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
