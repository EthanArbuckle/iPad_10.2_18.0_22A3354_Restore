@implementation CMActivityAlarm(RTMotionActivityManager)

+ (__CFString)triggerToString:()RTMotionActivityManager
{
  NSObject *v4;
  void *v5;
  __CFString *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 < 0x1D && ((0x10003FDFu >> a3) & 1) != 0)
  {
    v6 = off_1E92A5798[(int)a3];
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8[0] = 67109120;
      v8[1] = a3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "unrecognized trigger for description %d", (uint8_t *)v8, 8u);
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)description
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "duration");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0CA55D0], "triggerToString:", objc_msgSend(a1, "trigger"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("CMActivityAlarm, duration, %f, trigger, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
