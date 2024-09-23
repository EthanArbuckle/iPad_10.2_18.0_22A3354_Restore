@implementation MODataDumpFormatter

- (MODataDumpFormatter)initWithEvents:(id)a3 bundles:(id)a4 ranking:(id)a5 settings:(id)a6 configManager:(id)a7
{
  id v14;
  id v15;
  id v16;
  MODataDumpFormatter *v17;
  MODataDumpFormatter *v18;
  void *v19;
  MOEventSerializationSessionHelper *v20;
  MOEventSerializationSessionHelper *eventSerializer;
  MODataDumpFormatter *v22;
  id os_log;
  NSObject *v24;
  void *v25;
  id v27;
  void *v28;
  id v29;
  void *v30;
  objc_super v31;

  v29 = a3;
  v27 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v16)
  {
    v31.receiver = self;
    v31.super_class = (Class)MODataDumpFormatter;
    v17 = -[MODataDumpFormatter init](&v31, "init", v27, v29);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_events, a3);
      objc_storeStrong((id *)&v18->_bundles, a4);
      objc_storeStrong((id *)&v18->_ranking, a5);
      objc_storeStrong((id *)&v18->_settings, a6);
      objc_storeStrong((id *)&v18->_configManager, a7);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v18->_settings, "objectForKey:", CFSTR("kMODataWithoutRandomization")));
      v18->_persistWithoutRandomization = objc_msgSend(v19, "BOOLValue");

      v20 = -[MOEventSerializationSessionHelper initWithRandomization:]([MOEventSerializationSessionHelper alloc], "initWithRandomization:", !v18->_persistWithoutRandomization);
      eventSerializer = v18->_eventSerializer;
      v18->_eventSerializer = v20;

    }
    self = v18;
    v22 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[MODataDumpFormatter initWithEvents:bundles:ranking:settings:configManager:].cold.1(v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", v27, v29));
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MODataDumpFormatter.m"), 51, CFSTR("Invalid parameter not satisfying: configManager"));

    v22 = 0;
  }

  return v22;
}

- (id)extractJSONPayload
{
  NSMutableArray *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  void *i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  NSArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  NSMutableDictionary *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v28 = objc_opt_new(NSMutableDictionary);
  v3 = objc_opt_new(NSMutableArray);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = self->_events;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    v8 = 3.40282347e38;
    v9 = 1.17549435e-38;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventSerializationSessionHelper serializeEvent:](self->_eventSerializer, "serializeEvent:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i)));
        if (v11)
        {
          -[NSMutableArray addObject:](v3, "addObject:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("eventStartDate")));
          objc_msgSend(v12, "doubleValue");
          v14 = v13;

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("eventEndDate")));
          objc_msgSend(v15, "doubleValue");
          v17 = v16;

          if (v14 < v8)
            v8 = v14;
          if (v17 > v9)
            v9 = v17;
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 3.40282347e38;
    v9 = 1.17549435e-38;
  }

  -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v3, CFSTR("kMOEvent"));
  if (-[NSMutableArray count](v3, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
    -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v18, CFSTR("kMOStartTimeFromEventWithEarliestStartDate"));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
    -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v19, CFSTR("kMOEndTimeFromEventWithLatestEndDate"));

  }
  v20 = objc_opt_new(NSMutableArray);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v21 = self->_bundles;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventSerializationSessionHelper serializeEventBundle:](self->_eventSerializer, "serializeEventBundle:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j)));
        if (v26)
          -[NSMutableArray addObject:](v20, "addObject:", v26);

      }
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v23);
  }

  -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", v20, CFSTR("kMOEventBundle"));
  return v28;
}

- (void)_saveToDictionary:(id)a3 object:(id)a4 forKey:(id)a5
{
  if (a4)
  {
    if (a5)
      objc_msgSend(a3, "setObject:forKey:", a4, a5);
  }
}

- (MOConfigurationManager)configManager
{
  return self->_configManager;
}

- (void)setConfigManager:(id)a3
{
  objc_storeStrong((id *)&self->_configManager, a3);
}

- (BOOL)persistWithoutRandomization
{
  return self->_persistWithoutRandomization;
}

- (void)setPersistWithoutRandomization:(BOOL)a3
{
  self->_persistWithoutRandomization = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configManager, 0);
  objc_storeStrong((id *)&self->_eventSerializer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_ranking, 0);
  objc_storeStrong((id *)&self->_bundles, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

- (void)initWithEvents:(os_log_t)log bundles:ranking:settings:configManager:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configManager", v1, 2u);
}

@end
