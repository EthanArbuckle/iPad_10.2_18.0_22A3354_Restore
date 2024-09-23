@implementation NSDateComponents(HKSPSleep)

- (id)hksp_description
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (objc_msgSend(a1, "year") != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(a1, "month") != 0x7FFFFFFFFFFFFFFFLL
    || objc_msgSend(a1, "day") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v2, "appendFormat:", CFSTR("%04ld-%02ld-%02ld"), objc_msgSend(a1, "year"), objc_msgSend(a1, "month"), objc_msgSend(a1, "day"));
  }
  if (objc_msgSend(a1, "hour") != 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(a1, "minute") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v2, "appendFormat:", CFSTR(" %ld:%02ld"), objc_msgSend(a1, "hour"), objc_msgSend(a1, "minute"));
  objc_msgSend(v2, "hk_stripLeadingTrailingWhitespace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)hksp_compareHourAndMinuteComponents:()HKSPSleep
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  if (objc_msgSend(a1, "hour") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDateComponents+HKSPSleep.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.hour != NSDateComponentUndefined"));

  }
  if (objc_msgSend(a1, "minute") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDateComponents+HKSPSleep.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.minute != NSDateComponentUndefined"));

  }
  if (objc_msgSend(v5, "hour") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDateComponents+HKSPSleep.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherDateComponents.hour != NSDateComponentUndefined"));

  }
  if (objc_msgSend(v5, "minute") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDateComponents+HKSPSleep.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("otherDateComponents.minute != NSDateComponentUndefined"));

  }
  objc_msgSend(a1, "hk_hourNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_hourNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  objc_msgSend(a1, "hk_minuteNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hk_minuteNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  if (v8)
    v12 = v8;
  else
    v12 = v11;

  return v12;
}

- (id)hksp_timeComponents
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v2, "setHour:", objc_msgSend(a1, "hour"));
  objc_msgSend(v2, "setMinute:", objc_msgSend(a1, "minute"));
  return v2;
}

@end
