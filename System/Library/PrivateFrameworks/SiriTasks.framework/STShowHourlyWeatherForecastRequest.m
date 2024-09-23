@implementation STShowHourlyWeatherForecastRequest

- (id)_initWithCurrentAttributes:(id)a3 hourlyAttributes:(id)a4 city:(id)a5 startHour:(int64_t)a6 forecastType:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  STShowHourlyWeatherForecastRequest *v16;
  STShowHourlyWeatherForecastRequest *v17;
  uint64_t v18;
  NSArray *hourlyAttributes;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)STShowHourlyWeatherForecastRequest;
  v16 = -[AFSiriRequest init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_currentAttributes, a3);
    v18 = objc_msgSend(v14, "copy");
    hourlyAttributes = v17->_hourlyAttributes;
    v17->_hourlyAttributes = (NSArray *)v18;

    objc_storeStrong((id *)&v17->_city, a5);
    v17->_startHour = a6;
    v17->_forecastType = a7;
  }

  return v17;
}

- (id)createResponse
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092F0]), "_initWithRequest:", self);
}

- (id)currentAttributes
{
  return self->_currentAttributes;
}

- (id)hourlyAttributes
{
  return self->_hourlyAttributes;
}

- (id)city
{
  return self->_city;
}

- (int64_t)startHour
{
  return self->_startHour;
}

- (int64_t)forecastType
{
  return self->_forecastType;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STShowHourlyWeatherForecastRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentAttributes, CFSTR("_currentAttributes"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_hourlyAttributes, CFSTR("_hourlyAttributes"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_city, CFSTR("_city"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_startHour, CFSTR("_startHour"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_forecastType, CFSTR("_forecastType"));

}

- (STShowHourlyWeatherForecastRequest)initWithCoder:(id)a3
{
  id v4;
  STShowHourlyWeatherForecastRequest *v5;
  uint64_t v6;
  STWeatherAttributes *currentAttributes;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *hourlyAttributes;
  uint64_t v13;
  STCity *city;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)STShowHourlyWeatherForecastRequest;
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
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_hourlyAttributes"));
    v11 = objc_claimAutoreleasedReturnValue();
    hourlyAttributes = v5->_hourlyAttributes;
    v5->_hourlyAttributes = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_city"));
    v13 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (STCity *)v13;

    v5->_startHour = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_startHour"));
    v5->_forecastType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_forecastType"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_hourlyAttributes, 0);
  objc_storeStrong((id *)&self->_currentAttributes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
