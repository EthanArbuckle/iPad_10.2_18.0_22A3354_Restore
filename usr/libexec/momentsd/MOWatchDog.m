@implementation MOWatchDog

- (MOWatchDog)initWithName:(id)a3 cadenceInSeconds:(float)a4 andHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  const char *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  void *v18;
  dispatch_source_t v19;
  void *v20;
  NSObject *v21;
  double v22;
  id v23;
  _QWORD handler[4];
  id v26;
  id location;
  objc_super v28;

  v8 = a3;
  v9 = a5;
  v28.receiver = self;
  v28.super_class = (Class)MOWatchDog;
  v10 = -[MOWatchDog init](&v28, "init");
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    v12 = (void *)*((_QWORD *)v10 + 1);
    *((_QWORD *)v10 + 1) = v11;

    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MOWatchDog:%@"), v8)));
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = dispatch_queue_create(v14, v16);
    v18 = (void *)*((_QWORD *)v10 + 4);
    *((_QWORD *)v10 + 4) = v17;

    v19 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v10 + 4));
    v20 = (void *)*((_QWORD *)v10 + 3);
    *((_QWORD *)v10 + 3) = v19;

    objc_initWeak(&location, v10);
    v21 = *((_QWORD *)v10 + 3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = __55__MOWatchDog_initWithName_cadenceInSeconds_andHandler___block_invoke;
    handler[3] = &unk_1002AF120;
    objc_copyWeak(&v26, &location);
    dispatch_source_set_event_handler(v21, handler);
    dispatch_resume(*((dispatch_object_t *)v10 + 3));
    *(float *)&v22 = a4;
    objc_msgSend(v10, "setCadenceSeconds:", v22);
    v23 = v10;
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return (MOWatchDog *)v10;
}

void __55__MOWatchDog_initWithName_cadenceInSeconds_andHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  int v3;
  id os_log;
  NSObject *v5;
  NSObject *v6;
  id v7;
  double v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void (**v13)(id, _QWORD);
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[3];
  uint8_t buf[4];
  id *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  double v24;
  __int16 v25;
  int v26;
  _QWORD v27[3];
  _QWORD v28[3];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_DWORD *)WeakRetained + 5);
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityWatchDog);
    v5 = objc_claimAutoreleasedReturnValue(os_log);
    v6 = v5;
    if (v3 >= 18)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        __55__MOWatchDog_initWithName_cadenceInSeconds_andHandler___block_invoke_cold_1();

      v27[0] = CFSTR("Name");
      v14 = objc_msgSend(v2[1], "copy");
      v28[0] = v14;
      v27[1] = CFSTR("SuccessiveWarningCount");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)v2 + 5)));
      v27[2] = CFSTR("Fatal");
      v28[1] = v15;
      v28[2] = &off_1002D85A0;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3));
      AnalyticsSendEvent(CFSTR("com.apple.Moments.DaemonWatchDog"), v16);

      exit(255);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v2[1], "UTF8String");
      v8 = *((float *)v2 + 4);
      v9 = *((_DWORD *)v2 + 5);
      *(_DWORD *)buf = 134218754;
      v20 = v2;
      v21 = 2080;
      v22 = v7;
      v23 = 2048;
      v24 = v8;
      v25 = 1024;
      v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Watch dog [0x%p:%s] was not petted on time; [%f] seconds elapsed, this happened %i time(s) before!",
        buf,
        0x26u);
    }

    ++*((_DWORD *)v2 + 5);
    v10 = objc_msgSend(v2[1], "copy", CFSTR("Name"));
    v18[0] = v10;
    v17[1] = CFSTR("SuccessiveWarningCount");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *((unsigned int *)v2 + 5)));
    v17[2] = CFSTR("Fatal");
    v18[1] = v11;
    v18[2] = &off_1002D85B8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
    AnalyticsSendEvent(CFSTR("com.apple.Moments.DaemonWatchDog"), v12);

    v13 = (void (**)(id, _QWORD))v2[5];
    if (v13)
      v13[2](v13, *((unsigned int *)v2 + 5));
  }

}

- (void)dealloc
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_2(v0);
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v1, v2, "Watch dog [0x%p:%s] destructing", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5();
}

- (float)getCadenceSeconds
{
  return self->_cadenceSeconds;
}

- (BOOL)setCadenceSeconds:(float)a3
{
  id os_log;
  NSObject *v5;

  if (a3 <= 0.0)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityWatchDog);
    v5 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MOWatchDog setCadenceSeconds:].cold.1(v5, a3);

  }
  else
  {
    self->_cadenceSeconds = a3;
    -[MOWatchDog pet](self, "pet");
  }
  return a3 > 0.0;
}

- (void)pet
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __17__MOWatchDog_pet__block_invoke;
  v4[3] = &unk_1002AF120;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __17__MOWatchDog_pet__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_pet");
    WeakRetained = v2;
  }

}

- (void)_pet
{
  id os_log;
  NSObject *v4;
  const char *v5;
  int failureCount;
  id v7;
  NSObject *v8;
  unint64_t v9;
  NSObject *source;
  dispatch_time_t v11;
  int v12;
  MOWatchDog *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;

  if (self->_failureCount)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityWatchDog);
    v4 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[NSString UTF8String](self->_name, "UTF8String");
      failureCount = self->_failureCount;
      v12 = 134218498;
      v13 = self;
      v14 = 2080;
      v15 = v5;
      v16 = 1024;
      v17 = failureCount;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Watch dog [0x%p:%s] recovered from %i earlier failures!", (uint8_t *)&v12, 0x1Cu);
    }

  }
  -[MOWatchDog _cancel](self, "_cancel");
  v7 = _mo_log_facility_get_os_log(&MOLogFacilityWatchDog);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[MOWatchDog _pet].cold.1();

  v9 = (unint64_t)(float)(self->_cadenceSeconds * 1000000000.0);
  source = self->_source;
  v11 = dispatch_time(0, v9);
  dispatch_source_set_timer(source, v11, v9, 0);
}

- (void)cancel
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __20__MOWatchDog_cancel__block_invoke;
  v4[3] = &unk_1002AF120;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __20__MOWatchDog_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cancel");
    WeakRetained = v2;
  }

}

- (void)_cancel
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_2(v0);
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v1, v2, "Watch dog [0x%p:%s] canceling check-in callback", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_5();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __55__MOWatchDog_initWithName_cadenceInSeconds_andHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_3_2(v1);
  OUTLINED_FUNCTION_0_9();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Watch dog [0x%p:%s] died of no petting - Exiting process!", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)setCadenceSeconds:(os_log_t)log .cold.1(os_log_t log, float a2)
{
  int v2;
  double v3;

  v2 = 134217984;
  v3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid cadence value %f", (uint8_t *)&v2, 0xCu);
}

- (double)_pet
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  double v4;
  double result;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  __int16 v10;
  double v11;

  OUTLINED_FUNCTION_4_2();
  v3 = objc_msgSend(*(id *)(v2 + 8), "UTF8String");
  v4 = *(float *)(v1 + 16);
  v6 = 134218498;
  v7 = v1;
  v8 = 2080;
  v9 = v3;
  v10 = 2048;
  v11 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Watch dog [0x%p:%s] scheduling check-in callback (%f seconds timeout)", (uint8_t *)&v6, 0x20u);
  return result;
}

@end
