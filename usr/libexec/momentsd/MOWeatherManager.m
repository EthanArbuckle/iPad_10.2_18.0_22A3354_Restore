@implementation MOWeatherManager

- (MOWeatherManager)init
{
  MOWeatherManager *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  _TtC8momentsd21MOWeatherDataProvider *v7;
  _TtC8momentsd21MOWeatherDataProvider *weatherDataProvider;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MOWeatherManager;
  v2 = -[MOWeatherManager init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("MOWeatherManager", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new(_TtC8momentsd21MOWeatherDataProvider);
    weatherDataProvider = v2->_weatherDataProvider;
    v2->_weatherDataProvider = v7;

  }
  return v2;
}

- (MOWeatherManager)initWithUniverse:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  MOWeatherManager *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  _TtC8momentsd21MOWeatherDataProvider *v15;
  _TtC8momentsd21MOWeatherDataProvider *weatherDataProvider;
  void *v17;
  objc_super v19;

  v4 = a3;
  v6 = (objc_class *)objc_opt_class(MODefaultsManager, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v8));

  v19.receiver = self;
  v19.super_class = (Class)MOWeatherManager;
  v10 = -[MOWeatherManager init](&v19, "init");
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("MOWeatherManager", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    v15 = objc_opt_new(_TtC8momentsd21MOWeatherDataProvider);
    weatherDataProvider = v10->_weatherDataProvider;
    v10->_weatherDataProvider = v15;

    objc_storeStrong((id *)&v10->_defaultManager, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOWeatherManager defaultManager](v10, "defaultManager"));
    objc_msgSend(v17, "setObject:forKey:", &__kCFBooleanTrue, CFSTR("MODefaultsWeatherManagerRequestsDisabled"));

  }
  return v10;
}

- (void)fetchWeatherBetweenStartDate:(id)a3 StartDate:(id)a4 EndDate:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[MOWeatherManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __75__MOWeatherManager_fetchWeatherBetweenStartDate_StartDate_EndDate_handler___block_invoke;
  block[3] = &unk_1002AE198;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

void __75__MOWeatherManager_fetchWeatherBetweenStartDate_StartDate_EndDate_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = __75__MOWeatherManager_fetchWeatherBetweenStartDate_StartDate_EndDate_handler___block_invoke_2;
  v6[3] = &unk_1002AEBD0;
  v7 = v4;
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  objc_msgSend(v3, "fetchHourlyWeatherFor:startDate:endDate:completion:", v2, v7, v5, v6);

}

void __75__MOWeatherManager_fetchWeatherBetweenStartDate_StartDate_EndDate_handler___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getWeatherSummary"));
      v11 = a1[4];
      v12 = a1[5];
      v13 = 138412802;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Weather condition is %@ between %@ and %@", (uint8_t *)&v13, 0x20u);

    }
  }
  (*(void (**)(void))(a1[6] + 16))();

}

- (void)rehydrateWeather:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MOWeatherManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45__MOWeatherManager_rehydrateWeather_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

id __45__MOWeatherManager_rehydrateWeather_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rehydrateWeather:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_rehydrateWeather:(id)a3 handler:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  id v13;
  NSString *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  objc_class *v23;
  NSString *v24;
  id v25;
  NSString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  id v38;
  void *v39;
  _TtC8momentsd21MOWeatherDataProvider *weatherDataProvider;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  NSObject *v45;
  uint64_t v46;
  objc_class *v47;
  NSString *v48;
  id v49;
  NSString *v50;
  void *v51;
  void (**v52)(void);
  id v53;
  id obj;
  MOWeatherManager *v56;
  _QWORD block[5];
  void (**v58)(void);
  uint64_t *v59;
  _QWORD *v60;
  _BYTE *v61;
  uint64_t *v62;
  _QWORD *v63;
  SEL v64;
  _QWORD v65[6];
  NSObject *v66;
  _QWORD *v67;
  _QWORD *v68;
  _BYTE *v69;
  uint64_t *v70;
  SEL v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[4];
  _QWORD v81[5];
  id v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint8_t v89[128];
  _BYTE buf[24];
  id v91;

  v53 = a3;
  v52 = (void (**)(void))a4;
  v56 = self;
  v6 = objc_claimAutoreleasedReturnValue(-[MOWeatherManager queue](self, "queue"));
  dispatch_assert_queue_V2(v6);

  v7 = dispatch_group_create();
  v83 = 0;
  v84 = &v83;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__10;
  v87 = __Block_byref_object_dispose__10;
  v88 = objc_alloc_init((Class)NSMutableArray);
  v81[0] = 0;
  v81[1] = v81;
  v81[2] = 0x3032000000;
  v81[3] = __Block_byref_object_copy__10;
  v81[4] = __Block_byref_object_dispose__10;
  v82 = 0;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = (objc_class *)objc_opt_class(MOWeatherManager, v10);
    v12 = NSStringFromClass(v11);
    v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    v14 = NSStringFromSelector(a2);
    v15 = (id)objc_claimAutoreleasedReturnValue(v14);
    v16 = objc_msgSend(v53, "count");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2048;
    v91 = v16;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@, %@, Fetch Weather Data START, events count, %lu", buf, 0x20u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOWeatherManager defaultManager](self, "defaultManager"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("MODefaultsWeatherManagerRequestsDisabled")));
  v19 = objc_msgSend(v18, "BOOLValue");

  if (v19)
  {
    v20 = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v23 = (objc_class *)objc_opt_class(MOWeatherManager, v22);
      v24 = NSStringFromClass(v23);
      v25 = (id)objc_claimAutoreleasedReturnValue(v24);
      v26 = NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v27;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%@, %@, Fetch Weather Data END, the call to weather service is disabled by the default settings", buf, 0x16u);

    }
    if (v52)
    {
      v52[2]();
    }
    else
    {
      v44 = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v47 = (objc_class *)objc_opt_class(v56, v46);
        v48 = NSStringFromClass(v47);
        v49 = (id)objc_claimAutoreleasedReturnValue(v48);
        v50 = NSStringFromSelector(a2);
        v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
        -[MOWeatherManager _rehydrateWeather:handler:].cold.1(v49, v51, (uint64_t)buf, v45);
      }

    }
  }
  else
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v91 = 0;
    v80[0] = 0;
    v80[1] = v80;
    v80[2] = 0x2020000000;
    v80[3] = 0;
    v76 = 0;
    v77 = &v76;
    v78 = 0x2020000000;
    v79 = 0;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    obj = v53;
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v73 != v29)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
          v32 = objc_alloc((Class)CLLocation);
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "location"));
          objc_msgSend(v33, "latitude");
          v35 = v34;
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "location"));
          objc_msgSend(v36, "longitude");
          v38 = objc_msgSend(v32, "initWithLatitude:longitude:", v35, v37);

          dispatch_group_enter(v7);
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "predominantWeather"));
          LODWORD(v36) = v39 == 0;

          if ((_DWORD)v36)
          {
            ++v77[3];
            weatherDataProvider = v56->_weatherDataProvider;
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "startDate"));
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "endDate"));
            v65[0] = _NSConcreteStackBlock;
            v65[1] = 3221225472;
            v65[2] = __46__MOWeatherManager__rehydrateWeather_handler___block_invoke;
            v65[3] = &unk_1002AF388;
            v65[4] = v31;
            v65[5] = v56;
            v67 = v80;
            v68 = v81;
            v69 = buf;
            v70 = &v83;
            v71 = a2;
            v66 = v7;
            -[MOWeatherDataProvider fetchHourlyWeatherFor:startDate:endDate:completion:](weatherDataProvider, "fetchHourlyWeatherFor:startDate:endDate:completion:", v38, v41, v42, v65);

          }
          else
          {
            objc_msgSend((id)v84[5], "addObject:", v31);
            dispatch_group_leave(v7);
          }

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v89, 16);
      }
      while (v28);
    }

    v43 = objc_claimAutoreleasedReturnValue(-[MOWeatherManager queue](v56, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_70;
    block[3] = &unk_1002AF3B0;
    v59 = &v76;
    v60 = v80;
    v64 = a2;
    v61 = buf;
    v62 = &v83;
    v63 = v81;
    block[4] = v56;
    v58 = v52;
    dispatch_group_notify(v7, v43, block);

    _Block_object_dispose(&v76, 8);
    _Block_object_dispose(v80, 8);
    _Block_object_dispose(buf, 8);
  }
  _Block_object_dispose(v81, 8);

  _Block_object_dispose(&v83, 8);
}

void __46__MOWeatherManager__rehydrateWeather_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MOWeather *v14;
  id os_log;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  MOWeather *v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v21 = v6;
    v22 = v5;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
    v20 = [MOWeather alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "startDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "endDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "weatherSummary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "symbolName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "temperature"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windSpeed"));
    v14 = -[MOWeather initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:](v20, "initWithWeatherIdentifier:startDate:endDate:weatherSummary:weatherSymbolName:temperature:windSpeed:", v19, v8, v9, v10, v11, v12, v13);

    -[MOWeather setSourceEventAccessType:](v14, "setSourceEventAccessType:", 5);
    objc_msgSend(*(id *)(a1 + 32), "setPredominantWeather:", v14);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
    v16 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_cold_2(a1, (id *)(a1 + 32), v16);

    v6 = v21;
    v5 = v22;
  }
  else if (v6)
  {
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_cold_1(a1, (uint64_t)v6, v18);

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a3);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_70(uint64_t a1)
{
  id os_log;
  NSObject *v3;
  uint64_t v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;

  os_log = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
  v3 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class(MOWeatherManager, v4);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = NSStringFromSelector(*(SEL *)(a1 + 88));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    v16 = 138413314;
    v17 = v7;
    v18 = 2112;
    v19 = v9;
    v20 = 2048;
    v21 = v10;
    v22 = 2048;
    v23 = v11;
    v24 = 2048;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@, %@, Fetch Weather Data END, attempted %lu weather requests, successfully fethed weather data for %lu events and %lu weather fetch errors occured.", (uint8_t *)&v16, 0x34u);

  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v13 + 16))(v13, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  }
  else
  {
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityWeather);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_70_cold_1(a1, v15);

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (_TtC8momentsd21MOWeatherDataProvider)weatherDataProvider
{
  return self->_weatherDataProvider;
}

- (void)setWeatherDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_weatherDataProvider, a3);
}

- (MODefaultsManager)defaultManager
{
  return self->_defaultManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultManager, 0);
  objc_storeStrong((id *)&self->_weatherDataProvider, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_rehydrateWeather:(uint64_t)a3 handler:(NSObject *)a4 .cold.1(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_10((void *)&_mh_execute_header, a4, a3, "%@, %@, nil handler", (uint8_t *)a3);

}

void __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  NSString *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;

  v5 = (objc_class *)objc_opt_class(*(_QWORD *)(a1 + 40), a2);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSStringFromSelector(*(SEL *)(a1 + 88));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eventIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "predominantWeather"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "weatherSummary"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "predominantWeather"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "predominantWeather"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "endDate"));
  *(_DWORD *)buf = 138413826;
  v19 = v7;
  v20 = 2112;
  v21 = v9;
  v22 = 2112;
  v23 = a2;
  v24 = 2112;
  v25 = v10;
  v26 = 2112;
  v27 = v12;
  v28 = 2112;
  v29 = v14;
  v30 = 2112;
  v31 = v16;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%@, %@, error %@ fetching weather for the event %@, weather condition for the first hour is %@ between %@ and %@ ", buf, 0x48u);

}

void __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  objc_class *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v6 = (objc_class *)objc_opt_class(*(_QWORD *)(a1 + 40), a2);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = NSStringFromSelector(*(SEL *)(a1 + 88));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a2, "eventIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a2, "predominantWeather"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "weatherSummary"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a2, "predominantWeather"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a2, "predominantWeather"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
  v18 = 138413570;
  v19 = v8;
  v20 = 2112;
  v21 = v10;
  v22 = 2112;
  v23 = v11;
  v24 = 2112;
  v25 = v13;
  v26 = 2112;
  v27 = v15;
  v28 = 2112;
  v29 = v17;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@, %@, Just finished processing weather rehydrate for the event %@, weather condition for the first hour is %@ between %@ and %@ ", (uint8_t *)&v18, 0x3Eu);

}

void __46__MOWeatherManager__rehydrateWeather_handler___block_invoke_70_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v4;
  NSString *v5;
  void *v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;

  v4 = (objc_class *)objc_opt_class(*(_QWORD *)(a1 + 32), a2);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = NSStringFromSelector(*(SEL *)(a1 + 88));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v10 = 138412546;
  v11 = v6;
  v12 = 2112;
  v13 = v8;
  OUTLINED_FUNCTION_0_10((void *)&_mh_execute_header, a2, v9, "%@, %@, nil handler", (uint8_t *)&v10);

}

@end
