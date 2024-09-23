@implementation SignpostAggregationAccumulatorEntry

+ (void)_bumpErrorCount:(id)a3 countDict:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "localizedDescription");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedLongLong:", objc_msgSend(v8, "unsignedLongLongValue") + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v10);
}

- (id)_initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5 aggregationDescription:(id)a6 includeRawIntervals:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SignpostAggregationAccumulatorEntry *v17;
  SignpostAggregationAccumulatorEntry *v18;
  uint64_t v19;
  NSMutableDictionary *mutableAggregationAdditionErrorCounts;
  uint64_t v21;
  NSMutableDictionary *mutableAggregationCreationErrorCounts;
  objc_super v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SignpostAggregationAccumulatorEntry;
  v17 = -[SignpostAggregationAccumulatorEntry init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_subsystem, a3);
    objc_storeStrong((id *)&v18->_category, a4);
    objc_storeStrong((id *)&v18->_name, a5);
    objc_storeStrong((id *)&v18->_aggregationDescription, a6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    mutableAggregationAdditionErrorCounts = v18->_mutableAggregationAdditionErrorCounts;
    v18->_mutableAggregationAdditionErrorCounts = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    mutableAggregationCreationErrorCounts = v18->_mutableAggregationCreationErrorCounts;
    v18->_mutableAggregationCreationErrorCounts = (NSMutableDictionary *)v21;

    v18->_includeRawIntervals = a7;
  }

  return v18;
}

- (void)_handleInterval:(id)a3
{
  id v4;
  SignpostAggregation *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25 = 0;
  v5 = -[SignpostAggregation initWithInterval:errorsOut:]([SignpostAggregation alloc], "initWithInterval:errorsOut:", v4, &v25);
  v6 = v25;
  v7 = v6;
  if (v5)
  {
    -[SignpostAggregationAccumulatorEntry accumulatedAggregation](self, "accumulatedAggregation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[SignpostAggregationAccumulatorEntry accumulatedAggregation](self, "accumulatedAggregation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAggregation:", v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = (void *)objc_opt_class();
        -[SignpostAggregationAccumulatorEntry mutableAggregationAdditionErrorCounts](self, "mutableAggregationAdditionErrorCounts");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_bumpErrorCount:countDict:", v10, v12);
      }
      else
      {
        -[SignpostAggregationAccumulatorEntry accumulatedAggregation](self, "accumulatedAggregation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dropRawIntervals");
      }

    }
    else
    {
      objc_storeStrong((id *)&self->_accumulatedAggregation, v5);
      -[SignpostAggregationAccumulatorEntry accumulatedAggregation](self, "accumulatedAggregation");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dropRawIntervals");
    }
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v6;
    v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v13)
    {
      v14 = v13;
      v20 = v7;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v10);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v18 = (void *)objc_opt_class();
          -[SignpostAggregationAccumulatorEntry mutableAggregationCreationErrorCounts](self, "mutableAggregationCreationErrorCounts");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "_bumpErrorCount:countDict:", v17, v19);

        }
        v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v14);
      v7 = v20;
    }
  }

}

- (NSString)aggregationSignature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SignpostAggregationAccumulatorEntry subsystem](self, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationAccumulatorEntry category](self, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationAccumulatorEntry name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostAggregationAccumulatorEntry aggregationDescription](self, "aggregationDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SignpostAggregation _signatureForSubsystem:category:name:aggregationDescription:](SignpostAggregation, "_signatureForSubsystem:category:name:aggregationDescription:", v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)aggregationDescription
{
  return self->_aggregationDescription;
}

- (BOOL)includeRawIntervals
{
  return self->_includeRawIntervals;
}

- (SignpostAggregation)accumulatedAggregation
{
  return self->_accumulatedAggregation;
}

- (NSMutableDictionary)mutableAggregationCreationErrorCounts
{
  return self->_mutableAggregationCreationErrorCounts;
}

- (NSMutableDictionary)mutableAggregationAdditionErrorCounts
{
  return self->_mutableAggregationAdditionErrorCounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAggregationAdditionErrorCounts, 0);
  objc_storeStrong((id *)&self->_mutableAggregationCreationErrorCounts, 0);
  objc_storeStrong((id *)&self->_accumulatedAggregation, 0);
  objc_storeStrong((id *)&self->_aggregationDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
}

@end
