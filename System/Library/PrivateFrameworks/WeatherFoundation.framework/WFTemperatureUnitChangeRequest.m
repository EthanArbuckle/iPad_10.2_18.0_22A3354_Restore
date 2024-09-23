@implementation WFTemperatureUnitChangeRequest

- (void)startWithService:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v5 = -[WFTemperatureUnitChangeRequest temperatureUnit](self, "temperatureUnit");
  -[WFTask identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replaceTemperatureUnitWith:identifier:", v5, v6);

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
