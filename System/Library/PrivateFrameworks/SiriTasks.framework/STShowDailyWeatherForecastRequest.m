@implementation STShowDailyWeatherForecastRequest

- (id)_initWithCurrentAttributes:(id)a3 dailyAttributes:(id)a4 city:(id)a5 startWeekday:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  STShowDailyWeatherForecastRequest *v14;
  STShowDailyWeatherForecastRequest *v15;
  uint64_t v16;
  NSArray *dailyAttributes;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)STShowDailyWeatherForecastRequest;
  v14 = -[AFSiriRequest init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_currentAttributes, a3);
    v16 = objc_msgSend(v12, "copy");
    dailyAttributes = v15->_dailyAttributes;
    v15->_dailyAttributes = (NSArray *)v16;

    objc_storeStrong((id *)&v15->_city, a5);
    v15->_startWeekday = a6;
  }

  return v15;
}

- (id)createResponse
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092F0]), "_initWithRequest:", self);
}

- (id)currentAttributes
{
  return self->_currentAttributes;
}

- (id)dailyAttributes
{
  return self->_dailyAttributes;
}

- (id)city
{
  return self->_city;
}

- (int64_t)startWeekday
{
  return self->_startWeekday;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STShowDailyWeatherForecastRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentAttributes, CFSTR("_currentAttributes"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_dailyAttributes, CFSTR("_dailyAttributes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_city, CFSTR("_city"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_startWeekday, CFSTR("_startWeekday"));

}

- (STShowDailyWeatherForecastRequest)initWithCoder:(id)a3
{
  id v4;
  STShowDailyWeatherForecastRequest *v5;
  uint64_t v6;
  STWeatherAttributes *currentAttributes;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *dailyAttributes;
  uint64_t v13;
  STCity *city;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)STShowDailyWeatherForecastRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_currentAttributes"));
    v6 = objc_claimAutoreleasedReturnValue();
    currentAttributes = v5->_currentAttributes;
    v5->_currentAttributes = (STWeatherAttributes *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_dailyAttributes"));
    v11 = objc_claimAutoreleasedReturnValue();
    dailyAttributes = v5->_dailyAttributes;
    v5->_dailyAttributes = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_city"));
    v13 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (STCity *)v13;

    v5->_startWeekday = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_startWeekday"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_dailyAttributes, 0);
  objc_storeStrong((id *)&self->_currentAttributes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
