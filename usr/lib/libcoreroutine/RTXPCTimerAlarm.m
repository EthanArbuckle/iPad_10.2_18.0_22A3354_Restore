@implementation RTXPCTimerAlarm

- (RTXPCTimerAlarm)initWithIdentifier:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  RTXPCTimerAlarm *v12;
  RTXPCTimerAlarm *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  id handler;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTXPCTimerAlarm initWithIdentifier:queue:handler:]";
      v22 = 1024;
      v23 = 26;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue (in %s:%d)", buf, 0x12u);
    }

  }
  v19.receiver = self;
  v19.super_class = (Class)RTXPCTimerAlarm;
  v12 = -[RTXPCTimerAlarm init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a4);
    v13->_state = 0;
    v14 = objc_msgSend(v8, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    handler = v13->_handler;
    v13->_handler = (id)v16;

    -[RTXPCTimerAlarm setup](v13, "setup");
  }

  return v13;
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[RTXPCTimerAlarm queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__RTXPCTimerAlarm_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __24__RTXPCTimerAlarm_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (void)_setup
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTXPCTimerAlarm identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_onNotification_, v3, 0);

}

- (void)onNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTXPCTimerAlarm queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__RTXPCTimerAlarm_onNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __34__RTXPCTimerAlarm_onNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onNotification:", *(_QWORD *)(a1 + 40));
}

- (BOOL)fireWithDate:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v6 = a3;
  if (v6)
  {
    -[RTXPCTimerAlarm queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__RTXPCTimerAlarm_fireWithDate_error___block_invoke;
    v10[3] = &unk_1E9297540;
    v10[4] = self;
    v11 = v6;
    dispatch_async(v7, v10);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("endDate"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v6 != 0;
}

uint64_t __38__RTXPCTimerAlarm_fireWithDate_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fireWithDate:", *(_QWORD *)(a1 + 40));
}

- (BOOL)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[RTXPCTimerAlarm queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__RTXPCTimerAlarm_invalidate__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

  return 1;
}

uint64_t __29__RTXPCTimerAlarm_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_fireWithDate:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (v4)
  {
    -[RTXPCTimerAlarm _deregisterAlarm](self, "_deregisterAlarm");
    -[RTXPCTimerAlarm _resetState](self, "_resetState");
    if (-[RTXPCTimerAlarm _isEndDateValid:](self, "_isEndDateValid:", v4))
    {
      -[RTXPCTimerAlarm setState:](self, "setState:", 2);
      -[RTXPCTimerAlarm _setAlarmWithEndDate:userVisible:](self, "_setAlarmWithEndDate:userVisible:", v4, 1);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", v6, 2u);
    }

  }
}

- (void)_handleDurationExpiry
{
  void *v3;
  void *v4;
  void (**v5)(void);

  -[RTXPCTimerAlarm setState:](self, "setState:", 3);
  -[RTXPCTimerAlarm _deregisterAlarm](self, "_deregisterAlarm");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTXPCTimerAlarm setEndDate:](self, "setEndDate:", v3);

  -[RTXPCTimerAlarm handler](self, "handler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTXPCTimerAlarm handler](self, "handler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (void)_invalidate
{
  void *v3;
  id v4;

  -[RTXPCTimerAlarm _deregisterAlarm](self, "_deregisterAlarm");
  -[RTXPCTimerAlarm _resetState](self, "_resetState");
  -[RTXPCTimerAlarm setState:](self, "setState:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[RTXPCTimerAlarm identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, v3, 0);

}

- (void)_setAlarmWithEndDate:(id)a3 userVisible:(BOOL)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  xpc_object_t xdict;

  v6 = a3;
  -[RTXPCTimerAlarm identifier](self, "identifier");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "cStringUsingEncoding:", 4);

  objc_msgSend(v6, "timeIntervalSince1970");
  v9 = v8;

  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_date(xdict, "Date", 1000000000 * (uint64_t)v9);
  xpc_dictionary_set_BOOL(xdict, "UserVisible", a4);
  xpc_set_event();

}

- (void)_deregisterAlarm
{
  id v2;

  -[RTXPCTimerAlarm identifier](self, "identifier");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "cStringUsingEncoding:", 4);

  xpc_set_event();
}

- (BOOL)_isEndDateValid:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "compare:", v5);

  if (v7 == 1)
    -[RTXPCTimerAlarm _handleDurationExpiry](self, "_handleDurationExpiry");

  return v7 != 1;
}

- (void)_resetState
{
  -[RTXPCTimerAlarm setEndDate:](self, "setEndDate:", 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
