@implementation CLMetricEventBins

+ (int)getLocalSecondsIntoDay:(double)a3 andLog:(BOOL)a4
{
  _BOOL4 v4;
  NSDateComponents *v6;
  NSInteger v7;
  char *v8;
  char *v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  int v24;

  v4 = a4;
  v6 = -[NSCalendar components:fromDate:](+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"), "components:fromDate:", 224, +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  v7 = -[NSDateComponents hour](v6, "hour");
  v8 = (char *)-[NSDateComponents minute](v6, "minute") + 60 * v7;
  v9 = (char *)-[NSDateComponents second](v6, "second") + 60 * (_QWORD)v8;
  if (v4)
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102184B38);
    v10 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEBUG))
    {
      v12[0] = 68290306;
      v12[1] = 0;
      v13 = 2082;
      v14 = "";
      v15 = 1026;
      v16 = (int)a3;
      v17 = 1026;
      v18 = -[NSDateComponents hour](v6, "hour");
      v19 = 1026;
      v20 = -[NSDateComponents minute](v6, "minute");
      v21 = 1026;
      v22 = -[NSDateComponents second](v6, "second");
      v23 = 1026;
      v24 = (int)v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#cabin getLocalSecondsIntoDay\", \"t\":%{public}d, \"hour\":%{public}d, \"minute\":%{public}d, \"sec\":%{public}d, \"ret\":%{public}d}", (uint8_t *)v12, 0x30u);
    }
  }
  return (int)v9;
}

- (CLMetricEventBins)initWithInternalName:(id)a3 binPeriod:(int)a4 aggregationPeriod:(int)a5 atCurrentTime:(double)a6 andSubmit:(BOOL)a7
{
  return -[CLMetricEventBins initWithIdentifier:asExternal:binPeriod:aggregationPeriod:atCurrentTime:andSubmit:](self, "initWithIdentifier:asExternal:binPeriod:aggregationPeriod:atCurrentTime:andSubmit:", a3, 0, *(_QWORD *)&a4, *(_QWORD *)&a5, a7, a6);
}

- (CLMetricEventBins)initWithAnalyticsEvent:(id)a3 binPeriod:(int)a4 atCurrentTime:(double)a5
{
  return -[CLMetricEventBins initWithIdentifier:asExternal:binPeriod:aggregationPeriod:atCurrentTime:andSubmit:](self, "initWithIdentifier:asExternal:binPeriod:aggregationPeriod:atCurrentTime:andSubmit:", a3, 1, *(_QWORD *)&a4, 3600, 1, a5);
}

- (CLMetricEventBins)initWithIdentifier:(id)a3 asExternal:(BOOL)a4 binPeriod:(int)a5 aggregationPeriod:(int)a6 atCurrentTime:(double)a7 andSubmit:(BOOL)a8
{
  int v11;
  CLMetricEventBins *v15;
  CLMetricEventBins *v16;
  NSObject *v17;
  const char *v18;
  int binPeriod;
  int aggregationPeriod;
  int periodsInDay;
  int nBins;
  _BOOL4 submitMetrics;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  objc_super v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _BOOL4 v46;

  if (a6 > 86400 || (v11 = a6 / a5, a6 % a5) || a6 < 300 || 86400 % a6)
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102184B38);
    v24 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289794;
      v30 = 0;
      v31 = 2082;
      v32 = "";
      v33 = 2082;
      v34 = (const char *)objc_msgSend(a3, "UTF8String");
      v35 = 1026;
      v36 = a5;
      v37 = 1026;
      v38 = a6;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#cabin init, invalid bin/aggregation periods, returning nil\", \"id\":%{public, location:escape_only}s, \"bin\":%{public}d, \"aggregation\":%{public}d}", buf, 0x28u);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102184B38);
    }
    v25 = qword_1022A01F8;
    if (os_signpost_enabled((os_log_t)qword_1022A01F8))
    {
      v26 = (const char *)objc_msgSend(a3, "UTF8String");
      *(_DWORD *)buf = 68289794;
      v30 = 0;
      v31 = 2082;
      v32 = "";
      v33 = 2082;
      v34 = v26;
      v35 = 1026;
      v36 = a5;
      v37 = 1026;
      v38 = a6;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#cabin init, invalid bin/aggregation periods, returning nil", "{\"msg%{public}.0s\":\"#cabin init, invalid bin/aggregation periods, returning nil\", \"id\":%{public, location:escape_only}s, \"bin\":%{public}d, \"aggregation\":%{public}d}", buf, 0x28u);
    }
    return 0;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)CLMetricEventBins;
    v15 = -[CLMetricEventBins init](&v28, "init");
    v16 = v15;
    if (v15)
    {
      v15->_isExternal = a4;
      v15->_metricId = (NSString *)a3;
      v15->_binPeriod = a5;
      v15->_aggregationPeriod = a6;
      v15->_periodsInDay = 0x15180u / a6;
      v15->_nBins = v11;
      v15->_submitMetrics = a8;
      v15->_aggregationDict = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v16->_percentMetrics = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v16->_intervalDistributions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v16->_intervalDistributionStrings = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v16->_intervalMetrics = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      if (qword_1022A01F0 != -1)
        dispatch_once(&qword_1022A01F0, &stru_102184B38);
      v17 = qword_1022A01F8;
      if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
      {
        v18 = -[NSString UTF8String](v16->_metricId, "UTF8String");
        binPeriod = v16->_binPeriod;
        aggregationPeriod = v16->_aggregationPeriod;
        periodsInDay = v16->_periodsInDay;
        nBins = v16->_nBins;
        submitMetrics = v16->_submitMetrics;
        *(_DWORD *)buf = 68290818;
        v30 = 0;
        v31 = 2082;
        v32 = "";
        v33 = 2082;
        v34 = v18;
        v35 = 1026;
        v36 = binPeriod;
        v37 = 1026;
        v38 = aggregationPeriod;
        v39 = 1026;
        v40 = (int)a7;
        v41 = 1026;
        v42 = periodsInDay;
        v43 = 1026;
        v44 = nBins;
        v45 = 1026;
        v46 = submitMetrics;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin init\", \"id\":%{public, location:escape_only}s, \"bin\":%{public}d, \"aggregate\":%{public}d, \"now\":%{public}d, \"periods\":%{public}d, \"bins\":%{public}d, \"submit\":%{public}d}", buf, 0x40u);
      }
      -[CLMetricEventBins reset:](v16, "reset:", a7);
    }
  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMetricEventBins;
  -[CLMetricEventBins dealloc](&v3, "dealloc");
}

- (void)provideMetricDimensions:(id)a3
{
  -[NSMutableDictionary removeAllObjects](self->_percentMetrics, "removeAllObjects");
  -[NSMutableDictionary addEntriesFromDictionary:](self->_percentMetrics, "addEntriesFromDictionary:", a3);
  -[NSMutableDictionary removeAllObjects](self->_intervalMetrics, "removeAllObjects");
  -[NSMutableDictionary addEntriesFromDictionary:](self->_intervalMetrics, "addEntriesFromDictionary:", a3);
}

- (void)provideIntervalDistributions:(id)a3
{
  NSArray *v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  NSMutableArray *intervalDistributionStrings;
  int binPeriod;
  NSString *v16;
  NSObject *v17;
  const char *v18;
  NSMutableArray *intervalDistributions;
  NSMutableArray *v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  NSMutableArray *v36;
  __int16 v37;
  NSMutableArray *v38;
  _BYTE v39[128];

  -[NSMutableArray removeAllObjects](self->_intervalDistributions, "removeAllObjects");
  v22 = a3;
  v5 = -[NSArray sortedArrayUsingSelector:](-[NSSet allObjects](+[NSSet setWithArray:](NSSet, "setWithArray:", a3), "allObjects"), "sortedArrayUsingSelector:", "compare:");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = -1;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        v12 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v10);
        v8 = (int)objc_msgSend(v12, "intValue") / self->_binPeriod;
        -[NSMutableArray addObject:](self->_intervalDistributions, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (v8 + 1)));
        v13 = -[NSArray firstObject](v5, "firstObject");
        intervalDistributionStrings = self->_intervalDistributionStrings;
        binPeriod = self->_binPeriod;
        if (v12 == v13)
          v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(0 - %d]"), (binPeriod * v8), v21);
        else
          v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%d - %d]"), (binPeriod * v11), (binPeriod * v8));
        -[NSMutableArray addObject:](intervalDistributionStrings, "addObject:", v16);
        if (v12 == -[NSArray lastObject](v5, "lastObject"))
          -[NSMutableArray addObject:](self->_intervalDistributionStrings, "addObject:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("> %d"), (self->_binPeriod * v8)));
        v10 = (char *)v10 + 1;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
    }
    while (v7);
  }
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102184B38);
  v17 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = -[NSString UTF8String](self->_metricId, "UTF8String");
    intervalDistributions = self->_intervalDistributions;
    v20 = self->_intervalDistributionStrings;
    *(_DWORD *)buf = 68290050;
    v28 = 0;
    v29 = 2082;
    v30 = "";
    v31 = 2082;
    v32 = v18;
    v33 = 2114;
    v34 = v22;
    v35 = 2114;
    v36 = intervalDistributions;
    v37 = 2114;
    v38 = v20;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin provide dist\", \"id\":%{public, location:escape_only}s, \"in\":%{public, location:escape_only}@, \"dist\":%{public, location:escape_only}@, \"str\":%{public, location:escape_only}@}", buf, 0x3Au);
  }
}

- (int)getBinIndexForSecondsIntoDay:(int)a3
{
  return a3 % self->_aggregationPeriod / self->_binPeriod;
}

- (int)getAggregateIndexForSecondsIntoDay:(int)a3
{
  return a3 / self->_aggregationPeriod;
}

- (BOOL)canAccumulateForSecs:(int)a3
{
  return -[CLMetricEventBins getAggregateIndexForSecondsIntoDay:](self, "getAggregateIndexForSecondsIntoDay:", *(_QWORD *)&a3) != self->_initAggIndex;
}

- (void)checkIfIndexIsNewAndSubmit:(int)a3 forNow:(double)a4
{
  uint64_t v5;
  _UNKNOWN **v7;
  int periodsInDay;
  int v9;
  NSObject *v10;
  const char *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v19;
  uint64_t aggregationDict;
  __CFString *v21;
  int v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  _BOOL4 isExternal;
  NSMutableDictionary *percentMetrics;
  NSString *dimensionStr;
  const __CFString *v30;
  NSObject *v31;
  const char *v32;
  _BOOL4 submitMetrics;
  NSMutableDictionary *v34;
  int dailyTotal;
  int dailyCount;
  int v37;
  NSMutableDictionary *v38;
  int v39;
  _BOOL4 v40;
  NSNumber *v41;
  const __CFString *v42;
  NSObject *v43;
  const char *v44;
  int v45;
  NSMutableDictionary *v46;
  uint64_t v47;
  int v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  int v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  NSMutableDictionary *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  int v69;
  __int16 v70;
  int v71;
  __int16 v72;
  NSMutableDictionary *v73;
  _BYTE v74[128];

  v5 = *(_QWORD *)&a3;
  v7 = CLPContext_ptr;
  if (!-[NSMutableDictionary objectForKey:](self->_aggregationDict, "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:"))&& self->_initAggIndex != (_DWORD)v5)
  {
    -[NSMutableDictionary setObject:forKey:](self->_aggregationDict, "setObject:forKey:", objc_alloc_init((Class)NSMutableSet), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
    +[CLMetricEventBins getLocalSecondsIntoDay:andLog:](CLMetricEventBins, "getLocalSecondsIntoDay:andLog:", 1, a4);
    periodsInDay = v5;
    if (!(_DWORD)v5)
      periodsInDay = self->_periodsInDay;
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102184B38);
    v9 = periodsInDay - 1;
    v10 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[NSString UTF8String](self->_metricId, "UTF8String");
      *(_DWORD *)buf = 68289794;
      v55 = 0;
      v56 = 2082;
      v57 = "";
      v58 = 2082;
      v59 = v11;
      v60 = 1026;
      v61 = v5;
      v62 = 1026;
      v63 = periodsInDay - 1;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin newindex\", \"id\":%{public, location:escape_only}s, \"index\":%{public}d, \"skip\":%{public}d}", buf, 0x28u);
    }
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = -[NSMutableDictionary allKeys](self->_aggregationDict, "allKeys");
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v74, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v51;
      v48 = periodsInDay - 1;
      v47 = *(_QWORD *)v51;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v51 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)v15);
          v17 = objc_msgSend(v16, "intValue");
          if ((_DWORD)v17 != v9 && (_DWORD)v17 != (_DWORD)v5)
          {
            v19 = v17;
            aggregationDict = (uint64_t)self->_aggregationDict;
            if (objc_msgSend((id)aggregationDict, "objectForKey:", objc_msgSend(v7[239], "numberWithInt:", v5)))
            {
              if (self->_isExternal)
                v21 = -[NSString stringByAppendingString:](self->_metricId, "stringByAppendingString:", CFSTR(".percentages"));
              else
                v21 = CFSTR("com.apple.locationd.metricbins");
              v22 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->_aggregationDict, "objectForKey:", v16), "count");
              LODWORD(aggregationDict) = llround((double)v22 * 100.0 / (double)self->_nBins);
              if ((int)aggregationDict >= 101)
              {
                if (qword_1022A01F0 != -1)
                  dispatch_once(&qword_1022A01F0, &stru_102184B38);
                v23 = qword_1022A01F8;
                if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_ERROR))
                {
                  v24 = (const char *)-[__CFString UTF8String](v21, "UTF8String");
                  *(_DWORD *)buf = 68289538;
                  v55 = 0;
                  v56 = 2082;
                  v57 = "";
                  v58 = 2082;
                  v59 = v24;
                  v60 = 1026;
                  v61 = aggregationDict;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#cabin error, percentage\", \"event\":%{public, location:escape_only}s, \"pct\":%{public}d}", buf, 0x22u);
                  if (qword_1022A01F0 != -1)
                    dispatch_once(&qword_1022A01F0, &stru_102184B38);
                }
                v25 = qword_1022A01F8;
                if (os_signpost_enabled((os_log_t)qword_1022A01F8))
                {
                  v26 = (const char *)-[__CFString UTF8String](v21, "UTF8String");
                  *(_DWORD *)buf = 68289538;
                  v55 = 0;
                  v56 = 2082;
                  v57 = "";
                  v58 = 2082;
                  v59 = v26;
                  v60 = 1026;
                  v61 = aggregationDict;
                  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#cabin error, percentage", "{\"msg%{public}.0s\":\"#cabin error, percentage\", \"event\":%{public, location:escape_only}s, \"pct\":%{public}d}", buf, 0x22u);
                }
                aggregationDict = 100;
              }
              *(int32x2_t *)&self->_dailyTotal = vadd_s32(*(int32x2_t *)&self->_dailyTotal, (int32x2_t)(v22 | 0x100000000));
              isExternal = self->_isExternal;
              v7 = CLPContext_ptr;
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_percentMetrics, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", aggregationDict), CFSTR("percentage"));
              percentMetrics = self->_percentMetrics;
              dimensionStr = (NSString *)v16;
              if (isExternal)
              {
                v30 = CFSTR("hour");
              }
              else
              {
                -[NSMutableDictionary setObject:forKeyedSubscript:](percentMetrics, "setObject:forKeyedSubscript:", v16, CFSTR("aggPeriod"));
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_percentMetrics, "setObject:forKeyedSubscript:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%dx%d"), self->_metricId, self->_binPeriod, self->_aggregationPeriod), CFSTR("name"));
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_percentMetrics, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_dimensionInt), CFSTR("dimensionInt"));
                dimensionStr = self->_dimensionStr;
                percentMetrics = self->_percentMetrics;
                v30 = CFSTR("dimensionStr");
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](percentMetrics, "setObject:forKeyedSubscript:", dimensionStr, v30);
              -[CLMetricEventBins submitPercentageMetricsForEvent:](self, "submitPercentageMetricsForEvent:", v21);
              if (qword_1022A01F0 != -1)
                dispatch_once(&qword_1022A01F0, &stru_102184B38);
              v31 = qword_1022A01F8;
              if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
              {
                v32 = (const char *)-[__CFString UTF8String](v21, "UTF8String");
                submitMetrics = self->_submitMetrics;
                v34 = (NSMutableDictionary *)-[NSMutableDictionary objectForKey:](self->_aggregationDict, "objectForKey:", v16);
                dailyTotal = self->_dailyTotal;
                dailyCount = self->_dailyCount;
                v37 = self->_periodsInDay;
                v38 = self->_percentMetrics;
                *(_DWORD *)buf = 68291075;
                v55 = 0;
                v56 = 2082;
                v57 = "";
                v58 = 2082;
                v59 = v32;
                v60 = 1026;
                v61 = submitMetrics;
                v7 = CLPContext_ptr;
                v62 = 1026;
                v63 = (int)v19;
                v64 = 2114;
                v65 = v34;
                v66 = 1026;
                v67 = dailyTotal;
                v68 = 1026;
                v69 = dailyCount;
                v70 = 1026;
                v71 = v37;
                v72 = 2113;
                v73 = v38;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin submit\", \"event\":%{public, location:escape_only}s, \"submit\":%{public}d, \"period\":%{public}d, \"aggbin\":%{public, location:escape_only}@, \"dailytotal\":%{public}d, \"dailycount\":%{public}d, \"periods\":%{public}d, \"ca\":%{private, location:escape_only}@}", buf, 0x4Eu);
              }
              v39 = self->_dailyCount;
              if (v39 == self->_periodsInDay)
              {
                LODWORD(v31) = llround((double)self->_dailyTotal * 100.0 / (double)(self->_nBins * v39));
                v40 = self->_isExternal;
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_percentMetrics, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v31), CFSTR("percentage"));
                v41 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_periodsInDay);
                if (v40)
                  v42 = CFSTR("hour");
                else
                  v42 = CFSTR("aggPeriod");
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_percentMetrics, "setObject:forKeyedSubscript:", v41, v42);
                if (qword_1022A01F0 != -1)
                  dispatch_once(&qword_1022A01F0, &stru_102184B38);
                v43 = qword_1022A01F8;
                if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
                {
                  v44 = (const char *)-[__CFString UTF8String](v21, "UTF8String");
                  v45 = self->_dailyTotal;
                  v46 = self->_percentMetrics;
                  *(_DWORD *)buf = 68290051;
                  v55 = 0;
                  v56 = 2082;
                  v57 = "";
                  v58 = 2082;
                  v59 = v44;
                  v60 = 1026;
                  v61 = (int)v31;
                  v62 = 1026;
                  v63 = v45;
                  v64 = 2113;
                  v65 = v46;
                  _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin submit daily\", \"event\":%{public, location:escape_only}s, \"dailypct\":%{public}d, \"dailytotal\":%{public}d, \"ca\":%{private, location:escape_only}@}", buf, 0x32u);
                }
                -[CLMetricEventBins submitPercentageMetricsForEvent:](self, "submitPercentageMetricsForEvent:", v21);
                self->_dailyTotal = 0;
                self->_dailyCount = 0;
                v7 = CLPContext_ptr;
              }
              if (-[NSMutableArray count](self->_intervalDistributions, "count"))
                -[CLMetricEventBins computeIntervalDistributionsForKey:](self, "computeIntervalDistributionsForKey:", v19);
              -[NSMutableDictionary removeObjectForKey:](self->_aggregationDict, "removeObjectForKey:", v16);
              self->_initAggIndex = -1;
              v9 = v48;
              v14 = v47;
            }
          }
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v74, 16);
      }
      while (v13);
    }
  }
}

- (void)computeIntervalDistributionsForKey:(int)a3
{
  id v5;
  NSObject *v6;
  const char *v7;
  NSMutableArray *intervalDistributions;
  int priorDistributionBin;
  int v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  int nBins;
  int v17;
  int v18;
  uint64_t v19;
  char *v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  int v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  int v36;
  const __CFString *v37;
  __int128 v38;
  NSMutableArray *obj;
  uint64_t v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t buf;
  __int16 v59;
  const char *v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  NSMutableArray *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  _BYTE v68[14];

  v5 = objc_msgSend(objc_msgSend(-[NSMutableDictionary objectForKey:](self->_aggregationDict, "objectForKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:")), "allObjects"), "sortedArrayUsingSelector:", "compare:");
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102184B38);
  v6 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[NSString UTF8String](self->_metricId, "UTF8String");
    intervalDistributions = self->_intervalDistributions;
    priorDistributionBin = self->_priorDistributionBin;
    v10 = self->_nBins * a3;
    buf = 68290306;
    v59 = 2082;
    v60 = "";
    v61 = 2082;
    v62 = v7;
    v63 = 2114;
    v64 = intervalDistributions;
    v65 = 1026;
    v66 = priorDistributionBin;
    v67 = 1026;
    *(_DWORD *)v68 = v10;
    *(_WORD *)&v68[4] = 2114;
    *(_QWORD *)&v68[6] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin intdist\", \"id\":%{public, location:escape_only}s, \"buckets\":%{public, location:escape_only}@, \"priorBin\":%{public}d, \"binstart\":%{public}d, \"arr\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x3Cu);
  }
  if (objc_msgSend(v5, "count"))
  {
    v41 = objc_alloc_init((Class)NSMutableDictionary);
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v14)
            objc_enumerationMutation(v5);
          nBins = self->_nBins;
          v17 = objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i), "intValue") + nBins * a3;
          v18 = self->_priorDistributionBin;
          if (v18 != -1)
          {
            v19 = (v17 - v18);
            if (v17 - v18 < 0)
              v19 = (v19 + self->_nBins * self->_periodsInDay);
            -[NSMutableArray addObject:](v11, "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v19));
          }
          self->_priorDistributionBin = v17;
        }
        v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v13);
    }
    -[NSMutableArray setArray:](v11, "setArray:", -[NSMutableArray sortedArrayUsingSelector:](v11, "sortedArrayUsingSelector:", "compare:"));
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = self->_intervalDistributions;
    v20 = "fication_T &, const NotificationData_T &, BOOL, int, BOOL) [Notification_T = CLMotionHintLogger_Type::Notification, NotificationData_T = CLMotionHintLogger_Type::NotificationData, NotificationInfo_T = char, RegistrationInfo_T = char]";
    v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v42)
    {
      LODWORD(v22) = 0;
      v40 = *(_QWORD *)v48;
      *(_QWORD *)&v21 = 68290050;
      v38 = v21;
      do
      {
        v23 = 0;
        v22 = (int)v22;
        do
        {
          if (*(_QWORD *)v48 != v40)
            objc_enumerationMutation(obj);
          v24 = objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v23), "intValue", v38);
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
          if (v25)
          {
            v26 = v25;
            v27 = 0;
            v28 = *(_QWORD *)v44;
            while (2)
            {
              v29 = 0;
              v30 = (v27 + (_DWORD)v26);
              do
              {
                if (*(_QWORD *)v44 != v28)
                  objc_enumerationMutation(v11);
                if ((int)objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v29), "intValue") >= v24)
                {
                  v30 = (v27 + (_DWORD)v29);
                  goto LABEL_33;
                }
                v29 = (char *)v29 + 1;
              }
              while (v26 != v29);
              v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
              v27 = v30;
              if (v26)
                continue;
              break;
            }
          }
          else
          {
            v30 = 0;
          }
LABEL_33:
          if (qword_1022A01F0 != -1)
            dispatch_once(&qword_1022A01F0, &stru_102184B38);
          v31 = qword_1022A01F8;
          if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
          {
            v32 = -[NSString UTF8String](self->_metricId, "UTF8String");
            buf = v38;
            v59 = 2082;
            v60 = "";
            v61 = 2082;
            v62 = v32;
            v63 = 2114;
            v64 = v11;
            v65 = 1026;
            v66 = v24;
            v67 = 1026;
            *(_DWORD *)v68 = v30;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin intdist edgeiter\", \"id\":%{public, location:escape_only}s, \"deltas\":%{public, location:escape_only}@, \"edge\":%{public}d, \"n\":%{public}d}", (uint8_t *)&buf, 0x32u);
          }
          objc_msgSend(v41, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v30), -[NSMutableArray objectAtIndexedSubscript:](self->_intervalDistributionStrings, "objectAtIndexedSubscript:", v22));
          -[NSMutableArray removeObjectsInRange:](v11, "removeObjectsInRange:", 0, (int)v30);
          ++v22;
          v23 = (char *)v23 + 1;
        }
        while (v23 != v42);
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v42);
      v33 = (int)v22;
      v20 = "virtual void CLNotifier<CLMotionHintLogger_Type::Notification, CLMotionHintLogger_Type::NotificationData>::n"
            "otifyClientsWithData(const Notification_T &, const NotificationData_T &, BOOL, int, BOOL) [Notification_T = "
            "CLMotionHintLogger_Type::Notification, NotificationData_T = CLMotionHintLogger_Type::NotificationData, Notif"
            "icationInfo_T = char, RegistrationInfo_T = char]"
          + 139;
    }
    else
    {
      v33 = 0;
    }
    objc_msgSend(v41, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](v11, "count")), -[NSMutableArray objectAtIndexedSubscript:](self->_intervalDistributionStrings, "objectAtIndexedSubscript:", v33));
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102184B38);
    v34 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
    {
      v35 = -[NSString UTF8String](self->_metricId, "UTF8String");
      v36 = self->_priorDistributionBin;
      buf = *((_QWORD *)v20 + 495);
      v59 = 2082;
      v60 = "";
      v61 = 2082;
      v62 = v35;
      v63 = 2114;
      v64 = v11;
      v65 = 1026;
      v66 = v36;
      v67 = 2114;
      *(_QWORD *)v68 = v41;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin intdist submit\", \"id\":%{public, location:escape_only}s, \"deltas\":%{public, location:escape_only}@, \"priorBin\":%{public}d, \"ca\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x36u);
    }
    if (self->_isExternal)
      v37 = -[NSString stringByAppendingString:](self->_metricId, "stringByAppendingString:", CFSTR(".intervals"));
    else
      v37 = CFSTR("com.apple.locationd.metricbins.intervals");
    -[CLMetricEventBins submitIntervalMetrics:forEvent:](self, "submitIntervalMetrics:forEvent:", v41, v37);
  }
}

- (void)processEventTime:(double)a3 atCurrentTime:(double)a4
{
  NSNumber *v6;

  v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3);
  -[CLMetricEventBins processEventTimes:atCurrentTime:](self, "processEventTimes:atCurrentTime:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1), a4);
}

- (void)processEventTimes:(id)a3 atCurrentTime:(double)a4
{
  NSArray *v7;
  NSObject *v8;
  const char *v9;
  id v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  const char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t buf;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  NSArray *v41;

  v7 = -[NSArray sortedArrayUsingSelector:](-[NSSet allObjects](+[NSSet setWithArray:](NSSet, "setWithArray:"), "allObjects"), "sortedArrayUsingSelector:", "compare:");
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102184B38);
  v8 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[NSString UTF8String](self->_metricId, "UTF8String");
    buf = 68290306;
    v30 = 2082;
    v31 = "";
    v32 = 2082;
    v33 = v9;
    v34 = 1026;
    v35 = objc_msgSend(a3, "count");
    v36 = 1026;
    v37 = -[NSArray count](v7, "count");
    v38 = 1026;
    v39 = (int)(a4 + 0.5);
    v40 = 2114;
    v41 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin events\", \"id\":%{public, location:escape_only}s, \"events\":%{public}d, \"proc\":%{public}d, \"now\":%{public}d, \"times\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x38u);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v25;
    *(_QWORD *)&v11 = 68289282;
    v23 = v11;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v7);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v14), "intValue", v23);
        if (v15)
        {
          v16 = +[CLMetricEventBins getLocalSecondsIntoDay:andLog:](CLMetricEventBins, "getLocalSecondsIntoDay:andLog:", 0, (double)v15);
          v17 = -[CLMetricEventBins getAggregateIndexForSecondsIntoDay:](self, "getAggregateIndexForSecondsIntoDay:", v16);
          v18 = -[CLMetricEventBins getBinIndexForSecondsIntoDay:](self, "getBinIndexForSecondsIntoDay:", v16);
          if (-[CLMetricEventBins canAccumulateForSecs:](self, "canAccumulateForSecs:", v16))
          {
            -[CLMetricEventBins checkIfIndexIsNewAndSubmit:forNow:](self, "checkIfIndexIsNewAndSubmit:forNow:", v17, a4);
            objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregationDict, "objectForKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v17)), "addObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v18));
          }
          else
          {
            self->_priorDistributionBin = v18 + self->_nBins * v17;
          }
        }
        else
        {
          if (qword_1022A01F0 != -1)
            dispatch_once(&qword_1022A01F0, &stru_102184B38);
          v19 = qword_1022A01F8;
          if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_ERROR))
          {
            v20 = -[NSString UTF8String](self->_metricId, "UTF8String");
            buf = v23;
            v30 = 2082;
            v31 = "";
            v32 = 2082;
            v33 = v20;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#cabin error, time zero\", \"id\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
            if (qword_1022A01F0 != -1)
              dispatch_once(&qword_1022A01F0, &stru_102184B38);
          }
          v21 = qword_1022A01F8;
          if (os_signpost_enabled((os_log_t)qword_1022A01F8))
          {
            v22 = -[NSString UTF8String](self->_metricId, "UTF8String");
            buf = v23;
            v30 = 2082;
            v31 = "";
            v32 = 2082;
            v33 = v22;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#cabin error, time zero", "{\"msg%{public}.0s\":\"#cabin error, time zero\", \"id\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
          }
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }
}

- (void)submitPercentageMetricsForEvent:(id)a3
{
  NSObject *v5;
  id v6;
  NSMutableDictionary *percentMetrics;
  _QWORD v8[5];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  NSMutableDictionary *v16;

  if (self->_submitMetrics)
  {
    if (qword_1022A01F0 != -1)
      dispatch_once(&qword_1022A01F0, &stru_102184B38);
    v5 = qword_1022A01F8;
    if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(a3, "UTF8String");
      percentMetrics = self->_percentMetrics;
      *(_DWORD *)buf = 68289539;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2081;
      v14 = v6;
      v15 = 2113;
      v16 = percentMetrics;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin percentage submission\", \"event\":%{private, location:escape_only}s, \"dict\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100DA1150;
    v8[3] = &unk_10215F370;
    v8[4] = self;
    AnalyticsSendEventLazy(a3, v8);
  }
  self->_lastPercentageMetrics = self->_percentMetrics;
  ++self->_submissionCount;
}

- (void)submitIntervalMetrics:(id)a3 forEvent:(id)a4
{
  id v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  NSMutableDictionary *intervalMetrics;
  __int128 v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  NSMutableDictionary *v29;
  _BYTE v30[128];

  if (self->_submitMetrics && self->_isExternal)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v19;
      *(_QWORD *)&v8 = 68289539;
      v16 = v8;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(a3);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v11);
          if ((uint64_t)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", v12, v16), "integerValue") >= 1)
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_intervalMetrics, "setObject:forKeyedSubscript:", v12, CFSTR("interval"));
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_intervalMetrics, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", v12), CFSTR("total"));
            if (qword_1022A01F0 != -1)
              dispatch_once(&qword_1022A01F0, &stru_102184B38);
            v13 = qword_1022A01F8;
            if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
            {
              v14 = objc_msgSend(a4, "UTF8String");
              intervalMetrics = self->_intervalMetrics;
              *(_DWORD *)buf = v16;
              v23 = 0;
              v24 = 2082;
              v25 = "";
              v26 = 2081;
              v27 = v14;
              v28 = 2113;
              v29 = intervalMetrics;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin interval submission\", \"event\":%{private, location:escape_only}s, \"dict\":%{private, location:escape_only}@}", buf, 0x26u);
            }
            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472;
            v17[2] = sub_100DA13C0;
            v17[3] = &unk_10215F370;
            v17[4] = self;
            AnalyticsSendEventLazy(a4, v17);
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      }
      while (v9);
    }
  }
  self->_lastIntervalMetrics = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy", a3, a4);
  ++self->_submissionCount;
}

- (void)reset:(double)a3
{
  NSObject *v5;
  const char *v6;
  int initAggIndex;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;

  self->_initAggIndex = -[CLMetricEventBins getAggregateIndexForSecondsIntoDay:](self, "getAggregateIndexForSecondsIntoDay:", +[CLMetricEventBins getLocalSecondsIntoDay:andLog:](CLMetricEventBins, "getLocalSecondsIntoDay:andLog:", 1));
  if (qword_1022A01F0 != -1)
    dispatch_once(&qword_1022A01F0, &stru_102184B38);
  v5 = qword_1022A01F8;
  if (os_log_type_enabled((os_log_t)qword_1022A01F8, OS_LOG_TYPE_DEFAULT))
  {
    v6 = -[NSString UTF8String](self->_metricId, "UTF8String");
    initAggIndex = self->_initAggIndex;
    v8[0] = 68289794;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2082;
    v12 = v6;
    v13 = 1026;
    v14 = (int)a3;
    v15 = 1026;
    v16 = initAggIndex;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#cabin reset\", \"id\":%{public, location:escape_only}s, \"now\":%{public}d, \"initAggIndex\":%{public}d}", (uint8_t *)v8, 0x28u);
  }
  self->_dailyTotal = 0;
  self->_dailyCount = 0;
  -[NSMutableDictionary removeAllObjects](self->_aggregationDict, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_intervalDistributions, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_intervalDistributionStrings, "removeAllObjects");
  self->_priorDistributionBin = -1;
  self->_dimensionInt = -1;
  self->_dimensionStr = (NSString *)&stru_1021D8FB8;
}

- (void)testClearSubmissions
{
  -[NSMutableDictionary removeAllObjects](-[CLMetricEventBins lastPercentageMetrics](self, "lastPercentageMetrics"), "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](-[CLMetricEventBins lastIntervalMetrics](self, "lastIntervalMetrics"), "removeAllObjects");
  self->_submissionCount = 0;
}

- (int)testGetDistributionBinAnchor
{
  return self->_priorDistributionBin;
}

- (int)dimensionInt
{
  return self->_dimensionInt;
}

- (void)setDimensionInt:(int)a3
{
  self->_dimensionInt = a3;
}

- (NSString)dimensionStr
{
  return self->_dimensionStr;
}

- (int)submissionCount
{
  return self->_submissionCount;
}

- (void)setSubmissionCount:(int)a3
{
  self->_submissionCount = a3;
}

- (NSMutableDictionary)lastPercentageMetrics
{
  return self->_lastPercentageMetrics;
}

- (NSMutableDictionary)lastIntervalMetrics
{
  return self->_lastIntervalMetrics;
}

@end
