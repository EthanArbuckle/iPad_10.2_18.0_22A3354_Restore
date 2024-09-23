@implementation SignpostAggregationGroupDuration

- (id)_initWithGroup:(id)a3 type:(id)a4
{
  id v7;
  id v8;
  SignpostAggregationGroupDuration *v9;
  SignpostAggregationGroupDuration *v10;
  SignpostAggregationValueStats *v11;
  SignpostAggregationValueStats *stats;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SignpostAggregationGroupDuration;
  v9 = -[SignpostAggregationGroupDuration init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_groupName, a3);
    objc_storeStrong((id *)&v10->_type, a4);
    v11 = objc_alloc_init(SignpostAggregationValueStats);
    stats = v10->_stats;
    v10->_stats = v11;

  }
  return v10;
}

- (id)_initWithParser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SignpostAggregationGroupDuration _initWithGroup:type:](self, "_initWithGroup:type:", v5, v6);
  return v7;
}

- (id)_dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SignpostAggregationGroupDuration type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, kAggTypeKey);

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostAggregationGroupDuration totalDurationNs](self, "totalDurationNs");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, kAggTotalDurationNsKey);

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostAggregationGroupDuration averageDurationNs](self, "averageDurationNs");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, kAggAverageDurationNsKey);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SignpostAggregationGroupDuration telemetryEnabled](self, "telemetryEnabled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, kAggTelemetryEnabledKey);

  -[SignpostAggregationGroupDuration minDurationNs](self, "minDurationNs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SignpostAggregationGroupDuration minDurationNs](self, "minDurationNs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, kAggMinDurationNsKey);

  }
  -[SignpostAggregationGroupDuration maxDurationNs](self, "maxDurationNs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SignpostAggregationGroupDuration maxDurationNs](self, "maxDurationNs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, kAggMaxDurationNsKey);

  }
  -[SignpostAggregationGroupDuration stdDevNs](self, "stdDevNs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SignpostAggregationGroupDuration stdDevNs](self, "stdDevNs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, kAggDurationStdDevNsKey);

  }
  return v3;
}

- (id)_coreAnalyticsTotalFieldName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostAggregationGroupDuration groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroupDuration type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@__%@__TotalDuration"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_coreAnalyticsMinFieldName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostAggregationGroupDuration groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroupDuration type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@__%@__MinDuration"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_coreAnalyticsMaxFieldName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostAggregationGroupDuration groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroupDuration type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@__%@__MaxDuration"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_coreAnalyticsStdDevFieldName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SignpostAggregationGroupDuration groupName](self, "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroupDuration type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@__%@__DurationStdDev"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)unit
{
  return (NSString *)CFSTR("seconds");
}

- (id)total
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[SignpostAggregationGroupDuration totalDurationSeconds](self, "totalDurationSeconds");
  return (id)objc_msgSend(v2, "numberWithDouble:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  SignpostAggregationGroupDuration *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = [SignpostAggregationGroupDuration alloc];
  -[SignpostAggregationGroupDuration groupName](self, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroupDuration type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SignpostAggregationGroupDuration _initWithGroup:type:](v4, "_initWithGroup:type:", v5, v6);

  objc_msgSend(v7, "setTelemetryEnabled:", -[SignpostAggregationGroupDuration telemetryEnabled](self, "telemetryEnabled"));
  -[SignpostAggregationGroupDuration stats](self, "stats");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "copy");
  v10 = (void *)v7[4];
  v7[4] = v9;

  return v7;
}

- (double)totalDurationNs
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SignpostAggregationGroupDuration stats](self, "stats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "total");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)totalDurationMs
{
  double v2;

  -[SignpostAggregationGroupDuration totalDurationNs](self, "totalDurationNs");
  return v2 / 1000000.0;
}

- (double)totalDurationSeconds
{
  double v2;

  -[SignpostAggregationGroupDuration totalDurationNs](self, "totalDurationNs");
  return v2 / 1000000000.0;
}

- (double)averageDurationNs
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[SignpostAggregationGroupDuration stats](self, "stats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "average");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (double)averageDurationMs
{
  double v2;

  -[SignpostAggregationGroupDuration averageDurationNs](self, "averageDurationNs");
  return v2 / 1000000.0;
}

- (double)averageDurationSeconds
{
  double v2;

  -[SignpostAggregationGroupDuration averageDurationNs](self, "averageDurationNs");
  return v2 / 1000000000.0;
}

- (NSNumber)minDurationNs
{
  void *v2;
  void *v3;

  -[SignpostAggregationGroupDuration stats](self, "stats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "min");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)minDurationMs
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  -[SignpostAggregationGroupDuration minDurationNs](self, "minDurationNs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[SignpostAggregationGroupDuration minDurationNs](self, "minDurationNs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v4, "numberWithDouble:", v6 / 1000000.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSNumber *)v7;
}

- (NSNumber)minDurationSeconds
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  -[SignpostAggregationGroupDuration minDurationNs](self, "minDurationNs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[SignpostAggregationGroupDuration minDurationNs](self, "minDurationNs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v4, "numberWithDouble:", v6 / 1000000000.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSNumber *)v7;
}

- (NSNumber)maxDurationNs
{
  void *v2;
  void *v3;

  -[SignpostAggregationGroupDuration stats](self, "stats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "max");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)maxDurationMs
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  -[SignpostAggregationGroupDuration maxDurationNs](self, "maxDurationNs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[SignpostAggregationGroupDuration maxDurationNs](self, "maxDurationNs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v4, "numberWithDouble:", v6 / 1000000.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSNumber *)v7;
}

- (NSNumber)maxDurationSeconds
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  -[SignpostAggregationGroupDuration maxDurationNs](self, "maxDurationNs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[SignpostAggregationGroupDuration maxDurationNs](self, "maxDurationNs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v4, "numberWithDouble:", v6 / 1000000000.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSNumber *)v7;
}

- (NSNumber)stdDevNs
{
  void *v2;
  void *v3;

  -[SignpostAggregationGroupDuration stats](self, "stats");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stddev");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)stdDevMs
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;

  -[SignpostAggregationGroupDuration stdDevNs](self, "stdDevNs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v4, "numberWithDouble:", v5 / 1000000.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

- (NSNumber)stdDevSeconds
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;

  -[SignpostAggregationGroupDuration stdDevNs](self, "stdDevNs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v4, "numberWithDouble:", v5 / 1000000000.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (NSNumber *)v6;
}

+ (id)_sumOfDuration0:(id)a3 duration1:(id)a4 errorOut:(id *)a5
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  BOOL v10;
  _BOOL4 v11;
  char v12;
  id *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  int v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;

  v7 = (unint64_t)a3;
  v8 = (unint64_t)a4;
  v9 = (void *)v8;
  if (a5)
  {
    *a5 = 0;
    v10 = v7 == 0;
    v11 = v8 == 0;
    if (!(v7 | v8))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("Cannot add nil durations"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    v10 = v7 == 0;
    v11 = v8 == 0;
  }
  if (v7 && v11)
  {
    v8 = v7;
LABEL_11:
    v13 = (id *)objc_msgSend((id)v8, "copy");
    goto LABEL_27;
  }
  v12 = !v10;
  if (!v8)
    v12 = 1;
  if ((v12 & 1) == 0)
    goto LABEL_11;
LABEL_12:
  objc_msgSend((id)v7, "groupName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToString:", v15);

  if ((v16 & 1) != 0)
  {
    objc_msgSend((id)v7, "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "isEqualToString:", v18);

    if ((v19 & 1) != 0)
    {
      v20 = objc_msgSend((id)v7, "telemetryEnabled");
      v21 = objc_msgSend(v9, "telemetryEnabled");
      if (a5 && v20 != v21)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, CFSTR("Cannot add durations with different telemetry settings"));
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend((id)v7, "stats");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stats");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      +[SignpostAggregationValueStats sumOfStats0:stats1:errorOut:](SignpostAggregationValueStats, "sumOfStats0:stats1:errorOut:", v22, v23, &v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v32;

      if (v24)
      {
        v13 = (id *)objc_msgSend((id)v7, "copy");
        objc_storeStrong(v13 + 4, v24);
      }
      else
      {
        v13 = 0;
        if (a5)
          *a5 = objc_retainAutorelease(v25);
      }

      goto LABEL_27;
    }
    v29 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)v7, "type");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "type");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", CFSTR("Tried to add durations with different type: %@ vs. %@"), v27, v28);
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)v7, "groupName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "groupName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("Tried to add durations with different group names: %@ vs. %@"), v27, v28);
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCode:description:", 9, v30);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  v13 = 0;
LABEL_27:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  SignpostAggregationGroupDuration *v5;
  SignpostAggregationGroupDuration *v6;
  SignpostAggregationGroupDuration *v7;
  _BOOL4 v8;
  BOOL v9;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v5 = (SignpostAggregationGroupDuration *)a3;
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  if (v5 == self)
  {
    v9 = 1;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_9;
  }
  v7 = v6;
  v8 = -[SignpostAggregationGroupDuration telemetryEnabled](self, "telemetryEnabled");
  if (v8 != -[SignpostAggregationGroupDuration telemetryEnabled](v7, "telemetryEnabled"))
    goto LABEL_5;
  -[SignpostAggregationGroupDuration type](self, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroupDuration type](v7, "type");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

    goto LABEL_25;
  }
  v13 = (void *)v12;
  -[SignpostAggregationGroupDuration type](self, "type");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[SignpostAggregationGroupDuration type](v7, "type");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
      goto LABEL_28;
  }
  -[SignpostAggregationGroupDuration type](self, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15
    || (-[SignpostAggregationGroupDuration type](v7, "type"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[SignpostAggregationGroupDuration type](self, "type");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostAggregationGroupDuration type](v7, "type");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v16, "isEqual:", v17) ^ 1;

    if (v15)
    {

      goto LABEL_22;
    }
    v18 = 0;
  }
  else
  {
    v3 = 1;
  }

LABEL_22:
  if (v14)
  {

  }
  if ((v3 & 1) != 0)
    goto LABEL_5;
LABEL_25:
  -[SignpostAggregationGroupDuration groupName](self, "groupName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationGroupDuration groupName](v7, "groupName");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v19)
  {

    goto LABEL_40;
  }
  v13 = (void *)v19;
  -[SignpostAggregationGroupDuration groupName](self, "groupName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14
    || (-[SignpostAggregationGroupDuration groupName](v7, "groupName"),
        (v34 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[SignpostAggregationGroupDuration groupName](self, "groupName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20
      || (-[SignpostAggregationGroupDuration groupName](v7, "groupName"),
          (v24 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[SignpostAggregationGroupDuration groupName](self, "groupName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SignpostAggregationGroupDuration groupName](v7, "groupName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v21, "isEqual:", v22) ^ 1;

      if (v20)
      {

        v23 = v34;
        if (!v14)
        {
LABEL_39:

          if ((v3 & 1) != 0)
            goto LABEL_5;
LABEL_40:
          -[SignpostAggregationGroupDuration stats](self, "stats");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[SignpostAggregationGroupDuration stats](v7, "stats");
          v26 = objc_claimAutoreleasedReturnValue();
          if (v25 == (void *)v26)
          {

            goto LABEL_55;
          }
          v27 = (void *)v26;
          -[SignpostAggregationGroupDuration stats](self, "stats");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            -[SignpostAggregationGroupDuration stats](v7, "stats");
            v3 = objc_claimAutoreleasedReturnValue();
            if (!v3)
            {
              LOBYTE(v29) = 1;
              goto LABEL_54;
            }
          }
          -[SignpostAggregationGroupDuration stats](self, "stats");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30
            || (-[SignpostAggregationGroupDuration stats](v7, "stats"),
                (v33 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
          {
            -[SignpostAggregationGroupDuration stats](self, "stats");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[SignpostAggregationGroupDuration stats](v7, "stats");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v31, "isEqual:", v32) ^ 1;

            if (v30)
            {

              if (v28)
                goto LABEL_54;
              goto LABEL_48;
            }
            v33 = 0;
          }
          else
          {
            v29 = 1;
          }

          if (v28)
          {
LABEL_54:

            if ((v29 & 1) != 0)
              goto LABEL_5;
            goto LABEL_55;
          }
LABEL_48:

          if (v29)
            goto LABEL_5;
LABEL_55:
          v9 = 1;
          goto LABEL_6;
        }
LABEL_38:

        goto LABEL_39;
      }
      v24 = 0;
    }
    else
    {
      v3 = 1;
    }
    v23 = v34;

    if (!v14)
      goto LABEL_39;
    goto LABEL_38;
  }
LABEL_28:

LABEL_5:
  v9 = 0;
LABEL_6:

LABEL_9:
  return v9;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (BOOL)telemetryEnabled
{
  return self->_telemetryEnabled;
}

- (void)setTelemetryEnabled:(BOOL)a3
{
  self->_telemetryEnabled = a3;
}

- (SignpostAggregationValueStats)stats
{
  return self->_stats;
}

- (BOOL)_isTotalDuration
{
  return self->__isTotalDuration;
}

- (NSNumber)_durationValue
{
  return self->__durationValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__durationValue, 0);
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
