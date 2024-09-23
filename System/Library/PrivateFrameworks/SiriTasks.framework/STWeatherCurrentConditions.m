@implementation STWeatherCurrentConditions

- (id)_initWithConditionCode:(int64_t)a3 temperature:(id)a4 highTemperature:(id)a5 lowTemperature:(id)a6
{
  id v11;
  id v12;
  id v13;
  STWeatherCurrentConditions *v14;
  id *p_isa;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)STWeatherCurrentConditions;
  v14 = -[STWeatherCurrentConditions init](&v17, sel_init);
  p_isa = (id *)&v14->super.super.isa;
  if (v14)
  {
    v14->_conditionCode = a3;
    objc_storeStrong((id *)&v14->_temperature, a4);
    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 5, a6);
  }

  return p_isa;
}

- (int64_t)conditionCode
{
  return self->_conditionCode;
}

- (id)temperature
{
  return self->_temperature;
}

- (id)highTemperature
{
  return self->_highTemperature;
}

- (id)lowTemperature
{
  return self->_lowTemperature;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STWeatherCurrentConditions;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_conditionCode, CFSTR("_conditionCode"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_temperature, CFSTR("_temperature"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_highTemperature, CFSTR("_highTemperature"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lowTemperature, CFSTR("_lowTemperature"));

}

- (STWeatherCurrentConditions)initWithCoder:(id)a3
{
  id v4;
  STWeatherCurrentConditions *v5;
  uint64_t v6;
  NSNumber *temperature;
  uint64_t v8;
  NSNumber *highTemperature;
  uint64_t v10;
  NSNumber *lowTemperature;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STWeatherCurrentConditions;
  v5 = -[STSiriModelObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_conditionCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_conditionCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_temperature"));
    v6 = objc_claimAutoreleasedReturnValue();
    temperature = v5->_temperature;
    v5->_temperature = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_highTemperature"));
    v8 = objc_claimAutoreleasedReturnValue();
    highTemperature = v5->_highTemperature;
    v5->_highTemperature = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lowTemperature"));
    v10 = objc_claimAutoreleasedReturnValue();
    lowTemperature = v5->_lowTemperature;
    v5->_lowTemperature = (NSNumber *)v10;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lowTemperature, 0);
  objc_storeStrong((id *)&self->_highTemperature, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
