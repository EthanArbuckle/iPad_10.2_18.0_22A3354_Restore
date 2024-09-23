@implementation nccp_wra_qmaxp_seq_modelInput

- (nccp_wra_qmaxp_seq_modelInput)initWithDaily_history_input:(id)a3 usage_history_input:(id)a4
{
  id v7;
  id v8;
  nccp_wra_qmaxp_seq_modelInput *v9;
  nccp_wra_qmaxp_seq_modelInput *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)nccp_wra_qmaxp_seq_modelInput;
  v9 = -[nccp_wra_qmaxp_seq_modelInput init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_daily_history_input, a3);
    objc_storeStrong((id *)&v10->_usage_history_input, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_10002F110);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("daily_history_input")))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[nccp_wra_qmaxp_seq_modelInput daily_history_input](self, "daily_history_input"));
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("usage_history_input")))
    {
      v7 = 0;
      goto LABEL_7;
    }
    v5 = objc_claimAutoreleasedReturnValue(-[nccp_wra_qmaxp_seq_modelInput usage_history_input](self, "usage_history_input"));
  }
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v5));

LABEL_7:
  return v7;
}

- (MLMultiArray)daily_history_input
{
  return self->_daily_history_input;
}

- (void)setDaily_history_input:(id)a3
{
  objc_storeStrong((id *)&self->_daily_history_input, a3);
}

- (MLMultiArray)usage_history_input
{
  return self->_usage_history_input;
}

- (void)setUsage_history_input:(id)a3
{
  objc_storeStrong((id *)&self->_usage_history_input, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usage_history_input, 0);
  objc_storeStrong((id *)&self->_daily_history_input, 0);
}

@end
