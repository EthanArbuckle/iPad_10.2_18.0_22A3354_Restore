@implementation STWeatherHourlyForecast

- (id)_initWithConditionCodeIndex:(int64_t)a3 timeIndex:(int64_t)a4 temperature:(id)a5 chanceOfPrecipitation:(id)a6
{
  id v11;
  id v12;
  STWeatherHourlyForecast *v13;
  id *p_isa;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)STWeatherHourlyForecast;
  v13 = -[STWeatherHourlyForecast init](&v16, sel_init);
  p_isa = (id *)&v13->super.super.isa;
  if (v13)
  {
    v13->_conditionCode = a3;
    v13->_timeIndex = a4;
    objc_storeStrong((id *)&v13->_temperature, a5);
    objc_storeStrong(p_isa + 5, a6);
  }

  return p_isa;
}

- (int64_t)timeIndex
{
  return self->_timeIndex;
}

- (int64_t)conditionCode
{
  return self->_conditionCode;
}

- (id)temperature
{
  return self->_temperature;
}

- (id)chanceOfPrecipitation
{
  return self->_chanceOfPrecipitation;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STWeatherHourlyForecast;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_conditionCode, CFSTR("_conditionCode"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_timeIndex, CFSTR("_timeIndex"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_temperature, CFSTR("_temperature"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_chanceOfPrecipitation, CFSTR("_chanceOfPrecipitation"));

}

- (STWeatherHourlyForecast)initWithCoder:(id)a3
{
  id v4;
  STWeatherHourlyForecast *v5;
  uint64_t v6;
  NSNumber *temperature;
  uint64_t v8;
  NSNumber *chanceOfPrecipitation;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STWeatherHourlyForecast;
  v5 = -[STSiriModelObject initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_conditionCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_conditionCode"));
    v5->_timeIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_timeIndex"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_temperature"));
    v6 = objc_claimAutoreleasedReturnValue();
    temperature = v5->_temperature;
    v5->_temperature = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_chanceOfPrecipitation"));
    v8 = objc_claimAutoreleasedReturnValue();
    chanceOfPrecipitation = v5->_chanceOfPrecipitation;
    v5->_chanceOfPrecipitation = (NSNumber *)v8;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chanceOfPrecipitation, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
