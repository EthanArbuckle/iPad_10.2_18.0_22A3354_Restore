@implementation RTPersistentTimer

- (RTPersistentTimer)initWithFireDate:(id)a3 interval:(double)a4 serviceIdentifier:(id)a5 queue:(id)a6 handler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  RTPersistentTimer *v20;
  RTPersistentTimer *v21;
  uint64_t v22;
  NSString *serviceIdentifier;
  uint64_t v24;
  id handler;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[RTPersistentTimer initWithFireDate:interval:serviceIdentifier:queue:handler:]";
      v30 = 1024;
      v31 = 37;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fireDate (in %s:%d)", buf, 0x12u);
    }

    if (v14)
    {
LABEL_3:
      if (v16)
        goto LABEL_14;
      goto LABEL_11;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[RTPersistentTimer initWithFireDate:interval:serviceIdentifier:queue:handler:]";
    v30 = 1024;
    v31 = 38;
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: serviceIdentifer (in %s:%d)", buf, 0x12u);
  }

  if (!v16)
  {
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[RTPersistentTimer initWithFireDate:interval:serviceIdentifier:queue:handler:]";
      v30 = 1024;
      v31 = 39;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_14:
  v27.receiver = self;
  v27.super_class = (Class)RTPersistentTimer;
  v20 = -[RTPersistentTimer init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_fireDate, a3);
    objc_storeStrong((id *)&v21->_queue, a6);
    v21->_interval = a4;
    v22 = objc_msgSend(v14, "copy");
    serviceIdentifier = v21->_serviceIdentifier;
    v21->_serviceIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    handler = v21->_handler;
    v21->_handler = (id)v24;

    -[RTPersistentTimer _startTimer](v21, "_startTimer");
  }

  return v21;
}

- (RTPersistentTimer)initWithFireDate:(id)a3 serviceIdentifier:(id)a4 queue:(id)a5 handler:(id)a6
{
  return -[RTPersistentTimer initWithFireDate:interval:serviceIdentifier:queue:handler:](self, "initWithFireDate:interval:serviceIdentifier:queue:handler:", a3, a4, a5, a6, INFINITY);
}

- (void)_startTimer
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[RTPersistentTimer _invalidateTimer](self, "_invalidateTimer");
  -[RTPersistentTimer fireDate](self, "fireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D70A38]);
    -[RTPersistentTimer fireDate](self, "fireDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPersistentTimer serviceIdentifier](self, "serviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithFireDate:serviceIdentifier:target:selector:userInfo:", v5, v6, self, sel__onTimerFired_, 0);
    -[RTPersistentTimer setTimer:](self, "setTimer:", v7);

    -[RTPersistentTimer timer](self, "timer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMinimumEarlyFireProportion:", 0.9);

    -[RTPersistentTimer timer](self, "timer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[RTPersistentTimer queue](self, "queue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scheduleInQueue:", v9);

  }
}

- (void)_onTimerFired:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[RTPersistentTimer handler](self, "handler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RTPersistentTimer handler](self, "handler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  -[RTPersistentTimer _setupNextTimer](self, "_setupNextTimer");
}

- (void)_setupNextTimer
{
  double v3;
  void *v4;
  void *v5;

  -[RTPersistentTimer interval](self, "interval");
  if (v3 == INFINITY)
  {
    -[RTPersistentTimer setFireDate:](self, "setFireDate:", 0);
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99D68];
    -[RTPersistentTimer interval](self, "interval");
    objc_msgSend(v4, "dateWithTimeIntervalSinceNow:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPersistentTimer setFireDate:](self, "setFireDate:", v5);

  }
  -[RTPersistentTimer _startTimer](self, "_startTimer");
}

- (void)_invalidateTimer
{
  void *v3;

  -[RTPersistentTimer timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[RTPersistentTimer setTimer:](self, "setTimer:", 0);
}

- (void)invalidate
{
  -[RTPersistentTimer _invalidateTimer](self, "_invalidateTimer");
  -[RTPersistentTimer setHandler:](self, "setHandler:", 0);
  -[RTPersistentTimer setFireDate:](self, "setFireDate:", 0);
  -[RTPersistentTimer setInterval:](self, "setInterval:", INFINITY);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
  objc_storeStrong((id *)&self->_fireDate, a3);
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PCPersistentTimer)timer
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
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
