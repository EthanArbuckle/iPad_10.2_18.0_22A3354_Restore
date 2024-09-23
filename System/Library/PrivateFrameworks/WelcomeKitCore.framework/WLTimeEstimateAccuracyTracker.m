@implementation WLTimeEstimateAccuracyTracker

- (WLTimeEstimateAccuracyTracker)init
{
  WLTimeEstimateAccuracyTracker *v2;
  WLTimeEstimateAccuracyTracker *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WLTimeEstimateAccuracyTracker;
  v2 = -[WLTimeEstimateAccuracyTracker init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WLTimeEstimateAccuracyTracker setThresholds:](v2, "setThresholds:", &unk_24E385940);
    -[WLTimeEstimateAccuracyTracker setSamples:](v3, "setSamples:", MEMORY[0x24BDBD1A8]);
  }
  return v3;
}

- (unint64_t)_thresholdAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;

  -[WLTimeEstimateAccuracyTracker thresholds](self, "thresholds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[WLTimeEstimateAccuracyTracker thresholds](self, "thresholds");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 <= a3)
  {
    objc_msgSend(v7, "lastObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    -[WLTimeEstimateAccuracyTracker thresholds](self, "thresholds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (a3 - objc_msgSend(v8, "count") + 2) * v12;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

  }
  return v10;
}

- (unint64_t)_indexOfThresholdGreaterThanOrEqualToEstimate:(unint64_t)a3
{
  unint64_t v5;

  v5 = -1;
  do
    ++v5;
  while (-[WLTimeEstimateAccuracyTracker _thresholdAtIndex:](self, "_thresholdAtIndex:", v5) < a3);
  return v5;
}

- (void)didCalculateTimeEstimate:(unint64_t)a3 atDate:(id)a4 associatedObject:(id)a5
{
  id v8;
  void *v9;
  unint64_t thresholdBelowLastSample;
  unint64_t v11;
  unint64_t v12;
  WLTimeEstimateSample *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  v8 = a5;
  if (a3)
  {
    -[WLTimeEstimateAccuracyTracker samples](self, "samples");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      thresholdBelowLastSample = self->_thresholdBelowLastSample;

      if (thresholdBelowLastSample < a3)
        goto LABEL_7;
    }
    else
    {

    }
    v11 = -[WLTimeEstimateAccuracyTracker _indexOfThresholdGreaterThanOrEqualToEstimate:](self, "_indexOfThresholdGreaterThanOrEqualToEstimate:", a3);
    v12 = v11 - 1;
    v13 = objc_alloc_init(WLTimeEstimateSample);
    -[WLTimeEstimateSample setEstimate:](v13, "setEstimate:", a3);
    -[WLTimeEstimateSample setStartDate:](v13, "setStartDate:", v16);
    -[WLTimeEstimateSample setThreshold:](v13, "setThreshold:", -[WLTimeEstimateAccuracyTracker _thresholdAtIndex:](self, "_thresholdAtIndex:", v11));
    -[WLTimeEstimateSample setAssociatedObject:](v13, "setAssociatedObject:", v8);
    -[WLTimeEstimateAccuracyTracker samples](self, "samples");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObject:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WLTimeEstimateAccuracyTracker setSamples:](self, "setSamples:", v15);

    self->_thresholdBelowLastSample = -[WLTimeEstimateAccuracyTracker _thresholdAtIndex:](self, "_thresholdAtIndex:", v12);
  }
LABEL_7:

}

- (void)estimatesDidResolveAtDate:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t, unint64_t, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t, unint64_t, void *))a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[WLTimeEstimateAccuracyTracker samples](self, "samples", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "startDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timeIntervalSinceDate:", v14);
        v16 = v15;

        v17 = objc_msgSend(v13, "estimate");
        v18 = objc_msgSend(v13, "threshold");
        objc_msgSend(v13, "associatedObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, v17, v18, vcvtpd_u64_f64(v16), v19);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

}

- (NSArray)thresholds
{
  return self->_thresholds;
}

- (void)setThresholds:(id)a3
{
  objc_storeStrong((id *)&self->_thresholds, a3);
}

- (NSArray)samples
{
  return self->_samples;
}

- (void)setSamples:(id)a3
{
  objc_storeStrong((id *)&self->_samples, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_thresholds, 0);
}

@end
