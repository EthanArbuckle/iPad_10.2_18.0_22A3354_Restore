@implementation MOEventPatternDetectorFeatureTransformerAggregateEvents

- (MOEventPatternDetectorFeatureTransformerAggregateEvents)init
{
  MOEventPatternDetectorFeatureTransformerAggregateEvents *v2;
  MOEventPatternDetectorFeatureTransformerAggregateEvents *v3;
  NSCalendar *v4;
  NSCalendar *currentCalendar;
  MOEventPatternDetectorFeatureTransformerAggregateEvents *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MOEventPatternDetectorFeatureTransformerAggregateEvents;
  v2 = -[MOEventPatternDetectorFeatureTransformerAggregateEvents init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    v2->_aggregationWindow = 16;
    v4 = (NSCalendar *)objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
    currentCalendar = v3->_currentCalendar;
    v3->_currentCalendar = v4;

    v6 = v3;
  }

  return v3;
}

- (id)transformFeaturesFromEvents:(id)a3 withFeatures:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  double v23;
  double v24;
  unint64_t aggregationType;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  double v32;
  uint64_t v33;
  NSMutableArray *v34;
  NSMutableArray *v36;
  id v37;
  NSMutableArray *v38;
  NSMutableArray *v39;
  id v40;
  unint64_t v41;
  NSMutableArray *v43;
  NSMutableArray *v44;
  NSCalendar *currentCalendar;

  v5 = a3;
  v40 = a4;
  v36 = objc_opt_new(NSMutableArray);
  v39 = objc_opt_new(NSMutableArray);
  v38 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v37 = v5;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v6, v36));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "objectAtIndex:", v6));
      if (objc_msgSend(v7, "count"))
      {
        v44 = objc_opt_new(NSMutableArray);
        v43 = objc_opt_new(NSMutableArray);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingTimeInterval:", -10800.0));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        v41 = v6;
        if (objc_msgSend(v7, "count"))
        {
          v15 = 0;
          do
          {
            if ((unint64_t)objc_msgSend(v7, "count") <= v15 + 1)
              goto LABEL_12;
            currentCalendar = self->_currentCalendar;
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v15 + 1));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "endDate"));
            v18 = v9;
            v19 = v8;
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dateByAddingTimeInterval:", -10800.0));
            v21 = -[NSCalendar isDate:equalToDate:toUnitGranularity:](currentCalendar, "isDate:equalToDate:toUnitGranularity:", v11, v20, self->_aggregationWindow);

            v8 = v19;
            v9 = v18;

            if (v21)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v15 + 1));
              objc_msgSend(v22, "doubleValue");
              v24 = v23;

              aggregationType = self->_aggregationType;
              if (aggregationType == 1)
              {
                if (v24 > v14)
                {
                  v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v15 + 1));

                  v9 = (void *)v33;
                  v14 = v24;
                }
              }
              else if (!aggregationType)
              {
                v14 = v14 + v24;
              }
            }
            else
            {
LABEL_12:
              v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
              -[NSMutableArray addObject:](v44, "addObject:", v26);

              -[NSMutableArray addObject:](v43, "addObject:", v9);
              if ((unint64_t)objc_msgSend(v7, "count") > v15 + 1)
              {
                v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v15 + 1));
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "startDate"));
                v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dateByAddingTimeInterval:", -10800.0));

                v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v15 + 1));
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", v15 + 1));
                objc_msgSend(v31, "doubleValue");
                v14 = v32;

                v9 = (void *)v30;
                v11 = (void *)v29;
              }
            }
            ++v15;
          }
          while ((unint64_t)objc_msgSend(v7, "count") > v15);
        }
        -[NSMutableArray addObject:](v38, "addObject:", v44);
        -[NSMutableArray addObject:](v39, "addObject:", v43);

        v5 = v37;
        v6 = v41;
      }

      ++v6;
    }
    while ((unint64_t)objc_msgSend(v5, "count") > v6);
  }
  v34 = v36;
  -[NSMutableArray addObject:](v36, "addObject:", v39, v36);
  -[NSMutableArray addObject:](v34, "addObject:", v38);

  return v34;
}

- (BOOL)configure:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id os_log;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("AggregationWindow")));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("AggregationWindow")));
      self->_aggregationWindow = (unint64_t)v8;

    }
    else
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v10 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorFeatureTransformerAggregateEvents configure:].cold.1((uint64_t)CFSTR("AggregationWindow"), v10, v11, v12, v13, v14, v15, v16);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("AggregationType")));

    if (!v17)
    {
      v22 = _mo_log_facility_get_os_log(&MOLogFacilityPatternDetection);
      v21 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorFeatureTransformerAggregateEvents configure:].cold.1((uint64_t)CFSTR("AggregationType"), v21, v23, v24, v25, v26, v27, v28);
      goto LABEL_14;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("AggregationType")));
    self->_aggregationType = objc_msgSend(v18, "unsignedIntValue");

    if (self->_aggregationType >= 2)
    {
      v19 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[MOEventPatternDetectorFeatureTransformerAggregateEvents configure:].cold.2((uint64_t *)&self->_aggregationType, v20);

      v21 = objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventPatternDetectorFeatureTransformerAggregateEvents.m"), 108, CFSTR("Unknown Aggregation Type : %lu (in %s:%d)"), self->_aggregationType, "-[MOEventPatternDetectorFeatureTransformerAggregateEvents configure:]", 108);
LABEL_14:

    }
  }

  return v6 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
}

- (void)configure:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Configuration property not set for AggregateEvents: %@", a5, a6, a7, a8, 2u);
}

- (void)configure:(uint64_t *)a1 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;

  v2 = *a1;
  v3 = 134218498;
  v4 = v2;
  v5 = 2080;
  v6 = "-[MOEventPatternDetectorFeatureTransformerAggregateEvents configure:]";
  v7 = 1024;
  v8 = 108;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown Aggregation Type : %lu (in %s:%d)", (uint8_t *)&v3, 0x1Cu);
}

@end
