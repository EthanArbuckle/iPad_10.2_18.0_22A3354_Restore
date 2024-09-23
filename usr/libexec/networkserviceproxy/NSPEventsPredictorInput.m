@implementation NSPEventsPredictorInput

- (NSPEventsPredictorInput)initWithLstm_input:(id)a3
{
  id v5;
  NSPEventsPredictorInput *v6;
  NSPEventsPredictorInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSPEventsPredictorInput;
  v6 = -[NSPEventsPredictorInput init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_lstm_input, a3);

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000FF8A8);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("lstm_input")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSPEventsPredictorInput lstm_input](self, "lstm_input"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (MLMultiArray)lstm_input
{
  return self->_lstm_input;
}

- (void)setLstm_input:(id)a3
{
  objc_storeStrong((id *)&self->_lstm_input, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lstm_input, 0);
}

@end
