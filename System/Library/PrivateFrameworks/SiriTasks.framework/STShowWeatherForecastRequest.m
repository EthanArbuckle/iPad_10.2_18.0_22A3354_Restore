@implementation STShowWeatherForecastRequest

- (id)_initWithCurrentConditions:(id)a3 hourlyForecasts:(id)a4 city:(id)a5 units:(id)a6 forecastType:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  STShowWeatherForecastRequest *v17;
  STShowWeatherForecastRequest *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)STShowWeatherForecastRequest;
  v17 = -[AFSiriRequest init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_currentConditions, a3);
    objc_storeStrong((id *)&v18->_hourlyForecasts, a4);
    objc_storeStrong((id *)&v18->_city, a5);
    objc_storeStrong((id *)&v18->_units, a6);
    v18->_forecastType = a7;
  }

  return v18;
}

- (id)createResponse
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE092F0]), "_initWithRequest:", self);
}

- (id)currentConditions
{
  return self->_currentConditions;
}

- (id)hourlyForecasts
{
  return self->_hourlyForecasts;
}

- (id)city
{
  return self->_city;
}

- (id)units
{
  return self->_units;
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
  v5.super_class = (Class)STShowWeatherForecastRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_currentConditions, CFSTR("_currentConditions"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_hourlyForecasts, CFSTR("_hourlyForecasts"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_city, CFSTR("_city"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_units, CFSTR("_units"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_forecastType, CFSTR("_forecastType"));

}

- (STShowWeatherForecastRequest)initWithCoder:(id)a3
{
  id v4;
  STShowWeatherForecastRequest *v5;
  uint64_t v6;
  STWeatherCurrentConditions *currentConditions;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *hourlyForecasts;
  uint64_t v13;
  STCity *city;
  uint64_t v15;
  STWeatherUnits *units;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STShowWeatherForecastRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v18, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_currentConditions"));
    v6 = objc_claimAutoreleasedReturnValue();
    currentConditions = v5->_currentConditions;
    v5->_currentConditions = (STWeatherCurrentConditions *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("_hourlyForecasts"));
    v11 = objc_claimAutoreleasedReturnValue();
    hourlyForecasts = v5->_hourlyForecasts;
    v5->_hourlyForecasts = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_city"));
    v13 = objc_claimAutoreleasedReturnValue();
    city = v5->_city;
    v5->_city = (STCity *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_units"));
    v15 = objc_claimAutoreleasedReturnValue();
    units = v5->_units;
    v5->_units = (STWeatherUnits *)v15;

    v5->_forecastType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_forecastType"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_units, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_hourlyForecasts, 0);
  objc_storeStrong((id *)&self->_currentConditions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
