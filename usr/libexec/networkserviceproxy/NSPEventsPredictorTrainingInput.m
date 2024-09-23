@implementation NSPEventsPredictorTrainingInput

- (NSPEventsPredictorTrainingInput)initWithLstm_input:(id)a3 sequential_TimeDistributedDense_dense_BiasAdd_true:(id)a4
{
  id v7;
  id v8;
  NSPEventsPredictorTrainingInput *v9;
  NSPEventsPredictorTrainingInput *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NSPEventsPredictorTrainingInput;
  v9 = -[NSPEventsPredictorTrainingInput init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lstm_input, a3);
    objc_storeStrong((id *)&v10->_sequential_TimeDistributedDense_dense_BiasAdd_true, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000FF8D8);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("lstm_input")))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NSPEventsPredictorTrainingInput lstm_input](self, "lstm_input"));
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("sequential/TimeDistributedDense/dense/BiasAdd_true")))
    {
      v7 = 0;
      goto LABEL_7;
    }
    v5 = objc_claimAutoreleasedReturnValue(-[NSPEventsPredictorTrainingInput sequential_TimeDistributedDense_dense_BiasAdd_true](self, "sequential_TimeDistributedDense_dense_BiasAdd_true"));
  }
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v5));

LABEL_7:
  return v7;
}

- (MLMultiArray)lstm_input
{
  return self->_lstm_input;
}

- (void)setLstm_input:(id)a3
{
  objc_storeStrong((id *)&self->_lstm_input, a3);
}

- (MLMultiArray)sequential_TimeDistributedDense_dense_BiasAdd_true
{
  return self->_sequential_TimeDistributedDense_dense_BiasAdd_true;
}

- (void)setSequential_TimeDistributedDense_dense_BiasAdd_true:(id)a3
{
  objc_storeStrong((id *)&self->_sequential_TimeDistributedDense_dense_BiasAdd_true, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequential_TimeDistributedDense_dense_BiasAdd_true, 0);
  objc_storeStrong((id *)&self->_lstm_input, 0);
}

@end
