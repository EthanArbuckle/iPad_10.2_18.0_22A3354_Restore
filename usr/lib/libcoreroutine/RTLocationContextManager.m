@implementation RTLocationContextManager

- (RTLocationContextManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAuthorizationManager_defaultsManager_distanceCalculator_learnedLocationManager_learnedLocationStore_locationManager_placeInferenceManager_platform_timerManager_visitManager_);
}

- (RTLocationContextManager)initWithAuthorizationManager:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 learnedLocationManager:(id)a6 learnedLocationStore:(id)a7 locationManager:(id)a8 placeInferenceManager:(id)a9 platform:(id)a10 timerManager:(id)a11 visitManager:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  RTLocationContextManager *v27;
  RTLocationContextManager *v28;
  RTLocation *lastPublishedLocation;
  RTLocation *latestValidLocation;
  RTPlaceInference *lastPublishedPlaceInference;
  RTTimer *timer;
  RTLocationContextManager *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  NSObject *v39;
  const char *v40;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  objc_super v52;
  uint8_t buf[16];

  v17 = a3;
  v43 = a4;
  v18 = a4;
  v50 = a5;
  v44 = a6;
  v19 = a6;
  v45 = a7;
  v20 = a7;
  v46 = a8;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v49 = v17;
  if (v17)
  {
    if (v18)
    {
      if (v50)
      {
        v47 = v25;
        v26 = v18;
        if (v19)
        {
          if (v20)
          {
            if (v21)
            {
              if (v22)
              {
                if (v23)
                {
                  if (v24)
                  {
                    if (v25)
                    {
                      v52.receiver = self;
                      v52.super_class = (Class)RTLocationContextManager;
                      v27 = -[RTNotifier init](&v52, sel_init);
                      v28 = v27;
                      if (v27)
                      {
                        objc_storeStrong((id *)&v27->_authorizationManager, a3);
                        objc_storeStrong((id *)&v28->_defaultsManager, v43);
                        objc_storeStrong((id *)&v28->_distanceCalculator, a5);
                        objc_storeStrong((id *)&v28->_learnedLocationManager, v44);
                        objc_storeStrong((id *)&v28->_learnedLocationStore, v45);
                        objc_storeStrong((id *)&v28->_locationManager, v46);
                        objc_storeStrong((id *)&v28->_placeInferenceManager, a9);
                        objc_storeStrong((id *)&v28->_platform, a10);
                        objc_storeStrong((id *)&v28->_timerManager, a11);
                        objc_storeStrong((id *)&v28->_visitManager, a12);
                        v28->_locationContextMonitoringEnabled = 0;
                        v28->_inLowConfidenceVisit = 0;
                        v28->_inHighConfidenceVisit = 0;
                        lastPublishedLocation = v28->_lastPublishedLocation;
                        v28->_lastPublishedLocation = 0;

                        latestValidLocation = v28->_latestValidLocation;
                        v28->_latestValidLocation = 0;

                        lastPublishedPlaceInference = v28->_lastPublishedPlaceInference;
                        v28->_lastPublishedPlaceInference = 0;

                        timer = v28->_timer;
                        v28->_timer = 0;

                        -[RTService setup](v28, "setup");
                      }
                      v33 = v28;
                      self = v33;
                      goto LABEL_39;
                    }
                    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    v39 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      v40 = "Invalid parameter not satisfying: visitManager";
                      goto LABEL_37;
                    }
LABEL_38:

                    v33 = 0;
LABEL_39:
                    v36 = v47;
                    goto LABEL_40;
                  }
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    goto LABEL_38;
                  *(_WORD *)buf = 0;
                  v40 = "Invalid parameter not satisfying: timerManager";
                }
                else
                {
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                    goto LABEL_38;
                  *(_WORD *)buf = 0;
                  v40 = "Invalid parameter not satisfying: platform";
                }
              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                v39 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  goto LABEL_38;
                *(_WORD *)buf = 0;
                v40 = "Invalid parameter not satisfying: placeInferenceManager";
              }
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v39 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                goto LABEL_38;
              *(_WORD *)buf = 0;
              v40 = "Invalid parameter not satisfying: locationManager";
            }
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v39 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              goto LABEL_38;
            *(_WORD *)buf = 0;
            v40 = "Invalid parameter not satisfying: learnedLocationStore";
          }
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v39 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            goto LABEL_38;
          *(_WORD *)buf = 0;
          v40 = "Invalid parameter not satisfying: learnedLocationManager";
        }
LABEL_37:
        _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, v40, buf, 2u);
        goto LABEL_38;
      }
      v26 = v18;
      v36 = v25;
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v37 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
LABEL_20:

        v33 = 0;
LABEL_40:
        v35 = v50;
        goto LABEL_41;
      }
      *(_WORD *)buf = 0;
      v38 = "Invalid parameter not satisfying: distanceCalculator";
    }
    else
    {
      v26 = 0;
      v36 = v25;
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v37 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      *(_WORD *)buf = 0;
      v38 = "Invalid parameter not satisfying: defaultsManager";
    }
    _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, v38, buf, 2u);
    goto LABEL_20;
  }
  v48 = v25;
  v26 = v18;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: authorizationManager", buf, 2u);
  }

  v33 = 0;
  v35 = v50;
  v36 = v48;
LABEL_41:

  return v33;
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    +[RTNotification notificationName](RTLocationContextManagerPlaceInferencesNotification, "notificationName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      -[RTLocationContextManager setLocationContextMonitoringEnabled:](self, "setLocationContextMonitoringEnabled:", -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v6) != 0);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, %@, feature not enabled", (uint8_t *)&v14, 0x16u);

    }
  }

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[RTNotification notificationName](RTLocationContextManagerPlaceInferencesNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[RTLocationContextManager setLocationContextMonitoringEnabled:](self, "setLocationContextMonitoringEnabled:", -[RTNotifier getNumberOfObservers:](self, "getNumberOfObservers:", v5) != 0);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "unsupported notification, %@", (uint8_t *)&v9, 0xCu);
    }

  }
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
  v7[2] = __56__RTLocationContextManager_onAuthorizationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __56__RTLocationContextManager_onAuthorizationNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onAuthorizationNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onAuthorizationNotification:(id)a3
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  const __CFString *v8;
  __CFString *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[RTLocationContextManager setRoutineEnabled:](self, "setRoutineEnabled:", objc_msgSend(v5, "enabled"));
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = -[RTLocationContextManager routineEnabled](self, "routineEnabled");
      v8 = CFSTR("NO");
      if (v7)
        v8 = CFSTR("YES");
      v11 = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "Updated routine enabled %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, unhandled notification, %@", (uint8_t *)&v11, 0x16u);

    }
  }

}

- (void)onLearnedLocationManagerNotification:(id)a3
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
  v7[2] = __65__RTLocationContextManager_onLearnedLocationManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __65__RTLocationContextManager_onLearnedLocationManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLearnedLocationManagerNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onLearnedLocationManagerNotification:(id)a3
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
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
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
      v15 = "-[RTLocationContextManager _onLearnedLocationManagerNotification:]";
      v16 = 1024;
      LODWORD(v17) = 220;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", (uint8_t *)&v12, 0x1Cu);
    }
  }

}

- (void)onVisitManagerNotification:(id)a3
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
  v7[2] = __55__RTLocationContextManager_onVisitManagerNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __55__RTLocationContextManager_onVisitManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onVisitManagerNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onVisitManagerNotification:(id)a3
{
  id v5;
  NSObject *v6;
  __CFString *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  char *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  __CFString *v15;
  id v16;
  NSObject *v17;
  const __CFString *v18;
  _BOOL4 v19;
  const __CFString *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  char *v29;
  _BOOL4 v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  const char *v37;
  uint64_t v38;
  objc_class *v39;
  char *v40;
  __CFString *v41;
  const __CFString *v42;
  _BOOL4 v43;
  const __CFString *v44;
  _BOOL4 v45;
  objc_class *v46;
  uint64_t v47;
  const __CFString *v48;
  _BOOL4 v49;
  objc_class *v50;
  uint64_t v51;
  const __CFString *v52;
  char *v53;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  const __CFString *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  const __CFString *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[NSObject visitIncident](v6, "visitIncident");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v11 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v60 = v10;
      v61 = 2112;
      v62 = v11;
      v63 = 2112;
      v64 = v7;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@, received visit notification, %@", buf, 0x20u);

    }
    if (-[__CFString type](v7, "type") != 1
      || -[RTLocationContextManager inHighConfidenceVisit](self, "inHighConfidenceVisit")
      || -[RTLocationContextManager inLowConfidenceVisit](self, "inLowConfidenceVisit"))
    {
      if (-[__CFString type](v7, "type") != 3
        || -[RTLocationContextManager inHighConfidenceVisit](self, "inHighConfidenceVisit"))
      {
        _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v53 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D18578], "stringFromVisitIncidentType:", -[__CFString type](v7, "type"));
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v16 = v5;
          v17 = v6;
          if (-[RTLocationContextManager inLowConfidenceVisit](self, "inLowConfidenceVisit"))
            v18 = CFSTR("YES");
          else
            v18 = CFSTR("NO");
          v19 = -[RTLocationContextManager inHighConfidenceVisit](self, "inHighConfidenceVisit");
          *(_DWORD *)buf = 138413314;
          if (v19)
            v20 = CFSTR("YES");
          else
            v20 = CFSTR("NO");
          v60 = v14;
          v61 = 2112;
          v62 = v53;
          v63 = 2112;
          v64 = v15;
          v65 = 2112;
          v66 = (void *)v18;
          v6 = v17;
          v5 = v16;
          v67 = 2112;
          v68 = v20;
          _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, %@, invalid state, visit type, %@, in low confidence visit, %@, in high confidence visit, %@", buf, 0x34u);

        }
        goto LABEL_54;
      }
      v38 = 0;
    }
    else
    {
      v38 = 1;
    }
    -[RTLocationContextManager setInLowConfidenceVisit:](self, "setInLowConfidenceVisit:", v38);
    -[RTLocationContextManager setInHighConfidenceVisit:](self, "setInHighConfidenceVisit:", 0);
    v58 = 0;
    v45 = -[RTLocationContextManager _postLocationContextNotificationUsingData:error:](self, "_postLocationContextNotificationUsingData:error:", v7, &v58);
    v12 = v58;
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
LABEL_53:

LABEL_54:
      goto LABEL_55;
    }
    v46 = (objc_class *)objc_opt_class();
    NSStringFromClass(v46);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v47 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v47;
    v48 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v60 = v33;
    v61 = 2112;
    if (v45)
      v48 = CFSTR("YES");
    v62 = (const char *)v47;
    v63 = 2112;
    v64 = v48;
    v65 = 2112;
    v66 = v12;
    v37 = "%@, %@, publish place inference status, %@, error, %@";
LABEL_52:
    _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, v37, buf, 0x2Au);

    goto LABEL_53;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[NSObject visitIncident](v6, "visitIncident");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v60 = v23;
      v61 = 2112;
      v62 = v24;
      v63 = 2112;
      v64 = v7;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%@, %@, received visit notification, %@", buf, 0x20u);

    }
    if (-[__CFString type](v7, "type") == 1
      && !-[RTLocationContextManager inHighConfidenceVisit](self, "inHighConfidenceVisit"))
    {
      v25 = 1;
    }
    else
    {
      if (-[__CFString type](v7, "type") != 3)
      {
        _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v39 = (objc_class *)objc_opt_class();
          NSStringFromClass(v39);
          v54 = objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v40 = (char *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D18578], "stringFromVisitIncidentType:", -[__CFString type](v7, "type"));
          v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (-[RTLocationContextManager inLowConfidenceVisit](self, "inLowConfidenceVisit"))
            v42 = CFSTR("YES");
          else
            v42 = CFSTR("NO");
          v43 = -[RTLocationContextManager inHighConfidenceVisit](self, "inHighConfidenceVisit", v54);
          *(_DWORD *)buf = 138413314;
          if (v43)
            v44 = CFSTR("YES");
          else
            v44 = CFSTR("NO");
          v60 = v55;
          v61 = 2112;
          v62 = v40;
          v63 = 2112;
          v64 = v41;
          v65 = 2112;
          v66 = (void *)v42;
          v67 = 2112;
          v68 = v44;
          _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "%@, %@, invalid state, visit type, %@, in low confidence visit, %@, in high confidence visit, %@", buf, 0x34u);

        }
        goto LABEL_54;
      }
      v25 = 0;
    }
    -[RTLocationContextManager setInHighConfidenceVisit:](self, "setInHighConfidenceVisit:", v25);
    -[RTLocationContextManager setInLowConfidenceVisit:](self, "setInLowConfidenceVisit:", 0);
    v57 = 0;
    v49 = -[RTLocationContextManager _postLocationContextNotificationUsingData:error:](self, "_postLocationContextNotificationUsingData:error:", v7, &v57);
    v12 = v57;
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      goto LABEL_53;
    v50 = (objc_class *)objc_opt_class();
    NSStringFromClass(v50);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v51 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v51;
    v52 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v60 = v33;
    v61 = 2112;
    if (v49)
      v52 = CFSTR("YES");
    v62 = (const char *)v51;
    v63 = 2112;
    v64 = v52;
    v65 = 2112;
    v66 = v12;
    v37 = "%@, %@, publish inside visit place inference status, %@, error, %@";
    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    -[NSObject placeInference](v6, "placeInference");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v29 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v60 = v28;
      v61 = 2112;
      v62 = v29;
      v63 = 2112;
      v64 = v7;
      _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%@, %@, received POI update notification, %@", buf, 0x20u);

    }
    v56 = 0;
    v30 = -[RTLocationContextManager _postLocationContextNotificationUsingData:error:](self, "_postLocationContextNotificationUsingData:error:", v7, &v56);
    v12 = v56;
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      goto LABEL_53;
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    v36 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v60 = v33;
    v61 = 2112;
    if (v30)
      v36 = CFSTR("YES");
    v62 = (const char *)v34;
    v63 = 2112;
    v64 = v36;
    v65 = 2112;
    v66 = v12;
    v37 = "%@, %@, publish inside visit POI status, %@, error, %@";
    goto LABEL_52;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v60 = v5;
    v61 = 2080;
    v62 = "-[RTLocationContextManager _onVisitManagerNotification:]";
    v63 = 1024;
    LODWORD(v64) = 340;
    _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "unhandled notification, %@ (in %s:%d)", buf, 0x1Cu);
  }
LABEL_55:

}

- (void)onLeechedLocationNotification:(id)a3
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
  v7[2] = __58__RTLocationContextManager_onLeechedLocationNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __58__RTLocationContextManager_onLeechedLocationNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onLeechedLocationNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onLeechedLocationNotification:(id)a3
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  RTLocationContextManager *v10;
  __CFString *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  const __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  uint64_t v33;
  void *v34;
  RTLocationContextManager *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  objc_class *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  BOOL v48;
  void *v49;
  void *v50;
  RTLocationContextManager *v51;
  void *v52;
  double v53;
  double v54;
  NSObject *v55;
  objc_class *v56;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  void *v60;
  _BOOL4 v61;
  NSObject *v62;
  objc_class *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  RTLocationContextManager *v69;
  void *v70;
  const char *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  const __CFString *v85;
  __int16 v86;
  const __CFString *v87;
  __int16 v88;
  __CFString *v89;
  __int16 v90;
  __CFString *v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v10 = self;
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v81 = v8;
    v82 = 2112;
    v83 = (uint64_t)v9;
    v84 = 2112;
    v85 = v11;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, notification name, %@", buf, 0x20u);

    self = v10;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "leechedLocations");
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
    v71 = a2;
    v72 = v5;
    if (v13)
    {
      v14 = v13;
      v69 = self;
      v15 = 0;
      v16 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v77 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x1D8231EA8]();
          if (v18)
          {
            if (!v15
              || (objc_msgSend(v15, "timestamp"),
                  v20 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v18, "timestamp"),
                  v21 = (void *)objc_claimAutoreleasedReturnValue(),
                  v22 = objc_msgSend(v20, "compare:", v21),
                  v21,
                  v20,
                  v22 == -1))
            {
              v23 = v18;

              v15 = v23;
            }
          }
          objc_autoreleasePoolPop(v19);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
      }
      while (v14);

      if (!v15)
      {
        a2 = v71;
        v5 = v72;
        self = v69;
LABEL_20:
        _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = (objc_class *)objc_opt_class();
          NSStringFromClass(v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = CFSTR("NO");
          if (-[RTLocationContextManager inLowConfidenceVisit](self, "inLowConfidenceVisit"))
            v30 = CFSTR("YES");
          else
            v30 = CFSTR("NO");
          if (-[RTLocationContextManager inHighConfidenceVisit](self, "inHighConfidenceVisit"))
            v29 = CFSTR("YES");
          -[RTLocationContextManager lastPublishedLocation](self, "lastPublishedLocation");
          v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
          -[RTLocationContextManager latestValidLocation](self, "latestValidLocation");
          v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413570;
          v81 = v27;
          v82 = 2112;
          v83 = (uint64_t)v28;
          v84 = 2112;
          v85 = v30;
          v86 = 2112;
          v87 = v29;
          a2 = v71;
          v5 = v72;
          v88 = 2112;
          v89 = v31;
          v90 = 2112;
          v91 = v32;
          _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "%@, %@, in low confidence visit, %@, in high confidence visit, %@, lastPublishedLocation, %@, latestValidLocation, %@", buf, 0x3Eu);

        }
        -[RTLocationContextManager lastPublishedLocation](self, "lastPublishedLocation");
        v33 = objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          v34 = (void *)v33;
          -[RTLocationContextManager latestValidLocation](self, "latestValidLocation");
          v35 = self;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36 && !-[RTLocationContextManager inLowConfidenceVisit](v35, "inLowConfidenceVisit"))
          {
            v48 = -[RTLocationContextManager inHighConfidenceVisit](v35, "inHighConfidenceVisit");

            self = v35;
            if (!v48)
            {
              -[RTLocationContextManager distanceCalculator](v35, "distanceCalculator");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTLocationContextManager lastPublishedLocation](v35, "lastPublishedLocation");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = v35;
              -[RTLocationContextManager latestValidLocation](v35, "latestValidLocation");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = 0;
              objc_msgSend(v49, "distanceFromLocation:toLocation:error:", v50, v52, &v75);
              v54 = v53;
              v39 = (__CFString *)v75;

              _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                v56 = (objc_class *)objc_opt_class();
                NSStringFromClass(v56);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTLocationContextManager lastPublishedLocation](v51, "lastPublishedLocation");
                v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
                -[RTLocationContextManager latestValidLocation](v51, "latestValidLocation");
                v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if (v54 == 1.79769313e308)
                {
                  v59 = CFSTR("DBL_MAX");
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.3f"), *(_QWORD *)&v54);
                  v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                *(_DWORD *)buf = 138413570;
                v81 = v70;
                v82 = 2112;
                v83 = (uint64_t)v68;
                v84 = 2112;
                v85 = v57;
                v86 = 2112;
                v87 = v58;
                v88 = 2112;
                v89 = v59;
                v90 = 2112;
                v91 = v39;
                _os_log_impl(&dword_1D1A22000, v55, OS_LOG_TYPE_INFO, "%@, %@, last published location, %@, latest valid location, %@, distance, %@, error, %@", buf, 0x3Eu);
                if (v54 != 1.79769313e308)

              }
              if (v39 || v54 == 1.79769313e308)
                goto LABEL_34;
              self = v51;
              if (v54 > 500.0)
              {
                -[RTLocationContextManager latestValidLocation](v51, "latestValidLocation");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = 0;
                v61 = -[RTLocationContextManager _postLocationContextNotificationUsingData:error:](v51, "_postLocationContextNotificationUsingData:error:", v60, &v74);
                v39 = (__CFString *)v74;

                _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
                v62 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                {
                  v63 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v63);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  NSStringFromSelector(a2);
                  v65 = objc_claimAutoreleasedReturnValue();
                  v66 = (void *)v65;
                  v67 = CFSTR("NO");
                  *(_DWORD *)buf = 138413058;
                  v81 = v64;
                  v82 = 2112;
                  if (v61)
                    v67 = CFSTR("YES");
                  v83 = v65;
                  v84 = 2112;
                  v85 = v67;
                  v86 = 2112;
                  v87 = v39;
                  _os_log_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_INFO, "%@, %@, publish outside visit after meeting distance threshold status, %@, error, %@", buf, 0x2Au);

                }
                self = v51;
                if (v39)
                  goto LABEL_34;
              }
            }
          }
          else
          {

            self = v35;
          }
        }
        -[RTLocationContextManager lastPublishedLocation](self, "lastPublishedLocation");
        v37 = objc_claimAutoreleasedReturnValue();
        if (v37)
        {
          v38 = v37;
          v39 = 0;
        }
        else
        {
          -[RTLocationContextManager latestValidLocation](self, "latestValidLocation");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v40)
          {
            v39 = 0;
            goto LABEL_34;
          }
          -[RTLocationContextManager latestValidLocation](self, "latestValidLocation");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = 0;
          v42 = -[RTLocationContextManager _postLocationContextNotificationUsingData:error:](self, "_postLocationContextNotificationUsingData:error:", v41, &v73);
          v39 = (__CFString *)v73;

          _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            v43 = (objc_class *)objc_opt_class();
            NSStringFromClass(v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v45 = objc_claimAutoreleasedReturnValue();
            v46 = (void *)v45;
            v47 = CFSTR("NO");
            *(_DWORD *)buf = 138413058;
            v81 = v44;
            v82 = 2112;
            if (v42)
              v47 = CFSTR("YES");
            v83 = v45;
            v84 = 2112;
            v85 = v47;
            v86 = 2112;
            v87 = v39;
            _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "%@, %@, publish outside visit after first location status, %@, error, %@", buf, 0x2Au);

          }
        }

LABEL_34:
        goto LABEL_35;
      }
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v15);
      self = v69;
      -[RTLocationContextManager setLatestValidLocation:](v69, "setLatestValidLocation:", v24);
      a2 = v71;
      v5 = v72;
    }
    else
    {
      v15 = 0;
      v24 = v12;
    }

    goto LABEL_20;
  }
LABEL_35:

}

- (void)setLocationContextMonitoringEnabled:(BOOL)a3
{
  NSObject *v4;
  const __CFString *v5;
  _BOOL4 locationContextMonitoringEnabled;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (self->_locationContextMonitoringEnabled != a3)
  {
    self->_locationContextMonitoringEnabled = a3;
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_locationContextMonitoringEnabled)
        v5 = CFSTR("YES");
      else
        v5 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v29 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "location context monitoring enabled, %@", buf, 0xCu);
    }

    locationContextMonitoringEnabled = self->_locationContextMonitoringEnabled;
    -[RTLocationContextManager authorizationManager](self, "authorizationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (locationContextMonitoringEnabled)
    {
      +[RTNotification notificationName](RTAuthorizationManagerNotificationRoutineEnabled, "notificationName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:", self, sel_onAuthorizationNotification_, v9);

      -[RTLocationContextManager visitManager](self, "visitManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTVisitManagerLowConfidenceVisitIncidentNotification, "notificationName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:", self, sel_onVisitManagerNotification_, v11);

      -[RTLocationContextManager visitManager](self, "visitManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:", self, sel_onVisitManagerNotification_, v13);

      -[RTLocationContextManager visitManager](self, "visitManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTVisitManagerPointOfInterestUpdateNotification, "notificationName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:", self, sel_onVisitManagerNotification_, v15);

      -[RTLocationContextManager learnedLocationManager](self, "learnedLocationManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTLearnedLocationManagerNotificationAvailabilityDidChange, "notificationName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObserver:selector:name:", self, sel_onLearnedLocationManagerNotification_, v17);

      -[RTLocationContextManager locationManager](self, "locationManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObserver:selector:name:", self, sel_onLeechedLocationNotification_, v19);

      v27 = 0;
      -[RTLocationContextManager _resetTimerWitherror:](self, "_resetTimerWitherror:", &v27);
    }
    else
    {
      objc_msgSend(v7, "removeObserver:", self);

      -[RTLocationContextManager visitManager](self, "visitManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTVisitManagerLowConfidenceVisitIncidentNotification, "notificationName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObserver:fromNotification:", self, v21);

      -[RTLocationContextManager visitManager](self, "visitManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeObserver:fromNotification:", self, v23);

      -[RTLocationContextManager learnedLocationManager](self, "learnedLocationManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeObserver:", self);

      -[RTLocationContextManager locationManager](self, "locationManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeObserver:", self);

      v26 = 0;
      -[RTLocationContextManager _clearTimerWithError:](self, "_clearTimerWithError:", &v26);
    }
  }
}

- (BOOL)_postLocationContextNotificationUsingData:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  BOOL v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  RTLocationContextManagerPlaceInferencesNotification *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  id v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  objc_class *v49;
  void *v50;
  void *v51;
  RTLocationContextManagerPlaceInferencesNotification *v52;
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  uint8_t buf[4];
  uint64_t v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  const __CFString *v66;
  __int16 v67;
  id v68;
  uint64_t v69;
  const __CFString *v70;
  id v71;
  uint64_t v72;
  void *v73;
  _QWORD v74[3];

  v74[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: data", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("data"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = 0;
    -[RTLocationContextManager _getPlaceInferencesAtLocation:error:](self, "_getPlaceInferencesAtLocation:error:", v7, &v56);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v56;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v71 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v38 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v39 = *MEMORY[0x1E0D18598];
    v69 = *MEMORY[0x1E0CB2D50];
    v70 = CFSTR("invalid data type is passed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v38, "initWithDomain:code:userInfo:", v39, 7, v40);

    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
LABEL_44:

      if (a4)
      {
        v10 = objc_retainAutorelease(v10);
        v16 = 0;
        *a4 = v10;
        goto LABEL_46;
      }
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138412290;
    v58 = (uint64_t)v10;
LABEL_43:
    _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, "error, %@", buf, 0xCu);
    goto LABEL_44;
  }
  objc_msgSend(v7, "placeInference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v7, "placeInference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v7, "location");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
  {
    v44 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v45 = *MEMORY[0x1E0D18598];
    v72 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid visit passed, %@"), v7);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v46;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v44, "initWithDomain:code:userInfo:", v45, 7, v47);

    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_44;
    *(_DWORD *)buf = 138412290;
    v58 = (uint64_t)v10;
    goto LABEL_43;
  }
  objc_msgSend(v7, "location");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  -[RTLocationContextManager _getPlaceInferencesAtLocation:error:](self, "_getPlaceInferencesAtLocation:error:", v43, &v55);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v55;

LABEL_14:
  _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134218242;
    v58 = v14;
    v59 = 2112;
    v60 = v10;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "final place inferences count, %lu, error, %@", buf, 0x16u);
  }

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __76__RTLocationContextManager__postLocationContextNotificationUsingData_error___block_invoke;
    v54[3] = &__block_descriptor_40_e33_v32__0__RTPlaceInference_8Q16_B24l;
    v54[4] = a2;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v54);
  }
  if (a4 && v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v58 = (uint64_t)v50;
      v59 = 2112;
      v60 = v51;
      v61 = 2112;
      v62 = v10;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v10 = objc_retainAutorelease(v10);
    *a4 = v10;

LABEL_23:
    v16 = 0;
    goto LABEL_46;
  }
  -[RTLocationContextManager lastPublishedPlaceInference](self, "lastPublishedPlaceInference");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqual:", v18);

  if (v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v58 = (uint64_t)v22;
      v59 = 2112;
      v60 = v23;
      v61 = 2112;
      v62 = v9;
      _os_log_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_INFO, "%@, %@, place inference already published, skipping place inference, %@", buf, 0x20u);

    }
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    v16 = v10 == 0;

  }
  else
  {
    v24 = -[RTLocationContextManagerPlaceInferencesNotification initWithPlaceInferences:]([RTLocationContextManagerPlaceInferencesNotification alloc], "initWithPlaceInferences:", v9);
    -[RTNotifier postNotification:](self, "postNotification:", v24);
    objc_msgSend(v9, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationContextManager setLastPublishedPlaceInference:](self, "setLastPublishedPlaceInference:", v25);

    objc_msgSend(v9, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "referenceLocation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationContextManager setLastPublishedLocation:](self, "setLastPublishedLocation:", v27);

    v53 = v10;
    v28 = -[RTLocationContextManager _resetTimerWitherror:](self, "_resetTimerWitherror:", &v53);
    v29 = v53;

    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationContextManager lastPublishedLocation](self, "lastPublishedLocation");
      v52 = v24;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationContextManager lastPublishedPlaceInference](self, "lastPublishedPlaceInference");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v35;
      *(_DWORD *)buf = 138413570;
      v37 = CFSTR("NO");
      v58 = (uint64_t)v32;
      v59 = 2112;
      if (v28)
        v37 = CFSTR("YES");
      v60 = v33;
      v61 = 2112;
      v62 = v34;
      v63 = 2112;
      v64 = v35;
      v65 = 2112;
      v66 = v37;
      v67 = 2112;
      v68 = v29;
      _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%@, %@, last published location, %@, last published place inference, %@, timer status, %@, error, %@", buf, 0x3Eu);

      v24 = v52;
    }

    if (a4)
      *a4 = objc_retainAutorelease(v29);
    v16 = v29 == 0;

    v10 = v29;
  }
LABEL_46:

  return v16;
}

void __76__RTLocationContextManager__postLocationContextNotificationUsingData_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = a3 + 1;
    v12 = 2112;
    v13 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%@, place inference %lu, %@", (uint8_t *)&v8, 0x20u);

  }
}

- (BOOL)_resetTimerWitherror:(id *)a3
{
  NSObject *v6;
  objc_class *v7;
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
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23[2];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationContextManager timer](self, "timer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, reset timer called, %@", buf, 0x20u);

  }
  -[RTLocationContextManager timer](self, "timer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[RTLocationContextManager timer](self, "timer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    -[RTLocationContextManager setTimer:](self, "setTimer:", 0);
  }
  objc_initWeak((id *)buf, self);
  -[RTLocationContextManager timerManager](self, "timerManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier queue](self, "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __49__RTLocationContextManager__resetTimerWitherror___block_invoke;
  v22 = &unk_1E92A2718;
  objc_copyWeak(v23, (id *)buf);
  v23[1] = (id)a2;
  objc_msgSend(v13, "timerWithIdentifier:queue:handler:", CFSTR("com.apple.routined.locationContextManagerAlarm"), v14, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationContextManager setTimer:](self, "setTimer:", v15, v19, v20, v21, v22);

  -[RTLocationContextManager timer](self, "timer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fireWithInterval:", 300.0);

  -[RTLocationContextManager timer](self, "timer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resume");

  if (a3)
    *a3 = 0;
  objc_destroyWeak(v23);
  objc_destroyWeak((id *)buf);
  return 1;
}

void __49__RTLocationContextManager__resetTimerWitherror___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "latestValidLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v4 = objc_msgSend(WeakRetained, "_postLocationContextNotificationUsingData:error:", v3, &v12);
  v5 = v12;

  _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v14 = v8;
    v15 = 2112;
    if (v4)
      v11 = CFSTR("YES");
    v16 = v9;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, %@, timer expired, notification status, %@, error, %@", buf, 0x2Au);

  }
}

- (BOOL)_clearTimerWithError:(id *)a3
{
  void *v5;
  void *v6;

  -[RTLocationContextManager timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RTLocationContextManager timer](self, "timer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[RTLocationContextManager setTimer:](self, "setTimer:", 0);
  }
  if (a3)
    *a3 = 0;
  return 1;
}

- (id)_getPlaceInferencesAtLocation:(id)a3 error:(id *)a4
{
  uint64_t (*v6)(uint64_t, uint64_t);
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  dispatch_semaphore_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  dispatch_time_t v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  id v45;
  _QWORD v48[4];
  NSObject *v49;
  _BYTE *v50;
  uint64_t *v51;
  uint64_t v52;
  id *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  void *v58;
  _BYTE v59[12];
  __int16 v60;
  id v61;
  _BYTE buf[24];
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  void *v66;
  _QWORD v67[4];

  v67[1] = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (*)(uint64_t, uint64_t))a3;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("location"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    v63 = v6;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, %@, location, %@,", buf, 0x20u);

  }
  v12 = objc_alloc(MEMORY[0x1E0D18428]);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithRTLocation:", v6);
  v66 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "_coreroutineBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithFidelityPolicy:locations:accessPoints:clientIdentifier:", 0, v14, MEMORY[0x1E0C9AA60], v16);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v63 = __Block_byref_object_copy__118;
  v64 = __Block_byref_object_dispose__118;
  v65 = 0;
  v52 = 0;
  v53 = (id *)&v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__118;
  v56 = __Block_byref_object_dispose__118;
  v57 = 0;
  v18 = dispatch_semaphore_create(0);
  -[RTLocationContextManager placeInferenceManager](self, "placeInferenceManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __64__RTLocationContextManager__getPlaceInferencesAtLocation_error___block_invoke;
  v48[3] = &unk_1E9296EE0;
  v50 = buf;
  v51 = &v52;
  v20 = v18;
  v49 = v20;
  objc_msgSend(v19, "fetchPlaceInferencesForOptions:handler:", v17, v48);

  v21 = v20;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v21, v23))
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timeIntervalSinceDate:", v22);
  v26 = v25;
  v27 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_90);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "filteredArrayUsingPredicate:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "submitToCoreAnalytics:type:duration:", v31, 1, v26);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v59 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v59, 2u);
  }

  v33 = (void *)MEMORY[0x1E0CB35C8];
  v67[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v59 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v67, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = objc_retainAutorelease(v35);

  }
  else
  {
LABEL_13:
    v36 = 0;
  }

  v37 = v36;
  if (v37)
    objc_storeStrong(v53 + 5, v36);
  _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v39 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
    v40 = v53[5];
    *(_DWORD *)v59 = 134218242;
    *(_QWORD *)&v59[4] = v39;
    v60 = 2112;
    v61 = v40;
    _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "fetched place inferences count, %lu, error, %@", v59, 0x16u);
  }

  if (!objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
  {
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18420]), "initWithMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:loiIdentifier:", 0, 0, 0, 0, v6, 0, 1.0);
    _rt_log_facility_get_os_log(RTLogFacilityLocationContext);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v59 = 138412290;
      *(_QWORD *)&v59[4] = v41;
      _os_log_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_INFO, "created a place inference using location, %@,", v59, 0xCu);
    }

    v58 = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v43 = objc_claimAutoreleasedReturnValue();
    v44 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v43;

  }
  if (a4)
    *a4 = objc_retainAutorelease(v53[5]);
  v45 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(buf, 8);

  return v45;
}

void __64__RTLocationContextManager__getPlaceInferencesAtLocation_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_getLearnedLOIForVisit:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  objc_class *v34;
  id v35;
  void *v36;
  _QWORD v38[4];
  NSObject *v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE buf[12];
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  _QWORD v59[4];

  v59[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__118;
  v52 = __Block_byref_object_dispose__118;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__118;
  v46 = __Block_byref_object_dispose__118;
  v47 = 0;
  v7 = dispatch_semaphore_create(0);
  -[RTLocationContextManager learnedLocationManager](self, "learnedLocationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeInference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loiIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __57__RTLocationContextManager__getLearnedLOIForVisit_error___block_invoke;
  v38[3] = &unk_1E9297478;
  v40 = &v42;
  v41 = &v48;
  v11 = v7;
  v39 = v11;
  objc_msgSend(v8, "fetchLocationOfInterestWithIdentifier:handler:", v10, v38);

  v12 = v11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v12, v14))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceDate:", v13);
  v17 = v16;
  v18 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_90);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v24 = (void *)MEMORY[0x1E0CB35C8];
  v59[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v59, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = objc_retainAutorelease(v26);

  }
  else
  {
LABEL_6:
    v27 = 0;
  }

  v28 = v27;
  v29 = v28;
  if (a4 && v28)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v35;
      v55 = 2112;
      v56 = v36;
      v57 = 2112;
      v58 = v29;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v31 = 0;
    *a4 = objc_retainAutorelease(v29);
  }
  else
  {
    if (a4)
      *a4 = objc_retainAutorelease((id)v49[5]);
    if (v49[5])
      v32 = 0;
    else
      v32 = (void *)v43[5];
    v31 = v32;
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v31;
}

void __57__RTLocationContextManager__getLearnedLOIForVisit_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_getFamIndexResultWithGranularity:(unint64_t)a3 location:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  double v10;
  uint64_t v11;
  dispatch_semaphore_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  dispatch_time_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  NSObject *v33;
  id v34;
  objc_class *v36;
  id v37;
  void *v38;
  const char *aSelector;
  void *v40;
  _QWORD v41[4];
  NSObject *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _BYTE buf[12];
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  _QWORD v62[4];

  aSelector = a2;
  v62[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = objc_alloc(MEMORY[0x1E0D18388]);
  objc_msgSend(v8, "horizontalUncertainty");
  v11 = objc_msgSend(v9, "initWithDateInterval:lookbackInterval:spatialGranularity:referenceLocation:referenceLocationSummary:distance:", 0, a3, v8, 0, 604800.0, v10);
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__118;
  v55 = __Block_byref_object_dispose__118;
  v56 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__118;
  v49 = __Block_byref_object_dispose__118;
  v50 = 0;
  v12 = dispatch_semaphore_create(0);
  -[RTLocationContextManager learnedLocationManager](self, "learnedLocationManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __77__RTLocationContextManager__getFamIndexResultWithGranularity_location_error___block_invoke;
  v41[3] = &unk_1E9296EE0;
  v43 = &v45;
  v44 = &v51;
  v14 = v12;
  v42 = v14;
  objc_msgSend(v13, "fetchFamiliarityIndexResultsWithOptions:handler:", v11, v41);
  v40 = (void *)v11;

  v15 = v14;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v15, v17))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", aSelector);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", v16);
  v20 = v19;
  v21 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_90);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "filteredArrayUsingPredicate:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "submitToCoreAnalytics:type:duration:", v25, 1, v20);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v27 = (void *)MEMORY[0x1E0CB35C8];
  v62[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v62, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = objc_retainAutorelease(v29);

  }
  else
  {
LABEL_6:
    v30 = 0;
  }

  v31 = v30;
  v32 = v31;
  if (a5 && v31)
  {
    _rt_log_facility_get_os_log(RTLogFacilityWorkout);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(aSelector);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v37;
      v58 = 2112;
      v59 = v38;
      v60 = 2112;
      v61 = v32;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, %@, RTOutErrorAssignConditionalReturn, error, %@", buf, 0x20u);

    }
    v34 = 0;
    *a5 = objc_retainAutorelease(v32);
  }
  else
  {
    if (a5)
      *a5 = objc_retainAutorelease((id)v52[5]);
    v34 = (id)v46[5];
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);

  return v34;
}

void __77__RTLocationContextManager__getFamIndexResultWithGranularity_location_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "lastObject");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
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

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTPlaceInferenceManager)placeInferenceManager
{
  return self->_placeInferenceManager;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (BOOL)routineEnabled
{
  return self->_routineEnabled;
}

- (void)setRoutineEnabled:(BOOL)a3
{
  self->_routineEnabled = a3;
}

- (BOOL)locationContextMonitoringEnabled
{
  return self->_locationContextMonitoringEnabled;
}

- (RTLocation)latestValidLocation
{
  return self->_latestValidLocation;
}

- (void)setLatestValidLocation:(id)a3
{
  objc_storeStrong((id *)&self->_latestValidLocation, a3);
}

- (RTLocation)lastPublishedLocation
{
  return self->_lastPublishedLocation;
}

- (void)setLastPublishedLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastPublishedLocation, a3);
}

- (RTPlaceInference)lastPublishedPlaceInference
{
  return self->_lastPublishedPlaceInference;
}

- (void)setLastPublishedPlaceInference:(id)a3
{
  objc_storeStrong((id *)&self->_lastPublishedPlaceInference, a3);
}

- (BOOL)inLowConfidenceVisit
{
  return self->_inLowConfidenceVisit;
}

- (void)setInLowConfidenceVisit:(BOOL)a3
{
  self->_inLowConfidenceVisit = a3;
}

- (BOOL)inHighConfidenceVisit
{
  return self->_inHighConfidenceVisit;
}

- (void)setInHighConfidenceVisit:(BOOL)a3
{
  self->_inHighConfidenceVisit = a3;
}

- (RTTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_lastPublishedPlaceInference, 0);
  objc_storeStrong((id *)&self->_lastPublishedLocation, 0);
  objc_storeStrong((id *)&self->_latestValidLocation, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_placeInferenceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
}

@end
