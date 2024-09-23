@implementation RTTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (RTTimer)initWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  RTTimer *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315394;
      v17 = "-[RTTimer initWithIdentifier:queue:handler:]";
      v18 = 1024;
      v19 = 30;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v16, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v10)
        goto LABEL_4;
LABEL_13:
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = 136315394;
        v17 = "-[RTTimer initWithIdentifier:queue:handler:]";
        v18 = 1024;
        v19 = 32;
        _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v16, 0x12u);
      }
      v11 = 0;
      goto LABEL_16;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v16 = 136315394;
    v17 = "-[RTTimer initWithIdentifier:queue:handler:]";
    v18 = 1024;
    v19 = 31;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", (uint8_t *)&v16, 0x12u);
  }

  if (!v10)
    goto LABEL_13;
LABEL_4:
  v11 = 0;
  if (v8 && v9)
  {
    v12 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v9);
    dispatch_source_set_event_handler(v12, v10);
    self = -[RTTimer initWithIdentifier:dispatchSource:](self, "initWithIdentifier:dispatchSource:", v8, v12);
    v11 = self;
LABEL_16:

  }
  return v11;
}

- (RTTimer)initWithIdentifier:(id)a3 dispatchSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  RTTimer *v9;
  uint64_t v10;
  NSString *identifier;
  RTTimer *v12;
  NSObject *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTTimer initWithIdentifier:dispatchSource:]";
      v19 = 1024;
      v20 = 53;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if (v8)
      goto LABEL_12;
    goto LABEL_9;
  }
  if (!v7)
  {
LABEL_9:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTTimer initWithIdentifier:dispatchSource:]";
      v19 = 1024;
      v20 = 54;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: source (in %s:%d)", buf, 0x12u);
    }

LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  v16.receiver = self;
  v16.super_class = (Class)RTTimer;
  v9 = -[RTTimer init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    objc_storeStrong((id *)&v9->_timer, a4);
  }
  self = v9;
  v12 = self;
LABEL_13:

  return v12;
}

- (void)resume
{
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (void)fireAfterDelay:(double)a3 interval:(double)a4 leeway:(double)a5
{
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *timer;
  double v13;
  uint64_t v14;
  dispatch_time_t v15;
  uint64_t v18;
  uint64_t v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315394;
      v23 = "-[RTTimer fireAfterDelay:interval:leeway:]";
      v24 = 1024;
      v25 = 108;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: delay > 0 (in %s:%d)", (uint8_t *)&v22, 0x12u);
    }

  }
  if (a4 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315394;
      v23 = "-[RTTimer fireAfterDelay:interval:leeway:]";
      v24 = 1024;
      v25 = 109;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: interval > 0 (in %s:%d)", (uint8_t *)&v22, 0x12u);
    }

  }
  if (a5 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315394;
      v23 = "-[RTTimer fireAfterDelay:interval:leeway:]";
      v24 = 1024;
      v25 = 110;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: leeway > 0 (in %s:%d)", (uint8_t *)&v22, 0x12u);
    }

  }
  timer = self->_timer;
  v13 = fabs(a3);
  if (v13 == INFINITY)
    v14 = -1;
  else
    v14 = 0;
  v15 = v14;
  if (a3 > 0.0 && v13 != INFINITY)
    v15 = dispatch_walltime(0, (uint64_t)(a3 * 1000000000.0));
  if ((*(uint64_t *)&a4 <= -1 || ((*(_QWORD *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(_QWORD *)&a4 - 1) >= 0xFFFFFFFFFFFFFLL)
  {
    v18 = -1;
  }
  else
  {
    v18 = (unint64_t)(a4 * 1000000000.0);
  }
  if ((*(uint64_t *)&a5 <= -1 || ((*(_QWORD *)&a5 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(_QWORD *)&a5 - 1) >= 0xFFFFFFFFFFFFFLL)
  {
    v21 = -1;
  }
  else
  {
    v21 = (unint64_t)(a5 * 1000000000.0);
  }
  dispatch_source_set_timer(timer, v15, v18, v21);
}

- (void)fireAfterDelay:(double)a3
{
  -[RTTimer fireAfterDelay:interval:leeway:](self, "fireAfterDelay:interval:leeway:", a3, INFINITY, a3 * 0.2);
}

- (void)invalidate
{
  dispatch_source_cancel((dispatch_source_t)self->_timer);
}

- (void)dealloc
{
  objc_super v3;

  dispatch_source_cancel((dispatch_source_t)self->_timer);
  v3.receiver = self;
  v3.super_class = (Class)RTTimer;
  -[RTTimer dealloc](&v3, sel_dealloc);
}

- (void)fireWithInterval:(double)a3 leeway:(double)a4
{
  -[RTTimer fireAfterDelay:interval:leeway:](self, "fireAfterDelay:interval:leeway:", a3, a3, a4);
}

- (RTTimer)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithIdentifier_queue_handler_);
}

- (void)fireWithInterval:(double)a3
{
  -[RTTimer fireAfterDelay:interval:leeway:](self, "fireAfterDelay:interval:leeway:", a3, a3, a3 * 0.2);
}

- (void)fireAfterDelay:(double)a3 interval:(double)a4
{
  -[RTTimer fireAfterDelay:interval:leeway:](self, "fireAfterDelay:interval:leeway:", a3, a4, a4 * 0.2);
}

- (void)cancel
{
  -[RTTimer fireAfterDelay:interval:leeway:](self, "fireAfterDelay:interval:leeway:", INFINITY, INFINITY, INFINITY);
}

- (void)suspend
{
  dispatch_suspend((dispatch_object_t)self->_timer);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

@end
