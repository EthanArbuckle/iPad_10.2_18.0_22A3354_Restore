@implementation STWeatherAttributes

- (id)_initWithCondition:(int64_t)a3 temperature:(id)a4 highTemperature:(id)a5 lowTemperature:(id)a6 chanceOfPrecipitation:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  STWeatherAttributes *v17;
  id *p_isa;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)STWeatherAttributes;
  v17 = -[STWeatherAttributes init](&v20, sel_init);
  p_isa = (id *)&v17->super.super.isa;
  if (v17)
  {
    v17->_condition = a3;
    objc_storeStrong((id *)&v17->_temperature, a4);
    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 5, a6);
    objc_storeStrong(p_isa + 6, a7);
  }

  return p_isa;
}

- (int64_t)condition
{
  return self->_condition;
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

- (id)chanceOfPrecipitation
{
  return self->_chanceOfPrecipitation;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STWeatherAttributes;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_condition, CFSTR("_condition"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_temperature, CFSTR("_temperature"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_highTemperature, CFSTR("_highTemperature"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lowTemperature, CFSTR("_lowTemperature"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_chanceOfPrecipitation, CFSTR("_chanceOfPrecipitation"));

}

- (STWeatherAttributes)initWithCoder:(id)a3
{
  id v4;
  STWeatherAttributes *v5;
  uint64_t v6;
  STTemperature *temperature;
  uint64_t v8;
  STTemperature *highTemperature;
  uint64_t v10;
  STTemperature *lowTemperature;
  uint64_t v12;
  NSNumber *chanceOfPrecipitation;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)STWeatherAttributes;
  v5 = -[STSiriModelObject initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_condition = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_condition"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_temperature"));
    v6 = objc_claimAutoreleasedReturnValue();
    temperature = v5->_temperature;
    v5->_temperature = (STTemperature *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_highTemperature"));
    v8 = objc_claimAutoreleasedReturnValue();
    highTemperature = v5->_highTemperature;
    v5->_highTemperature = (STTemperature *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_lowTemperature"));
    v10 = objc_claimAutoreleasedReturnValue();
    lowTemperature = v5->_lowTemperature;
    v5->_lowTemperature = (STTemperature *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_chanceOfPrecipitation"));
    v12 = objc_claimAutoreleasedReturnValue();
    chanceOfPrecipitation = v5->_chanceOfPrecipitation;
    v5->_chanceOfPrecipitation = (NSNumber *)v12;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chanceOfPrecipitation, 0);
  objc_storeStrong((id *)&self->_lowTemperature, 0);
  objc_storeStrong((id *)&self->_highTemperature, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
