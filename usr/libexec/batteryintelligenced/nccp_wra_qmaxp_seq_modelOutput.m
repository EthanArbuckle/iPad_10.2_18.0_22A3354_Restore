@implementation nccp_wra_qmaxp_seq_modelOutput

- (nccp_wra_qmaxp_seq_modelOutput)initWithNccp_wra_qmaxp_q10_forecast:(id)a3 nccp_wra_qmaxp_q25_forecast:(id)a4 nccp_wra_qmaxp_q50_forecast:(id)a5 nccp_wra_qmaxp_q75_forecast:(id)a6 nccp_wra_qmaxp_q90_forecast:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  nccp_wra_qmaxp_seq_modelOutput *v17;
  nccp_wra_qmaxp_seq_modelOutput *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)nccp_wra_qmaxp_seq_modelOutput;
  v17 = -[nccp_wra_qmaxp_seq_modelOutput init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_nccp_wra_qmaxp_q10_forecast, a3);
    objc_storeStrong((id *)&v18->_nccp_wra_qmaxp_q25_forecast, a4);
    objc_storeStrong((id *)&v18->_nccp_wra_qmaxp_q50_forecast, a5);
    objc_storeStrong((id *)&v18->_nccp_wra_qmaxp_q75_forecast, a6);
    objc_storeStrong((id *)&v18->_nccp_wra_qmaxp_q90_forecast, a7);
  }

  return v18;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:](NSSet, "setWithArray:", &off_10002F128);
}

- (id)featureValueForName:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("nccp_wra_qmaxp_q10_forecast")))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[nccp_wra_qmaxp_seq_modelOutput nccp_wra_qmaxp_q10_forecast](self, "nccp_wra_qmaxp_q10_forecast"));
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("nccp_wra_qmaxp_q25_forecast")))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[nccp_wra_qmaxp_seq_modelOutput nccp_wra_qmaxp_q25_forecast](self, "nccp_wra_qmaxp_q25_forecast"));
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("nccp_wra_qmaxp_q50_forecast")))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[nccp_wra_qmaxp_seq_modelOutput nccp_wra_qmaxp_q50_forecast](self, "nccp_wra_qmaxp_q50_forecast"));
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("nccp_wra_qmaxp_q75_forecast")))
  {
    v5 = objc_claimAutoreleasedReturnValue(-[nccp_wra_qmaxp_seq_modelOutput nccp_wra_qmaxp_q75_forecast](self, "nccp_wra_qmaxp_q75_forecast"));
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("nccp_wra_qmaxp_q90_forecast")))
    {
      v7 = 0;
      goto LABEL_12;
    }
    v5 = objc_claimAutoreleasedReturnValue(-[nccp_wra_qmaxp_seq_modelOutput nccp_wra_qmaxp_q90_forecast](self, "nccp_wra_qmaxp_q90_forecast"));
  }
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v5));

LABEL_12:
  return v7;
}

- (MLMultiArray)nccp_wra_qmaxp_q10_forecast
{
  return self->_nccp_wra_qmaxp_q10_forecast;
}

- (void)setNccp_wra_qmaxp_q10_forecast:(id)a3
{
  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q10_forecast, a3);
}

- (MLMultiArray)nccp_wra_qmaxp_q25_forecast
{
  return self->_nccp_wra_qmaxp_q25_forecast;
}

- (void)setNccp_wra_qmaxp_q25_forecast:(id)a3
{
  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q25_forecast, a3);
}

- (MLMultiArray)nccp_wra_qmaxp_q50_forecast
{
  return self->_nccp_wra_qmaxp_q50_forecast;
}

- (void)setNccp_wra_qmaxp_q50_forecast:(id)a3
{
  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q50_forecast, a3);
}

- (MLMultiArray)nccp_wra_qmaxp_q75_forecast
{
  return self->_nccp_wra_qmaxp_q75_forecast;
}

- (void)setNccp_wra_qmaxp_q75_forecast:(id)a3
{
  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q75_forecast, a3);
}

- (MLMultiArray)nccp_wra_qmaxp_q90_forecast
{
  return self->_nccp_wra_qmaxp_q90_forecast;
}

- (void)setNccp_wra_qmaxp_q90_forecast:(id)a3
{
  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q90_forecast, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q90_forecast, 0);
  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q75_forecast, 0);
  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q50_forecast, 0);
  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q25_forecast, 0);
  objc_storeStrong((id *)&self->_nccp_wra_qmaxp_q10_forecast, 0);
}

@end
