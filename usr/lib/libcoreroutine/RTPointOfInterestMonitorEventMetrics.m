@implementation RTPointOfInterestMonitorEventMetrics

- (RTPointOfInterestMonitorEventMetrics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_);
}

- (RTPointOfInterestMonitorEventMetrics)initWithDistanceCalculator:(id)a3
{
  id v5;
  RTPointOfInterestMonitorEventMetrics *v6;
  RTPointOfInterestMonitorEventMetrics *v7;
  uint64_t v8;
  NSMutableDictionary *metrics;
  RTLocation *arrivalEventLocation;
  NSDate *arrivalEventDate;
  uint64_t v12;
  NSMutableArray *buildingPolygons;
  NSDate *locationRequestTimerStartDate;
  NSDate *highAccuracyLocationRequestStartDate;
  RTPointOfInterestMonitorEventMetrics *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[16];

  v5 = a3;
  if (v5)
  {
    v19.receiver = self;
    v19.super_class = (Class)RTPointOfInterestMonitorEventMetrics;
    v6 = -[RTPointOfInterestMonitorEventMetrics init](&v19, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_distanceCalculator, a3);
      v8 = objc_opt_new();
      metrics = v7->_metrics;
      v7->_metrics = (NSMutableDictionary *)v8;

      arrivalEventLocation = v7->_arrivalEventLocation;
      v7->_arrivalEventLocation = 0;

      arrivalEventDate = v7->_arrivalEventDate;
      v7->_arrivalEventDate = 0;

      v12 = objc_opt_new();
      buildingPolygons = v7->_buildingPolygons;
      v7->_buildingPolygons = (NSMutableArray *)v12;

      locationRequestTimerStartDate = v7->_locationRequestTimerStartDate;
      v7->_locationRequestTimerStartDate = 0;

      highAccuracyLocationRequestStartDate = v7->_highAccuracyLocationRequestStartDate;
      v7->_highAccuracyLocationRequestStartDate = 0;

      -[RTPointOfInterestMonitorEventMetrics reset](v7, "reset");
    }
    self = v7;
    v16 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator", buf, 2u);
    }

    v16 = 0;
  }

  return v16;
}

- (void)reset
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[RTPointOfInterestMonitorEventMetrics setArrivalEventLocation:](self, "setArrivalEventLocation:", 0);
  -[RTPointOfInterestMonitorEventMetrics setArrivalEventDate:](self, "setArrivalEventDate:", 0);
  -[RTPointOfInterestMonitorEventMetrics setLocationRequestTimerStartDate:](self, "setLocationRequestTimerStartDate:", 0);
  -[RTPointOfInterestMonitorEventMetrics setHighAccuracyLocationRequestStartDate:](self, "setHighAccuracyLocationRequestStartDate:", 0);
  -[RTPointOfInterestMonitorEventMetrics buildingPolygons](self, "buildingPolygons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[RTPointOfInterestMonitorEventMetrics metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", &unk_1E9326780, CFSTR("arrivalEvent"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", &unk_1E9326798, CFSTR("nearbyAppClipCount"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", &unk_1E9326798, CFSTR("distanceFromArrivalLocationToClosestAppClipLocation"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", &unk_1E9326798, CFSTR("buildingFenceCount"));
  v5 = MEMORY[0x1E0C9AAA0];
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("shouldRequestGPS"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", v5, CFSTR("exceedDailyPowerBudget"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", &unk_1E9326798, CFSTR("highAccuracyLocationRequestLatency"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", &unk_1E9326798, CFSTR("highAccuracyLocationRequestDuration"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", v5, CFSTR("isFenceBreak"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", &unk_1E9326798, CFSTR("buildingPolygonRadius"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", &unk_1E9326798, CFSTR("distanceFromArrivalLocationToBuildingPolygonCentroid"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", &unk_1E9326798, CFSTR("fenceBreakLatency"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", v5, CFSTR("isGPSRunningWhenFenceBreak"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", &unk_1E9326798, CFSTR("BluePOIQueryCount"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", v5, CFSTR("bluePOIHasResult"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", &unk_1E93267B0, CFSTR("bluePOIConfidenceScore"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", &unk_1E9326798, CFSTR("bluePOILatency"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", v5, CFSTR("pOIHasAppClip"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", &unk_1E9326798, CFSTR("pOIVisitDetectionLatency"));
  -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", &unk_1E93267B0, CFSTR("signalEnvironment"));
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[RTPointOfInterestMonitorEventMetrics metrics](self, "metrics");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[RTPointOfInterestMonitorEventMetrics metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)submit
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (void *)objc_msgSend(v3, "initWithCString:encoding:", RTAnalyticsEventPointOfInterestMonitorEvent, 1);
  -[RTPointOfInterestMonitorEventMetrics metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  log_analytics_submission(v4, v5);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPointOfInterestMonitorEventMetrics metrics](self, "metrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

  -[RTPointOfInterestMonitorEventMetrics reset](self, "reset");
}

- (double)calculateMinimumDistanceFromLocation:(id)a3 toLocations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    v12 = 1.79769313e308;
    do
    {
      v13 = 0;
      v14 = v10;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
        -[RTPointOfInterestMonitorEventMetrics distanceCalculator](self, "distanceCalculator");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v14;
        objc_msgSend(v16, "distanceFromLocation:toLocation:error:", v6, v15, &v21);
        v18 = v17;
        v10 = v21;

        if (v18 < v12 && v10 == 0)
          v12 = v18;
        ++v13;
        v14 = v10;
      }
      while (v9 != v13);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);

  }
  else
  {
    v12 = 1.79769313e308;
  }

  return v12;
}

- (double)calculateMaximumDistanceFromLocation:(id)a3 toLocations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v23;
    v12 = 2.22507386e-308;
    do
    {
      v13 = 0;
      v14 = v10;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
        -[RTPointOfInterestMonitorEventMetrics distanceCalculator](self, "distanceCalculator");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v14;
        objc_msgSend(v16, "distanceFromLocation:toLocation:error:", v6, v15, &v21);
        v18 = v17;
        v10 = v21;

        if (v18 > v12 && v10 == 0)
          v12 = v18;
        ++v13;
        v14 = v10;
      }
      while (v9 != v13);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);

  }
  else
  {
    v12 = 2.22507386e-308;
  }

  return v12;
}

- (void)saveBuildingPolygons:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  _RTMap *v16;
  void *v17;
  _RTMap *v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x1E0D183B0]);
        objc_msgSend(v8, "centroid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "latitude");
        v12 = v11;
        objc_msgSend(v8, "centroid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "longitude");
        v15 = (void *)objc_msgSend(v9, "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v12, v14, -1.0);

        v16 = [_RTMap alloc];
        objc_msgSend(v8, "vertices");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[_RTMap initWithInput:](v16, "initWithInput:", v17);
        -[_RTMap withBlock:](v18, "withBlock:", &__block_literal_global_1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[RTPointOfInterestMonitorEventMetrics calculateMaximumDistanceFromLocation:toLocations:](self, "calculateMaximumDistanceFromLocation:toLocations:", v15, v19);
        v21 = v20;
        v22 = objc_alloc(MEMORY[0x1E0D18408]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v22, "initWithFirstObject:secondObject:", v15, v23);

        if (v24)
        {
          -[RTPointOfInterestMonitorEventMetrics buildingPolygons](self, "buildingPolygons");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v24);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
  }

}

id __61__RTPointOfInterestMonitorEventMetrics_saveBuildingPolygons___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v2 = (objc_class *)MEMORY[0x1E0D183B0];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "latitude");
  v6 = v5;
  objc_msgSend(v3, "longitude");
  v8 = v7;

  return (id)objc_msgSend(v4, "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v6, v8, -1.0);
}

- (void)updateBuildingPolygonMetricsForRegionIdentifer:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("-"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  -[RTPointOfInterestMonitorEventMetrics buildingPolygons](self, "buildingPolygons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 > v6)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[RTPointOfInterestMonitorEventMetrics buildingPolygons](self, "buildingPolygons");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "secondObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v9, "numberWithUnsignedInteger:", vcvtad_u64_f64(v13));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", v14, CFSTR("buildingPolygonRadius"));

    -[RTPointOfInterestMonitorEventMetrics arrivalEventLocation](self, "arrivalEventLocation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPointOfInterestMonitorEventMetrics buildingPolygons](self, "buildingPolygons");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPointOfInterestMonitorEventMetrics calculateMinimumDistanceFromLocation:toLocations:](self, "calculateMinimumDistanceFromLocation:toLocations:", v15, v19);
    v21 = v20;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", vcvtad_u64_f64(v21));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPointOfInterestMonitorEventMetrics setObject:forKey:](self, "setObject:forKey:", v22, CFSTR("distanceFromArrivalLocationToBuildingPolygonCentroid"));

  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[RTPointOfInterestMonitorEventMetrics metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("RTPointOfInterestMonitorEventMetrics, %lu, "), objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTPointOfInterestMonitorEventMetrics metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__RTPointOfInterestMonitorEventMetrics_description__block_invoke;
  v12[3] = &unk_1E92973B8;
  v12[4] = self;
  v8 = v5;
  v13 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __51__RTPointOfInterestMonitorEventMetrics_description__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@, "), v4, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendString:", v7);
}

- (NSDate)locationRequestTimerStartDate
{
  return self->_locationRequestTimerStartDate;
}

- (void)setLocationRequestTimerStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_locationRequestTimerStartDate, a3);
}

- (NSDate)highAccuracyLocationRequestStartDate
{
  return self->_highAccuracyLocationRequestStartDate;
}

- (void)setHighAccuracyLocationRequestStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_highAccuracyLocationRequestStartDate, a3);
}

- (RTLocation)arrivalEventLocation
{
  return self->_arrivalEventLocation;
}

- (void)setArrivalEventLocation:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalEventLocation, a3);
}

- (NSDate)arrivalEventDate
{
  return self->_arrivalEventDate;
}

- (void)setArrivalEventDate:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalEventDate, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (NSMutableDictionary)metrics
{
  return self->_metrics;
}

- (NSMutableArray)buildingPolygons
{
  return self->_buildingPolygons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildingPolygons, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_arrivalEventDate, 0);
  objc_storeStrong((id *)&self->_arrivalEventLocation, 0);
  objc_storeStrong((id *)&self->_highAccuracyLocationRequestStartDate, 0);
  objc_storeStrong((id *)&self->_locationRequestTimerStartDate, 0);
}

@end
