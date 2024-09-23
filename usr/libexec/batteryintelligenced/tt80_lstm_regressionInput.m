@implementation tt80_lstm_regressionInput

- (tt80_lstm_regressionInput)initWithSbc_in:(id)a3
{
  id v5;
  tt80_lstm_regressionInput *v6;
  tt80_lstm_regressionInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)tt80_lstm_regressionInput;
  v6 = -[tt80_lstm_regressionInput init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sbc_in, a3);

  return v7;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_10002F140);
}

- (id)featureValueForName:(id)a3
{
  void *v4;
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("sbc_in")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[tt80_lstm_regressionInput sbc_in](self, "sbc_in"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v4));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (MLMultiArray)sbc_in
{
  return self->_sbc_in;
}

- (void)setSbc_in:(id)a3
{
  objc_storeStrong((id *)&self->_sbc_in, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbc_in, 0);
}

@end
