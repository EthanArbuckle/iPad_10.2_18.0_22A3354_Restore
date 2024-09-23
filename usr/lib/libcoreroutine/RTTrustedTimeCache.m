@implementation RTTrustedTimeCache

- (id)getApproximateTrustedDateNowWithUnsecureFallback
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double minBoundReferenceTimeCfatSeconds;
  double maxBoundReferenceTimeCfatSeconds;
  char v11;
  NSObject *v12;
  double Current;
  NSObject *v14;
  void *v15;
  double cachedReferenceTimeCfatSeconds;
  double v17;
  double v18;
  NSObject *v19;
  double v21;
  double v22;
  uint8_t buf[4];
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[RTTrustedTimeCache getApproximateTrustedDateNow](self, "getApproximateTrustedDateNow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
LABEL_26:
    v15 = v5;
    goto LABEL_27;
  }
  -[RTTrustedTimeCache machContinuousTimeSeconds](self, "machContinuousTimeSeconds");
  v7 = v6;
  v8 = v6 - self->_cachedReferenceTimeMachContSeconds;
  if (self->_cachedTrustedTimeCfatSeconds != 0.0 && v8 <= 300.0)
    goto LABEL_21;
  if (!TMGetReferenceTime())
  {
    _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_DEFAULT, "Reference time unavailable", buf, 2u);
    }
    goto LABEL_20;
  }
  minBoundReferenceTimeCfatSeconds = self->_minBoundReferenceTimeCfatSeconds;
  maxBoundReferenceTimeCfatSeconds = self->_maxBoundReferenceTimeCfatSeconds;
  if (maxBoundReferenceTimeCfatSeconds < -1.0 && maxBoundReferenceTimeCfatSeconds != 0.0)
  {
    if (v7 - self->_machContSecondsWhenReferenceTimeBoundsSet + 10.0 <= maxBoundReferenceTimeCfatSeconds
                                                                       - minBoundReferenceTimeCfatSeconds)
    {
LABEL_11:
      v11 = 0;
      goto LABEL_15;
    }
    self->_maxBoundReferenceTimeCfatSeconds = maxBoundReferenceTimeCfatSeconds
                                            + maxBoundReferenceTimeCfatSeconds
                                            - minBoundReferenceTimeCfatSeconds;
  }
  if (-1.0 + 10.0 < minBoundReferenceTimeCfatSeconds)
    goto LABEL_11;
  self->_cachedReferenceTimeCfatSeconds = -1.0;
  self->_cachedReferenceTimeMachContSeconds = v7;
  v8 = 0.0;
  v11 = 1;
LABEL_15:
  Current = CFAbsoluteTimeGetCurrent();
  _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349568;
    v24 = Current - -1.0;
    v25 = 2050;
    v26 = -1.0;
    v27 = 1026;
    LODWORD(v28) = 0;
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEFAULT, "Reference time fetched with offset %{public}.3f,unc,%{public}.3f,rel,%{public}d", buf, 0x1Cu);
  }

  if ((v11 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v21 = self->_minBoundReferenceTimeCfatSeconds;
      v22 = self->_maxBoundReferenceTimeCfatSeconds;
      *(_DWORD *)buf = 134349568;
      v24 = -1.0;
      v25 = 2050;
      v26 = v21;
      v27 = 2050;
      v28 = v22;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Reference time %{public}.1f violated bounds %{public}.1f,%{public}.1f", buf, 0x20u);
    }
LABEL_20:

  }
LABEL_21:
  v15 = 0;
  cachedReferenceTimeCfatSeconds = self->_cachedReferenceTimeCfatSeconds;
  if (cachedReferenceTimeCfatSeconds != 0.0 && v8 < 14400.0)
  {
    v17 = v8 + cachedReferenceTimeCfatSeconds;
    v18 = CFAbsoluteTimeGetCurrent();
    _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      v24 = v8;
      v25 = 2050;
      v26 = v18 - v17;
      _os_log_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_INFO, "Reference time fetched with age %{public}.3f and offset %{public}.3f", buf, 0x16u);
    }

    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v17);
    goto LABEL_26;
  }
LABEL_27:

  return v15;
}

- (id)getApproximateTrustedDateNow
{
  double v3;
  double v4;
  double cachedTrustedTimeCfatSeconds;
  double v6;
  double Current;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[RTTrustedTimeCache machContinuousTimeSeconds](self, "machContinuousTimeSeconds");
  v4 = v3;
  cachedTrustedTimeCfatSeconds = self->_cachedTrustedTimeCfatSeconds;
  v6 = v4 - self->_cachedTrustedTimeMachContSeconds;
  if (cachedTrustedTimeCfatSeconds == 0.0 || v6 > 300.0)
  {
    if (TMGetTrustedInterval())
    {
      self->_cachedTrustedTimeCfatSeconds = -1.0;
      self->_cachedTrustedTimeMachContSeconds = v4;
      Current = CFAbsoluteTimeGetCurrent();
      _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
      v8 = objc_claimAutoreleasedReturnValue();
      v6 = 0.0;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349312;
        v18 = Current - -1.0;
        v19 = 2050;
        v20 = -1.0;
        v9 = "Trusted interval fetched with offset %{public}.3f,unc,%{public}.3f";
        v10 = v8;
        v11 = 22;
LABEL_8:
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v9 = "Trusted interval unavailable";
        v10 = v8;
        v11 = 2;
        goto LABEL_8;
      }
    }

    cachedTrustedTimeCfatSeconds = self->_cachedTrustedTimeCfatSeconds;
  }
  v12 = 0;
  if (cachedTrustedTimeCfatSeconds != 0.0 && v6 < 14400.0)
  {
    v13 = cachedTrustedTimeCfatSeconds + v6;
    v14 = CFAbsoluteTimeGetCurrent();
    _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349312;
      v18 = v6;
      v19 = 2050;
      v20 = v14 - v13;
      _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "Trusted interval fetched with age %{public}.3f and offset %{public}.3f", buf, 0x16u);
    }

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v13);
  }
  return v12;
}

- (double)machContinuousTimeSeconds
{
  double result;

  -[RTTrustedTimeCache convertMachContinuousTicksToSeconds:](self, "convertMachContinuousTicksToSeconds:", mach_continuous_time());
  return result;
}

- (RTTrustedTimeCache)init
{
  RTTrustedTimeCache *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RTTrustedTimeCache;
  result = -[RTTrustedTimeCache init](&v3, sel_init);
  if (result)
  {
    result->_machContSecondsWhenReferenceTimeBoundsSet = 0.0;
    *(_OWORD *)&result->_minBoundReferenceTimeCfatSeconds = 0u;
    *(_OWORD *)&result->_cachedReferenceTimeCfatSeconds = 0u;
    *(_OWORD *)&result->_cachedTrustedTimeCfatSeconds = 0u;
  }
  return result;
}

- (double)convertMachContinuousTicksToSeconds:(unint64_t)a3
{
  if (qword_1ED942A08 != -1)
    dispatch_once(&qword_1ED942A08, &__block_literal_global_84);
  return (double)(_MergedGlobals_104 * a3 / *(unsigned int *)algn_1ED942A04) * 0.000000001;
}

uint64_t __58__RTTrustedTimeCache_convertMachContinuousTicksToSeconds___block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&_MergedGlobals_104);
}

- (void)setBoundsForReferenceTimeWithMinimumDate:(id)a3 maximumDate:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double Current;
  NSObject *v11;
  double minBoundReferenceTimeCfatSeconds;
  double maxBoundReferenceTimeCfatSeconds;
  int v14;
  double v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  self->_minBoundReferenceTimeCfatSeconds = 0.0;
  self->_maxBoundReferenceTimeCfatSeconds = 0.0;
  if (v6)
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    self->_minBoundReferenceTimeCfatSeconds = v8;
  }
  if (v7)
  {
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    self->_maxBoundReferenceTimeCfatSeconds = v9;
  }
  Current = CFAbsoluteTimeGetCurrent();
  _rt_log_facility_get_os_log(RTLogFacilityTrustedTime);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    minBoundReferenceTimeCfatSeconds = self->_minBoundReferenceTimeCfatSeconds;
    maxBoundReferenceTimeCfatSeconds = self->_maxBoundReferenceTimeCfatSeconds;
    v14 = 134349824;
    v15 = minBoundReferenceTimeCfatSeconds;
    v16 = 2050;
    v17 = maxBoundReferenceTimeCfatSeconds;
    v18 = 2050;
    v19 = Current - minBoundReferenceTimeCfatSeconds;
    v20 = 2050;
    v21 = Current - maxBoundReferenceTimeCfatSeconds;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_DEFAULT, "Set reference time bounds to %{public}.1f,%{public}.1f, age, %{public}.1f,%{public}.1f", (uint8_t *)&v14, 0x2Au);
  }

}

- (double)cachedTrustedTimeCfatSeconds
{
  return self->_cachedTrustedTimeCfatSeconds;
}

- (void)setCachedTrustedTimeCfatSeconds:(double)a3
{
  self->_cachedTrustedTimeCfatSeconds = a3;
}

- (double)cachedTrustedTimeMachContSeconds
{
  return self->_cachedTrustedTimeMachContSeconds;
}

- (void)setCachedTrustedTimeMachContSeconds:(double)a3
{
  self->_cachedTrustedTimeMachContSeconds = a3;
}

- (double)cachedReferenceTimeCfatSeconds
{
  return self->_cachedReferenceTimeCfatSeconds;
}

- (void)setCachedReferenceTimeCfatSeconds:(double)a3
{
  self->_cachedReferenceTimeCfatSeconds = a3;
}

- (double)cachedReferenceTimeMachContSeconds
{
  return self->_cachedReferenceTimeMachContSeconds;
}

- (void)setCachedReferenceTimeMachContSeconds:(double)a3
{
  self->_cachedReferenceTimeMachContSeconds = a3;
}

- (double)minBoundReferenceTimeCfatSeconds
{
  return self->_minBoundReferenceTimeCfatSeconds;
}

- (void)setMinBoundReferenceTimeCfatSeconds:(double)a3
{
  self->_minBoundReferenceTimeCfatSeconds = a3;
}

- (double)maxBoundReferenceTimeCfatSeconds
{
  return self->_maxBoundReferenceTimeCfatSeconds;
}

- (void)setMaxBoundReferenceTimeCfatSeconds:(double)a3
{
  self->_maxBoundReferenceTimeCfatSeconds = a3;
}

- (double)machContSecondsWhenReferenceTimeBoundsSet
{
  return self->_machContSecondsWhenReferenceTimeBoundsSet;
}

- (void)setMachContSecondsWhenReferenceTimeBoundsSet:(double)a3
{
  self->_machContSecondsWhenReferenceTimeBoundsSet = a3;
}

@end
