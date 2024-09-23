@implementation RTVisitLocationPoints

- (NSArray)locations
{
  return self->_locations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_centroid, 0);
}

- (RTVisitLocationPoints)initWithLocations:(id)a3
{
  id v4;
  NSObject *v5;
  RTVisitLocationPoints *v6;
  uint64_t v7;
  NSArray *locations;
  RTVisitLocationPoints *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[RTVisitLocationPoints initWithLocations:]";
      v14 = 1024;
      v15 = 29;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations.count (in %s:%d)", buf, 0x12u);
    }

  }
  if (objc_msgSend(v4, "count"))
  {
    v11.receiver = self;
    v11.super_class = (Class)RTVisitLocationPoints;
    v6 = -[RTVisitLocationPoints init](&v11, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v4, 0);
      locations = v6->_locations;
      v6->_locations = (NSArray *)v7;

    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)lastDate
{
  void *v2;
  void *v3;

  -[NSArray lastObject](self->_locations, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)enumerateLowSpeedSegementsUsingBlock:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  __int128 v28;
  void (**v29)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSArray *obj;
  uint64_t v31;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char v38;
  uint8_t v39[128];
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    if (v7)
    {
      v38 = 0;
      v9 = objc_opt_new();
      -[NSArray firstObject](self->_locations, "firstObject");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_opt_new();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      obj = self->_locations;
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v11)
      {
        v13 = v11;
        v29 = v8;
        v31 = 0;
        v14 = 0;
        v15 = 0;
        v16 = *(_QWORD *)v35;
        *(_QWORD *)&v12 = 138412290;
        v28 = v12;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            v18 = v10;
            if (*(_QWORD *)v35 != v16)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(v19, "speed", v28);
            v21 = v20;
            objc_msgSend(v6, "minSpeedToFilter");
            if (v21 >= v22)
              ++v14;
            else
              v14 = 0;

            v33 = 0;
            objc_msgSend(v32, "distanceFromLocation:toLocation:error:", v18, v19, &v33);
            v24 = v23;
            v15 = v33;
            if (v15)
            {
              _rt_log_facility_get_os_log(RTLogFacilityLocation);
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v28;
                v41 = (const char *)v15;
                _os_log_debug_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
              }

            }
            if ((v14 >= objc_msgSend(v6, "movingWindowSizeForSpeed")
               || v24 >= (double)(unint64_t)objc_msgSend(v6, "maxDistanceBetweenAdjacentPoints"))
              && -[NSObject count](v9, "count"))
            {
              ((void (**)(_QWORD, NSObject *, uint64_t, char *))v29)[2](v29, v9, v31 + i, &v38);
              if (v38)
              {
                v31 += i;
                v10 = v18;
                goto LABEL_29;
              }
              v26 = objc_opt_new();

              v9 = v26;
            }
            -[NSObject addObject:](v9, "addObject:", v19);
            v10 = v19;

          }
          v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          v31 += i;
          if (v13)
            continue;
          break;
        }
LABEL_29:
        v8 = v29;
      }
      else
      {
        v31 = 0;
        v15 = 0;
      }

      if (-[NSObject count](v9, "count"))
        ((void (**)(_QWORD, NSObject *, uint64_t, char *))v8)[2](v8, v9, v31, &v38);

      goto LABEL_34;
    }
LABEL_26:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[RTVisitLocationPoints enumerateLowSpeedSegementsUsingBlock:block:]";
      v42 = 1024;
      v43 = 74;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: block (in %s:%d)", buf, 0x12u);
    }
LABEL_34:

    goto LABEL_35;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[RTVisitLocationPoints enumerateLowSpeedSegementsUsingBlock:block:]";
    v42 = 1024;
    v43 = 73;
    _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hyperParameter (in %s:%d)", buf, 0x12u);
  }

  if (!v8)
    goto LABEL_26;
LABEL_35:

}

- (RTVisitLocationPoints)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocations_);
}

- (id)description
{
  void *v3;
  NSUInteger v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[NSArray count](self->_locations, "count");
  -[NSArray firstObject](self->_locations, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray lastObject](self->_locations, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("n_points, %lu, first location, %@, last location, %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (RTLocation)centroid
{
  RTLocation *centroid;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  RTLocation *v18;
  RTLocation *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  centroid = self->_centroid;
  if (!centroid)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = self->_locations;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      v8 = 0.0;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v11, "latitude", (_QWORD)v21);
          v9 = v9 + v12;
          objc_msgSend(v11, "longitude");
          v8 = v8 + v13;
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
      v9 = 0.0;
    }

    v14 = v9 / (double)-[NSArray count](self->_locations, "count");
    v15 = v8 / (double)-[NSArray count](self->_locations, "count");
    v16 = objc_alloc(MEMORY[0x1E0D183B0]);
    -[RTVisitLocationPoints firstDate](self, "firstDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (RTLocation *)objc_msgSend(v16, "initWithLatitude:longitude:horizontalUncertainty:date:", v17, v14, v15, 0.0);
    v19 = self->_centroid;
    self->_centroid = v18;

    centroid = self->_centroid;
  }
  return centroid;
}

- (double)duration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[RTVisitLocationPoints lastDate](self, "lastDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTVisitLocationPoints firstDate](self, "firstDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (id)firstDate
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_locations, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
