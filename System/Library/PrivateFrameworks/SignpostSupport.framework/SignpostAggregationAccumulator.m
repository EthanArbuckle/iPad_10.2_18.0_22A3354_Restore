@implementation SignpostAggregationAccumulator

- (SignpostAggregationAccumulator)init
{
  return -[SignpostAggregationAccumulator initWithIncludeRawIntervals:](self, "initWithIncludeRawIntervals:", 1);
}

- (SignpostAggregationAccumulator)initWithIncludeRawIntervals:(BOOL)a3
{
  SignpostAggregationAccumulator *v4;
  uint64_t v5;
  NSMutableDictionary *mutableSignatureToAccumulatorEntry;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SignpostAggregationAccumulator;
  v4 = -[SignpostAggregationAccumulator init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    mutableSignatureToAccumulatorEntry = v4->_mutableSignatureToAccumulatorEntry;
    v4->_mutableSignatureToAccumulatorEntry = (NSMutableDictionary *)v5;

    v4->_includeRawIntervals = a3;
  }
  return v4;
}

- (void)handleInterval:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  SignpostAggregationAccumulatorEntry *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  +[SignpostAggregation _aggregationDescriptionStringForInterval:](SignpostAggregation, "_aggregationDescriptionStringForInterval:", v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "subsystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SignpostAggregation _signatureForSubsystem:category:name:aggregationDescription:](SignpostAggregation, "_signatureForSubsystem:category:name:aggregationDescription:", v5, v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SignpostAggregationAccumulator mutableSignatureToAccumulatorEntry](self, "mutableSignatureToAccumulatorEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = [SignpostAggregationAccumulatorEntry alloc];
    objc_msgSend(v16, "subsystem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "category");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SignpostAggregationAccumulatorEntry _initWithSubsystem:category:name:aggregationDescription:includeRawIntervals:](v11, "_initWithSubsystem:category:name:aggregationDescription:includeRawIntervals:", v12, v13, v14, v4, -[SignpostAggregationAccumulator includeRawIntervals](self, "includeRawIntervals"));

    -[SignpostAggregationAccumulator mutableSignatureToAccumulatorEntry](self, "mutableSignatureToAccumulatorEntry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, v8);

  }
  objc_msgSend(v10, "_handleInterval:", v16);

}

- (BOOL)includeRawIntervals
{
  return self->_includeRawIntervals;
}

- (NSMutableDictionary)mutableSignatureToAccumulatorEntry
{
  return self->_mutableSignatureToAccumulatorEntry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSignatureToAccumulatorEntry, 0);
}

@end
