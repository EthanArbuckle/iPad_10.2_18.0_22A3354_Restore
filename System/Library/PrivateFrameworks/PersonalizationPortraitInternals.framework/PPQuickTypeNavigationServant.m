@implementation PPQuickTypeNavigationServant

- (PPQuickTypeNavigationServant)init
{
  char *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  dispatch_semaphore_t v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  dispatch_semaphore_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  uint8_t buf[16];
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)PPQuickTypeNavigationServant;
  v2 = -[PPQuickTypeNavigationServant init](&v31, sel_init);
  if (v2)
  {
    pp_quicktype_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_INFO, "PPQuickTypeNavigationServant initializing", buf, 2u);
    }

    newGEONavigationListener();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v4;

    objc_msgSend(*((id *)v2 + 1), "setDelegate:", v2);
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)(v2 + 40) = _Q0;
    v11 = dispatch_semaphore_create(0);
    v12 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v11;

    v13 = dispatch_semaphore_create(0);
    v14 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v13;

    v15 = dispatch_semaphore_create(0);
    v16 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v15;

    objc_msgSend(*((id *)v2 + 1), "requestGuidanceState");
    objc_msgSend(*((id *)v2 + 1), "requestRouteSummary");
    objc_msgSend(*((id *)v2 + 1), "requestPositionFromDestination");
    v17 = (void *)MEMORY[0x1E0D70C20];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "quickTypeQueryWithType:subtype:semanticTag:fields:time:options:subFields:label:people:localeIdentifier:bundleIdentifier:recipients:", 0, 0, 0, 0, 0, 0, 0, 0, 0, v19, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    +[PPQuickTypeFormatter formatterWithQuery:](PPQuickTypeFormatter, "formatterWithQuery:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v21, "makeShortEventFormatter");
    v23 = (id)objc_msgSend(v21, "makeLongEventFormatter");
    v24 = (id)objc_msgSend(v21, "makeDateComponentFormatter");
    v25 = (id)objc_msgSend(v21, "makeLengthFormatter");
    objc_msgSend(v21, "etaLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (id)objc_msgSend(v21, "navigationItemLabelForTypeLabel:destination:", v26, CFSTR("warmup"));

    pp_quicktype_log_handle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v28, OS_LOG_TYPE_INFO, "PPQuickTypeNavigationServant initialization complete", buf, 2u);
    }

  }
  return (PPQuickTypeNavigationServant *)v2;
}

- (void)dealloc
{
  NSObject *v3;
  PPQuickTypeNavigationServant *v4;
  GEONavigationListener *navigationListener;
  NSString *destinationName;
  NSString *streetName;
  objc_super v8;
  uint8_t buf[16];

  if (self)
  {
    pp_quicktype_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEBUG, "_stopListeningToNavigationUpdate", buf, 2u);
    }

    v4 = self;
    objc_sync_enter(v4);
    navigationListener = v4->_navigationListener;
    v4->_navigationListener = 0;

    destinationName = v4->_destinationName;
    v4->_destinationName = 0;

    streetName = v4->_streetName;
    v4->_streetName = 0;

    objc_sync_exit(v4);
  }
  v8.receiver = self;
  v8.super_class = (Class)PPQuickTypeNavigationServant;
  -[PPQuickTypeNavigationServant dealloc](&v8, sel_dealloc);
}

- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5
{
  id v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  PPQuickTypeNavigationServant *v14;
  double remainingTimeToDestination;
  void *v16;
  double v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  PPQuickTypeNavigationServant *v32;
  double remainingDistanceToDestination;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  double v42;
  void *v43;
  double v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  PPQuickTypeNavigationServant *v53;
  void *v54;
  void *v55;
  NSString *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  PPQuickTypeNavigationServant *v62;
  void *v63;
  void *v64;
  NSString *v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  PPQuickTypeNavigationServant *v69;
  int navigationState;
  NSObject *v71;
  uint64_t v72;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint8_t buf[4];
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = objc_msgSend(v7, "type") == 4;
  pp_quicktype_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "prediction request to PPQuickTypeNavigationServant", buf, 2u);
    }

    if (+[PPQuickTypeSettings servantShouldRespondToQuery:](PPQuickTypeSettings, "servantShouldRespondToQuery:", self))
    {
      if (self)
      {
        -[GEONavigationListener requestGuidanceState](self->_navigationListener, "requestGuidanceState");
        -[GEONavigationListener requestRouteSummary](self->_navigationListener, "requestRouteSummary");
        -[GEONavigationListener requestPositionFromDestination](self->_navigationListener, "requestPositionFromDestination");
      }
      v12 = (void *)objc_opt_new();
      +[PPQuickTypeFormatter formatterWithQuery:](PPQuickTypeFormatter, "formatterWithQuery:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "subtype") == 10)
      {
        -[PPQuickTypeNavigationServant _waitForSummary]((uint64_t)self);
        v14 = self;
        objc_sync_enter(v14);
        remainingTimeToDestination = v14->_remainingTimeToDestination;
        +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "navigationMinimumTimeInterval");
        v18 = remainingTimeToDestination > v17;

        if (v18)
        {
          if ((objc_msgSend(v7, "fields") & 0x800000) != 0)
          {
            objc_msgSend(v13, "etaLabel");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "navigationItemLabelForTypeLabel:destination:", v19, v14->_destinationName);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v14->_remainingTimeToDestination);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "formattedEventTime:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            BYTE2(v76) = 4;
            LOWORD(v76) = 0;
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C18]), "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v20, v22, 0, 0, 0x800000, 0, 1.0, 0, 0, v76, 0);
            objc_msgSend(v12, "addObject:", v23);

          }
          if ((objc_msgSend(v7, "fields") & 0x1000000) != 0)
          {
            objc_msgSend(v13, "timeLeftLabel");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "navigationItemLabelForTypeLabel:destination:", v24, v14->_destinationName);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v13, "formattedTimeInterval:", v14->_remainingTimeToDestination);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v26, "length"))
            {
              BYTE2(v76) = 4;
              LOWORD(v76) = 0;
              v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C18]), "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v25, v26, 0, 0, 0x1000000, 0, 1.0, 0, 0, v76, 0);
              objc_msgSend(v12, "addObject:", v27);

            }
          }
        }
        else if (v14->_remainingTimeToDestination <= 0.0)
        {
          pp_quicktype_log_handle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v31, OS_LOG_TYPE_DEFAULT, "got ETA request but don't have time data", buf, 2u);
          }

          objc_msgSend(v8, "push:", 33);
          +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", CFSTR("GEONoData"), 1);
        }
        else
        {
          pp_quicktype_log_handle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v30, OS_LOG_TYPE_DEFAULT, "got ETA request but too close to destination", buf, 2u);
          }

          objc_msgSend(v8, "push:", 48);
        }
        objc_sync_exit(v14);

      }
      if (objc_msgSend(v7, "subtype") == 8)
      {
        -[PPQuickTypeNavigationServant _waitForSummary]((uint64_t)self);
        v32 = self;
        objc_sync_enter(v32);
        remainingDistanceToDestination = v32->_remainingDistanceToDestination;
        +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = remainingDistanceToDestination > (double)objc_msgSend(v34, "navigationMinimumDistanceInMeters");

        if (v35)
        {
          objc_msgSend(v13, "distanceLabel");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "navigationItemLabelForTypeLabel:destination:", v36, v32->_destinationName);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "formattedLengthInMeters:", v32->_remainingDistanceToDestination);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          BYTE2(v76) = 4;
          LOWORD(v76) = 0;
          v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C18]), "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v37, v38, 0, 0, 0, 0, 1.0, 0, 0, v76, 0);
          objc_msgSend(v12, "addObject:", v39);

        }
        else if (v32->_remainingDistanceToDestination <= 0.0)
        {
          pp_quicktype_log_handle();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v41, OS_LOG_TYPE_DEFAULT, "got distance request but don't have distance data", buf, 2u);
          }

          objc_msgSend(v8, "push:", 34);
          +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", CFSTR("GEONoData"), 2);
        }
        else
        {
          pp_quicktype_log_handle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v40, OS_LOG_TYPE_DEFAULT, "got distance request but too close to destination", buf, 2u);
          }

          objc_msgSend(v8, "push:", 48);
        }
        v42 = v32->_remainingTimeToDestination;
        +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "navigationMinimumTimeInterval");
        v45 = v42 > v44;

        if (v45)
        {
          objc_msgSend(v13, "timeLeftLabel");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "navigationItemLabelForTypeLabel:destination:", v46, v32->_destinationName);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "formattedTimeInterval:", v32->_remainingTimeToDestination);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v48, "length"))
          {
            BYTE2(v76) = 4;
            LOWORD(v76) = 0;
            v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C18]), "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v47, v48, 0, 0, 0, 0, 1.0, 0, 0, v76, 0);
            objc_msgSend(v12, "addObject:", v49);

          }
        }
        else if (v32->_remainingTimeToDestination <= 0.0)
        {
          pp_quicktype_log_handle();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v51, OS_LOG_TYPE_DEFAULT, "got ETA request but don't have time data", buf, 2u);
          }

          objc_msgSend(v8, "push:", 33);
          +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", CFSTR("GEONoData"), 3);
        }
        else
        {
          pp_quicktype_log_handle();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v50, OS_LOG_TYPE_DEFAULT, "got ETA request but too close to destination", buf, 2u);
          }

          objc_msgSend(v8, "push:", 48);
        }
        objc_sync_exit(v32);

      }
      if (objc_msgSend(v7, "subtype") == 9)
      {
        pp_quicktype_log_handle();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C392E000, v52, OS_LOG_TYPE_DEBUG, "got a destination request", buf, 2u);
        }

        if ((-[PPQuickTypeNavigationServant _waitForSummary]((uint64_t)self) & 1) == 0)
        {
          objc_msgSend(v8, "push:", 32);
LABEL_93:
          v29 = 0;
          goto LABEL_94;
        }
        v53 = self;
        objc_sync_enter(v53);
        if (v53->_destinationName)
        {
          objc_msgSend(v13, "destinationLabel");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "navigationItemLabelForTypeLabel:destination:", v54, 0);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          v56 = v53->_destinationName;
          BYTE2(v76) = 4;
          LOWORD(v76) = 0;
          v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C18]), "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v55, v56, 0, 0, 0, 0, 1.0, 0, 0, v76, 0);
          pp_quicktype_log_handle();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v57, "value");
            v74 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v80 = v74;
            v77 = (void *)v74;
            _os_log_debug_impl(&dword_1C392E000, v58, OS_LOG_TYPE_DEBUG, "destination name: %@", buf, 0xCu);

          }
          objc_msgSend(v12, "addObject:", v57);

        }
        else
        {
          pp_quicktype_log_handle();
          v59 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v59, OS_LOG_TYPE_DEFAULT, "got Destination request but don't have destination data", buf, 2u);
          }

          objc_msgSend(v8, "push:", 35);
          +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", CFSTR("GEONoData"), 4);
        }
        objc_sync_exit(v53);

      }
      if (objc_msgSend(v7, "subtype") == 11)
      {
        pp_quicktype_log_handle();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C392E000, v60, OS_LOG_TYPE_DEBUG, "got a street request", buf, 2u);
        }

        if (!self)
          goto LABEL_73;
        if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", self->_streetSemaphore, 0.05) == 1)
        {
          pp_quicktype_log_handle();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1C392E000, v61, OS_LOG_TYPE_DEBUG, "timed out waiting on street.", buf, 2u);
          }

          +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", CFSTR("GEOTimeout"), 2);
LABEL_73:
          objc_msgSend(v8, "push:", 31);
          goto LABEL_93;
        }
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_streetSemaphore);
        v62 = self;
        objc_sync_enter(v62);
        if (v62->_streetName)
        {
          objc_msgSend(v13, "streetLabel");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "navigationItemLabelForTypeLabel:destination:", v63, 0);
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          v65 = v62->_streetName;
          BYTE2(v76) = 4;
          LOWORD(v76) = 0;
          v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C18]), "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v64, v65, 0, 0, 0, 0, 1.0, 0, 0, v76, 0);
          pp_quicktype_log_handle();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v66, "value");
            v75 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v80 = v75;
            v78 = (void *)v75;
            _os_log_debug_impl(&dword_1C392E000, v67, OS_LOG_TYPE_DEBUG, "street name: %@", buf, 0xCu);

          }
          objc_msgSend(v12, "addObject:", v66);

        }
        else
        {
          pp_quicktype_log_handle();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C392E000, v68, OS_LOG_TYPE_DEFAULT, "got Street request but don't have street data", buf, 2u);
          }

          objc_msgSend(v8, "push:", 36);
          +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", CFSTR("GEONoData"), 5);
        }
        objc_sync_exit(v62);

      }
      v69 = self;
      objc_sync_enter(v69);
      if (objc_msgSend(v12, "count"))
      {
LABEL_83:
        objc_sync_exit(v69);

        v29 = v12;
LABEL_94:

        goto LABEL_95;
      }
      navigationState = v69->_navigationState;
      if ((navigationState - 6) >= 2)
      {
        if (navigationState)
          goto LABEL_83;
        pp_quicktype_log_handle();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C392E000, v71, OS_LOG_TYPE_DEBUG, "navigation request when not navigating", buf, 2u);
        }
        v72 = 37;
      }
      else
      {
        pp_quicktype_log_handle();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C392E000, v71, OS_LOG_TYPE_DEBUG, "navigation request when navigation has ended", buf, 2u);
        }
        v72 = 38;
      }

      objc_msgSend(v8, "push:", v72);
      objc_sync_exit(v69);

      goto LABEL_93;
    }
    pp_quicktype_log_handle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEFAULT, "ignoring prediction request for Navigation due to settings", buf, 2u);
    }

    objc_msgSend(v8, "push:", 47);
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEBUG, "PPQuickTypeNavigationServant ignoring request since it doesn't ask for navigation", buf, 2u);
    }

  }
  v29 = 0;
LABEL_95:

  return v29;
}

- (void)navigationListener:(id)a3 didUpdateRouteSummary:(id)a4
{
  id v6;
  NSString *v7;
  NSObject *v8;
  PPQuickTypeNavigationServant *v9;
  void *v10;
  uint64_t v11;
  void *destinationName;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *v17;
  NSString *v18;
  int v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (NSString *)a4;
  pp_quicktype_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138412290;
    v20 = v7;
    _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "GEONavigationListener: didUpdateRouteSummary: %@", (uint8_t *)&v19, 0xCu);
  }

  v9 = self;
  objc_sync_enter(v9);
  if (-[NSString hasDestination](v7, "hasDestination"))
  {
    -[NSString destinationName](v7, "destinationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[NSString destinationName](v7, "destinationName");
      v11 = objc_claimAutoreleasedReturnValue();
      destinationName = v9->_destinationName;
      v9->_destinationName = (NSString *)v11;
    }
    else
    {
      -[NSString destination](v7, "destination");
      destinationName = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(destinationName, "waypoint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "waypointId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "placeNameHint");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v9->_destinationName;
      v9->_destinationName = (NSString *)v16;

    }
    pp_quicktype_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v18 = v9->_destinationName;
      v19 = 138412290;
      v20 = v18;
      _os_log_debug_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEBUG, "_destinationName = %@", (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    v13 = v9->_destinationName;
    v9->_destinationName = 0;
  }

  objc_sync_exit(v9);
  dispatch_semaphore_signal((dispatch_semaphore_t)v9->_summarySemaphore);

}

- (void)navigationListener:(id)a3 didUpdateCurrentRoadName:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  PPQuickTypeNavigationServant *v9;
  NSObject **p_streetName;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  pp_quicktype_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v7;
    _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "GEONavigationListener: didUpdateCurrentRoadName: %@", (uint8_t *)&v13, 0xCu);
  }

  v9 = self;
  objc_sync_enter(v9);
  p_streetName = (NSObject **)&v9->_streetName;
  if (-[NSObject length](v7, "length"))
  {
    objc_storeStrong((id *)&v9->_streetName, a4);
    pp_quicktype_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = *p_streetName;
      v13 = 138412290;
      v14 = v12;
      _os_log_debug_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEBUG, "_streetName = %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v11 = *p_streetName;
    *p_streetName = 0;
  }

  objc_sync_exit(v9);
  dispatch_semaphore_signal((dispatch_semaphore_t)v9->_streetSemaphore);

}

- (void)navigationListener:(id)a3 didUpdateGuidanceState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PPQuickTypeNavigationServant *v9;
  int v10;
  NSString *streetName;
  NSString *destinationName;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  pp_quicktype_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v18 = 138412290;
    v19 = v7;
    _os_log_debug_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEBUG, "GEONavigationListener: didUpdateGuidanceState: %@", (uint8_t *)&v18, 0xCu);
  }

  v9 = self;
  objc_sync_enter(v9);
  if ((objc_msgSend(v7, "hasNavigationState") & 1) != 0)
    v10 = objc_msgSend(v7, "navigationState");
  else
    v10 = 0;
  v9->_navigationState = v10;
  if (!objc_msgSend(v7, "navigationState"))
  {
    streetName = v9->_streetName;
    v9->_streetName = 0;

    destinationName = v9->_destinationName;
    v9->_destinationName = 0;

    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v9->_remainingTimeToDestination = _Q0;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)v9->_stateSemaphore);
  objc_sync_exit(v9);

}

- (void)navigationListener:(id)a3 didUpdatePositionFromDestination:(id)a4
{
  double var1;
  double var0;
  NSObject *v7;
  PPQuickTypeNavigationServant *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  var1 = a4.var1;
  var0 = a4.var0;
  v12 = *MEMORY[0x1E0C80C00];
  pp_quicktype_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.3f meters, %.3f seconds}"), *(_QWORD *)&var1, *(_QWORD *)&var0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v9;
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "GEONavigationListener: didUpdatePositionFromDestination: %@", buf, 0xCu);

  }
  v8 = self;
  objc_sync_enter(v8);
  v8->_remainingTimeToDestination = var0;
  v8->_remainingDistanceToDestination = var1;
  objc_sync_exit(v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summarySemaphore, 0);
  objc_storeStrong((id *)&self->_streetSemaphore, 0);
  objc_storeStrong((id *)&self->_stateSemaphore, 0);
  objc_storeStrong((id *)&self->_streetName, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_navigationListener, 0);
}

- (uint64_t)_waitForSummary
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (result)
  {
    v1 = result;
    if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", *(_QWORD *)(result + 72), 0.05) == 1)
    {
      pp_quicktype_log_handle();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v3 = 0;
        _os_log_debug_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEBUG, "timed out waiting on summary.", v3, 2u);
      }

      +[PPQuickTypeMetrics frameworkError:errorCode:](PPQuickTypeMetrics, "frameworkError:errorCode:", CFSTR("GEOTimeout"), 3);
      return 0;
    }
    else
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 72));
      return 1;
    }
  }
  return result;
}

@end
