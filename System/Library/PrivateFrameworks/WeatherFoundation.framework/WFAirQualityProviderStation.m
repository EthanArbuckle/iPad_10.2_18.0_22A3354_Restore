@implementation WFAirQualityProviderStation

- (WFAirQualityProviderStation)initWithLocation:(id)a3 lastReadDate:(id)a4
{
  id v7;
  id v8;
  WFAirQualityProviderStation *v9;
  WFAirQualityProviderStation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFAirQualityProviderStation;
  v9 = -[WFAirQualityProviderStation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_location, a3);
    objc_storeStrong((id *)&v10->_lastReadDate, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[WFAirQualityProviderStation location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityProviderStation lastReadDate](self, "lastReadDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WFAirQualityProviderStation location: %@, lastReadDate: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDate)lastReadDate
{
  return self->_lastReadDate;
}

- (CLLocation)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_lastReadDate, 0);
}

@end
