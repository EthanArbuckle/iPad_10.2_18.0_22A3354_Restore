@implementation BMStreamCRDTLocationDayAssigner

- (BMStreamCRDTLocationDayAssigner)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BMStreamCRDTLocationDayAssigner;
  return -[BMStreamCRDTLocationDayAssigner init](&v3, "init");
}

+ (id)truncateDateToDay:(double)a3
{
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", floor(a3 / 86400.0) * 86400.0);
}

- (id)locationWithStreamName:(id)a3 siteIdentifier:(id)a4 timestamp:(double)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  BMStreamCRDTLocation *v13;

  v8 = a4;
  v9 = a3;
  v11 = objc_msgSend((id)objc_opt_class(self, v10), "truncateDateToDay:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = -[BMStreamCRDTLocation initWithStreamName:siteIdentifier:day:]([BMStreamCRDTLocation alloc], "initWithStreamName:siteIdentifier:day:", v9, v8, v12);

  return v13;
}

@end
