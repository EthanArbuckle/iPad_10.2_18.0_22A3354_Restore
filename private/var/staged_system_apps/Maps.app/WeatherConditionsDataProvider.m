@implementation WeatherConditionsDataProvider

- (UITraitEnvironment)traitEnvironment
{
  return (UITraitEnvironment *)objc_autoreleaseReturnValue((id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa
                                                                                                  + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_traitEnvironment)));
}

- (void)setTraitEnvironment:(id)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_traitEnvironment);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_traitEnvironment) = (Class)a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v3);
}

- (_TtC4Maps29WeatherConditionsDataProvider)initWithTraitEnvironment:(id)a3
{
  swift_unknownObjectRetain(a3);
  return (_TtC4Maps29WeatherConditionsDataProvider *)sub_100148B00((uint64_t)a3);
}

- (void)dealloc
{
  _TtC4Maps29WeatherConditionsDataProvider *v2;

  v2 = self;
  sub_100148E94();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_traitEnvironment));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_weatherService));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_currentLocaleBlockObserver));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_updatingTimer));

}

- (BOOL)enabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_enabled);
}

- (void)setEnabled:(BOOL)a3
{
  char v3;
  _TtC4Maps29WeatherConditionsDataProvider *v4;

  v3 = *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_enabled);
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_enabled) = a3;
  v4 = self;
  sub_100149084(v3);

}

- (void)addObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_observers), "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps29WeatherConditionsDataProvider_observers), "removeObject:", a3);
}

- (_TtC4Maps29WeatherConditionsDataProvider)init
{
  _TtC4Maps29WeatherConditionsDataProvider *result;

  result = (_TtC4Maps29WeatherConditionsDataProvider *)_swift_stdlib_reportUnimplementedInitializer("Maps.WeatherConditionsDataProvider", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)weatherLocationDataProvider:(id)a3 didChangeLocation:(id)a4
{
  id v6;
  id v7;
  _TtC4Maps29WeatherConditionsDataProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10014AC50(a4);

}

@end
