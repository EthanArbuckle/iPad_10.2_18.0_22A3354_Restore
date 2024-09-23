@implementation BRCSyncBudgetThrottle

- (float)lastMinute
{
  return self->_values[0];
}

- (float)lastHour
{
  return (float)((float)((float)((float)(self->_values[0] + self->_values[1]) + self->_values[2]) + self->_values[3])
               * 60.0)
       / 61.0;
}

- (float)lastDay
{
  return (float)((float)((float)((float)((float)((float)((float)((float)(self->_values[0] + self->_values[1])
                                                               + self->_values[2])
                                                       + self->_values[3])
                                               + self->_values[4])
                                       + self->_values[5])
                               + self->_values[6])
                       + self->_values[7])
               * 1440.0)
       / 1411.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BRCSyncBudgetThrottle)init
{
  BRCSyncBudgetThrottle *v2;
  void *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BRCSyncBudgetThrottle;
  v2 = -[BRCSyncBudgetThrottle init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSince1970");
    v2->_t0 = v4;

  }
  return v2;
}

- (BRCSyncBudgetThrottle)initWithCoder:(id)a3
{
  id v4;
  BRCSyncBudgetThrottle *v5;
  double v6;
  _OWORD *v7;
  __int128 v8;
  void *v9;
  NSObject *v10;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BRCSyncBudgetThrottle;
  v5 = -[BRCSyncBudgetThrottle init](&v13, sel_init);
  if (v5)
  {
    v12 = 0;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("t0"));
    v5->_t0 = v6;
    v7 = (_OWORD *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("v"), &v12);
    if (v12 == 32)
    {
      v8 = v7[1];
      *(_OWORD *)v5->_values = *v7;
      *(_OWORD *)&v5->_values[4] = v8;
    }
    else
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[BRCSyncBudgetThrottle initWithCoder:].cold.1(&v12, (uint64_t)v9, v10);

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double t0;
  id v5;

  t0 = self->_t0;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("t0"), t0);
  objc_msgSend(v5, "encodeBytes:length:forKey:", self->_values, 32, CFSTR("v"));

}

- (void)clear
{
  *(_OWORD *)self->_values = 0u;
  *(_OWORD *)&self->_values[4] = 0u;
}

- (void)updateForTime:(double)a3
{
  double t0;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float *values;
  __int128 v8;
  float v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  float v16;
  float v17;
  _OWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  t0 = self->_t0;
  v4 = vcvtmd_s64_f64((a3 - t0) / 60.0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    if (!v4)
      return;
    v5 = 0;
    v6 = 0;
    values = self->_values;
    v8 = *(_OWORD *)&self->_values[4];
    v18[0] = *(_OWORD *)self->_values;
    v18[1] = v8;
    v9 = 0.0;
    do
    {
      v10 = __sums[v6];
      v11 = v10 <= v4;
      v12 = v10 - v4;
      if (v11)
      {
        values[v6] = 0.0;
      }
      else
      {
        if (v12 >= __sums[v5])
        {
          do
          {
            v13 = v5 + 1;
            v9 = v9 + *((float *)v18 + v5);
            v14 = __sums[++v5];
          }
          while (v12 >= v14);
        }
        else
        {
          v13 = v5;
        }
        *(float *)&v15 = (float)(v12 - __sums[v13 - 1]);
        v16 = *((float *)v18 + v13) * *(float *)&v15;
        LOWORD(v15) = __intervals[v13];
        v17 = v9 + (float)(v16 / (float)v15);
        values[v6] = v17;
        v9 = v9 - v17;
        v5 = v13;
      }
      ++v6;
    }
    while (v6 != 8);
    a3 = t0 + (double)v4 * 60.0;
  }
  self->_t0 = a3;
}

- (void)consume:(float)a3
{
  self->_values[0] = self->_values[0] + a3;
}

- (double)_timeToLoseAmount:(float)a3 count:(int)a4
{
  unsigned int v4;
  int v5;
  int v6;
  uint64_t v7;
  float v8;
  double v9;

  v5 = a4 - 1;
  if (a4 < 1)
  {
    v9 = 0.0;
  }
  else
  {
    v6 = 0;
    v7 = a4 + 1;
    while (1)
    {
      v8 = self->_values[v5];
      if (a3 < v8)
        break;
      v6 += (unsigned __int16)__intervals[v5];
      a3 = a3 - v8;
      --v7;
      --v5;
      if (v7 < 2)
      {
        v9 = (double)v6;
        return v9 * 60.0;
      }
    }
    LOWORD(v4) = __intervals[v5];
    v9 = (double)v6 + ceilf((float)(a3 * (float)v4) / v8);
  }
  return v9 * 60.0;
}

- (double)nextDateWithBudgetWithDefaults:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  double v11;
  double v12;
  float v13;
  float v14;
  float v15;
  double v16;
  float v17;
  float v18;
  float v19;
  double v20;

  v4 = a3;
  objc_msgSend(v4, "syncUpMinimalBudget");
  v6 = v5;
  -[BRCSyncBudgetThrottle lastDay](self, "lastDay");
  v8 = v6 + v7;
  objc_msgSend(v4, "syncUpDailyBudget");
  v10 = v8 - v9;
  v11 = 0.0;
  if (v10 <= 0.0
    || (-[BRCSyncBudgetThrottle _timeToLoseAmount:count:](self, "_timeToLoseAmount:count:", 8), v11 = v12,
                                                                                                  v12 < 3600.0))
  {
    -[BRCSyncBudgetThrottle lastHour](self, "lastHour");
    v14 = v6 + v13;
    objc_msgSend(v4, "syncUpHourlyBudget");
    if ((float)(v14 - v15) > 0.0)
    {
      -[BRCSyncBudgetThrottle _timeToLoseAmount:count:](self, "_timeToLoseAmount:count:", 4);
      if (v11 < v16)
        v11 = v16;
    }
  }
  if (v11 < 60.0)
  {
    -[BRCSyncBudgetThrottle lastMinute](self, "lastMinute");
    v18 = v6 + v17;
    objc_msgSend(v4, "syncUpMinutelyBudget");
    if (v18 > v19)
      v11 = 60.0;
  }
  v20 = v11 + self->_t0;

  return v20;
}

- (float)availableBudgetWithDefaults:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float result;
  float v17;

  v4 = a3;
  objc_msgSend(v4, "syncUpDailyBudget");
  v6 = v5;
  -[BRCSyncBudgetThrottle lastDay](self, "lastDay");
  v8 = v6 - v7;
  objc_msgSend(v4, "syncUpHourlyBudget");
  v10 = v9;
  -[BRCSyncBudgetThrottle lastHour](self, "lastHour");
  v12 = v10 - v11;
  objc_msgSend(v4, "syncUpMinutelyBudget");
  v14 = v13;

  -[BRCSyncBudgetThrottle lastMinute](self, "lastMinute");
  result = v14 - v15;
  if (v12 >= v8)
    v17 = v8;
  else
    v17 = v12;
  if (result >= v17)
    return v17;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[BRCSyncBudgetThrottle lastMinute](self, "lastMinute");
  v6 = v5;
  -[BRCSyncBudgetThrottle lastHour](self, "lastHour");
  v8 = v7;
  -[BRCSyncBudgetThrottle lastDay](self, "lastDay");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ {  m:%.1f  h:%.1f  d:%.1f  }>"), v4, *(_QWORD *)&v6, *(_QWORD *)&v8, v9);
}

- (id)debugDescriptionWithDefaults:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double t0;
  long double v12;
  uint64_t v13;
  float v14;
  float v15;
  float v16;
  double v17;
  float v18;
  float v19;
  float v20;
  double v21;
  float v22;
  float v23;
  float v24;
  double v25;
  float v26;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 64);
  -[BRCSyncBudgetThrottle nextDateWithBudgetWithDefaults:](self, "nextDateWithBudgetWithDefaults:", v4);
  v7 = v6 - self->_t0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9;
  t0 = self->_t0;

  if (v7 <= 0.0)
    objc_msgSend(v5, "appendString:", CFSTR("budget available {"));
  else
    objc_msgSend(v5, "appendFormat:", CFSTR("no budget left for %.1fs {"), *(_QWORD *)&v7);
  v12 = v10 - t0;
  v13 = ((int)fmod(v12, 3600.0) / 60);
  objc_msgSend(v5, "appendFormat:", CFSTR("  %d:%02d:%02ds ago"), (int)(v12 / 3600.0), v13, (int)fmod(v12, 60.0));
  -[BRCSyncBudgetThrottle lastMinute](self, "lastMinute");
  v15 = v14 * 100.0;
  objc_msgSend(v4, "syncUpMinutelyBudget");
  v17 = (float)(v15 / v16);
  -[BRCSyncBudgetThrottle lastMinute](self, "lastMinute");
  objc_msgSend(v5, "appendFormat:", CFSTR("  m:%.1f%% (%.1f)"), *(_QWORD *)&v17, v18);
  -[BRCSyncBudgetThrottle lastHour](self, "lastHour");
  *(float *)&v17 = v19 * 100.0;
  objc_msgSend(v4, "syncUpHourlyBudget");
  v21 = (float)(*(float *)&v17 / v20);
  -[BRCSyncBudgetThrottle lastHour](self, "lastHour");
  objc_msgSend(v5, "appendFormat:", CFSTR("  h:%.1f%% (%.1f)"), *(_QWORD *)&v21, v22);
  -[BRCSyncBudgetThrottle lastDay](self, "lastDay");
  *(float *)&v12 = v23 * 100.0;
  objc_msgSend(v4, "syncUpDailyBudget");
  v25 = (float)(*(float *)&v12 / v24);
  -[BRCSyncBudgetThrottle lastDay](self, "lastDay");
  objc_msgSend(v5, "appendFormat:", CFSTR("  d:%.1f%% (%.1f)"), *(_QWORD *)&v25, v26);
  objc_msgSend(v5, "appendString:", CFSTR("  }"));

  return v5;
}

- (void)initWithCoder:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_fault_impl(&dword_230455000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: invalid length: %ld%@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_0();
}

@end
