@implementation TIMetricDescriptor

- (TIMetricDescriptor)initWithMetricName:(id)a3
{
  id v5;
  TIMetricDescriptor *v6;
  TIMetricDescriptor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIMetricDescriptor;
  v6 = -[TIMetricDescriptor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_metricName, a3);

  return v7;
}

- (NSString)metricName
{
  return self->_metricName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricName, 0);
}

@end
