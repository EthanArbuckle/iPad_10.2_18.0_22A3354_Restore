@implementation RTSignificantRegionHintInjectionMetrics

- (RTSignificantRegionHintInjectionMetrics)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithHintSource_region_locationOfInterest_hintSubmitted_matchingError_);
}

- (RTSignificantRegionHintInjectionMetrics)initWithHintSource:(int64_t)a3 region:(id)a4 locationOfInterest:(id)a5 hintSubmitted:(BOOL)a6 matchingError:(id)a7
{
  id v13;
  id v14;
  id v15;
  RTSignificantRegionHintInjectionMetrics *v16;
  RTSignificantRegionHintInjectionMetrics *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)RTSignificantRegionHintInjectionMetrics;
  v16 = -[RTSignificantRegionHintInjectionMetrics init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_region, a4);
    objc_storeStrong((id *)&v17->_locationOfInterest, a5);
    v17->_hintSource = a3;
    v17->_hintSubmitted = a6;
    objc_storeStrong((id *)&v17->_matchingError, a7);
  }

  return v17;
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
  void *v20;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[RTSignificantRegionHintInjectionMetrics hintSource](self, "hintSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("hintSource"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[RTSignificantRegionHintInjectionMetrics region](self, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "horizontalUncertainty");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("regionRadius"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("matched"));
  -[RTSignificantRegionHintInjectionMetrics locationOfInterest](self, "locationOfInterest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("matched"));
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[RTSignificantRegionHintInjectionMetrics locationOfInterest](self, "locationOfInterest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "horizontalUncertainty");
    objc_msgSend(v9, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("loiRadius"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RTSignificantRegionHintInjectionMetrics hintSubmitted](self, "hintSubmitted"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hintSubmitted"));

  -[RTSignificantRegionHintInjectionMetrics matchingError](self, "matchingError");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[RTSignificantRegionHintInjectionMetrics matchingError](self, "matchingError");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("errorDomain"));

    v18 = (void *)MEMORY[0x1E0CB37E8];
    -[RTSignificantRegionHintInjectionMetrics matchingError](self, "matchingError");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "code"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("errorCode"));

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
  v15[2] = __56__RTSignificantRegionHintInjectionMetrics_submitMetrics__block_invoke;
  v15[3] = &unk_1E929BFE0;
  v15[4] = self;
  v3 = (void *)MEMORY[0x1D8232094](v15, a2);
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = v2;
  v10 = 3221225472;
  v11 = __56__RTSignificantRegionHintInjectionMetrics_submitMetrics__block_invoke_2;
  v12 = &unk_1E929B460;
  v13 = (id)objc_msgSend(v4, "initWithCString:encoding:", RTAnalyticsEventSignificanRegionHintInjection, 1);
  v14 = v3;
  v5 = v13;
  v6 = v3;
  v7 = (void *)MEMORY[0x1D8232094](&v9);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v5, v9, v10, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEventLazy();

}

uint64_t __56__RTSignificantRegionHintInjectionMetrics_submitMetrics__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "computeMetrics");
}

id __56__RTSignificantRegionHintInjectionMetrics_submitMetrics__block_invoke_2(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  log_analytics_submission(*(void **)(a1 + 32), v2);
  return v2;
}

+ (void)submitMetricsWithHintSource:(int64_t)a3 region:(id)a4 locationOfInterest:(id)a5 hintSubmitted:(BOOL)a6 matchingError:(id)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  RTSignificantRegionHintInjectionMetrics *v14;

  v7 = a6;
  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = -[RTSignificantRegionHintInjectionMetrics initWithHintSource:region:locationOfInterest:hintSubmitted:matchingError:]([RTSignificantRegionHintInjectionMetrics alloc], "initWithHintSource:region:locationOfInterest:hintSubmitted:matchingError:", a3, v13, v12, v7, v11);

  -[RTSignificantRegionHintInjectionMetrics submitMetrics](v14, "submitMetrics");
}

- (RTLocation)region
{
  return self->_region;
}

- (RTLearnedLocationOfInterest)locationOfInterest
{
  return self->_locationOfInterest;
}

- (int64_t)hintSource
{
  return self->_hintSource;
}

- (void)setHintSource:(int64_t)a3
{
  self->_hintSource = a3;
}

- (NSError)matchingError
{
  return self->_matchingError;
}

- (void)setMatchingError:(id)a3
{
  objc_storeStrong((id *)&self->_matchingError, a3);
}

- (BOOL)hintSubmitted
{
  return self->_hintSubmitted;
}

- (void)setHintSubmitted:(BOOL)a3
{
  self->_hintSubmitted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingError, 0);
  objc_storeStrong((id *)&self->_locationOfInterest, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
