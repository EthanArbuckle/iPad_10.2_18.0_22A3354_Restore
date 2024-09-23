@implementation WeatherSettingsState

+ (_TtC13WeatherWidget20WeatherSettingsState)defaultState
{
  return (_TtC13WeatherWidget20WeatherSettingsState *)sub_10008AC44();
}

- (_TtC13WeatherWidget20WeatherSettingsUnits)units
{
  return (_TtC13WeatherWidget20WeatherSettingsUnits *)sub_10008ACB8();
}

- (BOOL)resetIdentifier
{
  _TtC13WeatherWidget20WeatherSettingsState *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_10008ADD4(0x80000001001872B0, 0);

  return v3 & 1;
}

- (void)setResetIdentifier:(BOOL)a3
{
  _TtC13WeatherWidget20WeatherSettingsState *v3;

  v3 = self;
  sub_10008AE98();

}

- (BOOL)showHomeWorkLabels
{
  _TtC13WeatherWidget20WeatherSettingsState *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_10008ADD4(0x8000000100187280, 1);

  return v3 & 1;
}

- (void)setShowHomeWorkLabels:(BOOL)a3
{
  _TtC13WeatherWidget20WeatherSettingsState *v3;

  v3 = self;
  sub_10008AE98();

}

- (_TtC13WeatherWidget20WeatherSettingsState)init
{
  return (_TtC13WeatherWidget20WeatherSettingsState *)sub_10008AF18();
}

- (void).cxx_destruct
{

}

@end
