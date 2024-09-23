@implementation WFForecastResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFForecastResponse)initWithCoder:(id)a3
{
  id v4;
  WFForecastResponse *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFForecastResponse;
  v5 = -[WFResponse initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WFForecastResponseForecastKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFForecastResponse setForecast:](v5, "setForecast:", v6);

    -[WFForecastResponse setForecastType:](v5, "setForecastType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("WFForecastResponseForecastTypeKey")));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("WFForecastResponseRawAPIResponse"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFForecastResponse setRawAPIData:](v5, "setRawAPIData:", v7);

    -[WFForecastResponse setResponseWasFromCache:](v5, "setResponseWasFromCache:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WFForecastResponseWasFromCacheKey")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFForecastResponse;
  -[WFResponse encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[WFForecastResponse forecast](self, "forecast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFForecastResponseForecastKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[WFForecastResponse forecastType](self, "forecastType"), CFSTR("WFForecastResponseForecastTypeKey"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WFForecastResponse responseWasFromCache](self, "responseWasFromCache"), CFSTR("WFForecastResponseWasFromCacheKey"));
  -[WFForecastResponse rawAPIData](self, "rawAPIData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFForecastResponse rawAPIData](self, "rawAPIData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("WFForecastResponseRawAPIResponse"));

  }
}

- (WFWeatherConditions)forecast
{
  return self->_forecast;
}

- (void)setForecast:(id)a3
{
  objc_storeStrong((id *)&self->_forecast, a3);
}

- (unint64_t)forecastType
{
  return self->_forecastType;
}

- (void)setForecastType:(unint64_t)a3
{
  self->_forecastType = a3;
}

- (BOOL)responseWasFromCache
{
  return self->_responseWasFromCache;
}

- (void)setResponseWasFromCache:(BOOL)a3
{
  self->_responseWasFromCache = a3;
}

- (NSData)rawAPIData
{
  return self->_rawAPIData;
}

- (void)setRawAPIData:(id)a3
{
  objc_storeStrong((id *)&self->_rawAPIData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAPIData, 0);
  objc_storeStrong((id *)&self->_forecast, 0);
}

@end
