@implementation AirQualityConditionsDataProvider

- (void)dealloc
{
  _TtC4Maps32AirQualityConditionsDataProvider *v2;

  v2 = self;
  sub_10000E980();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps32AirQualityConditionsDataProvider_airQualityConditions));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps32AirQualityConditionsDataProvider_updatingTimer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps32AirQualityConditionsDataProvider_lastSavedLocation));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC4Maps32AirQualityConditionsDataProvider_weatherService));
}

- (BOOL)enabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps32AirQualityConditionsDataProvider_enabled);
}

- (void)setEnabled:(BOOL)a3
{
  char v3;
  _TtC4Maps32AirQualityConditionsDataProvider *v4;

  v3 = *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps32AirQualityConditionsDataProvider_enabled);
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps32AirQualityConditionsDataProvider_enabled) = a3;
  v4 = self;
  sub_10000EAF0(v3);

}

- (void)addObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps32AirQualityConditionsDataProvider_observers), "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps32AirQualityConditionsDataProvider_observers), "removeObject:", a3);
}

- (_TtC4Maps32AirQualityConditionsDataProvider)init
{
  return (_TtC4Maps32AirQualityConditionsDataProvider *)sub_10001086C();
}

- (void)weatherLocationDataProvider:(id)a3 didChangeLocation:(id)a4
{
  id v6;
  id v7;
  _TtC4Maps32AirQualityConditionsDataProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100010A58(a4);

}

@end
