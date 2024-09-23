@implementation RTWatchdogRecord

- (RTWatchdogRecord)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithObject_timeout_);
}

- (RTWatchdogRecord)initWithObject:(id)a3 timeout:(double)a4
{
  id v6;
  RTWatchdogRecord *v7;
  RTWatchdogRecord *v8;
  uint64_t v9;
  NSDate *checkInStartDate;
  uint64_t v11;
  NSDate *checkInStopDate;
  RTWatchdogRecord *v13;
  NSObject *v14;
  const char *v15;
  objc_super v17;
  uint8_t buf[16];

  v6 = a3;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v13 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: object";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
    goto LABEL_9;
  }
  if (a4 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v15 = "Invalid parameter not satisfying: timeout > 0";
    goto LABEL_12;
  }
  v17.receiver = self;
  v17.super_class = (Class)RTWatchdogRecord;
  v7 = -[RTWatchdogRecord init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_object, v6);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v9 = objc_claimAutoreleasedReturnValue();
    checkInStartDate = v8->_checkInStartDate;
    v8->_checkInStartDate = (NSDate *)v9;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v11 = objc_claimAutoreleasedReturnValue();
    checkInStopDate = v8->_checkInStopDate;
    v8->_checkInStopDate = (NSDate *)v11;

    v8->_timeout = a4;
  }
  self = v8;
  v13 = self;
LABEL_10:

  return v13;
}

- (double)getLatency
{
  NSDate *checkInStopDate;
  double result;
  void *v5;
  double v6;
  double v7;

  checkInStopDate = self->_checkInStopDate;
  if (checkInStopDate)
  {
    -[NSDate timeIntervalSinceDate:](checkInStopDate, "timeIntervalSinceDate:", self->_checkInStartDate);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", self->_checkInStartDate);
    v7 = v6;

    return v7;
  }
  return result;
}

- (BOOL)isPendingCheckIn
{
  return self->_checkInStartDate && self->_checkInStopDate == 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[RTWatchdogRecord object](self, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWatchdogRecord checkInStartDate](self, "checkInStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWatchdogRecord checkInStopDate](self, "checkInStopDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTWatchdogRecord timeout](self, "timeout");
  v13 = v12;
  -[RTWatchdogRecord getLatency](self, "getLatency");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("object, %@, start, %@, stop, %@, timeout, %f, latency, %f"), v7, v9, v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (RTWatchdogProtocol)object
{
  return (RTWatchdogProtocol *)objc_loadWeakRetained((id *)&self->_object);
}

- (void)setObject:(id)a3
{
  objc_storeWeak((id *)&self->_object, a3);
}

- (NSDate)checkInStartDate
{
  return self->_checkInStartDate;
}

- (void)setCheckInStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_checkInStartDate, a3);
}

- (NSDate)checkInStopDate
{
  return self->_checkInStopDate;
}

- (void)setCheckInStopDate:(id)a3
{
  objc_storeStrong((id *)&self->_checkInStopDate, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkInStopDate, 0);
  objc_storeStrong((id *)&self->_checkInStartDate, 0);
  objc_destroyWeak((id *)&self->_object);
}

@end
