@implementation STWeatherUnits

- (id)_initWithTemperatureUnits:(int64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STWeatherUnits;
  result = -[STWeatherUnits init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 2) = a3;
  return result;
}

- (int64_t)temperatureUnits
{
  return self->_temperatureUnits;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STWeatherUnits;
  v4 = a3;
  -[STSiriModelObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_temperatureUnits, CFSTR("_temperatureUnits"), v5.receiver, v5.super_class);

}

- (STWeatherUnits)initWithCoder:(id)a3
{
  id v4;
  STWeatherUnits *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STWeatherUnits;
  v5 = -[STSiriModelObject initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_temperatureUnits = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_temperatureUnits"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
