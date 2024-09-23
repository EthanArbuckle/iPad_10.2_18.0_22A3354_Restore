@implementation RTVisitLabeler

- (RTVisitLabeler)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_placeInferenceManager_locationManager_wifiManager_);
}

- (RTVisitLabeler)initWithDefaultsManager:(id)a3 placeInferenceManager:(id)a4 locationManager:(id)a5 wifiManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  RTVisitLabeler *v16;
  RTVisitLabeler *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  RTVisitLabeler *v21;
  OS_dispatch_queue *queue;
  uint64_t v24;
  RTTimerManager *timerManager;
  NSMutableArray *v26;
  NSMutableArray *accessPoints;
  id v28;
  dispatch_queue_t v29;
  NSObject *attr;
  RTVisitLabeler *v31;
  objc_super v32;
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
    v20 = "Invalid parameter not satisfying: placeInferenceManager";
    goto LABEL_16;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v20 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_16;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v20 = "Invalid parameter not satisfying: wifiManager";
      goto LABEL_16;
    }
LABEL_17:

    v21 = 0;
    goto LABEL_18;
  }
  v32.receiver = self;
  v32.super_class = (Class)RTVisitLabeler;
  v16 = -[RTVisitLabeler init](&v32, sel_init);
  if (v16)
  {
    v31 = v16;
    v17 = v16;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    attr = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (const char *)-[RTVisitLabeler UTF8String](objc_retainAutorelease(v17), "UTF8String");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v17);
      v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = (const char *)objc_msgSend(v28, "UTF8String");

    }
    v29 = dispatch_queue_create(v18, attr);

    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v29;

    objc_storeStrong((id *)&v17->_defaultsManager, a3);
    objc_storeStrong((id *)&v17->_placeInferenceManager, a4);
    objc_storeStrong((id *)&v17->_wifiManager, a6);
    objc_storeStrong((id *)&v17->_locationManager, a5);
    v24 = objc_opt_new();
    timerManager = v17->_timerManager;
    v17->_timerManager = (RTTimerManager *)v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    accessPoints = v17->_accessPoints;
    v17->_accessPoints = v26;

    *(_WORD *)&v17->_registeredForWifiScan = 0;
    v16 = v31;
  }
  self = v16;
  v21 = self;
LABEL_18:

  return v21;
}

- (BOOL)labelVisit:(id)a3 clientIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  dispatch_time_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char v27;
  id v28;
  BOOL v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  _QWORD v35[4];
  NSObject *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint8_t buf[16];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__10;
  v49 = __Block_byref_object_dispose__10;
  v50 = 0;
  v39 = 0;
  v40 = (id *)&v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__10;
  v43 = __Block_byref_object_dispose__10;
  v44 = 0;
  v9 = dispatch_semaphore_create(0);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __52__RTVisitLabeler_labelVisit_clientIdentifier_error___block_invoke;
  v35[3] = &unk_1E9298640;
  v37 = &v45;
  v38 = &v39;
  v10 = v9;
  v36 = v10;
  -[RTVisitLabeler labelVisit:clientIdentifier:handler:](self, "labelVisit:clientIdentifier:handler:", v7, v8, v35);
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v11, v13))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v12);
  v16 = v15;
  v17 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "filteredArrayUsingPredicate:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "submitToCoreAnalytics:type:duration:", v21, 1, v16);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v23 = (void *)MEMORY[0x1E0CB35C8];
  v51 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v51, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = objc_retainAutorelease(v25);

    v27 = 0;
  }
  else
  {
LABEL_6:
    v26 = 0;
    v27 = 1;
  }

  v28 = v26;
  if ((v27 & 1) == 0)
    objc_storeStrong(v40 + 5, v26);
  if (v40[5]
    || (objc_msgSend((id)v46[5], "placeInference"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        v31 = v30 == 0,
        v30,
        v31))
  {
    v29 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v40[5]);
  }
  else
  {
    objc_msgSend((id)v46[5], "placeInference");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPlaceInference:", v32);

    v29 = 1;
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v29;
}

void __52__RTVisitLabeler_labelVisit_clientIdentifier_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "placeInference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("YES");
    v16 = 138412802;
    if (!v8)
      v9 = CFSTR("NO");
    v17 = v9;
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "labeled visit, %@, %@, error, %@", (uint8_t *)&v16, 0x20u);

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;
  v12 = v5;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v6;
  v15 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)labelVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, id, void *);
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, id, void *))a5;
  switch(objc_msgSend(v9, "source"))
  {
    case 0:
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v22;
        v30 = 2048;
        v31 = objc_msgSend(v9, "source");
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@, unsupported visit source, %lu", buf, 0x16u);

      }
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported visit source."), *MEMORY[0x1E0CB2D50]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v15;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = &v25;
      v18 = &v24;
      goto LABEL_10;
    case 1:
      -[RTVisitLabeler labelConstantMonitorVisit:clientIdentifier:handler:](self, "labelConstantMonitorVisit:clientIdentifier:handler:", v9, v10, v11);
      break;
    case 2:
      -[RTVisitLabeler labelEventMonitorVisit:clientIdentifier:handler:](self, "labelEventMonitorVisit:clientIdentifier:handler:", v9, v10, v11);
      break;
    case 3:
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v23;
        v30 = 2048;
        v31 = objc_msgSend(v9, "source");
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@, unsupported visit source, %lu", buf, 0x16u);

      }
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D18598];
      v26 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported visit source."));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v15;
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = &v27;
      v18 = &v26;
LABEL_10:
      objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 1, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v11[2](v11, v9, v21);
      break;
    default:
      break;
  }

}

- (void)labelConstantMonitorVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
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
  -[RTVisitLabeler queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__RTVisitLabeler_labelConstantMonitorVisit_clientIdentifier_handler___block_invoke;
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

uint64_t __69__RTVisitLabeler_labelConstantMonitorVisit_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_labelConstantMonitorVisit:clientIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_labelConstantMonitorVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  CLLocationDegrees v13;
  void *v14;
  CLLocationDegrees v15;
  CLLocationCoordinate2D v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  uint64_t v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v39 = a5;
  v8 = (objc_class *)MEMORY[0x1E0C9E3B8];
  v9 = a4;
  v10 = [v8 alloc];
  objc_msgSend(v7, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "latitude");
  v13 = v12;
  objc_msgSend(v7, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "longitude");
  v16 = CLLocationCoordinate2DMake(v13, v15);
  objc_msgSend(v7, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "altitude");
  v19 = v18;
  objc_msgSend(v7, "location");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "horizontalUncertainty");
  v22 = v21;
  objc_msgSend(v7, "location");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "verticalUncertainty");
  v25 = v24;
  objc_msgSend(v7, "location");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "date");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v10, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v27, v16.latitude, v16.longitude, v19, v22, v25);

  v29 = objc_alloc(MEMORY[0x1E0D18428]);
  v49[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithFidelityPolicy:locations:accessPoints:clientIdentifier:", 0, v30, MEMORY[0x1E0C9AA60], v9);

  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v44 = v33;
    v45 = 2112;
    v46 = v7;
    v47 = 2048;
    v48 = 0;
    _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "%@ , visit, %@, fidelity policy, %lu", buf, 0x20u);

  }
  -[RTVisitLabeler placeInferenceManager](self, "placeInferenceManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __70__RTVisitLabeler__labelConstantMonitorVisit_clientIdentifier_handler___block_invoke;
  v40[3] = &unk_1E9297EE0;
  v41 = v7;
  v42 = v39;
  v35 = v39;
  v36 = v7;
  objc_msgSend(v34, "fetchPlaceInferencesForOptions:handler:", v31, v40);

}

void __70__RTVisitLabeler__labelConstantMonitorVisit_clientIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  double v18;
  double v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(v4, "count");
    *(_DWORD *)buf = 138412802;
    v31 = v7;
    v32 = 2048;
    v33 = v8;
    v34 = 2112;
    v35 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "label visit, %@, %lu possible placeInferences to choose from, error, %@", buf, 0x20u);
  }

  if (!v5 && objc_msgSend(v4, "count"))
  {
    v23 = v4;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v26;
      v14 = -1.0;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218242;
            v31 = v12 + i + 1;
            v32 = 2112;
            v33 = (uint64_t)v16;
            _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "placeInference candidate %lu, %@", buf, 0x16u);
          }

          objc_msgSend(v16, "confidence");
          if (v18 > v14)
          {
            objc_msgSend(*(id *)(a1 + 32), "setPlaceInference:", v16);
            objc_msgSend(v16, "confidence");
            v14 = v19;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        v12 += i;
      }
      while (v11);
    }

    objc_msgSend(*(id *)(a1 + 32), "placeInference");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = 0;
    v4 = v23;
    if (v20)
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v31 = v22;
        _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "selected placeInference for visit, %@", buf, 0xCu);
      }

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)labelEventMonitorVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
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
  -[RTVisitLabeler queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__RTVisitLabeler_labelEventMonitorVisit_clientIdentifier_handler___block_invoke;
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

uint64_t __66__RTVisitLabeler_labelEventMonitorVisit_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_labelEventMonitorVisit:clientIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_labelEventMonitorVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, id, _QWORD);
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  RTVisitLabeler *v27;
  id v28;
  id v29;
  void (**v30)(id, id, _QWORD);
  _QWORD *v31;
  SEL v32;
  _QWORD v33[5];
  RTPowerAssertion *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, id, _QWORD))a5;
  -[RTVisitLabeler setWifiScanTimerFireCount:](self, "setWifiScanTimerFireCount:", 0);
  NSStringFromSelector(a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__10;
  v33[4] = __Block_byref_object_dispose__10;
  v34 = -[RTPowerAssertion initWithIdentifier:timeout:]([RTPowerAssertion alloc], "initWithIdentifier:timeout:", v12, 21.0);
  if (-[RTVisitLabeler collectingWiFiScans](self, "collectingWiFiScans"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v14;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, already collecting wifi scans", buf, 0xCu);

    }
    v11[2](v11, v9, 0);
  }
  else
  {
    -[RTVisitLabeler setCollectingWiFiScans:](self, "setCollectingWiFiScans:", 1);
    -[RTVisitLabeler timerManager](self, "timerManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitLabeler queue](self, "queue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __67__RTVisitLabeler__labelEventMonitorVisit_clientIdentifier_handler___block_invoke;
    v26 = &unk_1E9298690;
    v32 = a2;
    v27 = self;
    v28 = v9;
    v29 = v10;
    v31 = v33;
    v30 = v11;
    objc_msgSend(v15, "timerWithIdentifier:queue:handler:", CFSTR("com.apple.routined.visit.wifiscan.delaytimer"), v16, &v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitLabeler setWifiScanDelayTimer:](self, "setWifiScanDelayTimer:", v17, v23, v24, v25, v26, v27);

    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      -[RTVisitLabeler wifiScanDelayTimer](self, "wifiScanDelayTimer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = v19;
      v37 = 2112;
      v38 = v20;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%@, wifiScanDelayTimer start, %@", buf, 0x16u);

    }
    -[RTVisitLabeler wifiScanDelayTimer](self, "wifiScanDelayTimer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fireAfterDelay:", 10.0);

    -[RTVisitLabeler wifiScanDelayTimer](self, "wifiScanDelayTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "resume");

  }
  _Block_object_dispose(v33, 8);

}

void __67__RTVisitLabeler__labelEventMonitorVisit_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  _QWORD v12[5];
  __int128 v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "wifiScanDelayTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v3;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, wifiScanDelayTimer expiry, %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "wifiScanDelayTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "setWifiScanDelayTimer:", 0);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__RTVisitLabeler__labelEventMonitorVisit_clientIdentifier_handler___block_invoke_22;
  v12[3] = &unk_1E9298668;
  v9 = *(_QWORD *)(a1 + 72);
  v11 = *(_OWORD *)(a1 + 56);
  v12[4] = v6;
  v14 = v9;
  v10 = (id)v11;
  v13 = v11;
  objc_msgSend(v6, "_collectWiFiScansAndLabelVisit:clientIdentifier:maxRetries:handler:", v7, v8, 1, v12);

}

void __67__RTVisitLabeler__labelEventMonitorVisit_clientIdentifier_handler___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  int v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 32), "setCollectingWiFiScans:", 0);
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeInference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("YES");
    v13 = 138413058;
    v14 = v10;
    if (!v11)
      v12 = CFSTR("NO");
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, label visit, %@, returned visit, %@, error, %@", (uint8_t *)&v13, 0x2Au);

  }
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5);

}

- (void)_collectWiFiScansAndLabelVisit:(id)a3 clientIdentifier:(id)a4 maxRetries:(unint64_t)a5 handler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  char *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  RTVisitLabeler *v28;
  id v29;
  id v30;
  id v31;
  id v32[3];
  id location;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v13)
  {
    -[RTVisitLabeler wifiScanTimer](self, "wifiScanTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[RTVisitLabeler _collectWiFiScansAndLabelVisit:clientIdentifier:maxRetries:handler:]";
        v36 = 1024;
        v37 = 271;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Wifi scan timer already started - should not happen. (in %s:%d)", buf, 0x12u);
      }

    }
    objc_initWeak(&location, self);
    -[RTVisitLabeler timerManager](self, "timerManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitLabeler queue](self, "queue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __85__RTVisitLabeler__collectWiFiScansAndLabelVisit_clientIdentifier_maxRetries_handler___block_invoke;
    v27 = &unk_1E92986E0;
    v32[1] = (id)a2;
    v28 = self;
    objc_copyWeak(v32, &location);
    v29 = v11;
    v30 = v12;
    v32[2] = (id)a5;
    v31 = v13;
    objc_msgSend(v16, "timerWithIdentifier:queue:handler:", CFSTR("com.apple.routined.visit.wifiscan.timer"), v17, &v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitLabeler setWifiScanTimer:](self, "setWifiScanTimer:", v18, v24, v25, v26, v27, v28);

    -[RTVisitLabeler setRegisteredForWifiScan:](self, "setRegisteredForWifiScan:", 1);
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v20;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "%@, request wifi scan", buf, 0xCu);

    }
    -[RTVisitLabeler wifiManager](self, "wifiManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scheduleActiveScan");

    -[RTVisitLabeler wifiScanTimer](self, "wifiScanTimer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fireAfterDelay:", 5.0);

    -[RTVisitLabeler wifiScanTimer](self, "wifiScanTimer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "resume");

    objc_destroyWeak(v32);
    objc_destroyWeak(&location);
  }

}

void __85__RTVisitLabeler__collectWiFiScansAndLabelVisit_clientIdentifier_maxRetries_handler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];
  id v11;
  id v12;
  id v13;
  __int128 *p_buf;
  _QWORD *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  __int128 buf;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "%@, wifi scan timer expiry", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "wifiManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelScan");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "wifiScanTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  objc_msgSend(WeakRetained, "setWifiScanTimer:", 0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__10;
  v22 = __Block_byref_object_dispose__10;
  v23 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__10;
  v17[4] = __Block_byref_object_dispose__10;
  v18 = 0;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __85__RTVisitLabeler__collectWiFiScansAndLabelVisit_clientIdentifier_maxRetries_handler___block_invoke_23;
  v10[3] = &unk_1E92986B8;
  v9 = *(_QWORD *)(a1 + 80);
  v10[4] = *(_QWORD *)(a1 + 32);
  p_buf = &buf;
  v15 = v17;
  v16 = v9;
  v13 = *(id *)(a1 + 56);
  v10[5] = WeakRetained;
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(WeakRetained, "_processVisit:clientIdentifier:handler:", v7, v8, v10);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&buf, 8);

}

void __85__RTVisitLabeler__collectWiFiScansAndLabelVisit_clientIdentifier_maxRetries_handler___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "placeInference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    v11 = objc_msgSend(*(id *)(a1 + 32), "wifiScanTimerFireCount");
    v15 = 138413058;
    v16 = v10;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    v21 = 2048;
    v22 = v11;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "label visit, %@, returned visit, %@, error, %@, wifi scan timer fire count, %lu", (uint8_t *)&v15, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "accessPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  objc_msgSend(v6, "placeInference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {

LABEL_12:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a3);
    objc_msgSend(*(id *)(a1 + 32), "setRegisteredForWifiScan:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_13;
  }
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "wifiScanTimerFireCount") >= *(_QWORD *)(a1 + 88))
    goto LABEL_12;
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "wifiScanTimerFireCount") < *(_QWORD *)(a1 + 88))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "placeInference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "setWifiScanTimerFireCount:", objc_msgSend(*(id *)(a1 + 32), "wifiScanTimerFireCount") + 1);
      objc_msgSend(*(id *)(a1 + 40), "_collectWiFiScansAndLabelVisit:clientIdentifier:maxRetries:handler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 64));
    }
  }
LABEL_13:

}

- (void)_processVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  double v12;
  CLLocationDegrees v13;
  void *v14;
  CLLocationDegrees v15;
  CLLocationCoordinate2D v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  _QWORD v52[5];
  id v53;
  id v54;
  id v55;
  SEL v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  unint64_t v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v50 = a5;
  v9 = (objc_class *)MEMORY[0x1E0C9E3B8];
  v49 = a4;
  v10 = [v9 alloc];
  objc_msgSend(v8, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "latitude");
  v13 = v12;
  objc_msgSend(v8, "location");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "longitude");
  v16 = CLLocationCoordinate2DMake(v13, v15);
  objc_msgSend(v8, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "altitude");
  v19 = v18;
  objc_msgSend(v8, "location");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "horizontalUncertainty");
  v22 = v21;
  objc_msgSend(v8, "location");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "verticalUncertainty");
  v25 = v24;
  objc_msgSend(v8, "location");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "date");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v10, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v27, v16.latitude, v16.longitude, v19, v22, v25);

  v29 = objc_alloc(MEMORY[0x1E0D183B0]);
  objc_msgSend(v28, "coordinate");
  v31 = v30;
  objc_msgSend(v28, "coordinate");
  v33 = v32;
  objc_msgSend(v28, "horizontalAccuracy");
  v35 = v34;
  objc_msgSend(v28, "timestamp");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v29, "initWithLatitude:longitude:horizontalUncertainty:date:", v36, v31, v33, v35);

  v38 = (void *)-[NSMutableArray copy](self->_accessPoints, "copy");
  v39 = objc_alloc(MEMORY[0x1E0D18428]);
  v67[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v48) = 1;
  v41 = (void *)objc_msgSend(v39, "initWithFidelityPolicy:locations:accessPoints:distance:location:startDate:endDate:limit:useBackground:clientIdentifier:", 32, v40, v38, 0, 0, 0, 0.0, -1, v48, v49);

  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v58 = v43;
    v59 = 2112;
    v60 = v28;
    v61 = 2048;
    v62 = objc_msgSend(v38, "count");
    v63 = 2048;
    v64 = 32;
    v65 = 2048;
    v66 = -[RTVisitLabeler wifiScanTimerFireCount](self, "wifiScanTimerFireCount");
    _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_INFO, "%@, location, %@, access point count, %lu, fidelity policy, %lu, _wifiScanTimerFireCount, %lu", buf, 0x34u);

  }
  -[RTVisitLabeler placeInferenceManager](self, "placeInferenceManager");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __57__RTVisitLabeler__processVisit_clientIdentifier_handler___block_invoke;
  v52[3] = &unk_1E92980D8;
  v52[4] = self;
  v53 = v8;
  v54 = v37;
  v55 = v50;
  v56 = a2;
  v45 = v50;
  v46 = v37;
  v47 = v8;
  objc_msgSend(v44, "fetchPlaceInferencesForOptions:handler:", v41, v52);

}

void __57__RTVisitLabeler__processVisit_clientIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__RTVisitLabeler__processVisit_clientIdentifier_handler___block_invoke_2;
  v10[3] = &unk_1E9298128;
  v11 = v6;
  v12 = v5;
  v16 = *(_QWORD *)(a1 + 64);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

void __57__RTVisitLabeler__processVisit_clientIdentifier_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  void *v25;
  double v26;
  id v27;
  double v28;
  double v29;
  id v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v1 = a1;
  v46 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) || !objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v2 = 0;
    goto LABEL_3;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = *(id *)(v1 + 40);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (!v15)
  {
    v2 = 0;
    goto LABEL_29;
  }
  v16 = v15;
  v33 = 0;
  v34 = 0;
  v32 = 0;
  v17 = *(_QWORD *)v36;
  v18 = -1.0;
  v19 = -1.0;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v36 != v17)
        objc_enumerationMutation(v14);
      v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(v1 + 72));
        v23 = v14;
        v24 = v1;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v40 = v25;
        v41 = 2048;
        v42 = v34 + i + 1;
        v43 = 2112;
        v44 = v21;
        _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%@, placeInference candidate %lu, %@", buf, 0x20u);

        v1 = v24;
        v14 = v23;
      }

      if (objc_msgSend(v21, "placeType") == 2)
      {
        objc_msgSend(v21, "confidence");
        if (v26 > v19)
        {
          v27 = v21;

          objc_msgSend(v27, "confidence");
          v19 = v28;
          v33 = v27;
        }
      }
      else if (objc_msgSend(v21, "placeType") == 3)
      {
        objc_msgSend(v21, "confidence");
        if (v29 > v18)
        {
          v30 = v21;

          objc_msgSend(v30, "confidence");
          v18 = v31;
          v32 = v30;
        }
      }
    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    v34 += i;
  }
  while (v16);

  if (v32)
  {
    v14 = v32;

    v2 = v14;
LABEL_29:

    goto LABEL_3;
  }
  v2 = v33;
LABEL_3:
  v3 = objc_alloc(MEMORY[0x1E0D18578]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(v1 + 48), "type");
  v6 = *(_QWORD *)(v1 + 56);
  objc_msgSend(*(id *)(v1 + 48), "entry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 48), "exit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(v1 + 48), "dataPointCount");
  objc_msgSend(*(id *)(v1 + 48), "confidence");
  v10 = (void *)objc_msgSend(v3, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:", v4, v5, v6, v7, v8, v9, v2);

  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(v1 + 72));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v12;
      v41 = 2112;
      v42 = (uint64_t)v10;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, selected placeInference for visit, %@", buf, 0x16u);

    }
  }
  v13 = *(_QWORD *)(v1 + 64);
  if (v13)
    (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v10, *(_QWORD *)(v1 + 32));

}

- (void)onWiFiScanNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTVisitLabeler *v9;

  v4 = a3;
  -[RTVisitLabeler queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__RTVisitLabeler_onWiFiScanNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __41__RTVisitLabeler_onWiFiScanNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "scanResults");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "accessPoints");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v3);

  }
}

- (void)setRegisteredForWifiScan:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_registeredForWifiScan != a3)
  {
    v3 = a3;
    self->_registeredForWifiScan = a3;
    -[RTVisitLabeler wifiManager](self, "wifiManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTWiFiManagerNotificationScanResults, "notificationName");
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:", self, sel_onWiFiScanNotification_, v5);
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObserver:fromNotification:", self, v5);
    }

  }
}

- (void)_findPointOfInterestForVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
{
  id v9;
  void (**v10)(id, id, _QWORD);
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(id, id, _QWORD);
  SEL v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = (void (**)(id, id, _QWORD))a5;
  v11 = a3;
  if (-[RTVisitLabeler collectingWiFiScans](self, "collectingWiFiScans"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, already collecting wifi scans", buf, 0xCu);

    }
    v10[2](v10, v11, 0);

  }
  else
  {
    -[RTVisitLabeler setCollectingWiFiScans:](self, "setCollectingWiFiScans:", 1);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__RTVisitLabeler__findPointOfInterestForVisit_clientIdentifier_handler___block_invoke;
    v14[3] = &unk_1E9298708;
    v14[4] = self;
    v16 = a2;
    v15 = v10;
    -[RTVisitLabeler _collectWiFiScansAndLabelVisit:clientIdentifier:maxRetries:handler:](self, "_collectWiFiScansAndLabelVisit:clientIdentifier:maxRetries:handler:", v11, v9, 0, v14);

  }
}

void __72__RTVisitLabeler__findPointOfInterestForVisit_clientIdentifier_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setCollectingWiFiScans:", 0);
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, labeled visit, %@, error, %@", (uint8_t *)&v9, 0x20u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)findPointOfInterestForVisit:(id)a3 clientIdentifier:(id)a4 handler:(id)a5
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
  -[RTVisitLabeler queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__RTVisitLabeler_findPointOfInterestForVisit_clientIdentifier_handler___block_invoke;
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

uint64_t __71__RTVisitLabeler_findPointOfInterestForVisit_clientIdentifier_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findPointOfInterestForVisit:clientIdentifier:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (RTPlaceInferenceManager)placeInferenceManager
{
  return self->_placeInferenceManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
  objc_storeStrong((id *)&self->_wifiManager, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)accessPoints
{
  return self->_accessPoints;
}

- (void)setAccessPoints:(id)a3
{
  objc_storeStrong((id *)&self->_accessPoints, a3);
}

- (RTTimer)wifiScanTimer
{
  return self->_wifiScanTimer;
}

- (void)setWifiScanTimer:(id)a3
{
  objc_storeStrong((id *)&self->_wifiScanTimer, a3);
}

- (unint64_t)wifiScanTimerFireCount
{
  return self->_wifiScanTimerFireCount;
}

- (void)setWifiScanTimerFireCount:(unint64_t)a3
{
  self->_wifiScanTimerFireCount = a3;
}

- (BOOL)registeredForWifiScan
{
  return self->_registeredForWifiScan;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (RTTimer)wifiScanDelayTimer
{
  return self->_wifiScanDelayTimer;
}

- (void)setWifiScanDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_wifiScanDelayTimer, a3);
}

- (BOOL)collectingWiFiScans
{
  return self->_collectingWiFiScans;
}

- (void)setCollectingWiFiScans:(BOOL)a3
{
  self->_collectingWiFiScans = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiScanDelayTimer, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_wifiScanTimer, 0);
  objc_storeStrong((id *)&self->_accessPoints, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_placeInferenceManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
