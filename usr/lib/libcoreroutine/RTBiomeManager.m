@implementation RTBiomeManager

- (RTBiomeManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAuthorizationManager_dataProtectionManager_defaultsManager_learnedLocationManager_platform_);
}

- (RTBiomeManager)initWithAuthorizationManager:(id)a3 dataProtectionManager:(id)a4 defaultsManager:(id)a5 learnedLocationManager:(id)a6 platform:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  RTBiomeManager *v18;
  id *p_isa;
  RTBiomeManager *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v25;
  id v26;
  objc_super v27;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
  {
    v21 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: authorizationManager";
LABEL_17:
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, v23, buf, 2u);
    goto LABEL_18;
  }
  if (!v14)
  {
    v21 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: dataProtectionManager";
    goto LABEL_17;
  }
  if (!v15)
  {
    v21 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v23 = "Invalid parameter not satisfying: defaultsManager";
    goto LABEL_17;
  }
  if (!v16)
  {
    v21 = v17;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = "Invalid parameter not satisfying: learnedLocationManager";
      goto LABEL_17;
    }
LABEL_18:

    v20 = 0;
    goto LABEL_19;
  }
  v26 = v17;
  if (v17)
  {
    v27.receiver = self;
    v27.super_class = (Class)RTBiomeManager;
    v18 = -[RTNotifier init](&v27, sel_init);
    p_isa = (id *)&v18->super.super.super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_authorizationManager, a3);
      objc_storeStrong(p_isa + 8, a4);
      objc_storeStrong(p_isa + 9, a5);
      objc_storeStrong(p_isa + 11, a6);
      objc_storeStrong(p_isa + 12, a7);
      objc_msgSend(p_isa, "setup");
    }
    self = p_isa;
    v20 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: platform", buf, 2u);
    }

    v20 = 0;
  }
  v21 = v26;
LABEL_19:

  return v20;
}

- (void)_setup
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[RTBiomeManager authorizationManager](self, "authorizationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:", self, sel_onAuthorizationNotification_, v5);

    -[RTBiomeManager dataProtectionManager](self, "dataProtectionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTDataProtectionManagerNotificationEncryptedDataAvailability, "notificationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:", self, sel_onDataProtectionNotification_, v7);

    -[RTBiomeManager learnedLocationManager](self, "learnedLocationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTLearnedLocationManagerNotificationAvailabilityDidChange, "notificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:", self, sel_onLearnedLocationManagerAvailabilityDidChangeNotification_, v9);

    -[RTBiomeManager learnedLocationManager](self, "learnedLocationManager");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTLearnedLocationManagerNotificationDidUpdate, "notificationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:", self, sel_onLearnedLocationManagerDidUpdateNotification_, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityBiome);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, %@, feature not enabled", buf, 0x16u);

    }
  }
}

- (void)startSubscriptionBiomeConnectionCompanion
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__RTBiomeManager_startSubscriptionBiomeConnectionCompanion__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __59__RTBiomeManager_startSubscriptionBiomeConnectionCompanion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startSubscriptionBiomeConnectionCompanion");
}

- (void)_startSubscriptionBiomeConnectionCompanion
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityBiome);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, %@, BMCarouselCompanion Currently unavailable in platforms other than watch_os", (uint8_t *)&v7, 0x16u);

  }
}

- (void)cancelSubscriptionBiomeConnectionCompanion
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__RTBiomeManager_cancelSubscriptionBiomeConnectionCompanion__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __60__RTBiomeManager_cancelSubscriptionBiomeConnectionCompanion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelSubscriptionBiomeConnectionCompanion");
}

- (void)_cancelSubscriptionBiomeConnectionCompanion
{
  NSObject *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityBiome);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, %@, BMCarouselCompanion Currently unavailable in platforms other than watch_os", (uint8_t *)&v7, 0x16u);

  }
}

- (void)enumerateEventsWithinDateInterval:(id)a3 streamType:(int64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  dispatch_semaphore_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  dispatch_time_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  const char *v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  NSObject *v45;
  id v46;
  objc_class *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  NSObject *v56;
  id v57;
  objc_class *v58;
  id v59;
  void *v60;
  id v61;
  objc_class *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  NSObject *dsema;
  RTBiomeManager *v70;
  void (**v72)(_QWORD, _QWORD, _QWORD);
  _QWORD v73[11];
  _QWORD v74[5];
  NSObject *v75;
  uint64_t *v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t *v79;
  SEL v80;
  int64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  _QWORD v88[4];
  _QWORD v89[5];
  id v90;
  _QWORD v91[5];
  id v92;
  uint64_t v93;
  id *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  _BYTE buf[12];
  __int16 v100;
  id v101;
  __int16 v102;
  id v103;
  __int16 v104;
  id v105;
  __int16 v106;
  uint64_t v107;
  uint64_t v108;
  const __CFString *v109;
  _QWORD v110[4];

  v110[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v72 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  if ((unint64_t)(a4 - 1) >= 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: RT_BIOME_STREAM_STREAM_TYPE_VALID(streamType)";
LABEL_18:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v39, buf, 2u);
    goto LABEL_41;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: dateInterval";
    goto LABEL_18;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_WORD *)buf = 0;
    v39 = "Invalid parameter not satisfying: handler";
    goto LABEL_18;
  }
  v70 = self;
  _rt_log_facility_get_os_log(RTLogFacilityBiome);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "streamTypeToString:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v11;
    v100 = 2112;
    v101 = v13;
    v102 = 2112;
    v103 = v14;
    v104 = 2112;
    v105 = v8;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, %@, streamType, %@, date interval, %@", buf, 0x2Au);

  }
  objc_msgSend((id)objc_opt_class(), "biomeStreamTypeToBiomeStream:", a4);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x1E0D026F0]);
    objc_msgSend(v8, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void *)objc_msgSend(v16, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v17, v18, 0, 0, 0);

    v67 = v8;
    v93 = 0;
    v94 = (id *)&v93;
    v95 = 0x3032000000;
    v96 = __Block_byref_object_copy__139;
    v97 = __Block_byref_object_dispose__139;
    v98 = 0;
    v91[0] = 0;
    v91[1] = v91;
    v91[2] = 0x3032000000;
    v91[3] = __Block_byref_object_copy__139;
    v91[4] = __Block_byref_object_dispose__139;
    v92 = 0;
    v89[0] = 0;
    v89[1] = v89;
    v89[2] = 0x3032000000;
    v89[3] = __Block_byref_object_copy__139;
    v89[4] = __Block_byref_object_dispose__139;
    v90 = 0;
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x2020000000;
    v88[3] = -1;
    v82 = 0;
    v83 = &v82;
    v84 = 0x3032000000;
    v85 = __Block_byref_object_copy__139;
    v86 = __Block_byref_object_dispose__139;
    v87 = (id)objc_opt_new();
    -[NSObject publisherWithOptions:](v15, "publisherWithOptions:", v68);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = dispatch_semaphore_create(0);
    v21 = MEMORY[0x1E0C809B0];
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __71__RTBiomeManager_enumerateEventsWithinDateInterval_streamType_handler___block_invoke;
    v74[3] = &unk_1E92A3E20;
    v74[4] = v70;
    v76 = &v93;
    v77 = v91;
    v80 = a2;
    v81 = a4;
    v78 = v89;
    v79 = &v82;
    v22 = v20;
    v75 = v22;
    v73[0] = v21;
    v73[1] = 3221225472;
    v73[2] = __71__RTBiomeManager_enumerateEventsWithinDateInterval_streamType_handler___block_invoke_28;
    v73[3] = &unk_1E92A3E48;
    v73[9] = a2;
    v73[10] = a4;
    v73[4] = v70;
    v73[5] = v89;
    v73[6] = v91;
    v73[7] = v88;
    v73[8] = &v82;
    v66 = v19;
    v23 = (id)objc_msgSend(v19, "sinkWithCompletion:receiveInput:", v74, v73);
    dsema = v22;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = v67;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v25))
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSinceDate:", v24);
    v28 = v27;
    v29 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_110);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "filteredArrayUsingPredicate:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "submitToCoreAnalytics:type:duration:", v33, 1, v28);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v35 = (void *)MEMORY[0x1E0CB35C8];
    v110[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v110, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = objc_retainAutorelease(v37);

    }
    else
    {
LABEL_19:
      v38 = 0;
    }

    v65 = v38;
    if (v65)
      objc_storeStrong(v94 + 5, v38);
    v40 = v94[5];
    _rt_log_facility_get_os_log(RTLogFacilityBiome);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v40)
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v61 = (id)objc_claimAutoreleasedReturnValue();
        v62 = (objc_class *)objc_opt_class();
        NSStringFromClass(v62);
        v63 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "streamTypeToString:", a4);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v61;
        v100 = 2112;
        v101 = v63;
        v102 = 2112;
        v103 = v64;
        v104 = 2112;
        v105 = v67;
        _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "%@, %@, streamType, %@, date interval, %@", buf, 0x2Au);

      }
      v43 = 0;
    }
    else
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v46 = (id)objc_claimAutoreleasedReturnValue();
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "streamTypeToString:", a4);
        v49 = (id)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend((id)v83[5], "count");
        *(_DWORD *)buf = 138413314;
        *(_QWORD *)&buf[4] = v46;
        v100 = 2112;
        v101 = v48;
        v102 = 2112;
        v103 = v49;
        v104 = 2112;
        v105 = v67;
        v106 = 2048;
        v107 = v50;
        _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_INFO, "%@, %@, streamType, %@, date interval, %@, outputDateIntervals count, %lu", buf, 0x34u);

      }
      v51 = 0;
      v52 = 1;
      v53 = MEMORY[0x1E0C81028];
      while (1)
      {
        v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG);
        if ((v52 & 1) == 0 || !v54 || !objc_msgSend((id)v83[5], "count"))
          break;
        v55 = (void *)MEMORY[0x1D8231EA8]();
        _rt_log_facility_get_os_log(RTLogFacilityBiome);
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(a2);
          v57 = (id)objc_claimAutoreleasedReturnValue();
          v58 = (objc_class *)objc_opt_class();
          NSStringFromClass(v58);
          v59 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v83[5], "objectAtIndexedSubscript:", v51);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v57;
          v100 = 2112;
          v101 = v59;
          v102 = 2048;
          v103 = (id)(v51 + 1);
          v104 = 2112;
          v105 = v60;
          _os_log_debug_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_DEBUG, "%@, %@, %lu output date interval, %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v55);
        v52 = 0;
        v51 = 1;
      }
      v43 = v83[5];
    }
    ((void (**)(_QWORD, uint64_t, id))v72)[2](v72, v43, v94[5]);

    _Block_object_dispose(&v82, 8);
    _Block_object_dispose(v88, 8);
    _Block_object_dispose(v89, 8);

    _Block_object_dispose(v91, 8);
    _Block_object_dispose(&v93, 8);

  }
  else
  {
    v108 = *MEMORY[0x1E0CB2D50];
    v109 = CFSTR("Invalid biome stream type.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTBiomeStreamErrorDomain"), 1, v68);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityBiome);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = a4;
      _os_log_error_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_ERROR, "Invalid biome stream type, %lu", buf, 0xCu);
    }

    ((void (**)(_QWORD, _QWORD, void *))v72)[2](v72, 0, v44);
  }

LABEL_41:
}

void __71__RTBiomeManager_enumerateEventsWithinDateInterval_streamType_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityBiome);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 80));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412802;
    v20 = v5;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, %@, completion, %@", (uint8_t *)&v19, 0x20u);

  }
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(v3, "error");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
LABEL_5:

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    goto LABEL_6;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  if (v12 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_extractDateIntervalFromBiomeEvent1:event2:streamType:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v10);
      _rt_log_facility_get_os_log(RTLogFacilityBiome);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(*(SEL *)(a1 + 80));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412802;
        v20 = v16;
        v21 = 2112;
        v22 = v18;
        v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%@, %@, output date interval, %@", (uint8_t *)&v19, 0x20u);

      }
    }
    goto LABEL_5;
  }
LABEL_6:
  *(_QWORD *)(v11 + 40) = 0;

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __71__RTBiomeManager_enumerateEventsWithinDateInterval_streamType_handler___block_invoke_28(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityBiome);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v4, "timestamp");
    objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412802;
    v24 = v15;
    v25 = 2112;
    v26 = v17;
    v27 = 2112;
    v28 = v19;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@, %@, received event, %@", (uint8_t *)&v23, 0x20u);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "_isValidEvent:streamType:", v4, *(_QWORD *)(a1 + 80)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(_QWORD *)(v6 + 40);
    if (!v7)
    {
      v13 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v12 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v13;
      goto LABEL_14;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_compareEvent1:event2:streamType:", v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 40), *(_QWORD *)(a1 + 80));
    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (v8 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_extractDateIntervalFromBiomeEvent1:event2:streamType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 80));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v12);
        _rt_log_facility_get_os_log(RTLogFacilityBiome);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          NSStringFromSelector(*(SEL *)(a1 + 72));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138412802;
          v24 = v20;
          v25 = 2112;
          v26 = v22;
          v27 = 2112;
          v28 = v12;
          _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "%@, %@, final output date interval, %@", (uint8_t *)&v23, 0x20u);

        }
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      goto LABEL_14;
    }
    if (v8 == -1)
    {
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = v9;
      v12 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v11;
LABEL_14:

    }
  }

}

- (BOOL)_isValidEvent:(id)a3 streamType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  BOOL v12;
  __int16 v14;
  __int16 v15;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v15 = 0;
    v10 = "Invalid parameter not satisfying: event";
    v11 = (uint8_t *)&v15;
    goto LABEL_14;
  }
  if ((unint64_t)(a4 - 1) >= 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v14 = 0;
    v10 = "Invalid parameter not satisfying: RT_BIOME_STREAM_STREAM_TYPE_VALID(streamType)";
    v11 = (uint8_t *)&v14;
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
LABEL_8:

LABEL_9:
    v12 = 0;
    goto LABEL_12;
  }
  switch(a4)
  {
    case 1:
    case 2:
    case 4:
      objc_msgSend(v5, "eventBody");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hasStarting");
      break;
    case 3:
      objc_msgSend(v5, "eventBody");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "hasStationary");
      break;
    default:
      goto LABEL_9;
  }
  v12 = v8;

LABEL_12:
  return v12;
}

- (int64_t)_compareEvent1:(id)a3 event2:(id)a4 streamType:(int64_t)a5
{
  void *v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  int64_t v17;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  int64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    LOWORD(v28) = 0;
    v16 = "Invalid parameter not satisfying: event1";
    goto LABEL_14;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    LOWORD(v28) = 0;
    v16 = "Invalid parameter not satisfying: event2";
    goto LABEL_14;
  }
  if ((unint64_t)(a5 - 1) >= 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    LOWORD(v28) = 0;
    v16 = "Invalid parameter not satisfying: RT_BIOME_STREAM_STREAM_TYPE_VALID(streamType)";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v28, 2u);
LABEL_15:

LABEL_16:
    v17 = -1;
    goto LABEL_17;
  }
  switch(a5)
  {
    case 1:
    case 2:
    case 4:
      v11 = v8;
      v12 = v10;
      objc_msgSend(v11, "eventBody");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "starting") & 1) != 0)
      {
        objc_msgSend(v12, "eventBody");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "starting");

        if (!v14)
          goto LABEL_25;
      }
      else
      {

      }
      objc_msgSend(v11, "eventBody");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "starting");
      if ((v20 & 1) == 0)
      {
        objc_msgSend(v12, "eventBody");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "starting") & 1) != 0)
          goto LABEL_32;
      }
      objc_msgSend(v11, "eventBody");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "starting") & 1) != 0)
        goto LABEL_34;
      objc_msgSend(v12, "eventBody");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "starting");
      goto LABEL_36;
    case 3:
      v11 = v8;
      v12 = v10;
      objc_msgSend(v11, "eventBody");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "stationary") & 1) != 0)
      {
        objc_msgSend(v12, "eventBody");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v5, "stationary");

        if (!v25)
        {
LABEL_25:
          v17 = 1;
          goto LABEL_40;
        }
      }
      else
      {

      }
      objc_msgSend(v11, "eventBody");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "stationary");
      if ((v20 & 1) == 0)
      {
        objc_msgSend(v12, "eventBody");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "stationary") & 1) != 0)
        {
LABEL_32:
          v27 = 1;
LABEL_38:

          goto LABEL_39;
        }
      }
      objc_msgSend(v11, "eventBody");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "stationary") & 1) != 0)
      {
LABEL_34:
        v27 = 0;
      }
      else
      {
        objc_msgSend(v12, "eventBody");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "stationary");
LABEL_36:
        v27 = v23 ^ 1u;

      }
      if ((v20 & 1) == 0)
        goto LABEL_38;
LABEL_39:

      v17 = v27 << 63 >> 63;
LABEL_40:

      break;
    default:
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v28 = 134218498;
        v29 = a5;
        v30 = 2080;
        v31 = "-[RTBiomeManager _compareEvent1:event2:streamType:]";
        v32 = 1024;
        v33 = 453;
        _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Unhandled stream type, %lu (in %s:%d)", (uint8_t *)&v28, 0x1Cu);
      }

      goto LABEL_16;
  }
LABEL_17:

  return v17;
}

- (id)_extractDateIntervalFromBiomeEvent1:(id)a3 event2:(id)a4 streamType:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    LOWORD(v23) = 0;
    v17 = "Invalid parameter not satisfying: event1";
LABEL_15:
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v23, 2u);
    goto LABEL_16;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    LOWORD(v23) = 0;
    v17 = "Invalid parameter not satisfying: event2";
    goto LABEL_15;
  }
  if ((unint64_t)(a5 - 1) < 4)
  {
    if (v8 == v9)
    {
      v15 = 0;
      v12 = 0;
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v8, "timestamp");
      objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v10, "timestamp");
      objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v12 && v14 && -[NSObject compare:](v12, "compare:", v14) != 1)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v12, v15);
LABEL_22:

        goto LABEL_17;
      }
    }
    _rt_log_facility_get_os_log(RTLogFacilityBiome);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138413058;
      v24 = v21;
      v25 = 2112;
      v26 = v22;
      v27 = 2112;
      v28 = v12;
      v29 = 2112;
      v30 = v15;
      _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "%@, %@, start date, %@, end date, %@", (uint8_t *)&v23, 0x2Au);

    }
    v16 = 0;
    goto LABEL_22;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v23) = 0;
    v17 = "Invalid parameter not satisfying: RT_BIOME_STREAM_STREAM_TYPE_VALID(streamType)";
    goto LABEL_15;
  }
LABEL_16:
  v16 = 0;
LABEL_17:

  return v16;
}

- (void)onAuthorizationNotification:(id)a3
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
  v7[2] = __46__RTBiomeManager_onAuthorizationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __46__RTBiomeManager_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onAuthorizationNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onAuthorizationNotification:(id)a3
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const __CFString *v8;
  id *v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RTBiomeManager setRoutineEnabled:](self, "setRoutineEnabled:", objc_msgSend(v5, "enabled"));
    _rt_log_facility_get_os_log(RTLogFacilityBiome);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = -[RTBiomeManager routineEnabled](self, "routineEnabled");
      v8 = CFSTR("NO");
      if (v7)
        v8 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Updated routine enabled %@", buf, 0xCu);
    }

    if (-[RTBiomeManager routineEnabled](self, "routineEnabled"))
    {
      v14 = 0;
      v9 = (id *)&v14;
      -[RTBiomeManager _publishNewHindsightVisitsToBiomeWithError:](self, "_publishNewHindsightVisitsToBiomeWithError:", &v14);
    }
    else
    {
      v13 = 0;
      v9 = (id *)&v13;
      -[RTBiomeManager _clearBiomeStreamForStreamType:error:](self, "_clearBiomeStreamForStreamType:error:", 5, &v13);
    }
    v10 = *v9;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityBiome);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", buf, 0x16u);

    }
  }

}

- (void)onDataProtectionNotification:(id)a3
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
  v7[2] = __47__RTBiomeManager_onDataProtectionNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __47__RTBiomeManager_onDataProtectionNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDataProtectionNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onDataProtectionNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v12 = v9;
      v13 = 2080;
      v14 = "-[RTBiomeManager _onDataProtectionNotification:]";
      v15 = 1024;
      v16 = 544;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unknown notification class, %@ (in %s:%d)", buf, 0x1Cu);

    }
  }
  -[RTBiomeManager setEncryptedDataAvailability:](self, "setEncryptedDataAvailability:", objc_msgSend(v4, "availability"));
  _rt_log_facility_get_os_log(RTLogFacilityBiome);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    +[RTDataProtectionManager encryptedDataAvailabilityToString:](RTDataProtectionManager, "encryptedDataAvailabilityToString:", -[RTBiomeManager encryptedDataAvailability](self, "encryptedDataAvailability"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Received keybag notification, %@", buf, 0xCu);

  }
  v10 = 0;
  -[RTBiomeManager _publishNewHindsightVisitsToBiomeWithError:](self, "_publishNewHindsightVisitsToBiomeWithError:", &v10);

}

- (void)onLearnedLocationManagerAvailabilityDidChangeNotification:(id)a3
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
  v7[2] = __76__RTBiomeManager_onLearnedLocationManagerAvailabilityDidChangeNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __76__RTBiomeManager_onLearnedLocationManagerAvailabilityDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLearnedLocationManagerAvailabilityDidChangeNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onLearnedLocationManagerAvailabilityDidChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  char *v9;
  int v10;
  const __CFString *v11;
  int v12;
  id v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    _rt_log_facility_get_os_log(RTLogFacilityBiome);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSObject available](v5, "available");
      v11 = CFSTR("NO");
      v12 = 138412802;
      v13 = v8;
      v14 = 2112;
      if (v10)
        v11 = CFSTR("YES");
      v15 = v9;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, learned location manager available, %@", (uint8_t *)&v12, 0x20u);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412802;
      v13 = v4;
      v14 = 2080;
      v15 = "-[RTBiomeManager _onLearnedLocationManagerAvailabilityDidChangeNotification:]";
      v16 = 1024;
      LODWORD(v17) = 575;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
    }
  }

}

- (void)onLearnedLocationManagerDidUpdateNotification:(id)a3
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
  v7[2] = __64__RTBiomeManager_onLearnedLocationManagerDidUpdateNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __64__RTBiomeManager_onLearnedLocationManagerDidUpdateNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLearnedLocationManagerDidUpdateNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onLearnedLocationManagerDidUpdateNotification:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    _rt_log_facility_get_os_log(RTLogFacilityBiome);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v10 = (char *)objc_claimAutoreleasedReturnValue();
      -[NSObject intervalSinceLastUpdate](v6, "intervalSinceLastUpdate");
      *(_DWORD *)buf = 138412802;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      v17 = 2048;
      v18 = v11;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, %@, learned location manager did update, %f", buf, 0x20u);

    }
    v12 = 0;
    -[RTBiomeManager _publishNewHindsightVisitsToBiomeWithError:](self, "_publishNewHindsightVisitsToBiomeWithError:", &v12);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v14 = v5;
      v15 = 2080;
      v16 = "-[RTBiomeManager _onLearnedLocationManagerDidUpdateNotification:]";
      v17 = 1024;
      LODWORD(v18) = 603;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
    }
  }

}

- (int)_translateToBiomeVisitLocationReferenceFrame:(int)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

- (int)_translateToBiomeVisitLocationSourceAccuracy:(unint64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

- (id)_translateToBiomeVisitLocation:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D020A8]);
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "latitude");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "longitude");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "horizontalUncertainty");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "altitude");
    objc_msgSend(v12, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "verticalUncertainty");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v5, "initWithLatitude:longitude:horizontalUncertainty:altitude:verticalUncertainty:date:referenceFrame:sourceAccuracy:", v7, v9, v11, v13, v15, v16, __PAIR64__(-[RTBiomeManager _translateToBiomeVisitLocationSourceAccuracy:](self, "_translateToBiomeVisitLocationSourceAccuracy:", objc_msgSend(v4, "sourceAccuracy")), -[RTBiomeManager _translateToBiomeVisitLocationReferenceFrame:](self, "_translateToBiomeVisitLocationReferenceFrame:", objc_msgSend(v4, "referenceFrame"))));

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }

    v17 = 0;
  }

  return v17;
}

- (int)_translateToBiomePlaceType:(unint64_t)a3
{
  if (a3 - 1 < 4)
    return a3;
  else
    return 0;
}

- (int)_translateToBiomeUserSpecificPlaceType:(unint64_t)a3
{
  if (a3 - 1 < 4)
    return a3;
  else
    return 0;
}

- (int)_translateToBiomeUserSpecificPlaceTypeSource:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 0;
  else
    return dword_1D1EEE350[a3 - 1];
}

- (id)_translateToBiomeMapItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D02168]);
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "category");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v4, "initWithIdentifier:name:address:category:", v5, v6, v8, v9);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItem", v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)_translateToBiomePlaceInference:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v15[16];

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D02160]);
    objc_msgSend(v4, "loiIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[RTBiomeManager _translateToBiomePlaceType:](self, "_translateToBiomePlaceType:", objc_msgSend(v4, "placeType"));
    v8 = -[RTBiomeManager _translateToBiomeUserSpecificPlaceType:](self, "_translateToBiomeUserSpecificPlaceType:", objc_msgSend(v4, "userType"));
    v9 = -[RTBiomeManager _translateToBiomeUserSpecificPlaceTypeSource:](self, "_translateToBiomeUserSpecificPlaceTypeSource:", objc_msgSend(v4, "userTypeSource"));
    objc_msgSend(v4, "mapItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTBiomeManager _translateToBiomeMapItem:](self, "_translateToBiomeMapItem:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v5, "initWithIdentifier:placeType:userSpecificPlaceType:userSpecificPlaceTypeSource:mapItem:", v6, v7, v8, v9, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeInference", v15, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (int)_translateToBiomeVisitType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    return a3;
  else
    return 0;
}

- (int)_translateToBiomeVisitSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    return a3;
  else
    return 0;
}

- (id)_translateRTVisitToBiomeObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  id v20;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    v20 = objc_alloc(MEMORY[0x1E0D020A0]);
    objc_msgSend(v4, "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[RTBiomeManager _translateToBiomeVisitType:](self, "_translateToBiomeVisitType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTBiomeManager _translateToBiomeVisitLocation:](self, "_translateToBiomeVisitLocation:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entry");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "exit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "confidence");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[RTBiomeManager _translateToBiomeVisitSource:](self, "_translateToBiomeVisitSource:", objc_msgSend(v4, "source"));
    objc_msgSend(v4, "placeInference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTBiomeManager _translateToBiomePlaceInference:](self, "_translateToBiomePlaceInference:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = v11;
    v14 = (void *)objc_msgSend(v20, "initWithDetectionDate:type:location:entryDate:exitDate:confidence:source:placeInference:", v19, v18, v6, v7, v8, v10, v17, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (void)_publishNewHindsightVisitsToBiomeWithError:(id *)a3
{
  id *v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[7];
  id obj;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  NSObject *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__139;
  v30 = __Block_byref_object_dispose__139;
  v31 = 0;
  if (-[RTBiomeManager routineEnabled](self, "routineEnabled"))
  {
    if (-[RTBiomeManager encryptedDataAvailability](self, "encryptedDataAvailability") == 2)
    {
      v6 = (id *)(v27 + 5);
      obj = (id)v27[5];
      -[RTBiomeManager _getLatestBiomeDataForStreamType:error:](self, "_getLatestBiomeDataForStreamType:error:", 5, &obj);
      v7 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v6, obj);
      v8 = (void *)v27[5];
      if (v8)
      {
        *a3 = objc_retainAutorelease(v8);
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityBiome);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v33 = v7;
          _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "Latest visit in Biome %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2419200.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject exitDate](v7, "exitDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          -[NSObject exitDate](v7, "exitDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "compare:", v16) == 1;

          if (v19)
          {
            -[NSObject exitDate](v7, "exitDate");
            v20 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v20;
          }
        }
        -[RTBiomeManager learnedLocationManager](self, "learnedLocationManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __61__RTBiomeManager__publishNewHindsightVisitsToBiomeWithError___block_invoke;
        v24[3] = &unk_1E92A3E70;
        v24[4] = self;
        v24[5] = &v26;
        v24[6] = a2;
        objc_msgSend(v21, "fetchHindsightVisitsBetweenStartDate:endDate:ascending:handler:", v16, v22, 1, v24);

        v23 = (void *)v27[5];
        if (v23)
          *a3 = objc_retainAutorelease(v23);

      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityBiome);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = v13;
        v34 = 2112;
        v35 = v14;
        _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, %@, Encrypted data not available, data is not published", buf, 0x16u);

      }
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityBiome);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = v10;
      v34 = 2112;
      v35 = v11;
      _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, %@, Significant Locations disabled, data is not published", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v26, 8);
}

void __61__RTBiomeManager__publishNewHindsightVisitsToBiomeWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD block[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityBiome);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Fetch hindsight visits error, %@", buf, 0xCu);
    }

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = v6;
    v10 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__RTBiomeManager__publishNewHindsightVisitsToBiomeWithError___block_invoke_42;
    block[3] = &unk_1E9297BC8;
    v12 = v5;
    v13 = *(_QWORD *)(a1 + 32);
    v15 = v12;
    v16 = v13;
    v17 = *(_QWORD *)(a1 + 48);
    dispatch_async(v11, block);

    v10 = v15;
  }

}

void __61__RTBiomeManager__publishNewHindsightVisitsToBiomeWithError___block_invoke_42(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityBiome);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v23 = v3;
    _os_log_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_INFO, "New hindsight visits count %lu", buf, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "biomeStreamTypeToBiomeStream:", 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v17 = v5;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 40), "_translateRTVisitToBiomeObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "sendEvent:", v10);
        _rt_log_facility_get_os_log(RTLogFacilityBiome);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(*(SEL *)(a1 + 48));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "streamTypeToString:", 5);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v23 = (uint64_t)v13;
          v24 = 2112;
          v25 = v14;
          v26 = 2112;
          v27 = v10;
          v28 = 2112;
          v29 = v15;
          _os_log_debug_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEBUG, "%@, %@, sent event, %@, streamType, %@", buf, 0x2Au);

          v5 = v17;
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    }
    while (v7);
  }

}

- (void)_clearBiomeStreamForStreamType:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v10;
  id v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", 5, a4);
    v5 = v4;
    objc_msgSend((id)objc_opt_class(), "biomeStreamTypeToBiomeStream:", 5);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pruner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __55__RTBiomeManager__clearBiomeStreamForStreamType_error___block_invoke;
    v18[3] = &__block_descriptor_40_e26_B24__0__BMStoreEvent_8_B16l;
    v18[4] = v5;
    objc_msgSend(v6, "deleteEventsPassingTest:", v18);

  }
  else
  {
    v27 = *MEMORY[0x1E0CB2D50];
    v28[0] = CFSTR("Unsupported stream type");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v11;
    _rt_log_facility_get_os_log(RTLogFacilityBiome);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "streamTypeToString:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v11;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@, %@, streamType, %@, error, %@", buf, 0x2Au);

    }
  }
}

BOOL __55__RTBiomeManager__clearBiomeStreamForStreamType_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  double v5;
  _BOOL8 v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityBiome);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "timestamp");
    v9 = v8;
    objc_msgSend(v3, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218242;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "Pruned Biome Event %f, %@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(v3, "timestamp");
  v6 = v5 < *(double *)(a1 + 32);

  return v6;
}

- (id)_getLatestBiomeDataForStreamType:(int64_t)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  id v6;
  dispatch_semaphore_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
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
  id v28;
  id v29;
  id v30;
  NSObject *v31;
  objc_class *v33;
  void *v34;
  void *v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  objc_class *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  _QWORD v44[5];
  _QWORD v45[4];
  NSObject *v46;
  uint64_t *v47;
  uint64_t v48;
  id *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  const __CFString *v55;
  _BYTE v56[12];
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  _BYTE buf[24];
  uint64_t (*v64)(uint64_t, uint64_t);
  __int128 v65;
  _QWORD v66[4];

  v66[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 5)
  {
    objc_msgSend((id)objc_opt_class(), "biomeStreamTypeToBiomeStream:", 5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 1, 1, 0);
    objc_msgSend(v4, "publisherWithOptions:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v7 = dispatch_semaphore_create(0);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v64 = __Block_byref_object_copy__139;
    *(_QWORD *)&v65 = __Block_byref_object_dispose__139;
    *((_QWORD *)&v65 + 1) = 0;
    v48 = 0;
    v49 = (id *)&v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__139;
    v52 = __Block_byref_object_dispose__139;
    v8 = MEMORY[0x1E0C809B0];
    v53 = 0;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __57__RTBiomeManager__getLatestBiomeDataForStreamType_error___block_invoke;
    v45[3] = &unk_1E92A3EB8;
    v47 = &v48;
    v9 = v7;
    v46 = v9;
    v44[0] = v8;
    v44[1] = 3221225472;
    v44[2] = __57__RTBiomeManager__getLatestBiomeDataForStreamType_error___block_invoke_2;
    v44[3] = &unk_1E92A3EE0;
    v44[4] = buf;
    v10 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", v45, v44);
    v11 = v9;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v11, v13))
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v12);
    v16 = v15;
    v17 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_110);
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
      *(_WORD *)v56 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v56, 2u);
    }

    v23 = (void *)MEMORY[0x1E0CB35C8];
    v66[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v56 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v66, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = objc_retainAutorelease(v25);

    }
    else
    {
LABEL_10:
      v26 = 0;
    }

    v29 = v26;
    if (v29)
      objc_storeStrong(v49 + 5, v26);
    v30 = v49[5];
    if (v30)
    {
      *a4 = objc_retainAutorelease(v30);
      _rt_log_facility_get_os_log(RTLogFacilityBiome);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "streamTypeToString:", 5);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v49[5];
        *(_DWORD *)v56 = 138413058;
        *(_QWORD *)&v56[4] = v38;
        v57 = 2112;
        v58 = v39;
        v59 = 2112;
        v60 = v40;
        v61 = 2112;
        v62 = v41;
        _os_log_error_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_ERROR, "%@, %@, streamType, %@, error, %@", v56, 0x2Au);

      }
    }
    v28 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(&v48, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v54 = *MEMORY[0x1E0CB2D50];
    v55 = CFSTR("Unsupported stream type");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v6;
    _rt_log_facility_get_os_log(RTLogFacilityBiome);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "streamTypeToString:", a3);
      v36 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v34;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v35;
      *(_WORD *)&buf[22] = 2112;
      v64 = v36;
      LOWORD(v65) = 2112;
      *(_QWORD *)((char *)&v65 + 2) = v6;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "%@, %@, streamType, %@, error, %@", buf, 0x2Au);

    }
    v28 = 0;
  }

  return v28;
}

void __57__RTBiomeManager__getLatestBiomeDataForStreamType_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "state"))
  {
    objc_msgSend(v6, "error");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __57__RTBiomeManager__getLatestBiomeDataForStreamType_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "eventBody");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

+ (id)biomeStreamTypeToBiomeStream:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  switch(a3)
  {
    case 1:
      BiomeLibrary();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Device");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "Power");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "PluggedIn");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      BiomeLibrary();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Device");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "ScreenLocked");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      BiomeLibrary();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Motion");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "Activity");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      BiomeLibrary();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Device");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "Wireless");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "WiFi");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = (void *)v6;

      goto LABEL_10;
    case 5:
      BiomeLibrary();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "Location");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "Visit");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v7 = (void *)v8;
LABEL_10:

      break;
    default:
      v7 = 0;
      break;
  }
  return v7;
}

+ (id)streamTypeToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return CFSTR("Unknown");
  else
    return off_1E92A3F20[a3 - 1];
}

- (BMBiomeScheduler)scheduler
{
  return self->_scheduler;
}

- (void)setScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_scheduler, a3);
}

- (BPSSink)sink
{
  return self->_sink;
}

- (void)setSink:(id)a3
{
  objc_storeStrong((id *)&self->_sink, a3);
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (RTDataProtectionManager)dataProtectionManager
{
  return self->_dataProtectionManager;
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (int64_t)encryptedDataAvailability
{
  return self->_encryptedDataAvailability;
}

- (void)setEncryptedDataAvailability:(int64_t)a3
{
  self->_encryptedDataAvailability = a3;
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (BOOL)routineEnabled
{
  return self->_routineEnabled;
}

- (void)setRoutineEnabled:(BOOL)a3
{
  self->_routineEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_dataProtectionManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
