@implementation RTVisitFeedBuffer

uint64_t __45__RTVisitFeedBuffer_initWithMinWaitInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)addLocations:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  double minWaitInterval;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v19 = objc_msgSend(v4, "count");
    v20 = -[NSMutableArray count](self->_locations, "count");
    -[NSDate stringFromDate](self->_lastMaturedLocationDate, "stringFromDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    minWaitInterval = self->_minWaitInterval;
    *(_DWORD *)buf = 134218754;
    v30 = v19;
    v31 = 2048;
    v32 = v20;
    v33 = 2112;
    v34 = v21;
    v35 = 2048;
    v36 = minWaitInterval;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "adding %lu locations to feedbuffer. numLocations, %lu, _lastMaturedLocationDate, %@, _minWaitInterval, %.2f", buf, 0x2Au);

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v25;
    *(_QWORD *)&v8 = 138412802;
    v23 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        if (self->_lastMaturedLocationDate
          && (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "date"),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "isOnOrBefore:", self->_lastMaturedLocationDate),
              v13,
              v14))
        {
          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            -[NSDate stringFromDate](self->_lastMaturedLocationDate, "stringFromDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "date");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "timeIntervalSinceDate:", self->_lastMaturedLocationDate);
            *(_DWORD *)buf = v23;
            v30 = (uint64_t)v12;
            v31 = 2112;
            v32 = (uint64_t)v16;
            v33 = 2048;
            v34 = v18;
            _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "discarding location, %@, predates last matured location with date, %@, by interval, %.2f", buf, 0x20u);

          }
        }
        else
        {
          -[NSMutableArray insertObject:atIndex:](self->_locations, "insertObject:atIndex:", v12, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_locations, "indexOfObject:inSortedRange:options:usingComparator:", v12, 0, -[NSMutableArray count](self->_locations, "count", v23, (_QWORD)v24), 1280, self->_comparator));
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v9);
  }

}

- (unint64_t)numLocations
{
  return -[NSMutableArray count](self->_locations, "count");
}

- (double)minWaitInterval
{
  return self->_minWaitInterval;
}

- (id)maturedLocations
{
  void *v3;
  void *locations;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  void *v18;
  NSDate *v19;
  NSDate *lastMaturedLocationDate;

  if (-[NSMutableArray count](self->_locations, "count"))
  {
    if (self->_minWaitInterval <= 0.0)
    {
      v16 = self->_locations;
      v17 = (NSMutableArray *)objc_opt_new();
      locations = self->_locations;
      self->_locations = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dateByAddingTimeInterval:", -self->_minWaitInterval);
      locations = (void *)objc_claimAutoreleasedReturnValue();

      v5 = objc_alloc(MEMORY[0x1E0D183B0]);
      -[NSMutableArray lastObject](self->_locations, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "latitude");
      v8 = v7;
      -[NSMutableArray lastObject](self->_locations, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "longitude");
      v11 = v10;
      -[NSMutableArray lastObject](self->_locations, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "horizontalUncertainty");
      v14 = (void *)objc_msgSend(v5, "initWithLatitude:longitude:horizontalUncertainty:date:", locations, v8, v11, v13);

      v15 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_locations, "indexOfObject:inSortedRange:options:usingComparator:", v14, 0, -[NSMutableArray count](self->_locations, "count"), 1280, self->_comparator);
      -[NSMutableArray subarrayWithRange:](self->_locations, "subarrayWithRange:", 0, v15);
      v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectsInRange:](self->_locations, "removeObjectsInRange:", 0, v15);

    }
    if (-[NSMutableArray count](v16, "count"))
    {
      -[NSMutableArray lastObject](v16, "lastObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "date");
      v19 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastMaturedLocationDate = self->_lastMaturedLocationDate;
      self->_lastMaturedLocationDate = v19;

    }
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (RTVisitFeedBuffer)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithMinWaitInterval_);
}

- (RTVisitFeedBuffer)initWithMinWaitInterval:(double)a3
{
  RTVisitFeedBuffer *v4;
  RTVisitFeedBuffer *v5;
  uint64_t v6;
  NSMutableArray *locations;
  id comparator;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RTVisitFeedBuffer;
  v4 = -[RTVisitFeedBuffer init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_minWaitInterval = a3;
    v6 = objc_opt_new();
    locations = v5->_locations;
    v5->_locations = (NSMutableArray *)v6;

    comparator = v5->_comparator;
    v5->_comparator = &__block_literal_global_55;

  }
  return v5;
}

- (NSMutableArray)locations
{
  return self->_locations;
}

- (void)setLocations:(id)a3
{
  objc_storeStrong((id *)&self->_locations, a3);
}

- (NSDate)lastMaturedLocationDate
{
  return self->_lastMaturedLocationDate;
}

- (void)setLastMaturedLocationDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastMaturedLocationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMaturedLocationDate, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong(&self->_comparator, 0);
}

@end
