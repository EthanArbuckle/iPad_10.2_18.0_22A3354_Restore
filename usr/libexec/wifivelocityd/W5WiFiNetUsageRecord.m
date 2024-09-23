@implementation W5WiFiNetUsageRecord

- (id)init:(id)a3 usageData:(id)a4
{
  id v5;
  id v6;
  W5WiFiNetUsageRecord *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)W5WiFiNetUsageRecord;
  v5 = a4;
  v6 = a3;
  v7 = -[W5WiFiNetUsageRecord init](&v9, "init");
  -[W5WiFiNetUsageRecord setDate:](v7, "setDate:", v6, v9.receiver, v9.super_class);

  -[W5WiFiNetUsageRecord setUsageData:](v7, "setUsageData:", v5);
  return v7;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSArray)usageData
{
  return self->_usageData;
}

- (void)setUsageData:(id)a3
{
  objc_storeStrong((id *)&self->_usageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageData, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
