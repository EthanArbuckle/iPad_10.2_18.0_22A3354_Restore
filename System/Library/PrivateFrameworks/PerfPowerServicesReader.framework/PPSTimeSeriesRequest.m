@implementation PPSTimeSeriesRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSTimeSeriesRequest)initWithCoder:(id)a3
{
  id v4;
  PPSTimeSeriesRequest *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PPSTimeSeriesRequest;
  v5 = -[PPSDataRequest initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_limitCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limitCount"));
    v5->_offsetCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("offsetCount"));
    v5->_readDirection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("readDirection"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PPSTimeSeriesRequest;
  v4 = a3;
  -[PPSDataRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limitCount, CFSTR("limitCount"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_offsetCount, CFSTR("offsetCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_readDirection, CFSTR("readDirection"));

}

- (PPSTimeSeriesRequest)initWithMetrics:(id)a3 predicate:(id)a4 timeFilter:(id)a5
{
  return -[PPSTimeSeriesRequest initWithMetrics:predicate:timeFilter:limitCount:offsetCount:readDirection:](self, "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:readDirection:", a3, a4, a5, 0, 0, 0);
}

- (PPSTimeSeriesRequest)initWithMetrics:(id)a3 predicate:(id)a4 timeFilter:(id)a5 limitCount:(unint64_t)a6 offsetCount:(unint64_t)a7
{
  return -[PPSTimeSeriesRequest initWithMetrics:predicate:timeFilter:limitCount:offsetCount:readDirection:](self, "initWithMetrics:predicate:timeFilter:limitCount:offsetCount:readDirection:", a3, a4, a5, a6, a7, 0);
}

- (PPSTimeSeriesRequest)initWithMetrics:(id)a3 predicate:(id)a4 timeFilter:(id)a5 limitCount:(unint64_t)a6 offsetCount:(unint64_t)a7 readDirection:(unint64_t)a8
{
  PPSTimeSeriesRequest *result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PPSTimeSeriesRequest;
  result = -[PPSDataRequest initWithRequestType:metrics:predicate:timeFilter:](&v12, sel_initWithRequestType_metrics_predicate_timeFilter_, 0, a3, a4, a5);
  if (result)
  {
    result->_limitCount = a6;
    result->_offsetCount = a7;
    result->_readDirection = a8;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = -[PPSDataRequest requestType](self, "requestType");
  -[PPSDataRequest metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSDataRequest predicate](self, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSDataRequest timeFilter](self, "timeFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { type: %ld, metrics: %@, predicate: %@, timeFilter: %@ limitCount:%ld offsetCount:%ld readDirection: %ld }>"), v4, self, v5, v6, v7, v8, -[PPSTimeSeriesRequest limitCount](self, "limitCount"), -[PPSTimeSeriesRequest offsetCount](self, "offsetCount"), -[PPSTimeSeriesRequest readDirection](self, "readDirection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)limitCount
{
  return self->_limitCount;
}

- (unint64_t)offsetCount
{
  return self->_offsetCount;
}

- (unint64_t)readDirection
{
  return self->_readDirection;
}

@end
