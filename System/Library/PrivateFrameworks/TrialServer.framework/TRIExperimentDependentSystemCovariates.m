@implementation TRIExperimentDependentSystemCovariates

- (TRIExperimentDependentSystemCovariates)initWithPaths:(id)a3 baseSystemCovariates:(id)a4 clientExperiment:(id)a5 experimentEndDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TRIExperimentDependentSystemCovariates *v14;
  uint64_t v15;
  TRISystemConfiguration *sysConfig;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TRIExperimentDependentSystemCovariates;
  v14 = -[TRIExperimentDependentSystemCovariates init](&v18, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B90]), "initWithPaths:", v10);
    sysConfig = v14->_sysConfig;
    v14->_sysConfig = (TRISystemConfiguration *)v15;

    objc_storeStrong((id *)&v14->_clientExperiment, a5);
    objc_storeStrong((id *)&v14->_baseSystemCovariates, a4);
    objc_storeStrong((id *)&v14->_experimentEndDate, a6);
  }

  return v14;
}

- (TRIExperimentDependentSystemCovariates)initWithPaths:(id)a3 baseSystemCovariates:(id)a4 clientExperiment:(id)a5 systemConfiguration:(id)a6
{
  id v10;
  id v11;
  id v12;
  TRIExperimentDependentSystemCovariates *v13;
  TRIExperimentDependentSystemCovariates *v14;
  void *v15;
  uint64_t v16;
  NSDate *experimentEndDate;
  objc_super v19;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TRIExperimentDependentSystemCovariates;
  v13 = -[TRIExperimentDependentSystemCovariates init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sysConfig, a6);
    objc_storeStrong((id *)&v14->_clientExperiment, a5);
    objc_storeStrong((id *)&v14->_baseSystemCovariates, a4);
    -[TRIClientExperiment endDate](v14->_clientExperiment, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "date");
    v16 = objc_claimAutoreleasedReturnValue();
    experimentEndDate = v14->_experimentEndDate;
    v14->_experimentEndDate = (NSDate *)v16;

  }
  return v14;
}

- (id)tri_contextValueWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[TRIExperimentDependentSystemCovariates dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The system covariates do not contain the key %@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exceptionWithName:reason:userInfo:", CFSTR("KeyNotFoundException"), v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v10);
  }

  return v6;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  -[TRISystemCovariateProviding dictionary](self->_baseSystemCovariates, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[TRISystemConfiguration siriDeviceAggregationIdRotationDate](self->_sysConfig, "siriDeviceAggregationIdRotationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[NSDate compare:](self->_experimentEndDate, "compare:", v5) == NSOrderedAscending;
  else
    v6 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("SiriAggregationIdRotationIsOutsideExperiment"));

  v8 = (void *)objc_msgSend(v4, "copy");
  return v8;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TRIExperimentDependentSystemCovariates dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentEndDate, 0);
  objc_storeStrong((id *)&self->_baseSystemCovariates, 0);
  objc_storeStrong((id *)&self->_clientExperiment, 0);
  objc_storeStrong((id *)&self->_sysConfig, 0);
}

@end
