@implementation RTStoredSettledStateTransitionEnumerationOptions

- (RTStoredSettledStateTransitionEnumerationOptions)initWithAscending:(BOOL)a3 dateInterval:(id)a4 limit:(id)a5 batchSize:(unint64_t)a6
{
  id v11;
  id v12;
  void *v13;
  RTStoredSettledStateTransitionEnumerationOptions *v14;
  RTStoredSettledStateTransitionEnumerationOptions *v15;
  RTStoredSettledStateTransitionEnumerationOptions *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[16];

  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v12 && !objc_msgSend(v12, "unsignedIntegerValue"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !limit || (limit && limit.unsignedIntegerValue > 0)", buf, 2u);
    }

    v16 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)RTStoredSettledStateTransitionEnumerationOptions;
    v14 = -[RTStoredSettledStateTransitionEnumerationOptions init](&v19, sel_init);
    v15 = v14;
    if (v14)
    {
      v14->_ascending = a3;
      objc_storeStrong((id *)&v14->_dateInterval, a4);
      objc_storeStrong((id *)&v15->_limit, a5);
      v15->_batchSize = a6;
    }
    self = v15;
    v16 = self;
  }

  return v16;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_ascending)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("ascending, %@, startDate, %@, endDate, %@, limit, %@"), v4, v6, v8, self->_limit);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)limit
{
  return self->_limit;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limit, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
