@implementation AWDMetricContainer

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
