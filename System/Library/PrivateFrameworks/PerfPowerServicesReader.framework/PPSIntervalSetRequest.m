@implementation PPSIntervalSetRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSIntervalSetRequest)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PPSIntervalSetRequest;
  return -[PPSDataRequest initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPSIntervalSetRequest;
  -[PPSDataRequest encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (PPSIntervalSetRequest)initWithMetrics:(id)a3 predicate:(id)a4 timeFilter:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPSIntervalSetRequest;
  return -[PPSDataRequest initWithRequestType:metrics:predicate:timeFilter:](&v6, sel_initWithRequestType_metrics_predicate_timeFilter_, 2, a3, a4, a5);
}

- (PPSIntervalSetRequest)initWithMetrics:(id)a3 dimensions:(id)a4 predicate:(id)a5 timeFilter:(id)a6
{
  id v11;
  PPSIntervalSetRequest *v12;
  PPSIntervalSetRequest *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PPSIntervalSetRequest;
  v12 = -[PPSDataRequest initWithRequestType:metrics:predicate:timeFilter:](&v15, sel_initWithRequestType_metrics_predicate_timeFilter_, 2, a3, a5, a6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_dimensions, a4);

  return v13;
}

- (NSArray)dimensions
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensions, 0);
}

@end
