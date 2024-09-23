@implementation tt80_lstm_regressionOutput

- (tt80_lstm_regressionOutput)initWithTt80_prediction_in_hrs:(id)a3
{
  id v5;
  tt80_lstm_regressionOutput *v6;
  tt80_lstm_regressionOutput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)tt80_lstm_regressionOutput;
  v6 = -[tt80_lstm_regressionOutput init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_tt80_prediction_in_hrs, a3);

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_10002F158);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("tt80_prediction_in_hrs")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[tt80_lstm_regressionOutput tt80_prediction_in_hrs](self, "tt80_prediction_in_hrs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (MLMultiArray)tt80_prediction_in_hrs
{
  return self->_tt80_prediction_in_hrs;
}

- (void)setTt80_prediction_in_hrs:(id)a3
{
  objc_storeStrong((id *)&self->_tt80_prediction_in_hrs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tt80_prediction_in_hrs, 0);
}

@end
