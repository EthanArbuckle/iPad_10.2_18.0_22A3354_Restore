@implementation CLWeatherServiceData

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  -[CLWeatherServiceData timestamp](self, "timestamp");
  objc_msgSend(v4, "setTimestamp:");
  -[CLWeatherServiceData weatherPressure](self, "weatherPressure");
  objc_msgSend(v4, "setWeatherPressure:");
  objc_msgSend(v4, "setPrecipitationType:", +[NSString stringWithString:](NSString, "stringWithString:", -[CLWeatherServiceData precipitationType](self, "precipitationType")));
  -[CLWeatherServiceData temperature](self, "temperature");
  objc_msgSend(v4, "setTemperature:");
  -[CLWeatherServiceData feelsLikeTemperature](self, "feelsLikeTemperature");
  objc_msgSend(v4, "setFeelsLikeTemperature:");
  return v4;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (float)weatherPressure
{
  return self->_weatherPressure;
}

- (void)setWeatherPressure:(float)a3
{
  self->_weatherPressure = a3;
}

- (NSString)precipitationType
{
  return self->_precipitationType;
}

- (void)setPrecipitationType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (float)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(float)a3
{
  self->_temperature = a3;
}

- (float)feelsLikeTemperature
{
  return self->_feelsLikeTemperature;
}

- (void)setFeelsLikeTemperature:(float)a3
{
  self->_feelsLikeTemperature = a3;
}

@end
