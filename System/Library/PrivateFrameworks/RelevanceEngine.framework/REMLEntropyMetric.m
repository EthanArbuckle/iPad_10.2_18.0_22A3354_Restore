@implementation REMLEntropyMetric

- (id)name
{
  return self->_metricName;
}

- (REMLEntropyMetric)initWithName:(id)a3 featureName:(id)a4
{
  id v7;
  id v8;
  REMLEntropyMetric *v9;
  REMLEntropyMetric *v10;
  uint64_t v11;
  NSMutableArray *calibrationCurveTotal;
  uint64_t v13;
  NSMutableArray *calibrationCurveTrue;
  REMLEntropyMetric *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)REMLEntropyMetric;
  v9 = -[REMLEntropyMetric init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metricName, a3);
    objc_storeStrong((id *)&v10->_predictionFeatureName, a4);
    objc_storeStrong((id *)&v10->_truthFeatureName, a4);
    v10->_arrayFeatureIndex = 0;
    v10->_calibrationCurveNumBuckets = 10;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
    v11 = objc_claimAutoreleasedReturnValue();
    calibrationCurveTotal = v10->_calibrationCurveTotal;
    v10->_calibrationCurveTotal = (NSMutableArray *)v11;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v10->_calibrationCurveNumBuckets);
    v13 = objc_claimAutoreleasedReturnValue();
    calibrationCurveTrue = v10->_calibrationCurveTrue;
    v10->_calibrationCurveTrue = (NSMutableArray *)v13;

    -[REMLEntropyMetric reset](v10, "reset");
    v15 = v10;
  }

  return v10;
}

- (void)reset
{
  unint64_t v3;

  self->_normalizedLogScore = 0.0;
  *(_OWORD *)&self->_sumPrediction = 0u;
  *(_OWORD *)&self->_numExamples = 0u;
  if (self->_calibrationCurveNumBuckets)
  {
    v3 = 0;
    do
    {
      -[NSMutableArray setObject:atIndexedSubscript:](self->_calibrationCurveTotal, "setObject:atIndexedSubscript:", &unk_24CFC1540, v3);
      -[NSMutableArray setObject:atIndexedSubscript:](self->_calibrationCurveTrue, "setObject:atIndexedSubscript:", &unk_24CFC1540, v3++);
    }
    while (v3 < self->_calibrationCurveNumBuckets);
  }
}

- (id)meanEntropy
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", -self->_logScore / (double)self->_numExamples);
}

- (id)meanNormalizedEntropy
{
  double normalizedLogScore;
  double v3;

  normalizedLogScore = self->_normalizedLogScore;
  v3 = 0.0;
  if (normalizedLogScore != 0.0)
    v3 = self->_logScore / normalizedLogScore;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v3);
}

- (id)meanTruth
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_sumTruth / (double)self->_numExamples);
}

- (id)meanPrediction
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_sumPrediction / (double)self->_numExamples);
}

- (int64_t)numberOfExamples
{
  return self->_numExamples;
}

- (unint64_t)calibrationCurveNumBuckets
{
  return self->_calibrationCurveNumBuckets;
}

- (id)calibrationCurveTotal
{
  return self->_calibrationCurveTrue;
}

- (id)calibrationCurveTrue
{
  return self->_calibrationCurveTrue;
}

- (double)getDoubleFromFeatureValue:(id)a3
{
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v4 = a3;
  v5 = v4;
  v6 = 0.0;
  if (v4)
  {
    v7 = objc_msgSend(v4, "type");
    switch(v7)
    {
      case 1:
        if (objc_msgSend(v5, "int64Value"))
          v6 = 1.0;
        else
          v6 = 0.0;
        break;
      case 2:
        objc_msgSend(v5, "doubleValue");
        v6 = v11;
        break;
      case 5:
        objc_msgSend(v5, "multiArrayValue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndexedSubscript:", self->_arrayFeatureIndex);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v6 = v10;

        break;
    }
  }

  return v6;
}

- (void)updateMetricsFromFeatures:(id)a3 prediction:(id)a4 truth:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  long double v11;
  double v12;
  double v13;
  double v14;
  int64_t numExamples;
  double v16;
  double v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  id v26;

  v26 = a4;
  v7 = a5;
  ++self->_numExamples;
  objc_msgSend(v26, "featureValueForName:", self->_predictionFeatureName);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "featureValueForName:", self->_truthFeatureName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMLEntropyMetric getDoubleFromFeatureValue:](self, "getDoubleFromFeatureValue:", v8);
  v11 = v10;
  -[REMLEntropyMetric getDoubleFromFeatureValue:](self, "getDoubleFromFeatureValue:", v9);
  v13 = v12;
  v14 = v11 + self->_sumPrediction;
  numExamples = self->_numExamples;
  v16 = v13 + self->_sumTruth;
  self->_sumTruth = v16;
  self->_sumPrediction = v14;
  v17 = v16 / (double)numExamples;
  if (v13 > 0.0)
  {
    self->_logScore = self->_logScore + v13 * log(v11);
    self->_normalizedLogScore = self->_normalizedLogScore + v13 * log(v17);
  }
  if (v13 < 1.0)
  {
    self->_logScore = self->_logScore + (1.0 - v13) * log(1.0 - v11);
    self->_normalizedLogScore = self->_normalizedLogScore + (1.0 - v13) * log(1.0 - v17);
  }
  v18 = (unint64_t)fmin(v11 * (double)self->_calibrationCurveNumBuckets, (double)(self->_calibrationCurveNumBuckets - 1));
  v19 = (void *)MEMORY[0x24BDD16E0];
  -[NSMutableArray objectAtIndexedSubscript:](self->_calibrationCurveTotal, "objectAtIndexedSubscript:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithInt:", objc_msgSend(v20, "intValue") + 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray setObject:atIndexedSubscript:](self->_calibrationCurveTotal, "setObject:atIndexedSubscript:", v21, v18);

  v22 = (void *)MEMORY[0x24BDD16E0];
  -[NSMutableArray objectAtIndexedSubscript:](self->_calibrationCurveTrue, "objectAtIndexedSubscript:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  objc_msgSend(v22, "numberWithDouble:", v13 + v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray setObject:atIndexedSubscript:](self->_calibrationCurveTrue, "setObject:atIndexedSubscript:", v25, v18);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calibrationCurveTrue, 0);
  objc_storeStrong((id *)&self->_calibrationCurveTotal, 0);
  objc_storeStrong((id *)&self->_truthFeatureName, 0);
  objc_storeStrong((id *)&self->_predictionFeatureName, 0);
  objc_storeStrong((id *)&self->_metricName, 0);
}

@end
