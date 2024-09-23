@implementation RTLearnedLocationEngineTrainingMetrics

- (RTLearnedLocationEngineTrainingMetrics)init
{
  RTLearnedLocationEngineTrainingMetrics *v2;
  uint64_t v3;
  NSMutableArray *awdVisits;
  uint64_t v5;
  NSMutableArray *awdPlaces;
  uint64_t v7;
  NSMutableArray *visits;
  uint64_t v9;
  NSMutableArray *places;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RTLearnedLocationEngineTrainingMetrics;
  v2 = -[RTLearnedLocationEngineTrainingMetrics init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    awdVisits = v2->_awdVisits;
    v2->_awdVisits = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    awdPlaces = v2->_awdPlaces;
    v2->_awdPlaces = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    visits = v2->_visits;
    v2->_visits = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    places = v2->_places;
    v2->_places = (NSMutableArray *)v9;

  }
  return v2;
}

- (void)submitVisit:(id)a3 possibleMapItems:(id)a4 selectedMapItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  RTLearnedLocationEngineTrainingMetrics *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v23 = self;
    v11 = (void *)objc_opt_new();
    objc_msgSend(v8, "exitDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entryDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v13);
    objc_msgSend(v11, "setDwellTime:", (unint64_t)v14);

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = v9;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDD160]), "initWithMapItem:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19));
          if (v20)
            objc_msgSend(v11, "addPossibleMapItems:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    if (v10)
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DDD160]), "initWithMapItem:", v10);
      objc_msgSend(v11, "setSelectedMapItem:", v21);

    }
    -[RTLearnedLocationEngineTrainingMetrics awdVisits](v23, "awdVisits");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v11);

  }
}

- (void)submitPlace:(id)a3 nearbyPlaces:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id obj;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v8 = objc_alloc(MEMORY[0x1E0DDD160]);
  v33 = v5;
  objc_msgSend(v5, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithMapItem:", v9);
  v30 = v7;
  objc_msgSend(v7, "setMapItem:", v10);

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v6;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);

        objc_msgSend(v18, "mapItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "location");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "mapItem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "location");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        objc_msgSend(v12, "distanceFromLocation:toLocation:error:", v20, v22, &v37);
        v24 = v23;
        v15 = v37;

        if (v15)
        {
          _rt_log_facility_get_os_log(RTLogFacilityLocation);
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v43 = v15;
            _os_log_debug_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", ceil(floor(v24) / 10.0) * 10.0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v26);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __67__RTLearnedLocationEngineTrainingMetrics_submitPlace_nearbyPlaces___block_invoke;
  v34[3] = &unk_1E92A1400;
  v35 = v11;
  v36 = v30;
  v27 = v30;
  v28 = v11;
  objc_msgSend(v28, "enumerateObjectsUsingBlock:", v34);
  -[RTLearnedLocationEngineTrainingMetrics awdPlaces](self, "awdPlaces");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addObject:", v27);

}

void __67__RTLearnedLocationEngineTrainingMetrics_submitPlace_nearbyPlaces___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setValue:", objc_msgSend(v3, "unsignedIntValue"));
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v3);

  objc_msgSend(v4, "numberWithUnsignedInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCount:", objc_msgSend(v6, "unsignedIntValue"));

  objc_msgSend(*(id *)(a1 + 40), "addDistanceToOtherPlaces:", v7);
}

- (void)startTrainingVisits
{
  NSDate *v3;
  NSDate *trainVisitsStart;

  self->_trainedVisits = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  trainVisitsStart = self->_trainVisitsStart;
  self->_trainVisitsStart = v3;

  self->_wasDeferred = 0;
}

- (void)stopTrainingVisits
{
  NSDate *v3;
  NSDate *trainVisitsStop;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  trainVisitsStop = self->_trainVisitsStop;
  self->_trainVisitsStop = v3;

}

- (double)latency
{
  NSDate *trainVisitsStop;
  double result;

  if (!self->_trainVisitsStart)
    return 0.0;
  trainVisitsStop = self->_trainVisitsStop;
  if (!trainVisitsStop)
    return 0.0;
  -[NSDate timeIntervalSinceDate:](trainVisitsStop, "timeIntervalSinceDate:");
  return result;
}

- (id)description
{
  objc_class *v3;
  _BOOL4 v4;
  const __CFString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[RTLearnedLocationEngineTrainingMetrics trainedVisits](self, "trainedVisits");
  v5 = CFSTR("NO");
  if (v4)
    v5 = CFSTR("YES");
  v18 = v5;
  -[RTLearnedLocationEngineTrainingMetrics latency](self, "latency");
  v7 = v6;
  -[RTLearnedLocationEngineTrainingMetrics intervalSinceLastAttempt](self, "intervalSinceLastAttempt");
  v9 = v8;
  v17 = -[RTLearnedLocationEngineTrainingMetrics locationsProcessed](self, "locationsProcessed");
  -[RTLearnedLocationEngineTrainingMetrics maxIntervalBetweenLocations](self, "maxIntervalBetweenLocations");
  v11 = v10;
  -[RTLearnedLocationEngineTrainingMetrics awdVisits](self, "awdVisits");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  -[RTLearnedLocationEngineTrainingMetrics awdPlaces](self, "awdPlaces");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@, trainedVisits, %@, latency, %.2f, intervalSinceLastAttempt, %.2f, locationsProcessed, %u, maxIntervalBetweenLocations, %.2f, new visits, %lu, places from visits, %lu, visitCountDevice, %lu, visitCountTotal, %lu, placeCountDevice, %lu, placeCountTotal, %lu, mode, %lu, reason, %lu"), v19, v18, v7, v9, v17, v11, v13, objc_msgSend(v14, "count"), -[RTLearnedLocationEngineTrainingMetrics visitCountDevice](self, "visitCountDevice"), -[RTLearnedLocationEngineTrainingMetrics visitCountTotal](self, "visitCountTotal"), -[RTLearnedLocationEngineTrainingMetrics placeCountDevice](self, "placeCountDevice"), -[RTLearnedLocationEngineTrainingMetrics placeCountTotal](self, "placeCountTotal"), -[RTLearnedLocationEngineTrainingMetrics mode](self, "mode"), -[RTLearnedLocationEngineTrainingMetrics reason](self, "reason"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)collectCoreAnalyticsMetrics
{
  void *v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLearnedLocationEngineTrainingMetrics wasDeferred](self, "wasDeferred"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("_deferralReason"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLearnedLocationEngineTrainingMetrics intervalSinceLastAttempt](self, "intervalSinceLastAttempt");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("_intervalSinceLastAttempt"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLearnedLocationEngineTrainingMetrics latency](self, "latency");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("_duration"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLearnedLocationEngineTrainingMetrics visits](self, "visits");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("_visitCountTrainingEvent"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[RTLearnedLocationEngineTrainingMetrics places](self, "places");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("_placeCountTrainingEvent"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLearnedLocationEngineTrainingMetrics visitCountDevice](self, "visitCountDevice"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("_visitCountDevice"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLearnedLocationEngineTrainingMetrics placeCountDevice](self, "placeCountDevice"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("_placeCountDevice"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLearnedLocationEngineTrainingMetrics placeCountTotal](self, "placeCountTotal"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("_placeCountTotal"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLearnedLocationEngineTrainingMetrics visitCountTotal](self, "visitCountTotal"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("_visitCountTotal"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLearnedLocationEngineTrainingMetrics mode](self, "mode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("_trainMode"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTLearnedLocationEngineTrainingMetrics reason](self, "reason"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("_trainReason"));

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = self->_visits;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v21);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "placeSource", (_QWORD)v29))
          ++v24;
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v23);
  }
  else
  {
    v24 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("_unlabeledVisitCountTrainingEvent"));

  return v3;
}

- (void)submitToCoreAnalytics
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  -[RTLearnedLocationEngineTrainingMetrics collectCoreAnalyticsMetrics](self, "collectCoreAnalyticsMetrics");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = (void *)objc_msgSend(v2, "initWithCString:encoding:", RTAnalyticsEventTraining, 1);
  log_analytics_submission(v3, v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (NSDate)trainVisitsStart
{
  return self->_trainVisitsStart;
}

- (NSDate)trainVisitsStop
{
  return self->_trainVisitsStop;
}

- (double)intervalSinceLastAttempt
{
  return self->_intervalSinceLastAttempt;
}

- (void)setIntervalSinceLastAttempt:(double)a3
{
  self->_intervalSinceLastAttempt = a3;
}

- (unint64_t)visitCountDevice
{
  return self->_visitCountDevice;
}

- (void)setVisitCountDevice:(unint64_t)a3
{
  self->_visitCountDevice = a3;
}

- (unint64_t)visitCountTotal
{
  return self->_visitCountTotal;
}

- (void)setVisitCountTotal:(unint64_t)a3
{
  self->_visitCountTotal = a3;
}

- (unint64_t)placeCountDevice
{
  return self->_placeCountDevice;
}

- (void)setPlaceCountDevice:(unint64_t)a3
{
  self->_placeCountDevice = a3;
}

- (unint64_t)placeCountTotal
{
  return self->_placeCountTotal;
}

- (void)setPlaceCountTotal:(unint64_t)a3
{
  self->_placeCountTotal = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (BOOL)trainedVisits
{
  return self->_trainedVisits;
}

- (void)setTrainedVisits:(BOOL)a3
{
  self->_trainedVisits = a3;
}

- (unint64_t)locationsProcessed
{
  return self->_locationsProcessed;
}

- (void)setLocationsProcessed:(unint64_t)a3
{
  self->_locationsProcessed = a3;
}

- (double)maxIntervalBetweenLocations
{
  return self->_maxIntervalBetweenLocations;
}

- (void)setMaxIntervalBetweenLocations:(double)a3
{
  self->_maxIntervalBetweenLocations = a3;
}

- (NSMutableArray)awdVisits
{
  return self->_awdVisits;
}

- (NSMutableArray)awdPlaces
{
  return self->_awdPlaces;
}

- (NSMutableArray)visits
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setVisits:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSMutableArray)places
{
  return (NSMutableArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPlaces:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (unint64_t)visitCountUnlabeled
{
  return self->_visitCountUnlabeled;
}

- (void)setVisitCountUnlabeled:(unint64_t)a3
{
  self->_visitCountUnlabeled = a3;
}

- (unint64_t)wasDeferred
{
  return self->_wasDeferred;
}

- (void)setWasDeferred:(unint64_t)a3
{
  self->_wasDeferred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_visits, 0);
  objc_storeStrong((id *)&self->_awdPlaces, 0);
  objc_storeStrong((id *)&self->_awdVisits, 0);
  objc_storeStrong((id *)&self->_trainVisitsStop, 0);
  objc_storeStrong((id *)&self->_trainVisitsStart, 0);
}

@end
