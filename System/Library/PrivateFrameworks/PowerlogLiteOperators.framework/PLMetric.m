@implementation PLMetric

- (void)updateMetricWithTimestamp:(id)a3 forEvent:(signed __int16)a4 withValue:(int)a5
{
  int v6;
  id v9;
  int v10;
  NSDate **p_lastOnTimestamp;
  NSDate *lastOnTimestamp;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  double v20;
  NSDate *v21;
  uint64_t block;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = -[PLMetric metricType](self, "metricType");
  switch(v10)
  {
    case 2:
      if (v6 == 2)
        goto LABEL_26;
      goto LABEL_15;
    case 1:
      if (!v6)
        goto LABEL_29;
      if (v6 == 2)
      {
        if (self->_lastOnTimestamp)
          goto LABEL_30;
        goto LABEL_26;
      }
      if (v6 != 1)
        goto LABEL_30;
      objc_storeStrong((id *)&self->_lastOnTimestamp, a3);
LABEL_15:
      self->_metricValue = a5;
      goto LABEL_30;
    case 0:
      if (v6)
      {
        if (v6 != 2)
        {
          if (v6 == 1)
          {
            lastOnTimestamp = self->_lastOnTimestamp;
            p_lastOnTimestamp = &self->_lastOnTimestamp;
            if (!lastOnTimestamp)
              objc_storeStrong((id *)p_lastOnTimestamp, a3);
          }
          goto LABEL_30;
        }
        if (self->_lastOnTimestamp)
          objc_storeStrong((id *)&self->_lastOnTimestamp, a3);
LABEL_26:
        self->_metricValue = self->_defaultValue;
        goto LABEL_30;
      }
      if (!self->_lastOnTimestamp)
        goto LABEL_30;
      objc_msgSend(v9, "timeIntervalSinceDate:");
      self->_metricValue = (int)(v20 + (double)self->_metricValue);
LABEL_29:
      v21 = self->_lastOnTimestamp;
      self->_lastOnTimestamp = 0;

      goto LABEL_30;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v13 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __57__PLMetric_updateMetricWithTimestamp_forEvent_withValue___block_invoke;
    v25 = &__block_descriptor_40_e5_v8__0lu32l8;
    v26 = v13;
    if (qword_1ED8836D0 != -1)
      dispatch_once(&qword_1ED8836D0, &block);
    if (_MergedGlobals_1_39)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: Unrecognized metric type %d!"), self->_metricType, block, v23, v24, v25, v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetric updateMetricWithTimestamp:forEvent:withValue:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 205);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v14;
        _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
LABEL_30:

}

- (signed)metricType
{
  return self->_metricType;
}

- (int)metricValue
{
  return self->_metricValue;
}

- (NSString)metricKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)getBinnedMetricValue
{
  double v3;
  unint64_t v4;
  int metricValue;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v10;
  uint64_t v11;

  v3 = ldexp(1.0, self->_numBits);
  if (!self->_metricType)
    return +[PLMetric binDurationValue:](PLMetric, "binDurationValue:", self->_metricValue, v3);
  v4 = (unint64_t)(v3 + -1.0);
  if (-[NSString isEqualToString:](self->_metricKey, "isEqualToString:", CFSTR("ChargerCurrent")))
  {
    metricValue = self->_metricValue;
    if (metricValue)
    {
      if (metricValue <= 2999)
      {
        v6 = 1374389535 * metricValue;
        v7 = (unint64_t)v6 >> 63;
        v8 = v6 >> 37;
        return (int)v8 + (int)v7 + 1;
      }
      return v4;
    }
    return 0;
  }
  if (-[NSString isEqualToString:](self->_metricKey, "isEqualToString:", CFSTR("ChargerVoltage")))
  {
    v10 = self->_metricValue;
    if (v10)
    {
      if (v10 <= 19999)
      {
        v11 = 274877907 * v10;
        v7 = (unint64_t)v11 >> 63;
        v8 = v11 >> 38;
        return (int)v8 + (int)v7 + 1;
      }
      return v4;
    }
    return 0;
  }
  if (-[NSString isEqualToString:](self->_metricKey, "isEqualToString:", CFSTR("BatteryTemperature")))
    return +[PLMetric binBatteryTemperature:](PLMetric, "binBatteryTemperature:", self->_metricValue);
  if (self->_metricValue >= v4)
    return v4;
  return self->_metricValue;
}

- (void)constructMetricValueForInterval:(id)a3
{
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_metricType && self->_lastOnTimestamp)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:");
    if ((int)v6 < 0)
    {
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v7 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __44__PLMetric_constructMetricValueForInterval___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v7;
        if (qword_1ED8836D8 != -1)
          dispatch_once(&qword_1ED8836D8, block);
        if (byte_1ED8836C1)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: Event starting at %@ does not belong to interval %@"), self->_lastOnTimestamp, v5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "lastPathComponent");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMetric constructMetricValueForInterval:]");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 216);

          PLLogCommon();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v16 = v8;
            _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
    }
    else
    {
      self->_metricValue += (int)v6;
    }
  }

}

- (unint64_t)bitPosition
{
  return self->_bitPosition;
}

+ (unint64_t)binDurationValue:(int)a3
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = 1;
  v4 = 2;
  v5 = 3;
  v6 = 4;
  v7 = 5;
  v8 = 6;
  if (a3 >= 0x384)
    v8 = 7;
  if (a3 >= 0x258)
    v7 = v8;
  if (a3 >= 0x12C)
    v6 = v7;
  if (a3 >= 0x78)
    v5 = v6;
  if (a3 >= 0x3C)
    v4 = v5;
  if (a3 >= 10)
    v3 = v4;
  if (a3)
    return v3;
  else
    return 0;
}

+ (unint64_t)binBatteryTemperature:(int)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 == 1000)
    return 15;
  if (a3 < -10)
    return 0;
  if (a3 < 0)
    return 1;
  if (a3 < 0xA)
    return 2;
  if (a3 < 0xF)
    return 3;
  if (a3 < 0x14)
    return 4;
  if (a3 < 0x19)
    return 5;
  if (a3 < 0x1E)
    return 6;
  if (a3 < 0x23)
    return 7;
  if (a3 < 0x28)
    return 8;
  if (a3 < 0x2D)
    return 9;
  if (a3 < 0x32)
    return 10;
  if (a3 < 0x3C)
    return 11;
  if (a3 >= 0x46)
  {
    v4 = *(_QWORD *)&a3;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v13 = 3221225472;
      v14 = __34__PLMetric_binBatteryTemperature___block_invoke;
      v15 = &__block_descriptor_40_e5_v8__0lu32l8;
      v16 = v5;
      if (qword_1ED8836E0 != -1)
        dispatch_once(&qword_1ED8836E0, &block);
      if (byte_1ED8836C2)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid temperature value : %d"), v4, block, v13, v14, v15, v16);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateUsageService.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLMetric binBatteryTemperature:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 267);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v6;
          _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    return 15;
  }
  return 12;
}

- (PLMetric)initWithKey:(id)a3 withPosition:(unint64_t)a4 withNumBits:(int)a5 withDefault:(int)a6 andType:(signed __int16)a7
{
  id v13;
  PLMetric *v14;
  PLMetric *v15;
  NSDate *lastOnTimestamp;
  objc_super v18;

  v13 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLMetric;
  v14 = -[PLMetric init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_metricKey, a3);
    v15->_metricType = a7;
    lastOnTimestamp = v15->_lastOnTimestamp;
    v15->_lastOnTimestamp = 0;

    v15->_bitPosition = a4;
    v15->_metricValue = a6;
    v15->_numBits = a5;
    v15->_defaultValue = a6;
  }

  return v15;
}

- (void)resetMetric
{
  NSDate *lastOnTimestamp;

  lastOnTimestamp = self->_lastOnTimestamp;
  self->_lastOnTimestamp = 0;

  self->_metricValue = self->_defaultValue;
}

uint64_t __57__PLMetric_updateMetricWithTimestamp_forEvent_withValue___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_39 = result;
  return result;
}

uint64_t __44__PLMetric_constructMetricValueForInterval___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836C1 = result;
  return result;
}

uint64_t __34__PLMetric_binBatteryTemperature___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8836C2 = result;
  return result;
}

- (void)setMetricKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setMetricType:(signed __int16)a3
{
  self->_metricType = a3;
}

- (NSDate)lastOnTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastOnTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setMetricValue:(int)a3
{
  self->_metricValue = a3;
}

- (void)setBitPosition:(unint64_t)a3
{
  self->_bitPosition = a3;
}

- (int)numBits
{
  return self->_numBits;
}

- (void)setNumBits:(int)a3
{
  self->_numBits = a3;
}

- (int)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(int)a3
{
  self->_defaultValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastOnTimestamp, 0);
  objc_storeStrong((id *)&self->_metricKey, 0);
}

@end
