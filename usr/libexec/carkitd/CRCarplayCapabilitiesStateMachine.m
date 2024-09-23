@implementation CRCarplayCapabilitiesStateMachine

- (CRCarplayCapabilitiesStateMachine)init
{
  CRCarplayCapabilitiesStateMachine *v2;
  CRCarplayCapabilitiesStateMachine *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workerQueue;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *delayedTasks;
  uint64_t v11;
  NSObject *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CRCarplayCapabilitiesStateMachine;
  v2 = -[CRCarplayCapabilitiesStateMachine init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_plistVersion, CRCapabilitiesDefaultVersion);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("com.apple.carkitd.carcapabilities.statemachine", v5);
    workerQueue = v3->_workerQueue;
    v3->_workerQueue = (OS_dispatch_queue *)v6;

    v3->_isReady = 1;
    v9 = objc_opt_new(NSMutableArray, v8);
    delayedTasks = v3->_delayedTasks;
    v3->_delayedTasks = (NSMutableArray *)v9;

  }
  v11 = CarGeneralLogging(v2);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_10006C3E8();

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[CUStateMachine invalidate](self->_underlyingStateMachine, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CRCarplayCapabilitiesStateMachine;
  -[CRCarplayCapabilitiesStateMachine dealloc](&v3, "dealloc");
}

- (void)lookupCarcapabilitiesForSession:(id)a3 plistURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRCarplayCapabilitiesStateMachine *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  CRCarplayCapabilitiesStateMachine *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  if (-[CRCarplayCapabilitiesStateMachine isReady](v11, "isReady"))
  {
    -[CRCarplayCapabilitiesStateMachine setIsReady:](v11, "setIsReady:", 0);
    objc_sync_exit(v11);

    v13 = CarGeneralLogging(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[CRCarplayCapabilitiesStateMachine lookupCarcapabilitiesForSession:plistURL:completionHandler:]";
      v34 = 2112;
      v35 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Lookup request starting using %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v11->_plistURL, a4);
    -[CRCarplayCapabilitiesStateMachine setResponseBlock:](v11, "setResponseBlock:", v10);
    v15 = objc_claimAutoreleasedReturnValue(-[CRCarplayCapabilitiesStateMachine workerQueue](v11, "workerQueue"));
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100032358;
    v30[3] = &unk_1000B5390;
    v30[4] = v11;
    v31 = v8;
    dispatch_async(v15, v30);

  }
  else
  {
    objc_sync_exit(v11);

    v17 = CarGeneralLogging(v16);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      sub_10006C454(v18, v19, v20, v21, v22, v23, v24, v25);

    v27 = (void *)objc_opt_new(CRCarplayCapabilitiesStateMachineTask, v26);
    objc_msgSend(v27, "setResponseBlock:", v10);
    objc_msgSend(v27, "setPlistURL:", v9);
    objc_msgSend(v27, "setSession:", v8);
    v28 = v11;
    objc_sync_enter(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarplayCapabilitiesStateMachine delayedTasks](v28, "delayedTasks"));
    objc_msgSend(v29, "addObject:", v27);

    objc_sync_exit(v28);
  }

}

- (void)setSession:(id)a3
{
  CARSession *v5;
  CARSession *v6;
  CUStateMachine *underlyingStateMachine;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CUStateMachine *v18;
  id v19;

  v5 = (CARSession *)a3;
  v6 = v5;
  if (self->_session != v5)
  {
    underlyingStateMachine = self->_underlyingStateMachine;
    v8 = objc_msgSend(objc_alloc((Class)CUStateEvent), "initWithName:userInfo:", CFSTR("Reset"), 0);
    -[CUStateMachine dispatchEvent:](underlyingStateMachine, "dispatchEvent:", v8);

    objc_storeStrong((id *)&self->_session, a3);
  }
  v9 = CarGeneralLogging(v5);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10006C4C4(v10, v11, v12, v13, v14, v15, v16, v17);

  v18 = self->_underlyingStateMachine;
  v19 = objc_msgSend(objc_alloc((Class)CUStateEvent), "initWithName:userInfo:", CFSTR("Start"), 0);
  -[CUStateMachine dispatchEvent:](v18, "dispatchEvent:", v19);

}

- (void)initializeStateMachine
{
  CUStateMachine *underlyingStateMachine;
  CUStateMachine *v4;
  CUStateMachine *v5;
  CUStateMachine *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSDictionary *v12;
  NSDictionary *stateForStateName;
  CUStateMachine *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  id location;
  _QWORD v25[5];
  _QWORD v26[4];
  _QWORD v27[4];

  underlyingStateMachine = self->_underlyingStateMachine;
  if (underlyingStateMachine)
  {
    -[CUStateMachine invalidate](underlyingStateMachine, "invalidate");
    v4 = self->_underlyingStateMachine;
    self->_underlyingStateMachine = 0;

  }
  v5 = (CUStateMachine *)objc_alloc_init((Class)CUStateMachine);
  v6 = self->_underlyingStateMachine;
  self->_underlyingStateMachine = v5;

  v7 = objc_msgSend(objc_alloc((Class)CUState), "initWithName:parent:", CFSTR("Root"), 0);
  objc_msgSend(v7, "setEventHandler:", &stru_1000B6238);
  objc_initWeak(&location, self);
  v8 = objc_msgSend(objc_alloc((Class)CUState), "initWithName:parent:", CFSTR("Ready"), v7);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000328F0;
  v22[3] = &unk_1000B6260;
  objc_copyWeak(&v23, &location);
  v22[4] = self;
  objc_msgSend(v8, "setEventHandler:", v22);
  v9 = objc_msgSend(objc_alloc((Class)CUState), "initWithName:parent:", CFSTR("Loading"), v7);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100032A3C;
  v20[3] = &unk_1000B6288;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v9, "setEventHandler:", v20);
  v10 = objc_msgSend(objc_alloc((Class)CUState), "initWithName:parent:", CFSTR("Searching"), v7);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100032BD4;
  v18[3] = &unk_1000B6260;
  objc_copyWeak(&v19, &location);
  v18[4] = self;
  objc_msgSend(v10, "setEventHandler:", v18);
  v11 = objc_msgSend(objc_alloc((Class)CUState), "initWithName:parent:", CFSTR("Done"), v7);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100032D50;
  v16[3] = &unk_1000B6260;
  objc_copyWeak(&v17, &location);
  v16[4] = self;
  objc_msgSend(v11, "setEventHandler:", v16);
  v26[0] = CFSTR("Ready");
  v26[1] = CFSTR("Loading");
  v27[0] = v8;
  v27[1] = v9;
  v26[2] = CFSTR("Searching");
  v26[3] = CFSTR("Done");
  v27[2] = v10;
  v27[3] = v11;
  v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 4));
  stateForStateName = self->_stateForStateName;
  self->_stateForStateName = v12;

  v14 = self->_underlyingStateMachine;
  v25[0] = v7;
  v25[1] = v8;
  v25[2] = v9;
  v25[3] = v10;
  v25[4] = v11;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 5));
  -[CUStateMachine setStates:](v14, "setStates:", v15);

  -[CUStateMachine setInitialState:](self->_underlyingStateMachine, "setInitialState:", v8);
  -[CUStateMachine start](self->_underlyingStateMachine, "start");
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)handleEvent:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  CUStateMachine *underlyingStateMachine;
  id v8;
  const __CFString *v9;
  id v10;

  v5 = CarGeneralLogging(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10006C7F8();

  underlyingStateMachine = self->_underlyingStateMachine;
  v8 = objc_alloc((Class)CUStateEvent);
  if ((unint64_t)(a3 + 1) > 4)
    v9 = CFSTR("Start");
  else
    v9 = off_1000B6340[a3 + 1];
  v10 = objc_msgSend(v8, "initWithName:userInfo:", v9, 0);
  -[CUStateMachine dispatchEvent:](underlyingStateMachine, "dispatchEvent:", v10);

}

- (void)_transitionToState:(int64_t)a3 forEvent:(int64_t)a4
{
  NSDictionary *stateForStateName;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;

  stateForStateName = self->_stateForStateName;
  if ((unint64_t)(a3 + 1) > 4)
    v7 = CFSTR("Ready");
  else
    v7 = off_1000B6318[a3 + 1];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](stateForStateName, "objectForKey:", v7, a4));
  v9 = CarGeneralLogging(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_10006C880();

  -[CUStateMachine transitionToState:](self->_underlyingStateMachine, "transitionToState:", v8);
  self->_currentState = a3;

}

- (void)_ignoreEvent:(int64_t)a3
{
  uint64_t v3;
  NSObject *v4;

  v3 = CarGeneralLogging(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10006C8EC();

}

- (id)nextMetadataKey
{
  NSMutableArray **p_configurationKeys;
  unint64_t metadaKeyIndex;
  NSMutableArray *configurationKeys;
  void *v6;
  uint64_t v7;
  NSObject *v8;

  p_configurationKeys = &self->_configurationKeys;
  metadaKeyIndex = self->_metadaKeyIndex;
  if (metadaKeyIndex >= (unint64_t)-[NSMutableArray count](self->_configurationKeys, "count"))
  {
    v6 = 0;
  }
  else
  {
    configurationKeys = self->_configurationKeys;
    ++self->_metadaKeyIndex;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](configurationKeys, "objectAtIndex:"));
    v7 = CarGeneralLogging(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10006C974((id *)p_configurationKeys, (uint64_t)v6, v8);

  }
  return v6;
}

- (void)performEnterReadyState
{
  NSMutableDictionary *v3;
  NSMutableDictionary *configurationValues;
  uint64_t v5;
  NSMutableArray *v6;
  NSMutableArray *configurationKeys;
  uint64_t v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *searchHitsByProperty;
  NSDictionary *plistData;
  uint64_t v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *propertyValueLookupTable;

  v3 = (NSMutableDictionary *)objc_opt_new(NSMutableDictionary, a2);
  configurationValues = self->_configurationValues;
  self->_configurationValues = v3;

  v6 = (NSMutableArray *)objc_opt_new(NSMutableArray, v5);
  configurationKeys = self->_configurationKeys;
  self->_configurationKeys = v6;

  v9 = (NSMutableDictionary *)objc_opt_new(NSMutableDictionary, v8);
  searchHitsByProperty = self->_searchHitsByProperty;
  self->_searchHitsByProperty = v9;

  self->_metadaKeyIndex = 0;
  plistData = self->_plistData;
  self->_plistData = 0;

  v13 = (NSMutableDictionary *)objc_opt_new(NSMutableDictionary, v12);
  propertyValueLookupTable = self->_propertyValueLookupTable;
  self->_propertyValueLookupTable = v13;

}

- (void)performPostResponseAndReleaseData
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  CARSession *session;
  NSMutableDictionary *configurationValues;
  NSMutableArray *configurationKeys;
  NSMutableDictionary *searchHitsByProperty;
  id responseBlock;
  NSDictionary *plistData;
  NSMutableDictionary *propertyValueLookupTable;
  CRCarplayCapabilitiesStateMachine *v22;
  void *v23;
  void *v24;
  dispatch_queue_global_t global_queue;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  _QWORD v32[5];
  id v33;

  v3 = CarGeneralLogging(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10006CA1C(v4, v5, v6, v7, v8, v9, v10, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarplayCapabilitiesStateMachine responseBlock](self, "responseBlock"));
  if (v12)
  {
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CRCarplayCapabilitiesStateMachine responseBlock](self, "responseBlock"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarplayCapabilitiesStateMachine carCapabilities](self, "carCapabilities"));
    ((void (**)(_QWORD, void *, _QWORD))v13)[2](v13, v14, 0);

  }
  session = self->_session;
  self->_session = 0;

  configurationValues = self->_configurationValues;
  self->_configurationValues = 0;

  configurationKeys = self->_configurationKeys;
  self->_configurationKeys = 0;

  searchHitsByProperty = self->_searchHitsByProperty;
  self->_searchHitsByProperty = 0;

  responseBlock = self->_responseBlock;
  self->_responseBlock = 0;

  plistData = self->_plistData;
  self->_plistData = 0;

  propertyValueLookupTable = self->_propertyValueLookupTable;
  self->_propertyValueLookupTable = 0;

  v22 = self;
  objc_sync_enter(v22);
  -[CRCarplayCapabilitiesStateMachine setIsReady:](v22, "setIsReady:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarplayCapabilitiesStateMachine delayedTasks](v22, "delayedTasks"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "popFirstObject"));

  objc_sync_exit(v22);
  if (v24)
  {
    global_queue = dispatch_get_global_queue(9, 0);
    v26 = objc_claimAutoreleasedReturnValue(global_queue);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000333A8;
    v32[3] = &unk_1000B5390;
    v32[4] = v22;
    v33 = v24;
    dispatch_async(v26, v32);

  }
  else
  {
    v27 = objc_claimAutoreleasedReturnValue(-[CRCarplayCapabilitiesStateMachine plistVersion](v22, "plistVersion"));
    if (v27)
    {
      v28 = (void *)v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarplayCapabilitiesStateMachine plistVersion](v22, "plistVersion"));
      v30 = objc_msgSend(v29, "isEqualToString:", CRCapabilitiesDefaultVersion);

      if ((v30 & 1) == 0)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarplayCapabilitiesStateMachine plistVersion](v22, "plistVersion"));
        +[CRCarPlayCapabilities setCapabilitiesVersion:](CRCarPlayCapabilities, "setCapabilitiesVersion:", v31);

      }
    }
  }

}

- (void)performLoadingPlistData:(int64_t)a3
{
  NSURL *plistURL;
  NSDictionary *v5;
  id v6;
  NSDictionary *plistData;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSMutableDictionary *configurationValues;
  void *v22;
  void *j;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *k;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  NSMutableDictionary *v57;
  _BYTE v58[128];

  plistURL = self->_plistURL;
  v51 = 0;
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", plistURL, &v51));
  v6 = v51;
  plistData = self->_plistData;
  self->_plistData = v5;

  if (v6)
  {
    -[CRCarplayCapabilitiesStateMachine handleEvent:](self, "handleEvent:", 2);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_plistData, "objectForKeyedSubscript:", CFSTR("version")));
    v9 = (void *)v8;
    if (v8)
      v10 = v8;
    else
      v10 = CRCapabilitiesDefaultVersion;
    -[CRCarplayCapabilitiesStateMachine setPlistVersion:](self, "setPlistVersion:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_plistData, "objectForKeyedSubscript:", CFSTR("properties")));
    v33 = objc_claimAutoreleasedReturnValue(-[CARSession configuration](self->_session, "configuration"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v48 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarplayCapabilitiesStateMachine _configurationValueForSafeKey:](self, "_configurationValueForSafeKey:", v16, v33));
          if (v17)
          {
            -[NSMutableArray addObject:](self->_configurationKeys, "addObject:", v16);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_configurationValues, "setObject:forKeyedSubscript:", v17, v16);
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
      }
      while (v13);
    }

    v19 = CarGeneralLogging(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      configurationValues = self->_configurationValues;
      *(_DWORD *)buf = 136315394;
      v55 = "-[CRCarplayCapabilitiesStateMachine performLoadingPlistData:]";
      v56 = 2112;
      v57 = configurationValues;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Found configuration values for search: %@", buf, 0x16u);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_plistData, "objectForKeyedSubscript:", CFSTR("vehicles")));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v35 = v22;
    v37 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v37)
    {
      v36 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(_QWORD *)v44 != v36)
            objc_enumerationMutation(v35);
          v24 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j);
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v25 = obj;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v40;
            do
            {
              for (k = 0; k != v27; k = (char *)k + 1)
              {
                if (*(_QWORD *)v40 != v28)
                  objc_enumerationMutation(v25);
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)k), v33));
                if (v30)
                {
                  v31 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_propertyValueLookupTable, "objectForKeyedSubscript:", v30));
                  if (!v31)
                  {
                    v31 = objc_alloc_init((Class)NSMutableArray);
                    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_propertyValueLookupTable, "setObject:forKeyedSubscript:", v31, v30);
                  }
                  objc_msgSend(v31, "addObject:", v24);

                }
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
            }
            while (v27);
          }

        }
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v37);
    }
    if (-[NSMutableDictionary count](self->_configurationValues, "count", v33))
      v32 = 1;
    else
      v32 = 2;
    -[CRCarplayCapabilitiesStateMachine handleEvent:](self, "handleEvent:", v32);

    v6 = 0;
  }

}

- (void)performLookup:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableDictionary *propertyValueLookupTable;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CRCarplayCapabilitiesStateMachine *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _BYTE v38[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarplayCapabilitiesStateMachine nextMetadataKey](self, "nextMetadataKey", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_configurationValues, "objectForKeyedSubscript:", v4));
    v7 = (void *)objc_opt_new(NSMutableArray, v6);
    v9 = (void *)objc_opt_new(NSMutableSet, v8);
    v30 = self;
    propertyValueLookupTable = self->_propertyValueLookupTable;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100033A98;
    v35[3] = &unk_1000B62B0;
    v11 = v5;
    v36 = v11;
    v12 = v9;
    v37 = v12;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](propertyValueLookupTable, "enumerateKeysAndObjectsUsingBlock:", v35);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", v4));
          v20 = sub_100033AE8(v19, v11);

          if (v20)
            objc_msgSend(v7, "addObject:", v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v15);
    }

    if (objc_msgSend(v7, "count"))
      -[NSMutableDictionary setObject:forKeyedSubscript:](v30->_searchHitsByProperty, "setObject:forKeyedSubscript:", v7, v4);
    -[CRCarplayCapabilitiesStateMachine handleEvent:](v30, "handleEvent:", 0);

  }
  else
  {
    v21 = CarGeneralLogging(0);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      sub_10006CAFC(v22, v23, v24, v25, v26, v27, v28, v29);

    -[CRCarplayCapabilitiesStateMachine handleEvent:](self, "handleEvent:", 1);
  }

}

- (void)performDoneCaptureResult
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSDictionary *plistData;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[6];
  _BYTE buf[24];
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = CarGeneralLogging(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10006CB6C((uint64_t)self, v4);

  if (-[NSMutableDictionary count](self->_searchHitsByProperty, "count")
    && -[NSMutableArray count](self->_configurationKeys, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_searchHitsByProperty, "allKeys"));
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v21 = sub_100033FFC;
    v22 = sub_10003400C;
    v23 = 0;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100034014;
    v19[3] = &unk_1000B62D8;
    v19[4] = self;
    v19[5] = buf;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v19);
    v6 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v6 = 0;
  }
  v7 = objc_alloc((Class)CRCarPlayCapabilities);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarplayCapabilitiesStateMachine plistVersion](self, "plistVersion"));
  v9 = objc_msgSend(v7, "initWithVersion:", v8);
  -[CRCarplayCapabilitiesStateMachine setCarCapabilities:](self, "setCarCapabilities:", v9);

  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("features")));
    v11 = CarGeneralLogging(v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CRCarplayCapabilitiesStateMachine performDoneCaptureResult]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    v13 = "%s: matching vehicle for session/plist is: %@";
    goto LABEL_13;
  }
  plistData = self->_plistData;
  if (!plistData)
    goto LABEL_16;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary valueForKey:](plistData, "valueForKey:", CFSTR("features")));
  v15 = CarGeneralLogging(v10);
  v12 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CRCarplayCapabilitiesStateMachine performDoneCaptureResult]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    v13 = "%s: no matching vehicle for session/plist, using default values: %@";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);
  }
LABEL_14:

  if (v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarplayCapabilitiesStateMachine carCapabilities](self, "carCapabilities"));
    -[CRCarplayCapabilitiesStateMachine assignCarCapabilities:valuesFromDictionary:](self, "assignCarCapabilities:valuesFromDictionary:", v16, v10);

  }
LABEL_16:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRCarplayCapabilitiesStateMachine carCapabilities](self, "carCapabilities"));

  if (v17)
    v18 = 1;
  else
    v18 = 2;
  -[CRCarplayCapabilitiesStateMachine handleEvent:](self, "handleEvent:", v18);

}

- (void)assignCarCapabilities:(id)a3 valuesFromDictionary:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *v15;
  double x;
  double y;
  double width;
  double height;
  void *v20;
  void *v21;
  unsigned int v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  NSString *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  char isKindOfClass;
  uint64_t v37;
  id v38;
  NSRect v39;
  NSRect v40;

  v38 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("nowPlayingAlbumArt")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("userInterfaceStyle")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("viewAreaInsets")));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("dashboardRoundedCorners")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("userInfo")));

    if (v8)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("nowPlayingAlbumArt")));
      objc_msgSend(v38, "setNowPlayingAlbumArtMode:", objc_msgSend(v13, "integerValue"));

      if (objc_msgSend(v38, "nowPlayingAlbumArtMode") == (id)1)
        objc_msgSend(v38, "setDisabledFeature:", (unint64_t)objc_msgSend(v38, "disabledFeature") | 1);
    }
    if (v9)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("userInterfaceStyle")));
      objc_msgSend(v38, "setUserInterfaceStyle:", objc_msgSend(v14, "integerValue"));

    }
    if (v10)
    {
      v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("viewAreaInsets")));
      v39 = NSRectFromString(v15);
      x = v39.origin.x;
      y = v39.origin.y;
      width = v39.size.width;
      height = v39.size.height;

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rightHandDriveFlip")));
      if ((objc_msgSend(v20, "BOOLValue") & 1) != 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CARSession configuration](self->_session, "configuration"));
        v22 = objc_msgSend(v21, "rightHandDrive");

        if (v22)
        {
          x = CRRectRHDFlip(x, y, width, height);
          y = v23;
          width = v24;
          height = v25;
        }
      }
      else
      {

      }
      CREdgeInsetsFromRect(x, y, width, height);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithEdgeInsets:](NSValue, "valueWithEdgeInsets:"));
      objc_msgSend(v38, "setViewAreaInsets:", v26);

    }
    if (v11)
    {
      v27 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("dashboardRoundedCorners")));
      v40 = NSRectFromString(v27);
      v28 = v40.origin.x;
      v29 = v40.origin.y;
      v30 = v40.size.width;
      v31 = v40.size.height;

      CREdgeInsetsFromRect(v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithEdgeInsets:](NSValue, "valueWithEdgeInsets:"));
      objc_msgSend(v38, "setDashboardRoundedCorners:", v32);

    }
    if (v12)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("userInfo")));
      v35 = objc_opt_class(NSDictionary);
      isKindOfClass = objc_opt_isKindOfClass(v34, v35);

      if ((isKindOfClass & 1) != 0)
      {
        v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("userInfo")));

        v33 = (void *)v37;
      }
      objc_msgSend(v38, "setUserInfo:", v33);

    }
  }

}

- (BOOL)_vehicleSatisfiesConfiguration:(id)a3 propertyHits:(int64_t *)a4
{
  void *v4;
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allKeys"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("features")) & 1) == 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_configurationValues, "objectForKeyedSubscript:", v12));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v12));
          v15 = v14;
          if (v13)
            v16 = v14 == 0;
          else
            v16 = 1;
          if (!v16)
          {
            v7 = sub_100033AE8(v14, v13);
            ++v9;
          }

          if ((v7 & 1) == 0)
          {
            v7 = 0;
            goto LABEL_19;
          }
          ++v8;
          v7 = 1;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
  }
LABEL_19:

  if (a4)
    *a4 = v9;

  return v7 & (v9 == v8);
}

- (id)_configurationValueForSafeKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;

  v4 = a3;
  if (qword_1000DB848 != -1)
    dispatch_once(&qword_1000DB848, &stru_1000B62F8);
  v5 = objc_msgSend((id)qword_1000DB850, "containsObject:", v4);
  if ((_DWORD)v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CARSession configuration](self->_session, "configuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKeyPath:", v4));

  }
  else
  {
    v8 = CarGeneralLogging(v5);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10006CBF0();

    v7 = 0;
  }

  return v7;
}

- (CRCarPlayCapabilities)carCapabilities
{
  return self->_carCapabilities;
}

- (void)setCarCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)plistVersion
{
  return self->_plistVersion;
}

- (void)setPlistVersion:(id)a3
{
  objc_storeStrong((id *)&self->_plistVersion, a3);
}

- (id)responseBlock
{
  return self->_responseBlock;
}

- (void)setResponseBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (OS_dispatch_queue)workerQueue
{
  return self->_workerQueue;
}

- (void)setWorkerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workerQueue, a3);
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (NSMutableArray)delayedTasks
{
  return self->_delayedTasks;
}

- (void)setDelayedTasks:(id)a3
{
  objc_storeStrong((id *)&self->_delayedTasks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedTasks, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong(&self->_responseBlock, 0);
  objc_storeStrong((id *)&self->_plistVersion, 0);
  objc_storeStrong((id *)&self->_carCapabilities, 0);
  objc_storeStrong((id *)&self->_stateForStateName, 0);
  objc_storeStrong((id *)&self->_searchHitsByProperty, 0);
  objc_storeStrong((id *)&self->_propertyValueLookupTable, 0);
  objc_storeStrong((id *)&self->_configurationValues, 0);
  objc_storeStrong((id *)&self->_configurationKeys, 0);
  objc_storeStrong((id *)&self->_plistData, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_plistURL, 0);
  objc_storeStrong((id *)&self->_underlyingStateMachine, 0);
}

@end
