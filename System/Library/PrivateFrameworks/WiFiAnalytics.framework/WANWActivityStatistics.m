@implementation WANWActivityStatistics

- (WANWActivityStatistics)initWithPBCodableData:(id)a3
{
  id v4;
  WANWActivityStatistics *v5;
  WANWActivityStatistics *v6;
  WiFiAnalyticsAWDWiFiNWActivity *v7;
  PBCodable *awdReport;
  NSObject *v9;
  uint64_t v10;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WANWActivityStatistics;
  v5 = -[WANWActivityStatistics init](&v12, sel_init);
  v6 = v5;
  if (v4 && v5 && objc_msgSend(v4, "length"))
  {
    v7 = -[WiFiAnalyticsAWDWiFiNWActivity initWithData:]([WiFiAnalyticsAWDWiFiNWActivity alloc], "initWithData:", v4);
    awdReport = v6->_awdReport;
    v6->_awdReport = &v7->super;

    v6->_fromInitWithPBCodableData = 1;
  }
  else
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(v4, "length");
      *(_DWORD *)buf = 136446978;
      v14 = "-[WANWActivityStatistics initWithPBCodableData:]";
      v15 = 1024;
      v16 = 63;
      v17 = 1024;
      v18 = v6 != 0;
      v19 = 2048;
      v20 = v10;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:initWithPBCodableData Failed self %d length %lu", buf, 0x22u);
    }

  }
  return v6;
}

- (WANWActivityStatistics)initWithWAActivityReport:(const void *)a3 length:(unint64_t)a4
{
  WANWActivityStatistics *v6;
  WANWActivityStatistics *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  PBCodable *awdReport;
  BOOL v13;
  NSObject *v14;
  WANWActivityStatistics *v15;
  NSObject *v17;
  id v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)WANWActivityStatistics;
  v6 = -[WANWActivityStatistics init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_fromInitWithPBCodableData = 0;
    v8 = (void *)MEMORY[0x212BEF45C]();
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      WALogCategoryDefaultHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v22 = "-[WANWActivityStatistics initWithWAActivityReport:length:]";
        v23 = 1024;
        v24 = 97;
        _os_log_impl(&dword_212581000, v11, OS_LOG_TYPE_ERROR, "%{public}s::%d:resultData failed", buf, 0x12u);
      }
      goto LABEL_18;
    }
    v19 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, &v19);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v19;
    awdReport = v7->_awdReport;
    v7->_awdReport = (PBCodable *)v10;

    if (v7->_awdReport)
      v13 = v11 == 0;
    else
      v13 = 0;
    if (!v13)
    {
      WALogCategoryDefaultHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v22 = "-[WANWActivityStatistics initWithWAActivityReport:length:]";
        v23 = 1024;
        v24 = 100;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_212581000, v17, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to unarchive WAMessageAWD: %@", buf, 0x1Cu);
      }

LABEL_18:
      objc_autoreleasePoolPop(v8);
      v15 = 0;
      goto LABEL_12;
    }

    objc_autoreleasePoolPop(v8);
    WALogCategoryDefaultHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v22 = "-[WANWActivityStatistics initWithWAActivityReport:length:]";
      v23 = 1024;
      v24 = 102;
      _os_log_impl(&dword_212581000, v14, OS_LOG_TYPE_INFO, "%{public}s::%d:Success", buf, 0x12u);
    }

  }
  v15 = v7;
LABEL_12:

  return v15;
}

- (unsigned)awdMetricID
{
  if (self->_awdMetricID)
    return self->_awdMetricID;
  else
    return 589927;
}

- (PBCodable)awdReport
{
  _BOOL4 fromInitWithPBCodableData;
  PBCodable *awdReport;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  PBCodable *v14;
  void *v15;
  NSObject *v16;
  PBCodable *v17;
  PBCodable *v18;
  NSObject *v19;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  PBCodable *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  fromInitWithPBCodableData = self->_fromInitWithPBCodableData;
  awdReport = self->_awdReport;
  if (fromInitWithPBCodableData)
    return awdReport;
  if (!awdReport)
  {
    WALogCategoryDefaultHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "-[WANWActivityStatistics awdReport]";
      v27 = 1024;
      v28 = 124;
      _os_log_impl(&dword_212581000, v6, OS_LOG_TYPE_ERROR, "%{public}s::%d:_awdReport missing Debug", buf, 0x12u);
    }

    awdReport = self->_awdReport;
    if (!awdReport)
    {
      WALogCategoryDefaultHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v26 = "-[WANWActivityStatistics awdReport]";
        v27 = 1024;
        v28 = 128;
        v20 = "%{public}s::%d:_awdReport missing";
LABEL_24:
        _os_log_impl(&dword_212581000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x12u);
      }
LABEL_25:

      return (PBCodable *)0;
    }
  }
  -[PBCodable activities](awdReport, "activities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    WALogCategoryDefaultHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v26 = "-[WANWActivityStatistics awdReport]";
      v27 = 1024;
      v28 = 132;
      v20 = "%{public}s::%d:_awdReport has activities already";
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[WANWActivityStatistics externallyVisibleActivityUUIDs](self, "externallyVisibleActivityUUIDs", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = self->_awdReport;
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PBCodable addActivities:](v14, "addActivities:", v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v11);
  }

  -[WANWActivityStatistics setAwdMetricID:](self, "setAwdMetricID:", 589927);
  WALogCategoryDefaultHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = self->_awdReport;
    *(_DWORD *)buf = 136446722;
    v26 = "-[WANWActivityStatistics awdReport]";
    v27 = 1024;
    v28 = 143;
    v29 = 2114;
    v30 = v17;
    _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Generated wifi nw_activity report: %{public}@", buf, 0x1Cu);
  }

  v18 = self->_awdReport;
  return v18;
}

- (id)getTransformedFlattenedFrom:(id)a3 style:(int)a4
{
  return -[WANWActivityStatistics getTransformedFlattenedFrom:style:index:](self, "getTransformedFlattenedFrom:style:index:", a3, *(_QWORD *)&a4, 1);
}

- (id)getTransformedFlattenedFrom:(id)a3 style:(int)a4 index:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  _TtC13WiFiAnalytics21WANWActivityTransform *v11;
  void *v12;
  void *v13;
  _TtC13WiFiAnalytics21WANWActivityTransform *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a5;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void *)MEMORY[0x212BEF45C]();
  -[WANWActivityStatistics obj](self, "obj");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (os_signpost_enabled(MEMORY[0x24BDACB70]))
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl(&dword_212581000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattenedFrom init", ", (uint8_t *)&v20, 2u);
    }
    v11 = [_TtC13WiFiAnalytics21WANWActivityTransform alloc];
    -[WANWActivityStatistics awdReport](self, "awdReport");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WANWActivityTransform initWithLater:early:](v11, "initWithLater:early:", v13, v8);
    -[WANWActivityStatistics setObj:](self, "setObj:", v14);

    if (os_signpost_enabled(MEMORY[0x24BDACB70]))
    {
      LOWORD(v20) = 0;
      _os_signpost_emit_with_name_impl(&dword_212581000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattenedFrom init", ", (uint8_t *)&v20, 2u);
    }
  }
  if (os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    LOWORD(v20) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattenedFrom Transform", ", (uint8_t *)&v20, 2u);
  }
  -[WANWActivityStatistics obj](self, "obj");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    WALogCategoryDefaultHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = 136446466;
      v21 = "-[WANWActivityStatistics getTransformedFlattenedFrom:style:index:]";
      v22 = 1024;
      v23 = 189;
      _os_log_impl(&dword_212581000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create WANWActivityTransform", (uint8_t *)&v20, 0x12u);
    }
    v18 = 0;
    goto LABEL_19;
  }
  switch(a4)
  {
    case 2:
      -[WANWActivityStatistics obj](self, "obj");
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject getTransformedMeasurementForLogging](v16, "getTransformedMeasurementForLogging");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 1:
      -[WANWActivityStatistics obj](self, "obj");
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject getTransformedMeasurementWithIndex:](v16, "getTransformedMeasurementWithIndex:", v5);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    case 0:
      -[WANWActivityStatistics obj](self, "obj");
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject getTransformedMeasurementForTelemetryWithIndex:](v16, "getTransformedMeasurementForTelemetryWithIndex:", v5);
      v17 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v18 = (void *)v17;
LABEL_19:

      goto LABEL_20;
  }
  v18 = 0;
LABEL_20:
  if (os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    LOWORD(v20) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattenedFrom Transform", ", (uint8_t *)&v20, 2u);
  }
  objc_autoreleasePoolPop(v9);

  return v18;
}

- (id)getTransformedFlattened:(int)a3
{
  void *v5;
  void *v6;
  _TtC13WiFiAnalytics21WANWActivityTransform *v7;
  void *v8;
  void *v9;
  _TtC13WiFiAnalytics21WANWActivityTransform *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x212BEF45C](self, a2);
  if (os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattened init", ", (uint8_t *)&v17, 2u);
  }
  -[WANWActivityStatistics obj](self, "obj");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = [_TtC13WiFiAnalytics21WANWActivityTransform alloc];
    -[WANWActivityStatistics awdReport](self, "awdReport");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WANWActivityTransform initWithSingle:](v7, "initWithSingle:", v9);
    -[WANWActivityStatistics setObj:](self, "setObj:", v10);

  }
  if (os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattened init", ", (uint8_t *)&v17, 2u);
  }
  if (os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattened Transform", ", (uint8_t *)&v17, 2u);
  }
  -[WANWActivityStatistics obj](self, "obj");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    WALogCategoryDefaultHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = 136446466;
      v18 = "-[WANWActivityStatistics getTransformedFlattened:]";
      v19 = 1024;
      v20 = 228;
      _os_log_impl(&dword_212581000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to create WANWActivityTransform", (uint8_t *)&v17, 0x12u);
    }
    goto LABEL_22;
  }
  switch(a3)
  {
    case 2:
      -[WANWActivityStatistics obj](self, "obj");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject getTransformedMeasurementForLogging](v12, "getTransformedMeasurementForLogging");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 1:
      WALogCategoryDefaultHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = 136446466;
        v18 = "-[WANWActivityStatistics getTransformedFlattened:]";
        v19 = 1024;
        v20 = 218;
        _os_log_impl(&dword_212581000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Invalid style for single parameter, timeOffset invalid", (uint8_t *)&v17, 0x12u);
      }

      WALogCategoryDefaultHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v17) = 0;
        _os_log_fault_impl(&dword_212581000, v12, OS_LOG_TYPE_FAULT, "Invalid style for single parameter, timeOffset invalid", (uint8_t *)&v17, 2u);
      }
LABEL_22:
      v14 = 0;
      goto LABEL_23;
    case 0:
      -[WANWActivityStatistics obj](self, "obj");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject getTransformedMeasurementForTelemetryWithIndex:](v12, "getTransformedMeasurementForTelemetryWithIndex:", 0);
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v14 = (void *)v13;
LABEL_23:

      goto LABEL_24;
  }
  v14 = 0;
LABEL_24:
  if (os_signpost_enabled(MEMORY[0x24BDACB70]))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_212581000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "getTransformedFlattened Transform", ", (uint8_t *)&v17, 2u);
  }
  objc_autoreleasePoolPop(v5);
  return v14;
}

- (id)expandKeyNameLengths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x212BEF45C]();
  -[WANWActivityStatistics obj](self, "obj");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (os_signpost_enabled(MEMORY[0x24BDACB70]))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_212581000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "expandKeyNameLengths", ", (uint8_t *)&v11, 2u);
    }
    -[WANWActivityStatistics obj](self, "obj");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expandKeyNameLengthsFrom:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_signpost_enabled(MEMORY[0x24BDACB70]))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_212581000, MEMORY[0x24BDACB70], OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "expandKeyNameLengths", ", (uint8_t *)&v11, 2u);
    }
  }
  else
  {
    WALogCategoryDefaultHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 136446466;
      v12 = "-[WANWActivityStatistics expandKeyNameLengths:]";
      v13 = 1024;
      v14 = 247;
      _os_log_impl(&dword_212581000, v9, OS_LOG_TYPE_ERROR, "%{public}s::%d:No WATransformForTelemetry alloctated", (uint8_t *)&v11, 0x12u);
    }

    v8 = 0;
  }
  objc_autoreleasePoolPop(v5);

  return v8;
}

- (void)setAwdReport:(id)a3
{
  objc_storeStrong((id *)&self->_awdReport, a3);
}

- (void)setAwdMetricID:(unsigned int)a3
{
  self->_awdMetricID = a3;
}

- (NSArray)activityUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActivityUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)externallyVisibleActivityUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExternallyVisibleActivityUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (_TtC13WiFiAnalytics21WANWActivityTransform)obj
{
  return self->_obj;
}

- (void)setObj:(id)a3
{
  objc_storeStrong((id *)&self->_obj, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obj, 0);
  objc_storeStrong((id *)&self->_externallyVisibleActivityUUIDs, 0);
  objc_storeStrong((id *)&self->_activityUUIDs, 0);
  objc_storeStrong((id *)&self->_awdReport, 0);
}

@end
