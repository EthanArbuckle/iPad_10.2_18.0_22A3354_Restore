@implementation RTTransitMetricManager

- (RTTransitMetricManager)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationManager:(id)a5 learnedLocationStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  RTTransitMetricManager *v16;
  RTTransitMetricManager *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  RTTransitMetricManager *v21;
  OS_dispatch_queue *queue;
  id v24;
  dispatch_queue_t v25;
  NSObject *attr;
  RTTransitMetricManager *v27;
  objc_super v28;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: defaultsManager";
LABEL_16:
    _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
    goto LABEL_17;
  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_16;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_16;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v20 = "Invalid parameter not satisfying: learnedLocationStore";
      goto LABEL_16;
    }
LABEL_17:

    v21 = 0;
    goto LABEL_18;
  }
  v28.receiver = self;
  v28.super_class = (Class)RTTransitMetricManager;
  v16 = -[RTTransitMetricManager init](&v28, sel_init);
  if (v16)
  {
    v27 = v16;
    v17 = v16;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    attr = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (const char *)-[RTTransitMetricManager UTF8String](objc_retainAutorelease(v17), "UTF8String");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v17);
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = (const char *)objc_msgSend(v24, "UTF8String");

    }
    v25 = dispatch_queue_create(v18, attr);

    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v25;

    objc_storeStrong((id *)&v17->_defaultsManager, a3);
    objc_storeStrong((id *)&v17->_distanceCalculator, a4);
    objc_storeStrong((id *)&v17->_learnedLocationManager, a5);
    objc_storeStrong((id *)&v17->_learnedLocationStore, a6);
    v16 = v27;
  }
  self = v16;
  v21 = self;
LABEL_18:

  return v21;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RTTransitMetricManager;
  -[RTTransitMetricManager dealloc](&v2, sel_dealloc);
}

- (BOOL)isOverlappedVisit:(id)a3 locationsOfInterest:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  RTDistanceCalculator *distanceCalculator;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = a4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        distanceCalculator = self->_distanceCalculator;
        objc_msgSend(v10, "location");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "location");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "location");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "location");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0;
        -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v13, v15, &v32);
        v17 = v16;
        v18 = v32;

        objc_msgSend(v10, "location");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "location");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "horizontalUncertainty");
        v22 = v21;
        objc_msgSend(v5, "location");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "location");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "horizontalUncertainty");
        v26 = v22 + v25;

        v27 = 50.0;
        if (v26 >= 50.0)
          v27 = v26;
        if (v17 < v27)
        {
          v28 = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v7)
        continue;
      break;
    }
  }
  v28 = 0;
LABEL_13:

  return v28;
}

- (void)performTransitAnalyticsWithHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v8 = 5;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "TransitMetrics, max reports, %lu", buf, 0xCu);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke_24;
  v5[3] = &unk_1E92A40C8;
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "_fetchLocationsOfInterestWithPlaceTypes:handler:", &unk_1E932CAC0, v5);

}

void __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id obj;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD block[5];
  id v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  const __CFString *v68;
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v47 = a2;
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "description");
      v40 = a1;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v70 = (uint64_t)v41;
      _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "TransitMetrics, error, home/work are not fetched, error, %@", buf, 0xCu);

      a1 = v40;
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v44 = a1;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      objc_msgSend(v47, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
      if (v48)
      {
        v46 = *(_QWORD *)v64;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v64 != v46)
              objc_enumerationMutation(obj);
            v49 = v7;
            v8 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v7);
            objc_msgSend(v47, "objectForKey:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              v28 = objc_msgSend(v8, "unsignedIntegerValue");
              v29 = objc_msgSend(v9, "count");
              *(_DWORD *)buf = 134218240;
              v70 = v28;
              v71 = 2048;
              v72 = v29;
              _os_log_debug_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEBUG, "TransitMetrics, type, %lu, lois.size, %lu", buf, 0x16u);
            }

            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            v11 = v9;
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v60;
              do
              {
                for (i = 0; i != v13; ++i)
                {
                  if (*(_QWORD *)v60 != v14)
                    objc_enumerationMutation(v11);
                  v16 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  v17 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v16, "identifier");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "place");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "customLabel");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "place");
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    v50 = objc_msgSend(v53, "type");
                    objc_msgSend(v16, "location");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "location");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v51, "latitude");
                    v21 = v20;
                    objc_msgSend(v16, "location");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "location");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "longitude");
                    v25 = v24;
                    objc_msgSend(v16, "visits");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v26, "count");
                    *(_DWORD *)buf = 138413570;
                    v70 = (uint64_t)v18;
                    v71 = 2112;
                    v72 = (uint64_t)v19;
                    v73 = 2048;
                    v74 = v50;
                    v75 = 2048;
                    v76 = v21;
                    v77 = 2048;
                    v78 = v25;
                    v79 = 2048;
                    v80 = v27;
                    _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "TransitMetrics, loi, %@, place, %@, type, %lu, lat, %f, lon, %f, visits, %lu", buf, 0x3Eu);

                  }
                }
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
              }
              while (v13);
            }

            v7 = v49 + 1;
          }
          while (v49 + 1 != v48);
          v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
        }
        while (v48);
      }

      a1 = v44;
    }
    objc_msgSend(v47, "objectForKey:", &unk_1E9329378);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKey:", &unk_1E9329390);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "count") && objc_msgSend(v31, "count"))
    {
      v32 = *(_QWORD *)(a1 + 32);
      v33 = *(NSObject **)(v32 + 40);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke_28;
      block[3] = &unk_1E9297EB8;
      block[4] = v32;
      v56 = v30;
      v57 = v31;
      v58 = *(id *)(a1 + 40);
      dispatch_async(v33, block);

    }
    else
    {
      v34 = a1;
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        v42 = objc_msgSend(v30, "count");
        v43 = objc_msgSend(v31, "count");
        *(_DWORD *)buf = 134218240;
        v70 = v42;
        v71 = 2048;
        v72 = v43;
        _os_log_debug_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_DEBUG, "TransitMetrics, Home/Work LOI are not learned, Home count, %lu, Work count, %lu", buf, 0x16u);
      }

      v36 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0D18598];
      v67 = *MEMORY[0x1E0CB2D50];
      v68 = CFSTR("Home/Work LOI are not learned.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, 14, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(v34 + 40) + 16))();
    }

    v5 = 0;
  }

}

void __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke_28(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke_2;
  v4[3] = &unk_1E9297568;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "_performAnalyticsWitHomeLOIs:workLOIs:handler:", v2, v3, v4);

}

void __61__RTTransitMetricManager_performTransitAnalyticsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "TransitMetrics, done, error, %@", (uint8_t *)&v6, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_fetchLocationsOfInterestWithPlaceTypes:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  RTLearnedLocationManager *learnedLocationManager;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id obj;
  _QWORD block[4];
  id v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  uint8_t *v25;
  _QWORD v26[4];
  id v27;
  void *v28;
  NSObject *v29;
  uint8_t *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[8];
  uint8_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  v20 = v6;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeTypes", buf, 2u);
    }
    goto LABEL_14;
  }
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
LABEL_14:

    goto LABEL_19;
  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v36 = buf;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__144;
    v39 = __Block_byref_object_dispose__144;
    v40 = 0;
    v10 = dispatch_group_create();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v6;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "unsignedIntegerValue");
          dispatch_group_enter(v10);
          learnedLocationManager = self->_learnedLocationManager;
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __74__RTTransitMetricManager__fetchLocationsOfInterestWithPlaceTypes_handler___block_invoke;
          v26[3] = &unk_1E9297060;
          v30 = buf;
          v27 = v9;
          v28 = v14;
          v29 = v10;
          -[RTLearnedLocationManager fetchLocationsOfInterestWithPlaceType:handler:](learnedLocationManager, "fetchLocationsOfInterestWithPlaceType:handler:", v15, v26);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
      }
      while (v11);
    }

    -[RTTransitMetricManager queue](self, "queue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__RTTransitMetricManager__fetchLocationsOfInterestWithPlaceTypes_handler___block_invoke_2;
    block[3] = &unk_1E92A40F0;
    v25 = buf;
    v23 = v9;
    v24 = v8;
    v18 = v9;
    dispatch_group_notify(v10, v17, block);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v8[2](v8, MEMORY[0x1E0C9AA70], 0);
  }
LABEL_19:

}

void __74__RTTransitMetricManager__fetchLocationsOfInterestWithPlaceTypes_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_QWORD *)(v7 + 40))
  {
    v8 = v5;
    v9 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }
  else
  {
    _RTSafeArray();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _RTMultiErrorCreate();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  if (objc_msgSend(v13, "count"))
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v13, *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __74__RTTransitMetricManager__fetchLocationsOfInterestWithPlaceTypes_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v3 = a1 + 40;
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 8) + 8) + 40))
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32));
}

- (void)_performAnalyticsWitHomeLOIs:(id)a3 workLOIs:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  dispatch_semaphore_t v9;
  id v10;
  void *v11;
  RTLearnedLocationStore *learnedLocationStore;
  void *v13;
  void *v14;
  void *v15;
  RTLearnedLocationStore *v16;
  NSObject *v17;
  void *v18;
  dispatch_time_t v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  char v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  void *v49;
  double v50;
  NSObject *v51;
  id v52;
  id v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  RTTransitMetricPeriod *v81;
  NSObject *v82;
  uint64_t v83;
  id v84;
  void *v85;
  id v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  dispatch_semaphore_t v90;
  RTLearnedLocationStore *v91;
  NSObject *v92;
  void *v93;
  dispatch_time_t v94;
  void *v95;
  double v96;
  double v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  NSObject *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  char v108;
  id v109;
  NSObject *v110;
  uint64_t v111;
  id v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  void *v118;
  dispatch_semaphore_t v119;
  RTLearnedLocationStore *v120;
  NSObject *v121;
  void *v122;
  dispatch_time_t v123;
  void *v124;
  double v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  NSObject *v132;
  void *v133;
  void *v134;
  void *v135;
  id v136;
  char v137;
  uint64_t v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  uint64_t (*v144)(uint64_t, uint64_t);
  void *v145;
  uint64_t v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  id v156;
  uint64_t (*v157)(uint64_t, uint64_t);
  id v158;
  id v159;
  id v160;
  void (**v161)(void);
  void *v162;
  void *v163;
  id v164;
  id v165;
  id v166;
  uint64_t v167;
  NSObject *v168;
  uint64_t v169;
  id obj;
  id obja;
  void *v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  NSObject *dsema;
  void *v182;
  _QWORD v183[5];
  NSObject *v184;
  id v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  _QWORD v190[4];
  id v191;
  RTTransitMetricManager *v192;
  id v193;
  id v194;
  id v195;
  _QWORD v196[4];
  NSObject *v197;
  _BYTE *v198;
  uint64_t *v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  _QWORD v204[4];
  NSObject *v205;
  uint64_t *v206;
  uint64_t *v207;
  uint64_t v208;
  id *v209;
  uint64_t v210;
  uint64_t (*v211)(uint64_t, uint64_t);
  void (*v212)(uint64_t);
  id v213;
  uint64_t v214;
  uint64_t *v215;
  uint64_t v216;
  uint64_t (*v217)(uint64_t, uint64_t);
  void (*v218)(uint64_t);
  id v219;
  _BYTE v220[128];
  _BYTE v221[12];
  __int16 v222;
  id v223;
  _BYTE buf[24];
  uint64_t (*v225)(uint64_t, uint64_t);
  _BYTE v226[20];
  __int16 v227;
  id v228;
  __int16 v229;
  uint64_t v230;
  _BYTE v231[128];
  _QWORD v232[3];
  _QWORD v233[4];

  v233[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v161 = (void (**)(void))a5;
  v177 = v7;
  v172 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: homeLois", buf, 2u);
    }
    goto LABEL_32;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workLois", buf, 2u);
    }
    goto LABEL_32;
  }
  if (!objc_msgSend(v7, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: homeLois.count>0", buf, 2u);
    }
    goto LABEL_32;
  }
  if (!objc_msgSend(v8, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: workLois.count>0", buf, 2u);
    }
    goto LABEL_32;
  }
  if (!v161)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
LABEL_32:

    goto LABEL_109;
  }
  v214 = 0;
  v215 = &v214;
  v216 = 0x3032000000;
  v217 = __Block_byref_object_copy__144;
  v218 = __Block_byref_object_dispose__144;
  v219 = 0;
  v208 = 0;
  v209 = (id *)&v208;
  v210 = 0x3032000000;
  v211 = __Block_byref_object_copy__144;
  v212 = __Block_byref_object_dispose__144;
  v213 = 0;
  v9 = dispatch_semaphore_create(0);
  -[RTLearnedLocationStore predicateForObjectsFromCurrentDevice](self->_learnedLocationStore, "predicateForObjectsFromCurrentDevice");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationStore predicateForCompleteVisits](self->_learnedLocationStore, "predicateForCompleteVisits");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:", v153, v11);

  learnedLocationStore = self->_learnedLocationStore;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLearnedLocationStore predicateForVisitsFromEntryDate:exitDate:](learnedLocationStore, "predicateForVisitsFromEntryDate:exitDate:", v153, v13);
  v149 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB3528];
  v232[0] = v151;
  v232[1] = v150;
  v232[2] = v149;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v232, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = self->_learnedLocationStore;
  v204[0] = MEMORY[0x1E0C809B0];
  v204[1] = 3221225472;
  v204[2] = __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke;
  v204[3] = &unk_1E9296EE0;
  v206 = &v214;
  v207 = &v208;
  v17 = v9;
  v205 = v17;
  -[RTLearnedLocationStore fetchVisitsWithPredicate:handler:](v16, "fetchVisitsWithPredicate:handler:", v148, v204);
  dsema = v17;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v19))
    goto LABEL_23;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceDate:", v18);
  v22 = v21;
  v23 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_112);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "filteredArrayUsingPredicate:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "submitToCoreAnalytics:type:duration:", v27, 1, v22);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v29 = (void *)MEMORY[0x1E0CB35C8];
  *(_QWORD *)v221 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v221, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = objc_retainAutorelease(v31);

    v33 = 0;
  }
  else
  {
LABEL_23:
    v32 = 0;
    v33 = 1;
  }

  v147 = v32;
  if ((v33 & 1) == 0)
    objc_storeStrong(v209 + 5, v32);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v36 = objc_msgSend((id)v215[5], "count");
    v37 = v209[5];
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v37;
    _os_log_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_INFO, "TransitMetrics, %lu visits on current device, error, %@", buf, 0x16u);
  }

  if (v209[5])
  {
    v161[2]();
    goto LABEL_108;
  }
  objc_msgSend((id)v215[5], "lastObject");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "exitDate");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v215[5], "firstObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "entryDate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "timeIntervalSinceDate:", v41);
  v43 = v42;

  v146 = (uint64_t)(v43 / 86400.0);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    v138 = objc_msgSend((id)v215[5], "count");
    objc_msgSend((id)v215[5], "firstObject");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "entryDate");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "stringFromDate");
    v141 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v215[5], "lastObject");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "exitDate");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "stringFromDate");
    v144 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "stringFromDate");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = v138;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v141;
    *(_WORD *)&buf[22] = 2112;
    v225 = v144;
    *(_WORD *)v226 = 2048;
    *(_QWORD *)&v226[2] = (uint64_t)(v43 / 86400.0);
    *(_WORD *)&v226[10] = 2112;
    *(_QWORD *)&v226[12] = v145;
    _os_log_debug_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_DEBUG, "TransitMetrics, visits, %lu, startDate, %@, endDate, %@, duration, %lu, stats.startDate, %@", buf, 0x34u);

  }
  v162 = (void *)objc_opt_new();
  v202 = 0u;
  v203 = 0u;
  v200 = 0u;
  v201 = 0u;
  obj = (id)v215[5];
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v200, v231, 16);
  if (!v45)
  {
    v178 = 0;
    v179 = 0;
    v182 = 0;
    goto LABEL_77;
  }
  v46 = 0;
  v178 = 0;
  v179 = 0;
  v182 = 0;
  v173 = *(_QWORD *)v201;
  do
  {
    v175 = v45;
    for (i = 0; i != v175; ++i)
    {
      if (*(_QWORD *)v201 != v173)
        objc_enumerationMutation(obj);
      v48 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * i);
      if (-[RTTransitMetricManager isOverlappedVisit:locationsOfInterest:](self, "isOverlappedVisit:locationsOfInterest:", v48, v177))
      {
        if (v46 == 2)
        {
          objc_msgSend(v48, "entryDate");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "timeIntervalSinceDate:", v178);
          if (v50 >= 900.0)
          {
            objc_msgSend(v178, "dateByAddingTimeInterval:", 300.0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            if (v58)
            {
              objc_msgSend(v178, "dateByAddingTimeInterval:", 300.0);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "earlierDate:", v182);
              v168 = objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v168 = v182;
            }

            objc_msgSend(v49, "dateByAddingTimeInterval:", -300.0);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            if (v64)
            {
              objc_msgSend(v49, "dateByAddingTimeInterval:", -300.0);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "laterDate:", v179);
              v166 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v166 = v179;
            }

            objc_msgSend(v48, "entryDate");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "dateByAddingTimeInterval:", 300.0);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (v67)
            {
              objc_msgSend(v48, "entryDate");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "dateByAddingTimeInterval:", 300.0);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "exitDate");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "dateByAddingTimeInterval:", -300.0);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "earlierDate:", v71);
              v164 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(v48, "exitDate");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "dateByAddingTimeInterval:", -300.0);
              v164 = (id)objc_claimAutoreleasedReturnValue();
            }

            objc_msgSend(v48, "entryDate");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "dateByAddingTimeInterval:", 300.0);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            if (v73)
            {
              objc_msgSend(v48, "entryDate");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "dateByAddingTimeInterval:", 300.0);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "exitDate");
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "dateByAddingTimeInterval:", -300.0);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "laterDate:", v77);
              v78 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(v48, "exitDate");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "dateByAddingTimeInterval:", -300.0);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
            }

            v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v168, v166);
            v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v164, v78);
            v81 = -[RTTransitMetricPeriod initWithJourneyPeriod:homeStayPeriod:]([RTTransitMetricPeriod alloc], "initWithJourneyPeriod:homeStayPeriod:", v79, v80);
            objc_msgSend(v162, "addObject:", v81);

            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
            {
              -[NSObject stringFromDate](v168, "stringFromDate");
              v84 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v166, "stringFromDate");
              v159 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v164, "stringFromDate");
              v157 = (uint64_t (*)(uint64_t, uint64_t))(id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "stringFromDate");
              v156 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "entryDate");
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "stringFromDate");
              v155 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "exitDate");
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v154, "stringFromDate");
              v86 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v178, "stringFromDate");
              v87 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413826;
              *(_QWORD *)&buf[4] = v84;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v159;
              *(_WORD *)&buf[22] = 2112;
              v225 = v157;
              *(_WORD *)v226 = 2112;
              *(_QWORD *)&v226[2] = v156;
              *(_WORD *)&v226[10] = 2112;
              *(_QWORD *)&v226[12] = v155;
              v227 = 2112;
              v228 = v86;
              v229 = 2112;
              v152 = (void *)v87;
              v230 = v87;
              _os_log_debug_impl(&dword_1D1A22000, v82, OS_LOG_TYPE_DEBUG, "TransitMetrics, create journey, startDate, %@, endDate, %@, home.entryDate.adjusted, %@, home.exitDate.adjusted, %@, home.entryDate, %@, home.exitDate, %@, home.prevExitDate, %@", buf, 0x48u);

            }
            v51 = v168;
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v178, "stringFromDate");
              v52 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "stringFromDate");
              v53 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "timeIntervalSinceDate:", v178);
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v52;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v53;
              *(_WORD *)&buf[22] = 2048;
              v225 = v54;
              _os_log_debug_impl(&dword_1D1A22000, v51, OS_LOG_TYPE_DEBUG, "TransitMetrics, pass journey, startDate, %@, endDate, %@, interval, %f", buf, 0x20u);

            }
          }

        }
        objc_msgSend(v48, "exitDate");
        v83 = objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v57 = 0;
        v62 = v178;
        v46 = 1;
        v178 = (void *)v83;
        goto LABEL_71;
      }
      if (!-[RTTransitMetricManager isOverlappedVisit:locationsOfInterest:](self, "isOverlappedVisit:locationsOfInterest:", v48, v172))continue;
      if (v46 == 1)
        v46 = 2;
      objc_msgSend(v48, "entryDate");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v55)
      {
        objc_msgSend(v48, "entryDate");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "earlierDate:", v182);
        v57 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v57 = (uint64_t)v182;
      }

      objc_msgSend(v48, "exitDate");
      v60 = objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        objc_msgSend(v48, "exitDate");
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v182, "laterDate:", v179);
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = v179;
        v179 = (void *)v60;
LABEL_71:

        v63 = v179;
        v179 = (void *)v61;
        goto LABEL_72;
      }
      v63 = 0;
LABEL_72:

      v182 = (void *)v57;
    }
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v200, v231, 16);
  }
  while (v45);
LABEL_77:

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v88 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
  {
    v89 = objc_msgSend(v162, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v89;
    _os_log_impl(&dword_1D1A22000, v88, OS_LOG_TYPE_INFO, "TransitMetrics, journeys, %lu", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v225 = __Block_byref_object_copy__144;
  *(_QWORD *)v226 = __Block_byref_object_dispose__144;
  *(_QWORD *)&v226[8] = 0;
  v90 = dispatch_semaphore_create(0);

  v91 = self->_learnedLocationStore;
  v196[0] = MEMORY[0x1E0C809B0];
  v196[1] = 3221225472;
  v196[2] = __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke_40;
  v196[3] = &unk_1E9296EE0;
  v198 = buf;
  v199 = &v208;
  v92 = v90;
  v197 = v92;
  -[RTLearnedLocationStore fetchDevicesNotFromCurrentDeviceWithHandler:](v91, "fetchDevicesNotFromCurrentDeviceWithHandler:", v196);
  dsema = v92;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v94))
    goto LABEL_84;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "timeIntervalSinceDate:", v93);
  v97 = v96;
  v98 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_112);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "filteredArrayUsingPredicate:", v99);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "firstObject");
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v98, "submitToCoreAnalytics:type:duration:", v102, 1, v97);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v103 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v221 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v103, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v221, 2u);
  }

  v104 = (void *)MEMORY[0x1E0CB35C8];
  v233[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v221 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v221, v233, 1);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    v107 = objc_retainAutorelease(v106);

    v108 = 0;
  }
  else
  {
LABEL_84:
    v108 = 1;
    v107 = v147;
  }

  v109 = v107;
  if ((v108 & 1) == 0)
    objc_storeStrong(v209 + 5, v107);
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v110 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
  {
    v111 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
    v112 = v209[5];
    *(_DWORD *)v221 = 134218242;
    *(_QWORD *)&v221[4] = v111;
    v222 = 2112;
    v223 = v112;
    _os_log_impl(&dword_1D1A22000, v110, OS_LOG_TYPE_INFO, "TransitMetrics, devices, %lu, error, %@", v221, 0x16u);
  }

  if (v209[5])
  {
    v161[2]();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v190[0] = MEMORY[0x1E0C809B0];
    v190[1] = 3221225472;
    v190[2] = __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke_42;
    v190[3] = &unk_1E92A4118;
    v158 = v162;
    v191 = v158;
    v192 = self;
    v193 = v172;
    v194 = v177;
    v160 = v113;
    v195 = v160;
    v174 = (void *)MEMORY[0x1D8232094](v190);
    v188 = 0u;
    v189 = 0u;
    v186 = 0u;
    v187 = 0u;
    v165 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v114 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v186, v220, 16);
    if (v114)
    {
      obja = *(id *)v187;
      v167 = *MEMORY[0x1E0D18598];
      v169 = *MEMORY[0x1E0CB2D50];
      do
      {
        v176 = v114;
        v115 = 0;
        v116 = v109;
        do
        {
          if (*(id *)v187 != obja)
            objc_enumerationMutation(v165);
          v117 = *(_QWORD *)(*((_QWORD *)&v186 + 1) + 8 * v115);
          v118 = (void *)MEMORY[0x1D8231EA8]();
          v119 = dispatch_semaphore_create(0);

          v120 = self->_learnedLocationStore;
          v183[0] = MEMORY[0x1E0C809B0];
          v183[1] = 3221225472;
          v183[2] = __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke_44;
          v183[3] = &unk_1E92A3A20;
          v183[4] = v117;
          v185 = v174;
          v121 = v119;
          v184 = v121;
          -[RTLearnedLocationStore fetchVisitsWithDevice:dateInterval:handler:](v120, "fetchVisitsWithDevice:dateInterval:handler:", v117, v163, v183);
          dsema = v121;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(dsema, v123))
            goto LABEL_101;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "timeIntervalSinceDate:", v122);
          v126 = v125;
          v127 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_112);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "filteredArrayUsingPredicate:", v128);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "firstObject");
          v131 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v127, "submitToCoreAnalytics:type:duration:", v131, 1, v126);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v132 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v132, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)v221 = 0;
            _os_log_fault_impl(&dword_1D1A22000, v132, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v221, 2u);
          }

          v133 = (void *)MEMORY[0x1E0CB35C8];
          v233[0] = v169;
          *(_QWORD *)v221 = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v221, v233, 1);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "errorWithDomain:code:userInfo:", v167, 15, v134);
          v135 = (void *)objc_claimAutoreleasedReturnValue();

          if (v135)
          {
            v136 = objc_retainAutorelease(v135);

            v137 = 0;
          }
          else
          {
LABEL_101:
            v137 = 1;
            v136 = v116;
          }

          v109 = v136;
          if ((v137 & 1) == 0)
            objc_storeStrong(v209 + 5, v136);

          objc_autoreleasePoolPop(v118);
          ++v115;
          v116 = v109;
        }
        while (v176 != v115);
        v114 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v186, v220, 16);
      }
      while (v114);
    }

    -[RTTransitMetricManager _sendMetricsWithDevices:counts:primaryDeviceJourneyCount:metricDurationDays:](self, "_sendMetricsWithDevices:counts:primaryDeviceJourneyCount:metricDurationDays:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v160, objc_msgSend(v158, "count"), v146);
    ((void (*)(void (**)(void), _QWORD))v161[2])(v161, 0);

  }
  _Block_object_dispose(buf, 8);

  v147 = v109;
LABEL_108:

  _Block_object_dispose(&v208, 8);
  _Block_object_dispose(&v214, 8);

LABEL_109:
}

void __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke_40(uint64_t a1, void *a2, void *a3)
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

void __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  __int128 v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  id v37;
  id obj;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  void *v50;
  char v51;
  void *v52;
  NSObject *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v37 = a2;
  v46 = a3;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = *(id *)(a1 + 32);
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  if (v47)
  {
    v45 = *(_QWORD *)v59;
    *(_QWORD *)&v5 = 138412546;
    v36 = v5;
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v59 != v45)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v53 = v46;
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
        if (!v8)
        {
LABEL_29:

          continue;
        }
        v9 = v8;
        v48 = i;
        v49 = 0;
        v51 = 0;
        v10 = *(_QWORD *)v55;
        do
        {
          for (j = 0; j != v9; ++j)
          {
            if (*(_QWORD *)v55 != v10)
              objc_enumerationMutation(v53);
            v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * j);
            if (objc_msgSend(v7, "travelTogether:", v12, v36)
              && objc_msgSend(*(id *)(a1 + 40), "isOverlappedVisit:locationsOfInterest:", v12, *(_QWORD *)(a1 + 48)))
            {
              _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v12, "entryDate");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "stringFromDate");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "exitDate");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "stringFromDate");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "location");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "location");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "latitude");
                v21 = v20;
                objc_msgSend(v12, "location");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "location");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "longitude");
                *(_DWORD *)buf = 138413058;
                v63 = v18;
                v64 = 2112;
                v65 = (uint64_t)v19;
                v66 = 2048;
                v67 = v21;
                v68 = 2048;
                v69 = v24;
                _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "TransitMetrics, traveled togeter, entryDate, %@, exitDate, %@, lat, %f, lon, %f", buf, 0x2Au);

              }
              v51 = 1;
LABEL_21:

              continue;
            }
            if (objc_msgSend(v7, "stayAtHomeTogether:", v12)
              && objc_msgSend(*(id *)(a1 + 40), "isOverlappedVisit:locationsOfInterest:", v12, *(_QWORD *)(a1 + 56)))
            {
              _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v12, "entryDate");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "stringFromDate");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "exitDate");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "stringFromDate");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "location");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "location");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "latitude");
                v28 = v27;
                objc_msgSend(v12, "location");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "location");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "longitude");
                *(_DWORD *)buf = 138413058;
                v63 = v25;
                v64 = 2112;
                v65 = (uint64_t)v26;
                v66 = 2048;
                v67 = v28;
                v68 = 2048;
                v69 = v31;
                _os_log_debug_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_DEBUG, "TransitMetrics, stayed at home togeter, entryDate, %@, exitDate, %@, lat, %f, lon, %f", buf, 0x2Au);

              }
              v49 = 1;
              goto LABEL_21;
            }
            objc_msgSend(v12, "entryDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "homeStayPeriod");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "endDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v14, "isAfterDate:", v16);

            if ((v17 & 1) != 0)
              goto LABEL_25;
          }
          v9 = -[NSObject countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
        }
        while (v9);
LABEL_25:

        i = v48;
        if ((v51 & 1) != 0 && (v49 & 1) != 0)
        {
          v32 = *(void **)(a1 + 64);
          objc_msgSend(v37, "identifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v33);

          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v37, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(*(id *)(a1 + 64), "count");
            *(_DWORD *)buf = v36;
            v63 = v34;
            v64 = 2048;
            v65 = v35;
            _os_log_debug_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_DEBUG, "TransitMetrics, carrying device, identifier, %@, all devices, %lu", buf, 0x16u);

          }
          goto LABEL_29;
        }
      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    }
    while (v47);
  }

}

void __72__RTTransitMetricManager__performAnalyticsWitHomeLOIs_workLOIs_handler___block_invoke_44(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2048;
    v11 = objc_msgSend(v5, "count");
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "TransitMetrics, device, %@, visits, %lu", (uint8_t *)&v8, 0x16u);

  }
  if (!a3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_sendMetricsWithDevices:(id)a3 counts:(id)a4 primaryDeviceJourneyCount:(int64_t)a5 metricDurationDays:(int64_t)a6
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  const char *v55;
  id v56;
  id obj;
  NSObject *log;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int64_t v63;
  uint64_t v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[6];
  _QWORD v77[6];
  _QWORD v78[8];
  _QWORD v79[8];
  uint8_t buf[4];
  int64_t v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  __int16 v94;
  int64_t v95;
  _BYTE v96[128];
  void *v97;
  _QWORD v98[2];
  _QWORD v99[2];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    log = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v55 = "Invalid parameter not satisfying: devices";
LABEL_29:
    _os_log_error_impl(&dword_1D1A22000, log, OS_LOG_TYPE_ERROR, v55, buf, 2u);
    goto LABEL_27;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    log = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v55 = "Invalid parameter not satisfying: counts";
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  log = objc_claimAutoreleasedReturnValue();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v56 = v7;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v72, v100, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v73 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v9, "countForObject:", v16);
        if (v17 >= 1)
        {
          v99[0] = v15;
          v98[0] = CFSTR("device");
          v98[1] = CFSTR("count");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v99[1] = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](log, "addObject:", v19);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v72, v100, 16);
    }
    while (v12);
  }

  v20 = objc_msgSend(v9, "count");
  v63 = -[RTTransitMetricManager decimateInteger:](self, "decimateInteger:", a6);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("count"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject sortedArrayUsingDescriptors:](log, "sortedArrayUsingDescriptors:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v23;
  v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v96, 16);
  if (v61)
  {
    v62 = 0;
    v60 = *(_QWORD *)v69;
    v24 = (double)v20;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v69 != v60)
          objc_enumerationMutation(obj);
        v26 = v62 + v25;
        v66 = v25;
        v27 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v25);
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("device"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("count"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "longValue");
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v28, "identifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "deviceName");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "deviceClass");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "deviceModel");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v29, "longValue");
          *(_DWORD *)buf = 134219778;
          v81 = a6;
          v82 = 2112;
          v83 = v50;
          v84 = 2112;
          v85 = v51;
          v86 = 2112;
          v87 = v52;
          v88 = 2112;
          v89 = v53;
          v90 = 2048;
          v91 = v26;
          v92 = 2048;
          v93 = v54;
          v94 = 2048;
          v95 = a5;
          _os_log_debug_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEBUG, "TransitMetrics, send metrics, duration, %lu, device, %@, deviceName, %@, deviceClass, %@, deviceModel, %@, idx, %lu, carrying count, %lu, journey count, %lu", buf, 0x52u);

        }
        v67 = v29;
        v32 = (double)v30 / (double)a5;

        v78[0] = CFSTR("LOIType");
        v78[1] = CFSTR("ModelType");
        v79[0] = CFSTR("Work");
        v79[1] = CFSTR("Commute");
        v78[2] = CFSTR("DurationBinned");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v63);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v79[2] = v33;
        v78[3] = CFSTR("DeviceType");
        objc_msgSend(v28, "deviceClass");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v79[3] = v34;
        v78[4] = CFSTR("Priority");
        v35 = (void *)MEMORY[0x1E0CB37E8];
        -[RTTransitMetricManager decimateDoulbe:](self, "decimateDoulbe:", (double)(v26 + 1) / v24);
        objc_msgSend(v35, "numberWithDouble:");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v79[4] = v36;
        v78[5] = CFSTR("PriorityBinned");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)((double)(v26 + 1) / v24 * 10.0));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v79[5] = v37;
        v78[6] = CFSTR("ParityRate");
        v38 = (void *)MEMORY[0x1E0CB37E8];
        -[RTTransitMetricManager decimateDoulbe:](self, "decimateDoulbe:", v32);
        objc_msgSend(v38, "numberWithDouble:");
        v39 = v26;
        v40 = v28;
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v79[6] = v41;
        v78[7] = CFSTR("TransitsBinned");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[RTTransitMetricManager decimateInteger:](self, "decimateInteger:", a5));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v79[7] = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 8);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        AnalyticsSendEvent();
        if (!v39)
        {
          v76[0] = CFSTR("LOIType");
          v76[1] = CFSTR("ModelType");
          v77[0] = CFSTR("Work");
          v77[1] = CFSTR("Commute");
          v76[2] = CFSTR("DurationBinned");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v63);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v77[2] = v44;
          v76[3] = CFSTR("DeviceType");
          objc_msgSend(v40, "deviceClass");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v77[3] = v45;
          v76[4] = CFSTR("ParityRate");
          v46 = (void *)MEMORY[0x1E0CB37E8];
          -[RTTransitMetricManager decimateDoulbe:](self, "decimateDoulbe:", v32);
          objc_msgSend(v46, "numberWithDouble:");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v77[4] = v47;
          v76[5] = CFSTR("TransitsBinned");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[RTTransitMetricManager decimateInteger:](self, "decimateInteger:", a5));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v77[5] = v48;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 6);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          AnalyticsSendEvent();
        }

        v25 = v66 + 1;
      }
      while (v61 != v66 + 1);
      v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v96, 16);
      v62 += v25;
    }
    while (v61);
  }

  v7 = v56;
LABEL_27:

}

- (int64_t)decimateInteger:(int64_t)a3
{
  return 5 * (a3 / 5);
}

- (double)decimateDoulbe:(double)a3
{
  return (double)(uint64_t)(a3 * 100.0) / 100.0;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
