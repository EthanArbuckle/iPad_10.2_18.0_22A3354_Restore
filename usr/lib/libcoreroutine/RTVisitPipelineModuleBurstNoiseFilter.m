@implementation RTVisitPipelineModuleBurstNoiseFilter

uint64_t __61__RTVisitPipelineModuleBurstNoiseFilter_removeNoiseLocations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isNoise") ^ 1;
}

- (void)identifyNoiseInWindowRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  RTDistanceCalculator *distanceCalculator;
  double v18;
  double v19;
  char *v20;
  __int128 v21;
  NSObject *v22;
  unint64_t lastProcessedIndex;
  void *v24;
  char v25;
  char *v26;
  RTDistanceCalculator *v27;
  NSUInteger v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  NSObject *v36;
  void *v37;
  char *v38;
  __int128 v39;
  void *v40;
  void *v41;
  char *v42;
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  length = a3.length;
  location = a3.location;
  v48 = *MEMORY[0x1E0C80C00];
  if (!a3.location)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[RTVisitPipelineModuleBurstNoiseFilter identifyNoiseInWindowRange:]";
      v46 = 1024;
      v47 = 89;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: windowRange.location > 0 (in %s:%d)", buf, 0x12u);
    }

  }
  v7 = location + length;
  if (v7 >= -[NSMutableArray count](self->_potentialNoiseLocations, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[RTVisitPipelineModuleBurstNoiseFilter identifyNoiseInWindowRange:]";
      v46 = 1024;
      v47 = 90;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: windowRange.location + windowRange.length < _potentialNoiseLocations.count (in %s:%d)", buf, 0x12u);
    }

  }
  v9 = location - 1;
  -[NSMutableArray objectAtIndexedSubscript:](self->_potentialNoiseLocations, "objectAtIndexedSubscript:", location - 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isNoise") & 1) == 0)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_potentialNoiseLocations, "objectAtIndexedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isNoise");

    if ((v12 & 1) != 0)
      return;
    -[NSMutableArray objectAtIndexedSubscript:](self->_potentialNoiseLocations, "objectAtIndexedSubscript:", location - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "location");
    v14 = objc_claimAutoreleasedReturnValue();

    -[NSMutableArray objectAtIndexedSubscript:](self->_potentialNoiseLocations, "objectAtIndexedSubscript:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "location");
    v16 = objc_claimAutoreleasedReturnValue();

    distanceCalculator = self->_distanceCalculator;
    v43 = 0;
    v40 = (void *)v16;
    -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v14, v16, &v43);
    v19 = v18;
    v20 = (char *)v43;
    if (v20)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLocation);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v20;
        _os_log_debug_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_DEBUG, "Distance Calculator error, %@", buf, 0xCu);
      }

    }
    v41 = (void *)v14;
    if (v19 >= self->_maximumFlankDistance)
      goto LABEL_29;
    lastProcessedIndex = self->_lastProcessedIndex;
    if (location <= lastProcessedIndex + 1)
      location = lastProcessedIndex + 1;
    if (location >= v7)
    {
LABEL_29:
      v26 = v20;
    }
    else
    {
      *(_QWORD *)&v21 = 138412290;
      v39 = v21;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_potentialNoiseLocations, "objectAtIndexedSubscript:", location, v39);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isNoise");

        if ((v25 & 1) != 0)
        {
          v26 = v20;
        }
        else
        {
          v27 = self->_distanceCalculator;
          v28 = v9;
          -[NSMutableArray objectAtIndexedSubscript:](self->_potentialNoiseLocations, "objectAtIndexedSubscript:", v9);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "location");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray objectAtIndexedSubscript:](self->_potentialNoiseLocations, "objectAtIndexedSubscript:", location);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "location");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v20;
          -[RTDistanceCalculator distanceFromLocation:toLocation:error:](v27, "distanceFromLocation:toLocation:error:", v30, v32, &v42);
          v34 = v33;
          v26 = v42;

          if (v34 > self->_minimumNoiseToLeftFlankDistance)
          {
            -[NSMutableArray objectAtIndexedSubscript:](self->_potentialNoiseLocations, "objectAtIndexedSubscript:", location);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setNoise:", 1);

            _rt_log_facility_get_os_log(RTLogFacilityLocation);
            v36 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              -[NSMutableArray objectAtIndexedSubscript:](self->_potentialNoiseLocations, "objectAtIndexedSubscript:", location);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "location");
              v38 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v39;
              v45 = v38;
              _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_INFO, "Noisy Location: %@", buf, 0xCu);

            }
          }
          v9 = v28;
        }
        ++location;
        v20 = v26;
      }
      while (v7 != location);
    }

    v10 = v41;
  }

}

- (id)process:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  RTVisitCluster *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  RTVisitCluster *v12;
  void *v13;
  void *v14;
  void *v15;
  RTVisitCluster *v16;
  NSObject *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  RTVisitCluster *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  RTVisitCluster *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v25 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v25)
          objc_enumerationMutation(obj);
        v8 = *(RTVisitCluster **)(*((_QWORD *)&v26 + 1) + 8 * i);
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v32 = v20;
          v33 = 2112;
          v34 = v8;
          _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@ working on cluster, %@", buf, 0x16u);

        }
        -[RTVisitCluster points](v8, "points");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "locations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitPipelineModuleBurstNoiseFilter addLocations:](self, "addLocations:", v11);

        -[RTVisitPipelineModuleBurstNoiseFilter filterNoise](self, "filterNoise");
        v12 = [RTVisitCluster alloc];
        -[RTVisitPipelineModuleBurstNoiseFilter getFilteredLocations](self, "getFilteredLocations");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "points");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTVisitCluster visit](v8, "visit");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[RTVisitCluster initWithPoints:visit:](v12, "initWithPoints:visit:", v14, v15);

        -[RTVisitPipelineModuleBurstNoiseFilter discardObsoleteLocations](self, "discardObsoleteLocations");
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v32 = v22;
          v33 = 2112;
          v34 = v16;
          _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "%@ adding to output clusters, %@", buf, 0x16u);

        }
        if (v16)
        {
          v30 = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
          v18 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v18;
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)addLocations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  NSMutableArray *potentialNoiseLocations;
  RTPotentialNoiseLocation *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "horizontalUncertainty");
        if (v10 <= self->_maxHorizontalAccuracy)
        {
          potentialNoiseLocations = self->_potentialNoiseLocations;
          v12 = -[RTPotentialNoiseLocation initWithLocation:]([RTPotentialNoiseLocation alloc], "initWithLocation:", v9);
          -[NSMutableArray addObject:](potentialNoiseLocations, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (id)getFilteredLocations
{
  void *v3;
  unint64_t i;
  void *v5;
  void *v6;
  unint64_t lastProcessedIndex;
  RTVisitCluster *v8;
  RTVisitLocationPoints *v9;
  RTVisitCluster *v10;

  v3 = (void *)objc_opt_new();
  for (i = -[RTVisitPipelineModuleBurstNoiseFilter getFirstIndexToProcess](self, "getFirstIndexToProcess");
        i < -[RTVisitPipelineModuleBurstNoiseFilter getFirstUnprocessableIndex](self, "getFirstUnprocessableIndex");
        ++i)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_potentialNoiseLocations, "objectAtIndexedSubscript:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  lastProcessedIndex = self->_lastProcessedIndex;
  if (lastProcessedIndex < -[RTVisitPipelineModuleBurstNoiseFilter getFirstUnprocessableIndex](self, "getFirstUnprocessableIndex")- 1)
  {
    self->_lastProcessedIndex = -[RTVisitPipelineModuleBurstNoiseFilter getFirstUnprocessableIndex](self, "getFirstUnprocessableIndex")- 1;
    self->_firstTimeProcessingModule = 0;
  }
  if (objc_msgSend(v3, "count"))
  {
    v8 = [RTVisitCluster alloc];
    v9 = -[RTVisitLocationPoints initWithLocations:]([RTVisitLocationPoints alloc], "initWithLocations:", v3);
    v10 = -[RTVisitCluster initWithPoints:](v8, "initWithPoints:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)getFirstUnprocessableIndex
{
  unint64_t result;
  unint64_t lastProcessedIndex;

  result = objc_msgSend((id)objc_opt_class(), "getIndexInArray:followedByCount:", self->_potentialNoiseLocations, self->_maximumWindowSize - 1);
  lastProcessedIndex = self->_lastProcessedIndex;
  if (result <= lastProcessedIndex)
    return lastProcessedIndex + 1;
  return result;
}

+ (unint64_t)getIndexInArray:(id)a3 followedByCount:(unint64_t)a4
{
  id v5;
  unint64_t v6;

  v5 = a3;
  if (objc_msgSend(v5, "count") - 1 >= a4)
    v6 = objc_msgSend(v5, "count") + ~a4;
  else
    v6 = 0;

  return v6;
}

- (unint64_t)getFirstIndexToProcess
{
  if (self->_firstTimeProcessingModule)
    return 0;
  else
    return self->_lastProcessedIndex + 1;
}

- (void)discardObsoleteLocations
{
  unint64_t v2;
  unint64_t maximumWindowSize;
  unint64_t v4;

  v2 = self->_lastProcessedIndex + 1;
  maximumWindowSize = self->_maximumWindowSize;
  v4 = v2 - maximumWindowSize;
  if (v2 > maximumWindowSize)
  {
    -[NSMutableArray removeObjectsInRange:](self->_potentialNoiseLocations, "removeObjectsInRange:", 0, v2 - maximumWindowSize);
    self->_lastProcessedIndex -= v4;
  }
}

- (void)filterNoise
{
  unint64_t i;
  unint64_t j;

  for (i = self->_maximumWindowSize; i; --i)
  {
    for (j = self->_lastProcessedIndex + 1; i + j < -[NSMutableArray count](self->_potentialNoiseLocations, "count"); ++j)
      -[RTVisitPipelineModuleBurstNoiseFilter identifyNoiseInWindowRange:](self, "identifyNoiseInWindowRange:", j, i);
    -[RTVisitPipelineModuleBurstNoiseFilter removeNoiseLocations](self, "removeNoiseLocations");
  }
}

- (void)removeNoiseLocations
{
  NSMutableArray *potentialNoiseLocations;
  id v3;

  potentialNoiseLocations = self->_potentialNoiseLocations;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_69);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filterUsingPredicate:](potentialNoiseLocations, "filterUsingPredicate:", v3);

}

- (RTVisitPipelineModuleBurstNoiseFilter)initWithMaximumFlankDistance:(double)a3 minimumNoiseToLeftFlankDistance:(double)a4 maximumWindowSize:(unint64_t)a5 maxHorizontalAccuracy:(double)a6
{
  void *v11;
  RTVisitPipelineModuleBurstNoiseFilter *v12;

  v11 = (void *)objc_opt_new();
  v12 = -[RTVisitPipelineModuleBurstNoiseFilter initWithMaximumFlankDistance:minimumNoiseToLeftFlankDistance:maximumWindowSize:maxHorizontalAccuracy:distanceCalculator:](self, "initWithMaximumFlankDistance:minimumNoiseToLeftFlankDistance:maximumWindowSize:maxHorizontalAccuracy:distanceCalculator:", a5, v11, a3, a4, a6);

  return v12;
}

- (RTVisitPipelineModuleBurstNoiseFilter)initWithMaximumFlankDistance:(double)a3 minimumNoiseToLeftFlankDistance:(double)a4 maximumWindowSize:(unint64_t)a5 maxHorizontalAccuracy:(double)a6 distanceCalculator:(id)a7
{
  id v13;
  RTVisitPipelineModuleBurstNoiseFilter *v14;
  RTVisitPipelineModuleBurstNoiseFilter *v15;
  uint64_t v16;
  NSMutableArray *potentialNoiseLocations;
  objc_super v19;

  v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)RTVisitPipelineModuleBurstNoiseFilter;
  v14 = -[RTVisitPipelineModuleBurstNoiseFilter init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_firstTimeProcessingModule = 1;
    v16 = objc_opt_new();
    potentialNoiseLocations = v15->_potentialNoiseLocations;
    v15->_potentialNoiseLocations = (NSMutableArray *)v16;

    v15->_lastProcessedIndex = 0;
    v15->_maximumFlankDistance = a3;
    v15->_minimumNoiseToLeftFlankDistance = a4;
    v15->_maximumWindowSize = a5;
    v15->_maxHorizontalAccuracy = a6;
    objc_storeStrong((id *)&v15->_distanceCalculator, a7);
  }

  return v15;
}

- (RTVisitPipelineModuleBurstNoiseFilter)initWithHyperParameter:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;

  v4 = a3;
  objc_msgSend(v4, "maxNonFlankDistance");
  v6 = v5;
  objc_msgSend(v4, "minNoiseToLeftFlankDistance");
  v8 = v7;
  v9 = objc_msgSend(v4, "maxBurstNoiseLength");
  objc_msgSend(v4, "maxHorizontalAccuracy");
  v11 = v10;

  return -[RTVisitPipelineModuleBurstNoiseFilter initWithMaximumFlankDistance:minimumNoiseToLeftFlankDistance:maximumWindowSize:maxHorizontalAccuracy:](self, "initWithMaximumFlankDistance:minimumNoiseToLeftFlankDistance:maximumWindowSize:maxHorizontalAccuracy:", v9, v6, v8, v11);
}

- (void)setLastProcessedIndex:(unint64_t)a3
{
  self->_lastProcessedIndex = a3;
}

- (BOOL)firstTimeProcessingModule
{
  return self->_firstTimeProcessingModule;
}

- (NSMutableArray)potentialNoiseLocations
{
  return self->_potentialNoiseLocations;
}

- (unint64_t)lastProcessedIndex
{
  return self->_lastProcessedIndex;
}

- (double)maximumFlankDistance
{
  return self->_maximumFlankDistance;
}

- (double)minimumNoiseToLeftFlankDistance
{
  return self->_minimumNoiseToLeftFlankDistance;
}

- (unint64_t)maximumWindowSize
{
  return self->_maximumWindowSize;
}

- (double)maxHorizontalAccuracy
{
  return self->_maxHorizontalAccuracy;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_potentialNoiseLocations, 0);
}

@end
