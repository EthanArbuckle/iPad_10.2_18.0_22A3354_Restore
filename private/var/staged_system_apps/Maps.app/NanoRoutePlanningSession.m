@implementation NanoRoutePlanningSession

- (void)dealloc
{
  id v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  NanoRoutePlanningSession *v7;
  __int16 v8;
  const char *v9;

  -[NanoRoutePlanningState leaveToState:](self->_stateObject, "leaveToState:", 0);
  v3 = sub_100B72200();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v7 = self;
    v8 = 2080;
    v9 = "-[NanoRoutePlanningSession dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%p] %s", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)NanoRoutePlanningSession;
  -[NanoRoutePlanningSession dealloc](&v5, "dealloc");
}

- (NanoRoutePlanningSession)init
{
  return -[NanoRoutePlanningSession initWithOrigin:](self, "initWithOrigin:", objc_msgSend((id)objc_opt_class(self), "defaultOrigin"));
}

- (NanoRoutePlanningSession)initWithOrigin:(unint64_t)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSString *v8;
  id v9;
  const char *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  void *v14;
  NSString *v15;
  id v16;
  const char *v17;
  dispatch_queue_attr_t v18;
  NSObject *v19;
  dispatch_queue_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_super v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  const char *v29;

  v25.receiver = self;
  v25.super_class = (Class)NanoRoutePlanningSession;
  v4 = -[NanoRoutePlanningSession init](&v25, "init");
  if (v4)
  {
    v5 = sub_100B72200();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v27 = v4;
      v28 = 2080;
      v29 = "-[NanoRoutePlanningSession initWithOrigin:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%p] %s", buf, 0x16u);
    }

    v7 = MapsAppBundleId;
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%p"), MapsAppBundleId, objc_opt_class(v4), v4);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v8));
    v10 = (const char *)objc_msgSend(v9, "UTF8String");
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create(v10, v12);
    v14 = (void *)*((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = v13;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v4 + 2), &unk_100E3F018, &unk_100E3F018, 0);
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%p"), v7, objc_opt_class(NanoRoutePlanningState), v4);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v15));
    v17 = (const char *)objc_msgSend(v16, "UTF8String");
    v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = dispatch_queue_create(v17, v19);
    v21 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = v20;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v4 + 3), &off_1011E7018, &off_1011E7018, 0);
    *((_QWORD *)v4 + 4) = a3;
    v22 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 1));
    v23 = (void *)*((_QWORD *)v4 + 11);
    *((_QWORD *)v4 + 11) = v22;

  }
  return (NanoRoutePlanningSession *)v4;
}

- (NSString)description
{
  NSObject *isolationQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if (dispatch_get_specific(&unk_100E3F018) == &unk_100E3F018)
    return (NSString *)(id)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningSession _description](self, "_description"));
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100B72588;
  v11 = sub_100B72598;
  v12 = 0;
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B725A0;
  v6[3] = &unk_1011ADF48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (id)_description
{
  NSString *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  objc_super v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v9.receiver = self;
  v9.super_class = (Class)NanoRoutePlanningSession;
  v3 = -[NanoRoutePlanningSession description](&v9, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = sub_1008EFAE8(self->_origin);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (origin:%@)"), v4, v6));

  return v7;
}

- (void)invalidate
{
  id v3;
  NSObject *v4;
  NSObject *isolationQueue;
  _QWORD block[5];
  uint8_t buf[4];
  NanoRoutePlanningSession *v8;

  if (!-[NanoRoutePlanningSession isInvalidated](self, "isInvalidated"))
  {
    self->_invalidated = 1;
    v3 = sub_100B72200();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%p] is being invalidated", buf, 0xCu);
    }

    isolationQueue = self->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B7275C;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async(isolationQueue, block);
  }
}

+ (unint64_t)defaultOrigin
{
  return 1;
}

- (void)processRequest:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  isolationQueue = self->_isolationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100B72808;
  v7[3] = &unk_1011AC8B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(isolationQueue, v7);

}

- (void)_processRequest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  NanoRoutePlanningSession *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[NanoRoutePlanningSession _cancelRequestIfNeeded](self, "_cancelRequestIfNeeded");
  -[NanoRoutePlanningSession _prepareForRequest:](self, "_prepareForRequest:", v4);
  -[NanoRoutePlanningSession _broadcastIfNeeded](self, "_broadcastIfNeeded");
  v5 = sub_100B72200();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%p] Will process request: %@", (uint8_t *)&v7, 0x16u);
  }

  -[NanoRoutePlanningSession _transitionToState:](self, "_transitionToState:", -[objc_class requiredInitialStateForRequest:](-[NanoRoutePlanningSession _classForState:](self, "_classForState:", 3), "requiredInitialStateForRequest:", v4));
}

- (void)_prepareForRequest:(id)a3
{
  NSObject *isolationQueue;
  id v5;
  NanoRoutePlanningMutableRequest *v6;
  NanoRoutePlanningMutableRequest *request;
  NanoRoutePlanningMutableResponse *v8;
  NSObject *stateIsolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateIsolationQueue);
  self->_state = 0;
  v6 = (NanoRoutePlanningMutableRequest *)objc_msgSend(v5, "mutableCopy");

  request = self->_request;
  self->_request = v6;

  v8 = objc_alloc_init(NanoRoutePlanningMutableResponse);
  -[NanoRoutePlanningSession _setResponse:](self, "_setResponse:", v8);

  stateIsolationQueue = self->_stateIsolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B729DC;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async(stateIsolationQueue, block);
}

- (void)_cancelRequestIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[NanoRoutePlanningSession _transitionToState:](self, "_transitionToState:", 0);
}

- (unint64_t)origin
{
  NSObject *isolationQueue;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B72AD4;
  v6[3] = &unk_1011ADF48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (int64_t)state
{
  NSObject *isolationQueue;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B72B80;
  v6[3] = &unk_1011ADF48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (NanoRoutePlanningRequest)request
{
  NSObject *isolationQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100B72588;
  v11 = sub_100B72598;
  v12 = 0;
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B72C50;
  v6[3] = &unk_1011ADF48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NanoRoutePlanningRequest *)v4;
}

- (NanoRoutePlanningResponse)response
{
  NSObject *isolationQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100B72588;
  v11 = sub_100B72598;
  v12 = 0;
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B72D44;
  v6[3] = &unk_1011ADF48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(isolationQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NanoRoutePlanningResponse *)v4;
}

- (BOOL)shouldBroadcast
{
  NanoRoutePlanningSession *v2;
  NSObject *isolationQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = v2->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B72E14;
  v5[3] = &unk_1011ADF48;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setShouldBroadcast:(BOOL)a3
{
  NSObject *isolationQueue;
  _QWORD v4[5];
  BOOL v5;

  isolationQueue = self->_isolationQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B72E84;
  v4[3] = &unk_1011ACE58;
  v4[4] = self;
  v5 = a3;
  dispatch_async(isolationQueue, v4);
}

- (BOOL)isLoading
{
  NSObject *isolationQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B72F24;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setRequest:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = objc_msgSend(a3, "mutableCopy");
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B72FC4;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(isolationQueue, block);

}

- (void)setResponse:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = objc_msgSend(a3, "mutableCopy");
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B73050;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(isolationQueue, block);

}

- (void)_setResponse:(id)a3
{
  NanoRoutePlanningMutableResponse *v5;
  id *p_response;
  NanoRoutePlanningMutableResponse *response;
  id v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  NanoRoutePlanningMutableResponse *v14;

  v5 = (NanoRoutePlanningMutableResponse *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  response = self->_response;
  p_response = (id *)&self->_response;
  if (response != v5)
  {
    v8 = sub_100B72200();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *p_response;
      v11 = 138543618;
      v12 = v10;
      v13 = 2114;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Changing response from %{public}@ to %{public}@", (uint8_t *)&v11, 0x16u);
    }

    objc_storeStrong(p_response, a3);
  }

}

- (id)valueForUserInfoKey:(id)a3
{
  id v4;
  _UNKNOWN **specific;
  NSObject *stateIsolationQueue;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  specific = (_UNKNOWN **)dispatch_get_specific(&off_1011E7018);
  stateIsolationQueue = self->_stateIsolationQueue;
  if (specific == &off_1011E7018)
  {
    dispatch_assert_queue_V2(stateIsolationQueue);
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_userInfo, "objectForKeyedSubscript:", v4));
  }
  else
  {
    dispatch_assert_queue_not_V2(stateIsolationQueue);
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = sub_100B72588;
    v17 = sub_100B72598;
    v18 = 0;
    v7 = self->_stateIsolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B73264;
    block[3] = &unk_1011B3B68;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(v7, block);
    v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }

  return v8;
}

- (void)setUserInfoKey:(id)a3 andValue:(id)a4
{
  id v6;
  _UNKNOWN **specific;
  NSObject *stateIsolationQueue;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v10 = a3;
  v6 = a4;
  specific = (_UNKNOWN **)dispatch_get_specific(&off_1011E7018);
  stateIsolationQueue = self->_stateIsolationQueue;
  if (specific == &off_1011E7018)
  {
    dispatch_assert_queue_V2(stateIsolationQueue);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_userInfo, "setObject:forKeyedSubscript:", v6, v10);
  }
  else
  {
    dispatch_assert_queue_not_V2(stateIsolationQueue);
    v9 = self->_stateIsolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B73388;
    block[3] = &unk_1011AD238;
    block[4] = self;
    v12 = v10;
    v13 = v6;
    dispatch_sync(v9, block);

  }
}

- (void)_broadcastIfNeeded
{
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_shouldBroadcast)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100B7340C;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_notifySessionDidStartLoading
{
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B735A4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_notifySessionDidUpdateResponse
{
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B7372C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_notifySessionDidFail
{
  _QWORD block[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B738B4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_notifyDidInvalidate
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B73A28;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

+ (id)_defaultClassesBySessionState
{
  if (qword_1014D4158 != -1)
    dispatch_once(&qword_1014D4158, &stru_1011E7020);
  return (id)qword_1014D4150;
}

+ (void)setDefaultClass:(Class)a3 forSessionState:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_defaultClassesBySessionState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, v6);

}

- (void)setNextClass:(Class)a3 forSessionState:(int64_t)a4
{
  NSMutableDictionary *classesBySessionState;
  id v6;

  classesBySessionState = self->_classesBySessionState;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](classesBySessionState, "setObject:forKeyedSubscript:", a3, v6);

}

- (Class)_classForState:(int64_t)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_classesBySessionState, "objectForKeyedSubscript:", v4);
  if (v5)
  {
    v6 = v5;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_classesBySessionState, "setObject:forKeyedSubscript:", 0, v4);
    v7 = v6;
  }
  else
  {
    v8 = objc_msgSend((id)objc_opt_class(self), "_defaultClassesBySessionState");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v4));

  }
  return (Class)v7;
}

- (void)updateWithBlock:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    isolationQueue = self->_isolationQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100B73E80;
    v6[3] = &unk_1011B0288;
    objc_copyWeak(&v8, &location);
    v6[4] = self;
    v7 = v4;
    dispatch_async(isolationQueue, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)_transitionToState:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_state != a3)
    -[NanoRoutePlanningSession _transitionToState:withClass:](self, "_transitionToState:withClass:", a3, -[NanoRoutePlanningSession _classForState:](self, "_classForState:", a3));
}

- (void)_transitionToState:(int64_t)a3 withClass:(Class)a4
{
  int64_t state;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  NanoRoutePlanningState *v12;
  NanoRoutePlanningState *stateObject;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  NSString *v18;
  void *v19;
  int v20;
  NanoRoutePlanningSession *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (a4)
  {
    state = self->_state;
    -[NanoRoutePlanningState leaveToState:](self->_stateObject, "leaveToState:", a3);
    if (a3 < 1)
      -[NanoRoutePlanningSession _endTransaction](self, "_endTransaction");
    else
      -[NanoRoutePlanningSession _startTransaction](self, "_startTransaction");
    self->_state = a3;
    v12 = (NanoRoutePlanningState *)objc_msgSend([a4 alloc], "initWithStateManager:isolationQueue:", self, self->_stateIsolationQueue);
    stateObject = self->_stateObject;
    self->_stateObject = v12;

    v14 = sub_100B72200();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = sub_1008EFC08(a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = NSStringFromClass(a4);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = 134218498;
      v21 = self;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%p] Will transition to state %@ with class %@", (uint8_t *)&v20, 0x20u);

    }
    -[NanoRoutePlanningState enterToState:fromState:](self->_stateObject, "enterToState:fromState:", a3, state);
    -[NanoRoutePlanningSession _notifyDidChangeFromState:toState:](self, "_notifyDidChangeFromState:toState:", state, self->_state);
  }
  else
  {
    v8 = sub_100B72200();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = sub_1008EFC08(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v20 = 134218242;
      v21 = self;
      v22 = 2112;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%p] No class found for state %@", (uint8_t *)&v20, 0x16u);

    }
    -[NanoRoutePlanningSession _notifySessionDidFail](self, "_notifySessionDidFail");
  }
}

- (void)replaceWithStateOfClass:(Class)a3
{
  NSObject *isolationQueue;
  _QWORD v6[5];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100B74500;
  v6[3] = &unk_1011E7048;
  objc_copyWeak(v7, &location);
  v6[4] = self;
  v7[1] = a3;
  dispatch_async(isolationQueue, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_notifyDidChangeFromState:(int64_t)a3 toState:(int64_t)a4
{
  id v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  int v14;
  NanoRoutePlanningSession *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;

  v7 = sub_100B72200();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = sub_1008EFC08(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = sub_1008EFC08(a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v14 = 134218498;
    v15 = self;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%p] State changed from '%@' to '%@'", (uint8_t *)&v14, 0x20u);

  }
  if (!a3)
    -[NanoRoutePlanningSession _notifySessionDidStartLoading](self, "_notifySessionDidStartLoading");
  if (a4 == 4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse lastError](self->_response, "lastError"));

    if (v13)
      -[NanoRoutePlanningSession _notifySessionDidFail](self, "_notifySessionDidFail");
    else
      -[NanoRoutePlanningSession _notifySessionDidUpdateResponse](self, "_notifySessionDidUpdateResponse");
  }
}

- (GEOComposedRoute)selectedRoute
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100B72588;
  v10 = sub_100B72598;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B74744;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (GEOComposedRoute *)v3;
}

- (GEOCompanionRouteDetails)selectedCompanionRoute
{
  NSObject *isolationQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100B72588;
  v10 = sub_100B72598;
  v11 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100B74834;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (GEOCompanionRouteDetails *)v3;
}

- (void)setSelectedRoute:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "uniqueRouteID"));
    -[NanoRoutePlanningSession setSelectedRouteWithRouteID:](self, "setSelectedRouteWithRouteID:", v4);

  }
}

- (void)setSelectedCompanionRoute:(id)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "routeID"));
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID _maps_UUIDWithData:](NSUUID, "_maps_UUIDWithData:", v4));

    -[NanoRoutePlanningSession setSelectedRouteWithRouteID:](self, "setSelectedRouteWithRouteID:", v5);
  }
}

- (void)setSelectedRouteWithRouteID:(id)a3
{
  id v4;
  void *v5;
  NSObject *isolationQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    isolationQueue = self->_isolationQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100B749BC;
    v7[3] = &unk_1011AC8B0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(isolationQueue, v7);

  }
}

- (void)_setSelectedRouteWithRouteID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse selectedRouteID](self->_response, "selectedRouteID"));
  if ((+[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v4, v5) & 1) == 0)
  {
    -[NanoRoutePlanningResponse setSelectedRouteID:](self->_response, "setSelectedRouteID:", v5);
    -[NanoRoutePlanningSession _notifySessionDidUpdateResponse](self, "_notifySessionDidUpdateResponse");
  }

}

- (BOOL)hasReceivedAllExpectedRoutes
{
  NSObject *isolationQueue;
  _QWORD block[5];
  id v6;
  id location;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B74B0C;
  block[3] = &unk_1011B0CF0;
  block[4] = &v8;
  objc_copyWeak(&v6, &location);
  dispatch_sync(isolationQueue, block);
  LOBYTE(isolationQueue) = *((_BYTE *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)isolationQueue;
}

- (BOOL)_hasReceivedAllExpectedRoutes
{
  NanoRoutePlanningMutableResponse *response;
  id v4;
  void *v5;
  id v6;
  BOOL v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  response = self->_response;
  if (response)
  {
    v4 = -[NanoRoutePlanningResponse expectedNumberOfRoutes](response, "expectedNumberOfRoutes");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningResponse routes](self->_response, "routes"));
    v6 = objc_msgSend(v5, "count");

    if (v4)
      v7 = v6 == v4;
    else
      v7 = 0;
    LOBYTE(response) = v7;
  }
  return (char)response;
}

- (GEOObserverHashTable)observers
{
  GEOObserverHashTable *observers;
  GEOObserverHashTable *v4;
  GEOObserverHashTable *v5;

  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___NanoRoutePlanningSessionObserver, 0);
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }
  return observers;
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  NanoRoutePlanningSession *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  -[NanoRoutePlanningSession _assertNotInvalidated](self, "_assertNotInvalidated");
  if (v4)
  {
    v5 = sub_100B72200();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134218242;
      v9 = self;
      v10 = 2112;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%p] Adding observer: %@", (uint8_t *)&v8, 0x16u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningSession observers](self, "observers"));
    objc_msgSend(v7, "registerObserver:", v4);

  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  NanoRoutePlanningSession *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  if (v4)
  {
    v5 = sub_100B72200();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134218242;
      v9 = self;
      v10 = 2112;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%p] Removing observer: %@", (uint8_t *)&v8, 0x16u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningSession observers](self, "observers"));
    objc_msgSend(v7, "unregisterObserver:", v4);

  }
}

- (void)_startTransaction
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSString *v7;
  id v8;
  OS_os_transaction *v9;
  OS_os_transaction *transaction;
  uint8_t buf[4];
  NanoRoutePlanningSession *v12;

  if (!self->_transaction)
  {
    v3 = sub_100B72200();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%p] Starting transaction", buf, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleIdentifier"));
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%p"), v6, objc_opt_class(self), self);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v7));
    v9 = (OS_os_transaction *)os_transaction_create(objc_msgSend(v8, "UTF8String"));
    transaction = self->_transaction;
    self->_transaction = v9;

  }
}

- (void)_endTransaction
{
  id v3;
  NSObject *v4;
  OS_os_transaction *transaction;
  int v6;
  NanoRoutePlanningSession *v7;

  if (self->_transaction)
  {
    v3 = sub_100B72200();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 134217984;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%p] Ending transaction", (uint8_t *)&v6, 0xCu);
    }

    transaction = self->_transaction;
    self->_transaction = 0;

  }
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_staleTimer, 0);
  objc_storeStrong((id *)&self->_classesBySessionState, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_stateObject, 0);
  objc_storeStrong((id *)&self->_stateIsolationQueue, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (void)_anticipateRoutesWithRequest:(id)a3
{
  NSObject *isolationQueue;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NanoRoutePlanningSession *v11;
  __int16 v12;
  void *v13;

  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  -[NanoRoutePlanningSession _prepareForRequest:](self, "_prepareForRequest:", v5);

  -[NanoRoutePlanningSession _broadcastIfNeeded](self, "_broadcastIfNeeded");
  v6 = sub_100B72200();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest companionRouteContext](self->_request, "companionRouteContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "simpleDescription"));
    v10 = 134218242;
    v11 = self;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%p] Anticipate request with context %@", (uint8_t *)&v10, 0x16u);

  }
  -[NanoRoutePlanningSession _transitionToState:](self, "_transitionToState:", 3);
}

- (void)updateWithRequest:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  NSObject *isolationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B7521C;
  block[3] = &unk_1011AD238;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(isolationQueue, block);

}

- (void)_updateWithRequest:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  void (**v11)(_QWORD);
  int64_t state;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[4];
  NanoRoutePlanningSession *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  __CFString *v40;
  __int16 v41;
  __CFString *v42;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100B75580;
  v32[3] = &unk_1011AD238;
  v32[4] = self;
  v8 = v6;
  v33 = v8;
  v9 = v7;
  v34 = v9;
  v10 = objc_retainBlock(v32);
  v11 = (void (**)(_QWORD))v10;
  state = self->_state;
  if (state != 3)
  {
    if (state == 4)
    {
      ((void (*)(_QWORD *))v10[2])(v10);
      v13 = sub_100B72200();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest companionRouteContext](self->_request, "companionRouteContext"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "simpleDescription"));
        *(_DWORD *)buf = 134218242;
        v36 = self;
        v37 = 2112;
        v38 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%p] Updating completed session with context %@, notify observers", buf, 0x16u);

      }
      -[NanoRoutePlanningSession _notifySessionDidUpdateResponse](self, "_notifySessionDidUpdateResponse");
      goto LABEL_20;
    }
    v17 = sub_100B72200();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest companionRouteContext](self->_request, "companionRouteContext"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "simpleDescription"));
      *(_DWORD *)buf = 134218242;
      v36 = self;
      v37 = 2112;
      v38 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%p] Force anticipate request before updating request/response with context %@", buf, 0x16u);

    }
    -[NanoRoutePlanningSession _anticipateRoutesWithRequest:](self, "_anticipateRoutesWithRequest:", v8);
  }
  v11[2](v11);
  v21 = objc_msgSend(v9, "hasReceivedAllExpectedRoutes");
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastError"));

  if (v22 || v21)
  {
    v23 = sub_100B72200();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NanoRoutePlanningRequest companionRouteContext](self->_request, "companionRouteContext"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "simpleDescription"));
      if (v21)
        v26 = CFSTR("YES");
      else
        v26 = CFSTR("NO");
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastError"));
      if (v28)
        v29 = CFSTR("YES");
      else
        v29 = CFSTR("NO");
      v30 = v29;
      *(_DWORD *)buf = 134218754;
      v36 = self;
      v37 = 2112;
      v38 = v25;
      v39 = 2112;
      v40 = v27;
      v41 = 2112;
      v42 = v30;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%p] Updating request with context %@ (hasReceivedAllRoutes: %@, error: %@)", buf, 0x2Au);

    }
    -[NanoRoutePlanningSession _transitionToState:](self, "_transitionToState:", 4);
  }
LABEL_20:

}

+ (void)processRequest:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  _NanoRoutePlanningSingleRequester *v17;

  v5 = a3;
  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_100B72588;
  v16 = sub_100B72598;
  v17 = objc_alloc_init(_NanoRoutePlanningSingleRequester);
  v7 = (void *)v13[5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100B75894;
  v9[3] = &unk_1011E7070;
  v8 = v6;
  v10 = v8;
  v11 = &v12;
  objc_msgSend(v7, "processRequest:withCompletion:", v5, v9);

  _Block_object_dispose(&v12, 8);
}

@end
