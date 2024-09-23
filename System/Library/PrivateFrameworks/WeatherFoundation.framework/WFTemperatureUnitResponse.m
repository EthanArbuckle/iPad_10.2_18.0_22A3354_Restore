@implementation WFTemperatureUnitResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WFTemperatureUnitResponse)initWithCoder:(id)a3
{
  id v4;
  WFTemperatureUnitResponse *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFTemperatureUnitResponse;
  v5 = -[WFResponse initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("WFTemperatureUnitResponseKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTemperatureUnitResponse setTemperatureUnit:](v5, "setTemperatureUnit:", NSStringToWFTemperatureUnit(v6));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFTemperatureUnitResponse;
  v4 = a3;
  -[WFResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  NSStringFromWFTemperatureUnit(-[WFTemperatureUnitResponse temperatureUnit](self, "temperatureUnit", v6.receiver, v6.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("WFTemperatureUnitResponseKey"));

}

- (int)temperatureUnit
{
  return self->_temperatureUnit;
}

- (void)setTemperatureUnit:(int)a3
{
  self->_temperatureUnit = a3;
}

@end
