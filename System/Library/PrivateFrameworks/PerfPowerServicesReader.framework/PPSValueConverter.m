@implementation PPSValueConverter

- (PPSValueConverter)initWithFilepath:(id)a3 andMetrics:(id)a4
{
  id v6;
  id v7;
  PPSValueConverter *v8;
  uint64_t v9;
  NSURL *filepath;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPSValueConverter;
  v8 = -[PPSValueConverter init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    filepath = v8->_filepath;
    v8->_filepath = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_metrics, a4);
  }

  return v8;
}

- (id)convertEventIfNecessary:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (!-[PPSValueConverter _isInitialized](self, "_isInitialized"))
    -[PPSValueConverter _performGeneration](self, "_performGeneration");
  if (-[PPSValueConverter _shouldConvertEvent:](self, "_shouldConvertEvent:", v4))
  {
    -[PPSValueConverter _convertEvent:](self, "_convertEvent:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)convertValueIfNeccesary:(id)a3 atTimestamp:(double)a4 usingMetric:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a5;
  if (!-[PPSValueConverter _isInitialized](self, "_isInitialized"))
    -[PPSValueConverter _performGeneration](self, "_performGeneration");
  if (-[PPSValueConverter _shouldConvertAtTimestamp:](self, "_shouldConvertAtTimestamp:", a4))
  {
    -[PPSValueConverter _convertValue:atTimestamp:usingMetric:](self, "_convertValue:atTimestamp:usingMetric:", v8, v9, a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;

  return v11;
}

- (id)_subsystem
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_metrics, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_category
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_metrics, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_isInitialized
{
  return self->_timeline != 0;
}

- (id)_latestHistory
{
  NSMutableDictionary *timeline;
  void *v3;
  void *v4;

  timeline = self->_timeline;
  -[NSArray lastObject](self->_sortedTimelineIntervals, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](timeline, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_latestInterval
{
  return -[NSArray lastObject](self->_sortedTimelineIntervals, "lastObject");
}

- (id)_latestMetricForMetricName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PPSValueConverter _latestHistory](self, "_latestHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_sourceMetricForMetricName:(id)a3
{
  -[NSDictionary objectForKeyedSubscript:](self->_selectedHistory, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_allowConversionFromMetric:(id)a3 toMetric:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "version");
  v8 = v7;
  objc_msgSend(v6, "version");
  if (v8 != v9)
  {
    objc_msgSend(v5, "unit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqual:", v11))
    {

    }
    else
    {
      objc_msgSend(v5, "unit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "unit");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unit");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unit");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v13, "isEqual:", v15);

      if (!v16)
      {
        v17 = 1;
        goto LABEL_6;
      }
    }
  }
  v17 = 0;
LABEL_6:

  return v17;
}

- (id)_convertEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "metricKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        objc_msgSend(v4, "metrics");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "monotonicTimestamp");
          -[PPSValueConverter _convertValue:atTimestamp:usingMetric:](self, "_convertValue:atTimestamp:usingMetric:", v12, v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "metrics");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v10);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_convertValue:(id)a3 atTimestamp:(double)a4 usingMetric:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v18;

  v7 = a3;
  v8 = a5;
  -[PPSValueConverter _latestMetricForMetricName:](self, "_latestMetricForMetricName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSValueConverter _sourceMetricForMetricName:](self, "_sourceMetricForMetricName:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PPSValueConverter _allowConversionFromMetric:toMetric:](self, "_allowConversionFromMetric:toMetric:", v10, v9))
  {
    objc_msgSend(v10, "unit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    PPSConvertValueWithPPSUnit(v7, v11, v12, &v18);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v18;

    if (v13)
    {
      v15 = v13;
    }
    else if (v14)
    {
      PPSReaderLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[PPSValueConverter _convertValue:atTimestamp:usingMetric:].cold.1((uint64_t)v8, (uint64_t)v14, v16);

    }
  }
  else
  {
    v13 = v7;
  }

  return v13;
}

- (void)_performGeneration
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_0_3(&dword_2439D9000, "Generating metric timeline for '%@::%@'", v5, v6);

}

- (BOOL)_shouldConvertAtTimestamp:(double)a3
{
  NSObject *v5;
  void *v6;
  NSArray *v7;
  NSArray *sortedTimelineIntervals;
  void *v9;
  void *v10;
  double v11;
  BOOL v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  int v21;
  BOOL v22;
  NSObject *v23;
  NSDictionary *v24;
  NSDictionary *selectedHistory;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  double v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (!self->_sortedTimelineIntervals)
  {
    PPSReaderLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[PPSValueConverter _shouldConvertAtTimestamp:].cold.1(v5);

    -[NSMutableDictionary allKeys](self->_timeline, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sortedTimelineIntervals = self->_sortedTimelineIntervals;
    self->_sortedTimelineIntervals = v7;

  }
  if ((unint64_t)-[NSMutableDictionary count](self->_timeline, "count") < 2)
    return 0;
  -[NSArray lastObject](self->_sortedTimelineIntervals, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  v12 = v11 > a3;

  if (!v12)
    return 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = self->_sortedTimelineIntervals;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[PPSValueConverter _latestInterval](self, "_latestInterval", (_QWORD)v32);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v17 == v18;

        if (!v19)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", a3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v17, "containsDate:", v20);

          if (v21)
          {
            PPSReaderLog();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v17, "startDate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "timeIntervalSince1970");
              v29 = v28;
              objc_msgSend(v17, "endDate");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "timeIntervalSince1970");
              *(_DWORD *)buf = 134218496;
              v37 = v29;
              v38 = 2048;
              v39 = v31;
              v40 = 2048;
              v41 = a3;
              _os_log_debug_impl(&dword_2439D9000, v23, OS_LOG_TYPE_DEBUG, "Selecting build interval [%f, %f] for timestamp '%f' as active conversion region!", buf, 0x20u);

            }
            -[NSMutableDictionary objectForKeyedSubscript:](self->_timeline, "objectForKeyedSubscript:", v17);
            v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
            selectedHistory = self->_selectedHistory;
            self->_selectedHistory = v24;

            v22 = 1;
            goto LABEL_21;
          }
        }
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      if (v14)
        continue;
      break;
    }
  }
  v22 = 0;
LABEL_21:

  return v22;
}

- (BOOL)_shouldConvertEvent:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "monotonicTimestamp");
  LOBYTE(self) = -[PPSValueConverter _shouldConvertAtTimestamp:](self, "_shouldConvertAtTimestamp:");

  return (char)self;
}

- (NSArray)metrics
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)timeline
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimeline:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_selectedHistory, 0);
  objc_storeStrong((id *)&self->_sortedTimelineIntervals, 0);
  objc_storeStrong((id *)&self->_filepath, 0);
}

- (void)_convertValue:(uint64_t)a1 atTimestamp:(uint64_t)a2 usingMetric:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2439D9000, log, OS_LOG_TYPE_ERROR, "Error while performing value conversion for metric name '%@' = %@", (uint8_t *)&v3, 0x16u);
}

- (void)_shouldConvertAtTimestamp:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2439D9000, log, OS_LOG_TYPE_DEBUG, "Caching sorted timeline interval keys...", v1, 2u);
}

@end
