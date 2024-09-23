@implementation FMDBatteryInfo

- (FMDBatteryInfo)init
{
  FMDBatteryInfo *v2;
  FMDBatteryInfo *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FMDBatteryInfo;
  v2 = -[FMDBatteryInfo init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->_batteryType = 4;
    -[FMDBatteryInfo populateBatterStatsForCurrentDevice](v2, "populateBatterStatsForCurrentDevice");
  }
  return v3;
}

- (FMDBatteryInfo)initWithType:(unint64_t)a3 level:(double)a4 state:(unint64_t)a5
{
  FMDBatteryInfo *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FMDBatteryInfo;
  result = -[FMDBatteryInfo init](&v9, "init");
  if (result)
  {
    result->_batteryLevel = a4;
    result->_batteryState = a5;
    result->_batteryType = a3;
  }
  return result;
}

- (FMDBatteryInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  FMDBatteryInfo *v6;
  uint64_t v7;
  NSString *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FMDBatteryInfo;
  v6 = -[FMDBatteryInfo init](&v23, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSNumber, v5);
    v8 = NSStringFromSelector("batteryLevel");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v9));
    objc_msgSend(v10, "doubleValue");
    v6->_batteryLevel = v11;

    v13 = objc_opt_class(NSNumber, v12);
    v14 = NSStringFromSelector("batteryState");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v15));
    v6->_batteryState = (unint64_t)objc_msgSend(v16, "unsignedIntegerValue");

    v18 = objc_opt_class(NSNumber, v17);
    v19 = NSStringFromSelector("batteryType");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v20));
    v6->_batteryType = (unint64_t)objc_msgSend(v21, "unsignedIntegerValue");

  }
  return v6;
}

- (FMDBatteryInfo)initWithDictionary:(id)a3
{

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  double batteryLevel;
  id v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  void *v13;
  id v14;

  batteryLevel = self->_batteryLevel;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", batteryLevel));
  v7 = NSStringFromSelector("batteryLevel");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v5, "encodeObject:forKey:", v6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_batteryState));
  v10 = NSStringFromSelector("batteryState");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v5, "encodeObject:forKey:", v9, v11);

  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_batteryType));
  v12 = NSStringFromSelector("batteryType");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v5, "encodeObject:forKey:", v14, v13);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_batteryLevel));
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v4, CFSTR("batteryLevel"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBatteryInfo batteryStatusForState:](self, "batteryStatusForState:", self->_batteryState));
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v5, CFSTR("batteryStatus"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_batteryType));
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v6, CFSTR("batteryType"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_batteryState == 2));
  -[NSMutableDictionary setValue:forKey:](v3, "setValue:forKey:", v7, CFSTR("isChargerConnected"));

  return (NSDictionary *)v3;
}

- (void)populateBatterStatsForCurrentDevice
{
  void *v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_registry_entry_t v6;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v8;
  const __CFBoolean *v9;
  BOOL v10;
  const __CFNumber *v11;
  CFTypeRef v12;
  const void *v13;
  BOOL v14;
  int Value;
  BOOL v17;
  unint64_t v18;
  float v19;
  double v20;
  BOOL v21;
  BOOL v22;
  double v23;
  uint64_t valuePtr;

  v3 = objc_autoreleasePoolPush();
  v4 = IOServiceMatching("IOPMPowerSource");
  if (v4)
  {
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v4);
    if (MatchingService)
    {
      v6 = MatchingService;
      CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("FullyCharged"), kCFAllocatorDefault, 0);
      v8 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v6, CFSTR("IsCharging"), kCFAllocatorDefault, 0);
      v9 = v8;
      if (CFProperty)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
      {
        self->_batteryState = 0;
        if (!CFProperty)
        {
          if (!v8)
            goto LABEL_11;
          goto LABEL_10;
        }
      }
      else
      {
        Value = CFBooleanGetValue(CFProperty);
        if (CFBooleanGetValue(v9))
          v17 = Value == 0;
        else
          v17 = 0;
        v18 = 1;
        if (v17)
          v18 = 2;
        self->_batteryState = v18;
      }
      CFRelease(CFProperty);
      if (!v9)
      {
LABEL_11:
        v11 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v6, CFSTR("CurrentCapacity"), kCFAllocatorDefault, 0);
        v12 = IORegistryEntryCreateCFProperty(v6, CFSTR("MaxCapacity"), kCFAllocatorDefault, 0);
        v13 = v12;
        if (v11)
          v14 = v12 == 0;
        else
          v14 = 1;
        if (v14)
        {
          if (!v11)
          {
            if (!v12)
            {
LABEL_19:
              IOObjectRelease(v6);
              goto LABEL_20;
            }
LABEL_18:
            CFRelease(v13);
            goto LABEL_19;
          }
        }
        else
        {
          valuePtr = 0;
          CFNumberGetValue(v11, kCFNumberFloatType, (char *)&valuePtr + 4);
          CFNumberGetValue((CFNumberRef)v13, kCFNumberFloatType, &valuePtr);
          v19 = fabsf(*((float *)&valuePtr + 1) / *(float *)&valuePtr);
          v20 = (float)(*((float *)&valuePtr + 1) / *(float *)&valuePtr);
          v21 = v19 < INFINITY;
          v22 = v19 <= INFINITY;
          v23 = 0.0;
          if (v21)
            v23 = (float)(*((float *)&valuePtr + 1) / *(float *)&valuePtr);
          if (v22)
            v20 = v23;
          self->_batteryLevel = v20;
        }
        CFRelease(v11);
        if (!v13)
          goto LABEL_19;
        goto LABEL_18;
      }
LABEL_10:
      CFRelease(v9);
      goto LABEL_11;
    }
  }
LABEL_20:
  objc_autoreleasePoolPop(v3);
}

- (id)batteryStatusForState:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Unknown");
  else
    return *(&off_1002C2E00 + a3 - 1);
}

- (unint64_t)batteryType
{
  return self->_batteryType;
}

- (double)batteryLevel
{
  return self->_batteryLevel;
}

- (unint64_t)batteryState
{
  return self->_batteryState;
}

@end
