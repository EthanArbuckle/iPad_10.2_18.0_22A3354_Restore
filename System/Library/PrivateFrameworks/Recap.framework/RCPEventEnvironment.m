@implementation RCPEventEnvironment

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screens, 0);
  objc_storeStrong((id *)&self->_recapVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_productType, 0);
}

- (int)touchScanRate
{
  return self->_touchScanRate;
}

- (NSArray)screens
{
  return self->_screens;
}

- (int)pointerScanRate
{
  return self->_pointerScanRate;
}

+ (id)currentEnvironment
{
  return (id)objc_opt_new();
}

- (RCPEventEnvironment)init
{
  RCPEventEnvironment *v2;
  int64_t numer;
  uint32_t denom;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  size_t size;
  mach_timebase_info info;
  objc_super v23;
  int v24;

  v23.receiver = self;
  v23.super_class = (Class)RCPEventEnvironment;
  v2 = -[RCPEventEnvironment init](&v23, sel_init);
  if (v2)
  {
    info = 0;
    mach_timebase_info(&info);
    numer = info.numer;
    denom = info.denom;
    v5 = (double)info.numer;
    v2->_machTimeDenominator = info.denom;
    v2->_machTimeNumerator = numer;
    v2->_timeScale = v5 / (double)denom;
    size = 0;
    sysctlbyname("hw.model", 0, &size, 0, 0);
    if (size)
    {
      v6 = malloc_type_malloc(size, 0x100004077774924uLL);
      if (v6)
      {
        v7 = v6;
        sysctlbyname("hw.model", v6, &size, 0, 0);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RCPEventEnvironment setProductType:](v2, "setProductType:", v8);

        free(v7);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Mac");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[RCPEventEnvironment setProductType:](v2, "setProductType:", v9);

      }
    }
    v24 = 0;
    v10 = (void *)MGCopyAnswerWithError();
    -[RCPEventEnvironment setProductName:](v2, "setProductName:", v10);

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "operatingSystemVersionString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Version "), &stru_1E4FC2788);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Build "), &stru_1E4FC2788);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[RCPEventEnvironment setProductVersion:](v2, "setProductVersion:", v14);
    -[RCPEventEnvironment setRecapVersion:](v2, "setRecapVersion:", CFSTR("1.4"));
    -[RCPEventEnvironment setPointerScanRate:](v2, "setPointerScanRate:", 120);
    if (MGGetBoolAnswer())
      v15 = 120;
    else
      v15 = 60;
    -[RCPEventEnvironment setTouchScanRate:](v2, "setTouchScanRate:", v15);
    _RCPActiveScreens();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCPEventEnvironment setScreens:](v2, "setScreens:", v16);

    objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "homeButtonType") + 1;
    if (v18 <= 3)
      -[RCPEventEnvironment setHomeButtonHardware:](v2, "setHomeButtonHardware:", qword_1A5EA8AC0[v18]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSince1970");
    -[RCPEventEnvironment setStartTimeAsIntervalSince1970:](v2, "setStartTimeAsIntervalSince1970:");

    -[RCPEventEnvironment setStartTimeAsMachTimestamp:](v2, "setStartTimeAsMachTimestamp:", mach_absolute_time());
  }
  return v2;
}

- (void)setTouchScanRate:(int)a3
{
  self->_touchScanRate = a3;
}

- (void)setStartTimeAsMachTimestamp:(unint64_t)a3
{
  self->_startTimeAsMachTimestamp = a3;
}

- (void)setStartTimeAsIntervalSince1970:(double)a3
{
  self->_startTimeAsIntervalSince1970 = a3;
}

- (void)setScreens:(id)a3
{
  objc_storeStrong((id *)&self->_screens, a3);
}

- (void)setRecapVersion:(id)a3
{
  objc_storeStrong((id *)&self->_recapVersion, a3);
}

- (void)setProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_productVersion, a3);
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (void)setProductName:(id)a3
{
  objc_storeStrong((id *)&self->_productName, a3);
}

- (void)setPointerScanRate:(int)a3
{
  self->_pointerScanRate = a3;
}

- (void)setHomeButtonHardware:(int64_t)a3
{
  self->_homeButtonHardware = a3;
}

- (unint64_t)machAbsoluteTimeForTimeInterval:(double)a3
{
  return (unint64_t)(a3 * 1000000000.0 / self->_timeScale);
}

- (double)speedFactorToAdjustRecordingEnvironment:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[RCPEventEnvironment timeScale](self, "timeScale");
  v6 = v5;
  objc_msgSend(v4, "timeScale");
  v8 = v7;

  return v6 / v8;
}

- (double)timeScale
{
  return self->_timeScale;
}

- (BOOL)isSimulator
{
  return self->_isSimulator;
}

- (double)timeIntervalForMachAbsoluteTime:(unint64_t)a3
{
  return self->_timeScale * (double)a3 / 1000000000.0;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  CFDictionaryRef DictionaryRepresentation;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t homeButtonHardware;
  id v13;
  CGSize v14;

  v13 = a3;
  objc_msgSend(v13, "encodeInt64:forKey:", self->_machTimeDenominator, CFSTR("denom"));
  objc_msgSend(v13, "encodeInt64:forKey:", self->_machTimeNumerator, CFSTR("num"));
  objc_msgSend(v13, "encodeBool:forKey:", -[RCPEventEnvironment isSimulator](self, "isSimulator"), CFSTR("isSim"));
  objc_msgSend(v13, "encodeInt:forKey:", self->_touchScanRate, CFSTR("touchScanRate"));
  objc_msgSend(v13, "encodeInt:forKey:", self->_touchScanRate, CFSTR("pointerScanRate"));
  -[RCPEventEnvironment screens](self, "screens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pointSize");
  DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v14);

  objc_msgSend(v13, "encodeObject:forKey:", DictionaryRepresentation, CFSTR("screenSize"));
  -[RCPEventEnvironment screens](self, "screens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("screens"));

  -[RCPEventEnvironment productType](self, "productType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("productType"));

  -[RCPEventEnvironment productName](self, "productName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("productName"));

  -[RCPEventEnvironment productVersion](self, "productVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("productVersion"));

  -[RCPEventEnvironment recapVersion](self, "recapVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("recapVersion"));

  homeButtonHardware = self->_homeButtonHardware;
  if (homeButtonHardware)
    objc_msgSend(v13, "encodeInteger:forKey:", homeButtonHardware, CFSTR("homeButtonHardware"));
  -[RCPEventEnvironment startTimeAsIntervalSince1970](self, "startTimeAsIntervalSince1970");
  objc_msgSend(v13, "encodeDouble:forKey:", CFSTR("startTimeAsIntervalSince1970"));
  objc_msgSend(v13, "encodeInt64:forKey:", -[RCPEventEnvironment startTimeAsMachTimestamp](self, "startTimeAsMachTimestamp"), CFSTR("startTimeAsMachTimestamp"));

}

- (RCPEventEnvironment)initWithCoder:(id)a3
{
  id v4;
  RCPEventEnvironment *v5;
  uint64_t v6;
  NSArray *screens;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *v19;
  double width;
  double height;
  void *v22;
  CGSize v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[RCPEventEnvironment init](self, "init");
  if (v5)
  {
    v5->_machTimeDenominator = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("denom"));
    v5->_machTimeNumerator = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("num"));
    -[RCPEventEnvironment setIsSimulator:](v5, "setIsSimulator:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSim")));
    if (objc_msgSend(v4, "requiresSecureCoding"))
      objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("screens"));
    else
      objc_msgSend(v4, "decodeObjectForKey:", CFSTR("screens"));
    v6 = objc_claimAutoreleasedReturnValue();
    screens = v5->_screens;
    v5->_screens = (NSArray *)v6;

    if (!v5->_screens)
    {
      _RCPActiveScreens();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        _RCPActiveScreens();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v5->_screens;
        v5->_screens = (NSArray *)v18;

        v23.width = 0.0;
        v23.height = 0.0;
        if (CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v4, "decodeObjectForKey:", CFSTR("screenSize")), &v23))
        {
          width = v23.width;
          height = v23.height;
          -[NSArray firstObject](v5->_screens, "firstObject");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setPointSize:", width, height);

        }
      }
    }
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("productType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCPEventEnvironment setProductType:](v5, "setProductType:", v8);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("productName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCPEventEnvironment setProductName:](v5, "setProductName:", v9);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("productVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCPEventEnvironment setProductVersion:](v5, "setProductVersion:", v10);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("recapVersion"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RCPEventEnvironment setRecapVersion:](v5, "setRecapVersion:", v11);

    -[RCPEventEnvironment recapVersion](v5, "recapVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      -[RCPEventEnvironment setRecapVersion:](v5, "setRecapVersion:", CFSTR("1.0"));
    -[RCPEventEnvironment setHomeButtonHardware:](v5, "setHomeButtonHardware:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("homeButtonHardware")));
    -[RCPEventEnvironment setTouchScanRate:](v5, "setTouchScanRate:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("touchScanRate")));
    -[RCPEventEnvironment setPointerScanRate:](v5, "setPointerScanRate:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("pointerScanRate")));
    v5->_timeScale = (double)v5->_machTimeNumerator / (double)v5->_machTimeDenominator;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("startTimeAsMachTimestamp")))
    {
      -[RCPEventEnvironment setStartTimeAsMachTimestamp:](v5, "setStartTimeAsMachTimestamp:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("startTimeAsMachTimestamp")));
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("startTimeAsIntervalSince1970"));
      -[RCPEventEnvironment setStartTimeAsIntervalSince1970:](v5, "setStartTimeAsIntervalSince1970:");
    }
    else
    {
      v5->_startTimeAsIntervalSince1970 = 0.0;
      v5->_startTimeAsMachTimestamp = 0;
    }
  }

  return v5;
}

- (void)setStartDate:(id)a3 machAbsoluteTime:(unint64_t)a4
{
  double v5;

  self->_startTimeAsMachTimestamp = a4;
  objc_msgSend(a3, "timeIntervalSince1970");
  self->_startTimeAsIntervalSince1970 = v5;
}

- (BOOL)hasAbsoluteTimeCorrelation
{
  return self->_startTimeAsMachTimestamp && self->_startTimeAsIntervalSince1970 != 0.0;
}

- (double)timeIntervalSince1970ForMachAbsoluteTime:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;

  -[RCPEventEnvironment timeIntervalForMachAbsoluteTime:](self, "timeIntervalForMachAbsoluteTime:", self->_startTimeAsMachTimestamp);
  v6 = v5;
  -[RCPEventEnvironment timeIntervalForMachAbsoluteTime:](self, "timeIntervalForMachAbsoluteTime:", a3);
  return self->_startTimeAsIntervalSince1970 + v7 - v6;
}

- (unint64_t)machAbsoluteTimeForTimeIntervalSince1970:(double)a3
{
  double v5;

  -[RCPEventEnvironment timeIntervalForMachAbsoluteTime:](self, "timeIntervalForMachAbsoluteTime:", self->_startTimeAsMachTimestamp);
  return -[RCPEventEnvironment machAbsoluteTimeForTimeInterval:](self, "machAbsoluteTimeForTimeInterval:", v5 + a3 - self->_startTimeAsIntervalSince1970);
}

- (id)_buttonConfigurationDescription
{
  if (self->_homeButtonHardware == 2)
    return CFSTR("(H)");
  else
    return CFSTR("(h)");
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;

  -[RCPEventEnvironment _buttonConfigurationDescription](self, "_buttonConfigurationDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPEventEnvironment productType](self, "productType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPEventEnvironment productName](self, "productName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCPEventEnvironment productVersion](self, "productVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RCPEventEnvironment isSimulator](self, "isSimulator");
  -[RCPEventEnvironment screens](self, "screens");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v9)
    v13 = CFSTR("Simulator");
  else
    v13 = CFSTR("Device");
  -[RCPEventEnvironment timeScale](self, "timeScale");
  v15 = v14;
  -[RCPEventEnvironment recapVersion](self, "recapVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@ %p> %@ -- %@ -- %@ -- %@ -- <%@> - %0.5f -- %@%@"), v5, self, v6, v7, v8, v13, v12, v15, v3, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)timeDescriptionForEvent:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = objc_msgSend(a3, "deliveryTimestamp");
  -[RCPEventEnvironment timeIntervalForMachAbsoluteTime:](self, "timeIntervalForMachAbsoluteTime:", v4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f %llu"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[RCPEventEnvironment hasAbsoluteTimeCorrelation](self, "hasAbsoluteTimeCorrelation"))
  {
    -[RCPEventEnvironment timeIntervalSince1970ForMachAbsoluteTime:](self, "timeIntervalSince1970ForMachAbsoluteTime:", v4);
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" - %@ - %f"), v10, v8);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  return v6;
}

- (void)setTimeScale:(double)a3
{
  self->_timeScale = a3;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)productName
{
  return self->_productName;
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (NSString)recapVersion
{
  return self->_recapVersion;
}

- (int64_t)homeButtonHardware
{
  return self->_homeButtonHardware;
}

- (void)setIsSimulator:(BOOL)a3
{
  self->_isSimulator = a3;
}

- (int64_t)machTimeDenominator
{
  return self->_machTimeDenominator;
}

- (void)setMachTimeDenominator:(int64_t)a3
{
  self->_machTimeDenominator = a3;
}

- (int64_t)machTimeNumerator
{
  return self->_machTimeNumerator;
}

- (void)setMachTimeNumerator:(int64_t)a3
{
  self->_machTimeNumerator = a3;
}

- (double)startTimeAsIntervalSince1970
{
  return self->_startTimeAsIntervalSince1970;
}

- (unint64_t)startTimeAsMachTimestamp
{
  return self->_startTimeAsMachTimestamp;
}

@end
