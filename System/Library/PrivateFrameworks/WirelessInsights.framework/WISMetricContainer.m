@implementation WISMetricContainer

- (WISMetricContainer)initWithMetricId:(unsigned int)a3
{
  WISMetricContainer *v4;
  WISMetricContainer *v5;
  PBCodable *metric;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WISMetricContainer;
  v4 = -[WISMetricContainer init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    metric = v4->_metric;
    v4->_metric = 0;

    v5->_metricId = a3;
  }
  return v5;
}

- (PBCodable)metric
{
  return self->_metric;
}

- (void)setMetric:(id)a3
{
  objc_storeStrong((id *)&self->_metric, a3);
}

- (unsigned)metricId
{
  return self->_metricId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metric, 0);
}

@end
