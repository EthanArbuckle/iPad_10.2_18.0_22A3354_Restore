@implementation RTStateDepiction

- (RTStateDepiction)init
{
  return -[RTStateDepiction initWithLocation:type:typeSource:customLabel:mapItem:](self, "initWithLocation:type:typeSource:customLabel:mapItem:", 0, -1, 0, 0, 0);
}

- (RTStateDepiction)initWithLocation:(id)a3 type:(int64_t)a4 typeSource:(unint64_t)a5 customLabel:(id)a6 mapItem:(id)a7
{
  id v12;
  id v13;
  id v14;
  RTStateDepiction *v15;
  RTStateDepictionOneState *v16;
  RTStateDepictionOneState *clusterState;
  objc_super v19;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v19.receiver = self;
  v19.super_class = (Class)RTStateDepiction;
  v15 = -[RTStateDepiction init](&v19, sel_init);
  if (v15)
  {
    v16 = -[RTStateDepictionOneState initWithLocation:type:typeSource:customLabel:mapItem:]([RTStateDepictionOneState alloc], "initWithLocation:type:typeSource:customLabel:mapItem:", v12, a4, a5, v13, v14);
    clusterState = v15->_clusterState;
    v15->_clusterState = v16;

    v15->_numOfDataPts = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[RTStateDepiction _performIntegrityCheck](self, "_performIntegrityCheck");
  objc_msgSend(v4, "encodeObject:forKey:", self->_clusterState, CFSTR("clusterState"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_numOfDataPts, CFSTR("numOfDataPts"));

}

- (RTStateDepiction)initWithCoder:(id)a3
{
  id v4;
  RTStateDepiction *v5;
  uint64_t v6;
  RTStateDepictionOneState *clusterState;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTStateDepiction;
  v5 = -[RTStateDepiction init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clusterState"));
    v6 = objc_claimAutoreleasedReturnValue();
    clusterState = v5->_clusterState;
    v5->_clusterState = (RTStateDepictionOneState *)v6;

    v5->_numOfDataPts = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("numOfDataPts"));
    -[RTStateDepiction _performErrorCorrection](v5, "_performErrorCorrection");
  }

  return v5;
}

+ (int64_t)maximumNumberOfDataPoints
{
  double v2;
  int64_t v3;
  NSObject *v4;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = (CFAbsoluteTimeGetCurrent() + -380675623.0) / 300.0;
  if (v2 >= 2147483650.0)
    v3 = 2147483646;
  else
    v3 = (int)v2;
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "maximum data point count, %ld", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (void)_performIntegrityCheck
{
  int64_t v3;
  NSObject *v4;
  int v5;
  int64_t v6;
  __int16 v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = +[RTStateDepiction maximumNumberOfDataPoints](RTStateDepiction, "maximumNumberOfDataPoints");
  if (-[RTStateDepiction numOfDataPts](self, "numOfDataPts") > v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityStateModel);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 134218240;
      v6 = -[RTStateDepiction numOfDataPts](self, "numOfDataPts");
      v7 = 2048;
      v8 = v3;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "data point count, %ld, exceeded maximum, %ld", (uint8_t *)&v5, 0x16u);
    }

    -[RTStateDepiction _performErrorCorrection](self, "_performErrorCorrection");
  }
}

- (void)_performErrorCorrection
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  RTStateDepiction *v19;
  uint64_t v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  int64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = +[RTStateDepiction maximumNumberOfDataPoints](RTStateDepiction, "maximumNumberOfDataPoints");
  if (-[RTStateDepiction numOfDataPts](self, "numOfDataPts") > v3)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[RTStateDepiction clusterState](self, "clusterState", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "histEntryExit_s");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "entry_s");
          if (v12 != -1.0)
          {
            objc_msgSend(v11, "exit_s");
            if (v13 != -1.0)
            {
              objc_msgSend(v11, "exit_s");
              v15 = v14;
              objc_msgSend(v11, "entry_s");
              v17 = (v15 - v16) / 600.0;
              if (v17 > (double)~v8)
              {
                _rt_log_facility_get_os_log(RTLogFacilityStateModel);
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "estimating data point count caused an overflow", buf, 2u);
                }

                -[RTStateDepiction setNumOfDataPts:](self, "setNumOfDataPts:", 0);
                return;
              }
              v8 = (unint64_t)(v17 + (double)v8);
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v7)
          continue;
        break;
      }

      if (v8 > v3)
      {
        _rt_log_facility_get_os_log(RTLogFacilityStateModel);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v27 = v8;
          v28 = 2048;
          v29 = v3;
          _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "estimated data point count, %llu, exceeded maximum, %ld", buf, 0x16u);
        }

        v19 = self;
        v20 = 0;
        goto LABEL_22;
      }
    }
    else
    {

      LODWORD(v8) = 0;
    }
    v20 = (int)v8;
    v19 = self;
LABEL_22:
    -[RTStateDepiction setNumOfDataPts:](v19, "setNumOfDataPts:", v20);
  }
}

+ (double)quantizeTimeIntervalSinceReferenceDate:(double)a3
{
  return floor(a3 / 60.0) * 60.0;
}

- (void)submitEntry:(double)a3 exit:(double)a4
{
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  RTStateModelEntryExit *v11;

  +[RTStateDepiction quantizeTimeIntervalSinceReferenceDate:](RTStateDepiction, "quantizeTimeIntervalSinceReferenceDate:", a3);
  v7 = v6;
  +[RTStateDepiction quantizeTimeIntervalSinceReferenceDate:](RTStateDepiction, "quantizeTimeIntervalSinceReferenceDate:", a4);
  v11 = -[RTStateModelEntryExit initWithEntry:exit:]([RTStateModelEntryExit alloc], "initWithEntry:exit:", v7, v8);
  -[RTStateDepiction clusterState](self, "clusterState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "histEntryExit_s");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

}

- (void)removeEntry:(double)a3 exit:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  RTStateModelEntryExit *v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__121;
  v14 = __Block_byref_object_dispose__121;
  v15 = -[RTStateModelEntryExit initWithEntry:exit:]([RTStateModelEntryExit alloc], "initWithEntry:exit:", a3, a4);
  -[RTStateDepiction clusterState](self, "clusterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "histEntryExit_s");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__RTStateDepiction_removeEntry_exit___block_invoke;
  v9[3] = &unk_1E929CB08;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  -[RTStateDepiction clusterState](self, "clusterState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "histEntryExit_s");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v11[5]);

  _Block_object_dispose(&v10, 8);
}

void __37__RTStateDepiction_removeEntry_exit___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)setLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[RTStateDepiction clusterState](self, "clusterState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLocation:", v4);

  -[RTStateDepiction clusterState](self, "clusterState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "source");

  if ((v8 & 1) != 0)
  {
    -[RTStateDepiction clusterState](self, "clusterState");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "mapItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "latitude");
    -[RTStateDepiction clusterState](self, "clusterState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mapItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "longitude");
    -[RTStateDepiction clusterState](self, "clusterState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "Latitude_deg");
    -[RTStateDepiction clusterState](self, "clusterState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "Longitude_deg");
    RTCommonCalculateDistanceHighPrecision();
    v19 = v18;

    if (v19 > 100.0)
    {
      _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        -[RTStateDepiction clusterState](self, "clusterState");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "mapItem");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "location");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "latitude");
        v26 = v25;
        -[RTStateDepiction clusterState](self, "clusterState");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "mapItem");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "location");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "longitude");
        v31 = v30;
        -[RTStateDepiction clusterState](self, "clusterState");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "location");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134284291;
        v36 = v26;
        v37 = 2049;
        v38 = v31;
        v39 = 2112;
        v40 = v33;
        v41 = 2049;
        v42 = v19;
        _os_log_debug_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEBUG, "underlying location moved from, <%{private}f, %{private}f>, to, %@. The new distance from the location to the mapItem center, %{private}f, resulted in marking the geocoded mapItem dirty", buf, 0x2Au);

      }
      -[RTStateDepiction clusterState](self, "clusterState");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setGeocodeDate:", 0);

    }
  }
}

- (RTStateModelLocation)location
{
  void *v2;
  void *v3;

  -[RTStateDepiction clusterState](self, "clusterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RTStateModelLocation *)v3;
}

- (void)incrementNumOfDataPtsByInteger:(int64_t)a3
{
  int64_t v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  __int16 v9;
  int64_t v10;
  __int16 v11;
  int64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 >= 1)
  {
    v5 = +[RTStateDepiction maximumNumberOfDataPoints](RTStateDepiction, "maximumNumberOfDataPoints");
    if (v5 - -[RTStateDepiction numOfDataPts](self, "numOfDataPts") >= a3)
    {
      -[RTStateDepiction setNumOfDataPts:](self, "setNumOfDataPts:", -[RTStateDepiction numOfDataPts](self, "numOfDataPts") + a3);
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityStateModel);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = 134218496;
        v8 = -[RTStateDepiction numOfDataPts](self, "numOfDataPts");
        v9 = 2048;
        v10 = v5;
        v11 = 2048;
        v12 = a3;
        _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "data point count, %ld, exceeded maximum, %ld, after increment, %ld", (uint8_t *)&v7, 0x20u);
      }

      -[RTStateDepiction setNumOfDataPts:](self, "setNumOfDataPts:", 0x7FFFFFFFLL);
      -[RTStateDepiction _performErrorCorrection](self, "_performErrorCorrection");
    }
  }
}

- (GEOMapItem)geoMapItem
{
  void *v2;
  void *v3;

  -[RTStateDepiction clusterState](self, "clusterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geoMapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOMapItem *)v3;
}

- (void)setGeoMapItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RTStateDepiction clusterState](self, "clusterState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGeoMapItem:", v4);

}

- (RTMapItem)mapItem
{
  void *v2;
  void *v3;

  -[RTStateDepiction clusterState](self, "clusterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (RTMapItem *)v3;
}

- (void)setMapItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RTStateDepiction clusterState](self, "clusterState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMapItem:", v4);

}

- (unint64_t)mapItemSource
{
  void *v2;
  unint64_t v3;

  -[RTStateDepiction clusterState](self, "clusterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mapItemSource");

  return v3;
}

- (void)setMapItemSource:(unint64_t)a3
{
  id v4;

  -[RTStateDepiction clusterState](self, "clusterState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMapItemSource:", a3);

}

- (int64_t)type
{
  void *v2;
  int64_t v3;

  -[RTStateDepiction clusterState](self, "clusterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type");

  return v3;
}

- (void)setType:(int64_t)a3
{
  id v4;

  -[RTStateDepiction clusterState](self, "clusterState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setType:", a3);

}

- (unint64_t)typeSource
{
  void *v2;
  unint64_t v3;

  -[RTStateDepiction clusterState](self, "clusterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "typeSource");

  return v3;
}

- (void)setTypeSource:(unint64_t)a3
{
  id v4;

  -[RTStateDepiction clusterState](self, "clusterState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTypeSource:", a3);

}

- (NSDate)geocodeDate
{
  void *v2;
  void *v3;

  -[RTStateDepiction clusterState](self, "clusterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "geocodeDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (void)setGeocodeDate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RTStateDepiction clusterState](self, "clusterState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGeocodeDate:", v4);

}

- (NSString)customLabel
{
  void *v2;
  void *v3;

  -[RTStateDepiction clusterState](self, "clusterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "customLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setCustomLabel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RTStateDepiction clusterState](self, "clusterState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomLabel:", v4);

}

- (double)getAggTimeScaleFactor:(double)a3 predictionWindow:(double)a4
{
  double result;

  result = 1.0;
  if (a3 > 0.0 && a4 > 0.0 && a4 + 0.000001 >= a3)
    return a3 / (a4 * 0.5) + 0.2;
  return result;
}

- (double)getLastVisit
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[RTStateDepiction lastEntyExit](self, "lastEntyExit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "exit_s");
    v5 = v4;
  }
  else
  {
    v5 = -1.0;
  }

  return v5;
}

- (id)lastEntyExit
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__121;
  v11 = __Block_byref_object_dispose__121;
  v12 = 0;
  -[RTStateDepiction clusterState](self, "clusterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "histEntryExit_s");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__RTStateDepiction_lastEntyExit__block_invoke;
  v6[3] = &unk_1E92A27E0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __32__RTStateDepiction_lastEntyExit__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  v10 = v4;
  if (!v6)
    goto LABEL_4;
  objc_msgSend(v6, "exit_s");
  v8 = v7;
  objc_msgSend(v10, "exit_s");
  if (v8 < v9)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v5 + 40), a2);
  }

}

- (BOOL)cleanState:(double)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  double v19;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[RTStateDepiction clusterState](self, "clusterState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "histEntryExit_s");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __31__RTStateDepiction_cleanState___block_invoke;
  v17 = &unk_1E92A23D8;
  v19 = a3;
  v8 = v5;
  v18 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v14);

  -[RTStateDepiction clusterState](self, "clusterState", v14, v15, v16, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHistEntryExit_s:", v8);

  if (-[RTStateDepiction exemptFromPurge](self, "exemptFromPurge"))
  {
    v10 = 0;
  }
  else
  {
    -[RTStateDepiction clusterState](self, "clusterState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "histEntryExit_s");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v12, "count") == 0;

  }
  return v10;
}

void __31__RTStateDepiction_cleanState___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "exit_s");
  if (v3 >= *(double *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (id)getRecentVisits:(double)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  double v14;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[RTStateDepiction clusterState](self, "clusterState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "histEntryExit_s");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__RTStateDepiction_getRecentVisits___block_invoke;
  v12[3] = &unk_1E92A2808;
  v14 = a3;
  v12[4] = self;
  v8 = v5;
  v13 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __36__RTStateDepiction_getRecentVisits___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  RTStateModelOneVisit *v4;
  void *v5;
  void *v6;
  RTStateModelOneVisit *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "entry_s");
  if (v3 > *(double *)(a1 + 48))
  {
    v4 = [RTStateModelOneVisit alloc];
    objc_msgSend(*(id *)(a1 + 32), "clusterState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[RTStateModelOneVisit initWithLocation:entryExit:andNumOfDataPts:](v4, "initWithLocation:entryExit:andNumOfDataPts:", v6, v8, 0);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }

}

- (id)getAllOneVisits
{
  void *v2;
  void *v3;

  -[RTStateDepiction clusterState](self, "clusterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "histEntryExit_s");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addOneVisitsFromStateDepiction:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  objc_msgSend(a3, "getAllOneVisits");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__RTStateDepiction_addOneVisitsFromStateDepiction___block_invoke;
  v7[3] = &unk_1E92974C8;
  v7[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);
  -[RTStateDepiction clusterState](self, "clusterState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "histEntryExit_s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_93);

}

void __51__RTStateDepiction_addOneVisitsFromStateDepiction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "entry_s");
  v6 = v5;
  objc_msgSend(v3, "exit_s");
  objc_msgSend(v4, "submitEntry:exit:", v6, v7);
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_debug_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_DEBUG, "adding visit, %@, to newly consolidated cluster", (uint8_t *)&v9, 0xCu);
  }

}

uint64_t __51__RTStateDepiction_addOneVisitsFromStateDepiction___block_invoke_227(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "entry_s");
  v6 = v5;
  objc_msgSend(v4, "entry_s");
  v8 = v7;

  if (v6 >= v8)
    return 1;
  else
    return -1;
}

- (unint64_t)getNumOfVisitsOverall
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[RTStateDepiction clusterState](self, "clusterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "histEntryExit_s");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)getAggStateStat
{
  RTStateDepictionAggStateStats *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  unint64_t v19;

  v3 = objc_alloc_init(RTStateDepictionAggStateStats);
  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0xBFF0000000000000;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0xBFF0000000000000;
  -[RTStateDepiction clusterState](self, "clusterState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "histEntryExit_s");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __35__RTStateDepiction_getAggStateStat__block_invoke;
  v11[3] = &unk_1E92A2428;
  v11[4] = &v12;
  v11[5] = &v16;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  -[RTStateDepictionAggStateStats setAggregateTime_s:](v3, "setAggregateTime_s:", v13[3]);
  -[RTStateDepictionAggStateStats setLastExit_s:](v3, "setLastExit_s:", v17[3]);
  -[RTStateDepiction clusterState](self, "clusterState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTStateDepictionAggStateStats setLocation:](v3, "setLocation:", v7);

  -[RTStateDepiction clusterState](self, "clusterState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "histEntryExit_s");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTStateDepictionAggStateStats setNumOfEntries:](v3, "setNumOfEntries:", objc_msgSend(v9, "count"));

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v3;
}

void __35__RTStateDepiction_getAggStateStat__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "exit_s");
  v4 = v3;
  objc_msgSend(v8, "entry_s");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4
                                                              - v5
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  objc_msgSend(v8, "exit_s");
  if (v6 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v8, "exit_s");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
  }

}

- (void)showState
{
  void *v2;
  void *v3;
  NSObject *v4;
  double v5;
  _QWORD v6[5];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[RTStateDepiction clusterState](self, "clusterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "histEntryExit_s");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__RTStateDepiction_showState__block_invoke;
  v6[3] = &unk_1E92A27E0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = v8[3] / 60.0;
    *(_DWORD *)buf = 134217984;
    v12 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "total duration in state, %.2f [min]", buf, 0xCu);
  }

  _Block_object_dispose(&v7, 8);
}

void __29__RTStateDepiction_showState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  double v7;
  double v8;
  double v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityStateModel);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134218242;
    v11 = a3 + 1;
    v12 = 2112;
    v13 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "visit %lu, %@", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(v5, "exit_s");
  v8 = v7;
  objc_msgSend(v5, "entry_s");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8
                                                              - v9
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);

}

- (id)getEarliestLatestEntry
{
  void *v2;
  void *v3;
  RTStateModelEarliestLatestEl *v4;
  RTStateModelEarliestLatestEl *v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0x426D1A94A2000000;
  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0xC26D1A94A2000000;
  -[RTStateDepiction clusterState](self, "clusterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "histEntryExit_s");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__RTStateDepiction_getEarliestLatestEntry__block_invoke;
  v7[3] = &unk_1E92A2428;
  v7[4] = &v12;
  v7[5] = &v8;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  v4 = [RTStateModelEarliestLatestEl alloc];
  v5 = -[RTStateModelEarliestLatestEl initWithEarliest:andLatest:](v4, "initWithEarliest:andLatest:", v13[3], v9[3]);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

void __42__RTStateDepiction_getEarliestLatestEntry__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "entry_s");
  if (v3 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(v7, "entry_s");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  }
  objc_msgSend(v7, "exit_s");
  if (v5 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(v7, "entry_s");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  }

}

- (id)getGetWeeklyStats:(double)a3 numOfWeeks:(int)a4 uniqueID:(id)a5
{
  void *v8;
  void *v9;
  double Current;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  char v18;
  double v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  int v24;
  double v25;
  double v26;
  BOOL v27;
  double v28;
  double v29;
  BOOL v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  NSObject *v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  char v46;
  void *v47;
  double v48;
  double v49;
  RTStateWeeklyStatisticsEl *v50;
  RTStateWeeklyStatisticsEl *v51;
  int v52;
  double v53;
  BOOL v54;
  unint64_t v55;
  double v56;
  void *v57;
  float v58;
  float v59;
  float v60;
  double v62;
  double v63;
  double v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  _QWORD v69[10];
  uint64_t v70;
  double *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  double *v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[7];
  uint64_t v83;
  int *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  _BYTE buf[24];
  uint64_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v65 = a5;
  -[RTStateDepiction clusterState](self, "clusterState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "histEntryExit_s");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_231);

  Current = CFAbsoluteTimeGetCurrent();
  -[RTStateDepiction clusterState](self, "clusterState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "histEntryExit_s");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "nextObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (double)a4;
  v15 = Current + (double)a4 * -604800.0 + -86400.0;
  v64 = 1.0e12;
  if (v14)
  {
    while (1)
    {
      objc_msgSend(v14, "exit_s");
      if (v16 >= v15)
        break;
      objc_msgSend(v13, "nextObject");
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v17;
      if (!v17)
        goto LABEL_4;
    }
    objc_msgSend(v14, "entry_s");
    v64 = v19;
    v18 = 0;
  }
  else
  {
LABEL_4:
    v18 = 1;
  }
  -[RTStateDepiction clusterState](self, "clusterState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "histEntryExit_s");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lastObject");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
    objc_msgSend(v66, "exit_s");
  else
    *(double *)&v22 = -1.0e12;
  v62 = *(double *)&v22;
  v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v67 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((v18 & 1) != 0)
  {
LABEL_35:
    v14 = 0;
  }
  else
  {
    v24 = 0;
    while (1)
    {
      objc_msgSend(v14, "exit_s");
      if (v25 >= a3)
        break;
      v26 = v15 + 86400.0;
      if (v14)
      {
        v27 = 0;
        v28 = 0.0;
        do
        {
          objc_msgSend(v14, "entry_s");
          v30 = v27 || v29 >= v26;
          if (v27 || v29 >= v26)
            break;
          objc_msgSend(v14, "exit_s");
          if (v15 >= v31)
          {
            objc_msgSend(v13, "nextObject");
            v41 = objc_claimAutoreleasedReturnValue();

            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "-[RTStateDepiction getGetWeeklyStats:numOfWeeks:uniqueID:]";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 813;
              _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "HomeWork detection entry is inconsistent - should not happen (in %s:%d)", buf, 0x12u);
            }
            v27 = 0;
            v14 = (void *)v41;
          }
          else
          {
            v32 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v14, "exit_s");
            v34 = v33;
            objc_msgSend(v14, "entry_s");
            v36 = v34 - v35;
            *(float *)&v36 = v36;
            objc_msgSend(v32, "numberWithFloat:", v36);
            v37 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v37);
            objc_msgSend(v14, "entry_s");
            if (v15 >= v38)
            {
              v40 = v15;
            }
            else
            {
              objc_msgSend(v14, "entry_s");
              v40 = v39;
              ++v24;
            }
            objc_msgSend(v14, "exit_s");
            v27 = v26 < v42;
            if (v26 < v42)
            {
              v44 = v15 + 86400.0;
            }
            else
            {
              objc_msgSend(v14, "exit_s");
              v44 = v43;
              objc_msgSend(v13, "nextObject");
              v45 = objc_claimAutoreleasedReturnValue();

              v14 = (void *)v45;
            }
            v28 = v28 + v44 - v40;
          }

        }
        while (v14);
        v46 = !v30;
      }
      else
      {
        v46 = 1;
        v28 = 0.0;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "addObject:", v47);

      if (objc_msgSend(v68, "count") == 7)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v92 = 0;
        v87 = 0;
        v88 = &v87;
        v89 = 0x2020000000;
        v90 = 0;
        v83 = 0;
        v84 = (int *)&v83;
        v85 = 0x2020000000;
        LODWORD(v86) = 0;
        v82[0] = MEMORY[0x1E0C809B0];
        v82[1] = 3221225472;
        v82[2] = __58__RTStateDepiction_getGetWeeklyStats_numOfWeeks_uniqueID___block_invoke_233;
        v82[3] = &unk_1E92A2350;
        v82[4] = &v83;
        v82[5] = buf;
        v82[6] = &v87;
        objc_msgSend(v68, "enumerateObjectsUsingBlock:", v82);
        if (v84[6] < 1)
        {
          v49 = -1.0;
          v48 = 0.0;
        }
        else
        {
          v48 = *(double *)(*(_QWORD *)&buf[8] + 24) / 7.0;
          v49 = sqrt(fabs(*((double *)v88 + 3) / 7.0 - v48 * v48));
        }
        v50 = objc_alloc_init(RTStateWeeklyStatisticsEl);
        -[RTStateWeeklyStatisticsEl setAvgAggTime_s:](v50, "setAvgAggTime_s:", v48);
        -[RTStateWeeklyStatisticsEl setStdAggTime_s:](v50, "setStdAggTime_s:", v49);
        -[RTStateWeeklyStatisticsEl setDaysPerWeek:](v50, "setDaysPerWeek:", (double)v84[6]);
        -[RTStateWeeklyStatisticsEl setNumOfClustEntPerWeek:](v50, "setNumOfClustEntPerWeek:", (double)v24);
        objc_msgSend(v67, "addObject:", v50);
        objc_msgSend(v68, "removeAllObjects");

        _Block_object_dispose(&v83, 8);
        _Block_object_dispose(&v87, 8);
        _Block_object_dispose(buf, 8);
        v24 = 0;
      }
      v15 = v15 + 86400.0;
      if ((v46 & 1) != 0)
        goto LABEL_35;
    }
  }
  v51 = objc_alloc_init(RTStateWeeklyStatisticsEl);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LODWORD(v92) = 0;
  v87 = 0;
  v88 = &v87;
  v89 = 0x2020000000;
  LODWORD(v90) = 0;
  v83 = 0;
  v84 = (int *)&v83;
  v85 = 0x2020000000;
  v86 = 0;
  v78 = 0;
  v79 = (double *)&v78;
  v80 = 0x2020000000;
  v81 = 0;
  v74 = 0;
  v75 = (int *)&v74;
  v76 = 0x2020000000;
  v77 = 0;
  v70 = 0;
  v71 = (double *)&v70;
  v72 = 0x2020000000;
  v73 = 0;
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __58__RTStateDepiction_getGetWeeklyStats_numOfWeeks_uniqueID___block_invoke_2;
  v69[3] = &unk_1E92A2870;
  v69[4] = &v87;
  v69[5] = &v83;
  v69[6] = &v78;
  v69[7] = &v74;
  v69[8] = &v70;
  v69[9] = buf;
  objc_msgSend(v67, "enumerateObjectsUsingBlock:", v69);
  v52 = *((_DWORD *)v88 + 6);
  if (v52 < 1 || ((v53 = (v62 - v64) / 604800.0, (double)v52 / v63 > 0.6) ? (v54 = v53 <= 2.0) : (v54 = 1), v54))
  {
    -[RTStateWeeklyStatisticsEl setAvgAggTime_s:](v51, "setAvgAggTime_s:", 0.0);
    -[RTStateWeeklyStatisticsEl setStdAggTime_s:](v51, "setStdAggTime_s:", -1.0);
    -[RTStateWeeklyStatisticsEl setDaysPerWeek:](v51, "setDaysPerWeek:", 0.0);
    -[RTStateWeeklyStatisticsEl setNumOfClustEntPerWeek:](v51, "setNumOfClustEntPerWeek:", 0.0);
LABEL_45:
    -[RTStateWeeklyStatisticsEl setTopMedian:](v51, "setTopMedian:", 0.0);
    goto LABEL_51;
  }
  -[RTStateWeeklyStatisticsEl setAvgAggTime_s:](v51, "setAvgAggTime_s:", *((double *)v84 + 3) / (double)v52);
  -[RTStateWeeklyStatisticsEl setStdAggTime_s:](v51, "setStdAggTime_s:", v79[3] / (double)*((int *)v88 + 6));
  -[RTStateWeeklyStatisticsEl setDaysPerWeek:](v51, "setDaysPerWeek:", (double)v75[6] / (double)*((int *)v88 + 6));
  -[RTStateWeeklyStatisticsEl setNumOfClustEntPerWeek:](v51, "setNumOfClustEntPerWeek:", v71[3] / (double)*((int *)v88 + 6));
  objc_msgSend(v23, "sortUsingComparator:", &__block_literal_global_235_0);
  v55 = objc_msgSend(v23, "count");
  v56 = floor(v53 * 0.5);
  if (v56 <= (double)v55)
  {
    if (v56 > 1.0)
    {
      objc_msgSend(v23, "objectAtIndex:", (unint64_t)v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "floatValue");
      -[RTStateWeeklyStatisticsEl setTopMedian:](v51, "setTopMedian:", v58);
LABEL_50:

      goto LABEL_51;
    }
    if ((unint64_t)objc_msgSend(v23, "count") >= 3)
    {
      objc_msgSend(v23, "objectAtIndex:", 2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "floatValue");
      -[RTStateWeeklyStatisticsEl setTopMedian:](v51, "setTopMedian:", v59);
      goto LABEL_50;
    }
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(v23, "objectAtIndex:", objc_msgSend(v23, "count") - 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "floatValue");
      -[RTStateWeeklyStatisticsEl setTopMedian:](v51, "setTopMedian:", v60);
      goto LABEL_50;
    }
    goto LABEL_45;
  }
LABEL_51:
  -[RTStateWeeklyStatisticsEl setStateUUID:](v51, "setStateUUID:", v65);
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(buf, 8);

  return v51;
}

uint64_t __58__RTStateDepiction_getGetWeeklyStats_numOfWeeks_uniqueID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "entry_s");
  v6 = v5;
  objc_msgSend(v4, "entry_s");
  v8 = v7;

  if (v6 >= v8)
    return 1;
  else
    return -1;
}

void __58__RTStateDepiction_getGetWeeklyStats_numOfWeeks_uniqueID___block_invoke_233(_QWORD *a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "doubleValue");
  if (v3 > 0.0)
  {
    ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    objc_msgSend(v8, "doubleValue");
    *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v4 + *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
    objc_msgSend(v8, "doubleValue");
    v6 = v5;
    objc_msgSend(v8, "doubleValue");
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = *(double *)(*(_QWORD *)(a1[6] + 8) + 24) + v6 * v7;
  }

}

void __58__RTStateDepiction_getGetWeeklyStats_numOfWeeks_uniqueID___block_invoke_2(_QWORD *a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "stdAggTime_s");
  if (v3 <= 0.0)
  {
    ++*(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
  }
  else
  {
    ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    objc_msgSend(v8, "avgAggTime_s");
    *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v4 + *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
    objc_msgSend(v8, "stdAggTime_s");
    *(double *)(*(_QWORD *)(a1[6] + 8) + 24) = v5 + *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
    objc_msgSend(v8, "daysPerWeek");
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = (int)(v6 + (double)*(int *)(*(_QWORD *)(a1[7] + 8) + 24));
    objc_msgSend(v8, "numOfClustEntPerWeek");
    *(double *)(*(_QWORD *)(a1[8] + 8) + 24) = v7 + *(double *)(*(_QWORD *)(a1[8] + 8) + 24);
  }

}

uint64_t __58__RTStateDepiction_getGetWeeklyStats_numOfWeeks_uniqueID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;

  v4 = a3;
  objc_msgSend(a2, "floatValue");
  v6 = v5;
  objc_msgSend(v4, "floatValue");
  v8 = v7;

  if (v6 <= v8)
    return 1;
  else
    return -1;
}

- (id)getPredState:(double)a3 predictionWindow:(double)a4 numOfWeeks:(int)a5 uniqueID:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  BOOL v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int v27;
  double v28;
  double v29;
  double v30;
  BOOL v31;
  int v32;
  double v33;
  BOOL v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  char v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  int v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  BOOL v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  RTStateDepcitionOneStatePred *v69;
  double v70;
  BOOL v71;
  int v72;
  double v73;
  BOOL v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  uint64_t v80;
  double v81;
  uint64_t v82;
  char v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  int v91;
  double v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  RTStateDepcitionOneStatePred *v100;
  double v102;
  id v103;
  int v104;
  RTStateDepiction *v105;
  id v106;
  id v107;
  id v108;
  id v109;
  RTStateDepcitionOneStatePred *v110;
  double v111;
  _QWORD v112[6];
  _QWORD v113[3];
  int v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  int v118;
  _QWORD v119[6];
  _QWORD v120[3];
  int v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  int v125;

  v103 = a6;
  v110 = objc_alloc_init(RTStateDepcitionOneStatePred);
  v104 = a5;
  v10 = -a5;
  v11 = 7 * (int)v10;
  v111 = a3;
  +[RTStateModelAlgorithms timeByAddingUnit:value:toTime:](RTStateModelAlgorithms, "timeByAddingUnit:value:toTime:", 16, v11, a3);
  v13 = v12;
  -[RTStateDepiction clusterState](self, "clusterState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "histEntryExit_s");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sortUsingComparator:", &__block_literal_global_238);

  v105 = self;
  -[RTStateDepiction clusterState](self, "clusterState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "histEntryExit_s");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectEnumerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "nextObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    do
    {
      objc_msgSend(v19, "exit_s");
      v21 = v20 < v13;
      if (v20 >= v13)
        break;
      objc_msgSend(v18, "nextObject");
      v22 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v22;
    }
    while (v22);
  }
  else
  {
    v21 = 1;
  }
  v102 = a4;
  v23 = v13 + a4;
  v109 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v108 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v21)
  {
    v19 = 0;
    v24 = 0.0;
    v25 = 1.0e12;
    v26 = -1.0e12;
    v27 = v104;
  }
  else
  {
    v24 = 0.0;
    v25 = 1.0e12;
    v26 = -1.0e12;
    v28 = v23;
    v29 = v13;
    while (1)
    {
      objc_msgSend(v19, "exit_s");
      if (v30 >= v111)
        break;
      if (v19)
      {
        v31 = 0;
        v32 = 0;
        do
        {
          objc_msgSend(v19, "entry_s");
          v34 = v31 || v33 >= v28;
          if (v31 || v33 >= v28)
            break;
          objc_msgSend(v19, "exit_s");
          if (v29 >= v35)
          {
            objc_msgSend(v18, "nextObject");
            v40 = objc_claimAutoreleasedReturnValue();

            v31 = 0;
            v19 = (void *)v40;
          }
          else
          {
            objc_msgSend(v19, "entry_s");
            v36 = v29;
            if (v29 < v37)
            {
              objc_msgSend(v19, "entry_s");
              v36 = v38;
            }
            objc_msgSend(v19, "exit_s");
            v31 = v28 < v39;
            if (v28 < v39)
            {
              v26 = v28;
            }
            else
            {
              objc_msgSend(v19, "exit_s");
              v26 = v41;
              objc_msgSend(v18, "nextObject");
              v42 = objc_claimAutoreleasedReturnValue();

              v19 = (void *)v42;
            }
            v24 = v24 + v26 - v36;
            ++v32;
            if (v36 < v25)
              v25 = v36;
          }
        }
        while (v19);
        v43 = !v34;
        if (v32 >= 1)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "addObject:", v44);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "addObject:", v45);

        }
      }
      else
      {
        v43 = 1;
      }
      +[RTStateModelAlgorithms timeByAddingUnit:value:toTime:](RTStateModelAlgorithms, "timeByAddingUnit:value:toTime:", 16, 7, v29);
      v29 = v46;
      +[RTStateModelAlgorithms timeByAddingUnit:value:toTime:](RTStateModelAlgorithms, "timeByAddingUnit:value:toTime:", 16, 7, v28);
      v28 = v47;
      v10 = (v10 + 1);
      if ((v43 & 1) != 0)
      {
        v19 = 0;
        break;
      }
    }
    v27 = v104;
  }
  v122 = 0;
  v123 = &v122;
  v124 = 0x2020000000;
  v125 = 0;
  v120[0] = 0;
  v120[1] = v120;
  v120[2] = 0x2020000000;
  v121 = 0;
  v119[0] = MEMORY[0x1E0C809B0];
  v119[1] = 3221225472;
  v119[2] = __70__RTStateDepiction_getPredState_predictionWindow_numOfWeeks_uniqueID___block_invoke_2;
  v119[3] = &unk_1E92A2428;
  v119[4] = &v122;
  v119[5] = v120;
  objc_msgSend(v109, "enumerateObjectsUsingBlock:", v119);
  if (v27 < 1)
  {
    v52 = 0.0;
    v49 = 0.0;
  }
  else
  {
    v48 = (double)v27;
    v49 = v24 / (double)v27;
    v50 = *((_DWORD *)v123 + 6);
    -[RTStateDepiction getAggTimeScaleFactor:predictionWindow:](v105, "getAggTimeScaleFactor:predictionWindow:", v49, v102);
    v52 = v51 * ((double)v50 / v48);
  }
  -[RTStateDepcitionOneStatePred weekly](v110, "weekly");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setNumOfClustEntries:", *((unsigned int *)v123 + 6));

  -[RTStateDepcitionOneStatePred weekly](v110, "weekly");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setLatestVisitTime_s:", v26);

  -[RTStateDepcitionOneStatePred weekly](v110, "weekly");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setAggregateTime_s:", v49);

  -[RTStateDepcitionOneStatePred weekly](v110, "weekly");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setEarliestVisitTime_s:", v25);

  -[RTStateDepcitionOneStatePred weekly](v110, "weekly");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setVisitHist:", v108);

  -[RTStateDepcitionOneStatePred weekly](v110, "weekly");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setDensity:", v52);

  -[RTStateDepiction clusterState](v105, "clusterState");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "histEntryExit_s");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "objectEnumerator");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v61, "nextObject");
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    do
    {
      objc_msgSend(v62, "exit_s");
      v64 = v63 < v13;
      if (v63 >= v13)
        break;
      objc_msgSend(v61, "nextObject");
      v65 = objc_claimAutoreleasedReturnValue();

      v62 = (void *)v65;
    }
    while (v65);
  }
  else
  {
    v64 = 1;
  }
  v107 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v106 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v64)
  {
    v62 = 0;
    v66 = 0.0;
    v67 = 1.0e12;
    v68 = -1.0e12;
    v69 = v110;
  }
  else
  {
    v66 = 0.0;
    v67 = 1.0e12;
    v68 = -1.0e12;
    v69 = v110;
    while (1)
    {
      objc_msgSend(v62, "exit_s");
      if (v70 >= v111)
        break;
      if (v62)
      {
        v71 = 0;
        v72 = 0;
        do
        {
          objc_msgSend(v62, "entry_s");
          v74 = v71 || v73 >= v23;
          if (v71 || v73 >= v23)
            break;
          objc_msgSend(v62, "exit_s");
          if (v13 >= v75)
          {
            objc_msgSend(v61, "nextObject");
            v80 = objc_claimAutoreleasedReturnValue();

            v71 = 0;
            v62 = (void *)v80;
          }
          else
          {
            objc_msgSend(v62, "entry_s");
            v76 = v13;
            if (v13 < v77)
            {
              objc_msgSend(v62, "entry_s");
              v76 = v78;
            }
            objc_msgSend(v62, "exit_s");
            v71 = v23 < v79;
            if (v23 < v79)
            {
              v68 = v23;
            }
            else
            {
              objc_msgSend(v62, "exit_s");
              v68 = v81;
              objc_msgSend(v61, "nextObject");
              v82 = objc_claimAutoreleasedReturnValue();

              v62 = (void *)v82;
            }
            v66 = v66 + v68 - v76;
            ++v72;
            if (v76 < v67)
              v67 = v76;
          }
        }
        while (v62);
        v83 = !v74;
        if (v72 >= 1)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v107, "addObject:", v84);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v11);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "addObject:", v85);

        }
      }
      else
      {
        v83 = 1;
      }
      +[RTStateModelAlgorithms timeByAddingUnit:value:toTime:](RTStateModelAlgorithms, "timeByAddingUnit:value:toTime:", 16, 1, v13);
      v87 = v86;
      +[RTStateModelAlgorithms timeByAddingUnit:value:toTime:](RTStateModelAlgorithms, "timeByAddingUnit:value:toTime:", 16, 1, v23);
      v13 = v13 + v87;
      v23 = v23 + v88;
      ++v11;
      if ((v83 & 1) != 0)
      {
        v62 = 0;
        break;
      }
    }
  }
  v115 = 0;
  v116 = &v115;
  v117 = 0x2020000000;
  v118 = 0;
  v113[0] = 0;
  v113[1] = v113;
  v113[2] = 0x2020000000;
  v114 = 0;
  v112[0] = MEMORY[0x1E0C809B0];
  v112[1] = 3221225472;
  v112[2] = __70__RTStateDepiction_getPredState_predictionWindow_numOfWeeks_uniqueID___block_invoke_3;
  v112[3] = &unk_1E92A2428;
  v112[4] = &v115;
  v112[5] = v113;
  objc_msgSend(v107, "enumerateObjectsUsingBlock:", v112);
  if (v104 < 1)
  {
    v93 = 0.0;
    v90 = 0.0;
  }
  else
  {
    v89 = (double)(7 * v104);
    v90 = v66 / v89;
    v91 = *((_DWORD *)v116 + 6);
    -[RTStateDepiction getAggTimeScaleFactor:predictionWindow:](v105, "getAggTimeScaleFactor:predictionWindow:", v66 / v89, v102);
    v93 = v92 * ((double)v91 / v89);
  }
  -[RTStateDepcitionOneStatePred daily](v69, "daily");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "setNumOfClustEntries:", *((unsigned int *)v116 + 6));

  -[RTStateDepcitionOneStatePred daily](v69, "daily");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "setLatestVisitTime_s:", v68);

  -[RTStateDepcitionOneStatePred daily](v69, "daily");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "setAggregateTime_s:", v90);

  -[RTStateDepcitionOneStatePred daily](v69, "daily");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "setEarliestVisitTime_s:", v67);

  -[RTStateDepcitionOneStatePred daily](v69, "daily");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "setVisitHist:", v106);

  -[RTStateDepcitionOneStatePred daily](v69, "daily");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "setDensity:", v93);

  -[RTStateDepcitionOneStatePred setStateUUID:](v69, "setStateUUID:", v103);
  v100 = v69;
  _Block_object_dispose(v113, 8);
  _Block_object_dispose(&v115, 8);

  _Block_object_dispose(v120, 8);
  _Block_object_dispose(&v122, 8);

  return v100;
}

uint64_t __70__RTStateDepiction_getPredState_predictionWindow_numOfWeeks_uniqueID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "entry_s");
  v6 = v5;
  objc_msgSend(v4, "entry_s");
  v8 = v7;

  if (v6 >= v8)
    return 1;
  else
    return -1;
}

uint64_t __70__RTStateDepiction_getPredState_predictionWindow_numOfWeeks_uniqueID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "intValue");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

uint64_t __70__RTStateDepiction_getPredState_predictionWindow_numOfWeeks_uniqueID___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "intValue");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)removeAllVisitsExceptMostRecent
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__121;
  v14 = __Block_byref_object_dispose__121;
  v15 = 0;
  -[RTStateDepiction clusterState](self, "clusterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "histEntryExit_s");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__RTStateDepiction_removeAllVisitsExceptMostRecent__block_invoke;
  v9[3] = &unk_1E929CB08;
  v9[4] = &v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[RTStateDepiction clusterState](self, "clusterState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHistEntryExit_s:", v5);

  if (v11[5])
  {
    -[RTStateDepiction clusterState](self, "clusterState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "histEntryExit_s");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11[5]);

  }
  _Block_object_dispose(&v10, 8);

}

void __51__RTStateDepiction_removeAllVisitsExceptMostRecent__block_invoke(uint64_t a1, void *a2)
{
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "exit_s");
  v5 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "exit_s");
  if (v5 > v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

- (BOOL)exemptFromPurge
{
  void *v2;
  void *v3;
  BOOL v4;

  -[RTStateDepiction clusterState](self, "clusterState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "source") & 0xC) != 0;

  return v4;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[RTStateDepiction clusterState](self, "clusterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)numOfDataPts
{
  return self->_numOfDataPts;
}

- (void)setNumOfDataPts:(int64_t)a3
{
  self->_numOfDataPts = a3;
}

- (RTStateDepictionOneState)clusterState
{
  return self->_clusterState;
}

- (void)setClusterState:(id)a3
{
  objc_storeStrong((id *)&self->_clusterState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterState, 0);
}

- (double)calculateStandardDeviationWithOptions:(id)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
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
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  double v25;
  double v26;

  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  if (!a3)
  {
    v8 = objc_opt_new();

    v7 = (void *)v8;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("RTMetricStandardDeviationOptionsTransitionTypeKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(v7, "setObject:forKey:", &unk_1E9328C70, CFSTR("RTMetricStandardDeviationOptionsTransitionTypeKey"));
  objc_msgSend(v7, "objectForKey:", CFSTR("RTMetricStandardDeviationOptionsMinimumVisitsKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    objc_msgSend(v7, "setObject:forKey:", &unk_1E9328C88, CFSTR("RTMetricStandardDeviationOptionsMinimumVisitsKey"));
  objc_msgSend(v7, "objectForKey:", CFSTR("RTMetricStandardDeviationOptionsIncludeOutliersKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(v7, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("RTMetricStandardDeviationOptionsIncludeOutliersKey"));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "components:fromDate:", 2097404, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setHour:", 0);
  objc_msgSend(v14, "setMinute:", 0);
  objc_msgSend(v14, "setSecond:", 0);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimeZone:", v16);

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dateFromComponents:", v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v18, CFSTR("RTMetricStandardDeviationOptionsReferenceDateKey"));

  -[RTStateDepictionOneState histEntryExit_s](self->_clusterState, "histEntryExit_s");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTStateDepiction _filterEntryExitData:options:](self, "_filterEntryExitData:options:", v19, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTStateDepiction _referenceAdjustEntryExitDates:options:](self, "_referenceAdjustEntryExitDates:options:", v20, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("RTMetricStandardDeviationOptionsIncludeOutliersKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  if ((v23 & 1) == 0)
  {
    -[RTStateDepiction _excludeEntryExitOutlierDates:options:](self, "_excludeEntryExitOutlierDates:options:", v21, v7);
    v24 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v24;
  }
  -[RTStateDepiction _calculateStandardDeviationForDates:options:error:](self, "_calculateStandardDeviationForDates:options:error:", v21, v7, a4);
  v26 = v25;

  return v26;
}

- (id)_referenceAdjustEntryExitDates:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("RTMetricStandardDeviationOptionsReferenceDateKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "components:fromDate:", 2097404, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__RTStateDepiction_RTMetricManager___referenceAdjustEntryExitDates_options___block_invoke;
  v17[3] = &unk_1E92973B8;
  v18 = v10;
  v12 = v11;
  v19 = v12;
  v13 = v10;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v17);

  v14 = v19;
  v15 = v12;

  return v15;
}

void __76__RTStateDepiction_RTMetricManager___referenceAdjustEntryExitDates_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a2;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 2097404, v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setMonth:", objc_msgSend(*(id *)(a1 + 32), "month"));
  objc_msgSend(v8, "setDay:", objc_msgSend(*(id *)(a1 + 32), "day"));
  objc_msgSend(v8, "setYear:", objc_msgSend(*(id *)(a1 + 32), "year"));
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
}

- (double)_calculateStandardDeviationForDates:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  double v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  double v21;
  double v22;
  id v23;
  double v24;
  unint64_t v25;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  double v30;
  uint64_t v31;
  double *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("RTMetricStandardDeviationOptionsMinimumVisitsKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    if (objc_msgSend(v7, "count") >= v10)
    {
      v38 = 0;
      v39 = (double *)&v38;
      v40 = 0x2020000000;
      v41 = 0;
      objc_msgSend(v8, "objectForKey:", CFSTR("RTMetricStandardDeviationOptionsReferenceDateKey"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __87__RTStateDepiction_RTMetricManager___calculateStandardDeviationForDates_options_error___block_invoke;
      v35[3] = &unk_1E92A2900;
      v37 = &v38;
      v20 = v18;
      v36 = v20;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v35);
      v21 = v39[3];
      v31 = 0;
      v32 = (double *)&v31;
      v22 = v21 / (double)(unint64_t)objc_msgSend(v7, "count");
      v33 = 0x2020000000;
      v34 = 0;
      v27[0] = v19;
      v27[1] = 3221225472;
      v27[2] = __87__RTStateDepiction_RTMetricManager___calculateStandardDeviationForDates_options_error___block_invoke_2;
      v27[3] = &unk_1E92A2928;
      v23 = v20;
      v28 = v23;
      v29 = &v31;
      v30 = v22;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v27);
      v24 = v32[3];
      v25 = objc_msgSend(v7, "count");

      _Block_object_dispose(&v31, 8);
      v11 = round(sqrt(v24 / (double)v25));
      _Block_object_dispose(&v38, 8);
    }
    else
    {
      v11 = -1.0;
      if (a5)
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v42 = *MEMORY[0x1E0CB2D50];
        v13 = CFSTR("dates");
        if (v10 == 1)
          v13 = CFSTR("date");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Calculating the standard deviation requires at least %lu %@."), v10, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 7, v15);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    v11 = -1.0;
    if (a5)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v44 = *MEMORY[0x1E0CB2D50];
      v45[0] = CFSTR("Calculating the standard deviation requires at least one date.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("RTMetricManagerErrorDomain"), 7, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v11;
}

double __87__RTStateDepiction_RTMetricManager___calculateStandardDeviationForDates_options_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

double __87__RTStateDepiction_RTMetricManager___calculateStandardDeviationForDates_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  uint64_t v4;
  double result;

  objc_msgSend(a2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  result = (v3 - *(double *)(a1 + 48)) * (v3 - *(double *)(a1 + 48)) + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

- (id)_filterEntryExitData:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  uint64_t v26;
  uint8_t buf[16];
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("RTMetricStandardDeviationOptionsTransitionTypeKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v6, "objectForKey:", CFSTR("RTMetricStandardDeviationOptionsMinimumVisitsKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    v12 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __66__RTStateDepiction_RTMetricManager___filterEntryExitData_options___block_invoke;
    v28[3] = &unk_1E92A2950;
    v30 = v9;
    v13 = v7;
    v29 = v13;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v28);
    objc_msgSend(v6, "objectForKey:", CFSTR("RTMetricStandardDeviationOptionsWeekdayKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Options specified calculation of weekly pattern type but didn't specify the weekday.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Options specified calculation of weekly pattern type but didn't specify the weekday."));
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("RTMetricStandardDeviationOptionsWeekdayKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");

    v21 = v12;
    v22 = 3221225472;
    v23 = __66__RTStateDepiction_RTMetricManager___filterEntryExitData_options___block_invoke_319;
    v24 = &unk_1E92A23D8;
    v25 = (id)objc_opt_new();
    v26 = v17;
    v18 = v25;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v21);
    objc_msgSend(v13, "removeObjectsInArray:", v18, v21, v22, v23, v24);
    if (objc_msgSend(v13, "count") >= v11)
      v19 = v13;
    else
      v19 = 0;

  }
  else
  {
    v19 = v7;
  }

  return v19;
}

void __66__RTStateDepiction_RTMetricManager___filterEntryExitData_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x1E0C99D68];
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(a2, "exit_s");
  else
    objc_msgSend(a2, "entry_s");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __66__RTStateDepiction_RTMetricManager___filterEntryExitData_options___block_invoke_319(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 512, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "weekday") != *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (id)_excludeEntryExitOutlierDates:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  _DWORD *v12;
  _DWORD *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  unint64_t v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _DWORD *v47;
  uint64_t v48;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  if (!objc_msgSend(v7, "count"))
    goto LABEL_11;
  objc_msgSend(v6, "objectForKey:", CFSTR("RTMetricStandardDeviationOptionsMinimumVisitsKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("RTMetricStandardDeviationOptionsOutlierTimeIntervalKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  v12 = malloc_type_calloc(0x18uLL, 4uLL, 0x100004052888210uLL);
  if (v12)
  {
    v13 = v12;
    v37 = v9;
    v38 = v7;
    v14 = (double)v11;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v6;
    objc_msgSend(v6, "objectForKey:", CFSTR("RTMetricStandardDeviationOptionsReferenceDateKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "components:fromDate:", 2097404, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setHour:", 0);
    objc_msgSend(v17, "setMinute:", 0);
    objc_msgSend(v17, "setSecond:", 0);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timeZone");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTimeZone:", v19);

    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(v17, "setHour:", v21);
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dateFromComponents:", v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "dateByAddingTimeInterval:", v14);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v23;
      v44[1] = 3221225472;
      v44[2] = __75__RTStateDepiction_RTMetricManager___excludeEntryExitOutlierDates_options___block_invoke;
      v44[3] = &unk_1E92A2978;
      v45 = v25;
      v46 = v26;
      v47 = v13;
      v48 = v21;
      v27 = v26;
      v28 = v25;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v44);
      if (v13[v21] > v22)
      {
        v22 = v13[v21];
        v20 = v21;
      }

      ++v21;
    }
    while (v21 != 24);
    v7 = v38;
    if (v22)
    {
      objc_msgSend(v17, "setHour:", v20);
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "dateFromComponents:", v17);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "dateByAddingTimeInterval:", v14);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v40[0] = v23;
      v40[1] = 3221225472;
      v40[2] = __75__RTStateDepiction_RTMetricManager___excludeEntryExitOutlierDates_options___block_invoke_2;
      v40[3] = &unk_1E92A0B98;
      v41 = v30;
      v42 = v31;
      v43 = (id)objc_claimAutoreleasedReturnValue();
      v32 = v43;
      v33 = v31;
      v34 = v30;
      objc_msgSend(v38, "enumerateObjectsUsingBlock:", v40);
      objc_msgSend(v38, "removeObjectsInArray:", v32);

    }
    free(v13);

    v6 = v39;
    v9 = v37;
  }
  if (objc_msgSend(v7, "count") >= v9)
    v35 = v7;
  else
LABEL_11:
    v35 = 0;

  return v35;
}

uint64_t __75__RTStateDepiction_RTMetricManager___excludeEntryExitOutlierDates_options___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "betweenDate:andDate:", a1[4], a1[5]);
  if ((_DWORD)result)
    ++*(_DWORD *)(a1[6] + 4 * a1[7]);
  return result;
}

void __75__RTStateDepiction_RTMetricManager___excludeEntryExitOutlierDates_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "betweenDate:andDate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);

}

@end
