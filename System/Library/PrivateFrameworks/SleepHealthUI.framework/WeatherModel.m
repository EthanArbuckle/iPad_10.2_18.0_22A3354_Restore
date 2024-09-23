@implementation WeatherModel

- (_TtC13SleepHealthUI12WeatherModel)init
{
  _TtC13SleepHealthUI12WeatherModel *result;

  result = (_TtC13SleepHealthUI12WeatherModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI12WeatherModel__currentWeatherModel;
  sub_1A9B92F34(0, &qword_1EEB45760, (uint64_t (*)(uint64_t))sub_1A9BD979C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
}

@end
