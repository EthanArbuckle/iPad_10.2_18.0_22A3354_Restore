@implementation Timeseries

- (Timeseries)init
{
  Timeseries *v2;
  uint64_t v3;
  TimeseriesInternal *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)Timeseries;
  v2 = -[Timeseries init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    underlyingObject = v2->_underlyingObject;
    v2->_underlyingObject = (TimeseriesInternal *)v3;

  }
  return v2;
}

- (id)runBinomialTestTimeseriesWithSamples:(id)a3 sampleTimestamps:(id)a4 chunkMethod:(id)a5 minimumSampleSize:(id)a6 lastTimestampPreviousTest:(id)a7 significanceLevel:(id)a8 pHypothesis:(id)a9 error:(id *)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;

  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  -[Timeseries underlyingObject](self, "underlyingObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "runBinomialTestTimeseriesWithSamples:sampleTimestamps:chunkMethod:minimumSampleSize:lastTimestampPreviousTest:significanceLevel:pHypothesis:error:", v23, v22, v21, v20, v19, v18, v17, a10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)runZTestBinomialProportionsTimeseriesWithSamples:(id)a3 sampleTimestamps:(id)a4 chunkMethod:(id)a5 minimumSampleSize:(id)a6 lastTimestampPreviousTest:(id)a7 significanceLevel:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;

  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  -[Timeseries underlyingObject](self, "underlyingObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "runZTestBinomialProportionsTimeseriesWithSamples:sampleTimestamps:chunkMethod:minimumSampleSize:lastTimestampPreviousTest:significanceLevel:error:", v20, v19, v18, v17, v16, v15, a9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)runChangeDetectionWithEvents:(id)a3 test:(id)a4 lastRun:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[Timeseries underlyingObject](self, "underlyingObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "runChangeDetectionWithEvents:test:lastRun:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (TimeseriesInternal)underlyingObject
{
  return (TimeseriesInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
