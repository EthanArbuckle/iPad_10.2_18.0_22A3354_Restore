@implementation SignpostReporterAggregation

- (SignpostReporterAggregation)init
{
  SignpostReporterAggregation *v2;
  uint64_t v3;
  NSDictionary *aggregationDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SignpostReporterAggregation;
  v2 = -[SignpostReporterAggregation init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    aggregationDictionary = v2->_aggregationDictionary;
    v2->_aggregationDictionary = (NSDictionary *)v3;

  }
  return v2;
}

- (unint64_t)countForSubsystem:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  SignpostReporterAggregationKey *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = -[SignpostReporterAggregationKey initWithSubsystem:category:]([SignpostReporterAggregationKey alloc], "initWithSubsystem:category:", v7, v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregation aggregationDictionary](self, "aggregationDictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));

  if (v10)
    v11 = objc_msgSend(v10, "unsignedLongLongValue");
  else
    v11 = 0;

  return (unint64_t)v11;
}

- (id)keysInDescendingCountOrder
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregation aggregationDictionary](self, "aggregationDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "keysSortedByValueUsingComparator:", &stru_100010980));

  return v3;
}

- (void)incrementSubsystem:(id)a3 category:(id)a4
{
  id v6;
  id v7;
  SignpostReporterAggregationKey *v8;
  uint64_t v9;
  _UNKNOWN **v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregation aggregationDictionary](self, "aggregationDictionary"));
  v8 = -[SignpostReporterAggregationKey initWithSubsystem:category:]([SignpostReporterAggregationKey alloc], "initWithSubsystem:category:", v7, v6);

  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v8));
  if (v9)
    v10 = (_UNKNOWN **)v9;
  else
    v10 = &off_1000121C0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)objc_msgSend(v10, "unsignedLongLongValue") + 1));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v8);

  ++self->_totalCount;
}

- (unint64_t)totalCount
{
  return self->_totalCount;
}

- (NSDictionary)aggregationDictionary
{
  return self->_aggregationDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregationDictionary, 0);
}

@end
