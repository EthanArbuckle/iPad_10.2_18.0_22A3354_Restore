@implementation RTRegionToLocationOfInterestMatchingMetrics

- (RTRegionToLocationOfInterestMatchingMetrics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDistanceCalculator_region_locationOfInterest_matchingError_numberOfMatches_);
}

- (RTRegionToLocationOfInterestMatchingMetrics)initWithDistanceCalculator:(id)a3 region:(id)a4 locationOfInterest:(id)a5 matchingError:(id)a6 numberOfMatches:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  RTRegionToLocationOfInterestMatchingMetrics *v17;
  RTRegionToLocationOfInterestMatchingMetrics *v18;
  RTRegionToLocationOfInterestMatchingMetrics *v19;
  NSObject *v20;
  const char *v21;
  objc_super v23;
  uint8_t buf[16];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v19 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: distanceCalculator";
LABEL_12:
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_9;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: region";
    goto LABEL_12;
  }
  v23.receiver = self;
  v23.super_class = (Class)RTRegionToLocationOfInterestMatchingMetrics;
  v17 = -[RTRegionToLocationOfInterestMatchingMetrics init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_distanceCalculator, a3);
    objc_storeStrong((id *)&v18->_region, a4);
    objc_storeStrong((id *)&v18->_locationOfInterest, a5);
    objc_storeStrong((id *)&v18->_matchingError, a6);
    v18->_numberOfMatches = a7;
  }
  self = v18;
  v19 = self;
LABEL_10:

  return v19;
}

- (id)computeMetrics
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
  RTDistanceCalculator *distanceCalculator;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  NSObject *v28;
  RTLearnedLocationOfInterest *locationOfInterest;
  RTLocation *region;
  id v32;
  uint8_t buf[4];
  RTLearnedLocationOfInterest *v34;
  __int16 v35;
  RTLocation *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("matched"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[RTRegionToLocationOfInterestMatchingMetrics numberOfMatches](self, "numberOfMatches"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("numberOfMatches"));

  -[RTRegionToLocationOfInterestMatchingMetrics matchingError](self, "matchingError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[RTRegionToLocationOfInterestMatchingMetrics matchingError](self, "matchingError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("errorDomain"));

    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[RTRegionToLocationOfInterestMatchingMetrics matchingError](self, "matchingError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "code"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("errorCode"));

  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[RTRegionToLocationOfInterestMatchingMetrics region](self, "region");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "horizontalUncertainty");
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("regionRadius"));

  -[RTRegionToLocationOfInterestMatchingMetrics locationOfInterest](self, "locationOfInterest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("matched"));
    v15 = (void *)MEMORY[0x1E0CB37E8];
    -[RTRegionToLocationOfInterestMatchingMetrics locationOfInterest](self, "locationOfInterest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "location");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "location");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "horizontalUncertainty");
    objc_msgSend(v15, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("loiRadius"));

    distanceCalculator = self->_distanceCalculator;
    -[RTRegionToLocationOfInterestMatchingMetrics region](self, "region");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTRegionToLocationOfInterestMatchingMetrics locationOfInterest](self, "locationOfInterest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "location");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "location");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    -[RTDistanceCalculator distanceFromLocation:toLocation:error:](distanceCalculator, "distanceFromLocation:toLocation:error:", v21, v24, &v32);
    v26 = v25;
    v27 = v32;

    if (v27)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        region = self->_region;
        locationOfInterest = self->_locationOfInterest;
        *(_DWORD *)buf = 138412802;
        v34 = locationOfInterest;
        v35 = 2112;
        v36 = region;
        v37 = 2112;
        v38 = v27;
        _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "METRICS: Unable to compute the distance between matching candidate, %@, and the target region, %@, because of a distance computation error, %@. Not recording the distance.", buf, 0x20u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v26);
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("distanceRegionToLoi"));
    }

  }
  return v3;
}

- (void)submitMetrics
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];

  v2 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__RTRegionToLocationOfInterestMatchingMetrics_submitMetrics__block_invoke;
  v15[3] = &unk_1E929BFE0;
  v15[4] = self;
  v3 = (void *)MEMORY[0x1D8232094](v15, a2);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = v2;
  v10 = 3221225472;
  v11 = __60__RTRegionToLocationOfInterestMatchingMetrics_submitMetrics__block_invoke_2;
  v12 = &unk_1E929B460;
  v13 = (id)objc_msgSend(v4, "initWithCString:encoding:", RTAnalyticsEventRegionToLOIMatching, 1);
  v14 = v3;
  v5 = v13;
  v6 = v3;
  v7 = (void *)MEMORY[0x1D8232094](&v9);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v5, v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

uint64_t __60__RTRegionToLocationOfInterestMatchingMetrics_submitMetrics__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "computeMetrics");
}

id __60__RTRegionToLocationOfInterestMatchingMetrics_submitMetrics__block_invoke_2(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  log_analytics_submission(*(void **)(a1 + 32), v2);
  return v2;
}

+ (void)submitMetricsWithDistanceCalculator:(id)a3 region:(id)a4 locationOfInterest:(id)a5 matchingError:(id)a6 numberOfMatches:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  RTRegionToLocationOfInterestMatchingMetrics *v15;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[RTRegionToLocationOfInterestMatchingMetrics initWithDistanceCalculator:region:locationOfInterest:matchingError:numberOfMatches:]([RTRegionToLocationOfInterestMatchingMetrics alloc], "initWithDistanceCalculator:region:locationOfInterest:matchingError:numberOfMatches:", v14, v13, v12, v11, a7);

  -[RTRegionToLocationOfInterestMatchingMetrics submitMetrics](v15, "submitMetrics");
}

- (RTLocation)region
{
  return self->_region;
}

- (RTLearnedLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (NSError)matchingError
{
  return self->_matchingError;
}

- (unint64_t)numberOfMatches
{
  return self->_numberOfMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingError, 0);
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
}

@end
