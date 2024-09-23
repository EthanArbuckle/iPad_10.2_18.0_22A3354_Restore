@implementation WeatherSettingsUnits

- (_TtC13WeatherWidget20WeatherSettingsUnits)init
{
  return (_TtC13WeatherWidget20WeatherSettingsUnits *)sub_10015FDE0();
}

- (void)refreshUnits
{
  _TtC13WeatherWidget20WeatherSettingsUnits *v2;

  v2 = self;
  sub_10015FED8();

}

- (void)refreshUnitsWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC13WeatherWidget20WeatherSettingsUnits *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1001BB5A8, 32, 7);
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_1001600E8((uint64_t)&unk_1001C6FC8, v5);
}

- (void)setPreferredTemperatureUnit:(id)a3
{
  id v5;
  _TtC13WeatherWidget20WeatherSettingsUnits *v6;

  v5 = a3;
  v6 = self;
  sub_1001601C4(a3);

}

- (NSUnitTemperature)preferredTemperatureUnit
{
  _TtC13WeatherWidget20WeatherSettingsUnits *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100160318();

  return (NSUnitTemperature *)v3;
}

@end
