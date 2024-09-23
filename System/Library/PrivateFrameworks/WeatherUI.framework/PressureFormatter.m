@implementation PressureFormatter

- (NSLocale)locale
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC9WeatherUI17PressureFormatter *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1F44D8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  PressureFormatter.locale.getter((uint64_t)v5);

  v7 = sub_1B0005A1C();
  v8 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v7) != 1)
  {
    v8 = (void *)sub_1B0005950();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
  }
  return (NSLocale *)v8;
}

- (void)setLocale:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC9WeatherUI17PressureFormatter *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED1F44D8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1B0005974();
    v8 = sub_1B0005A1C();
    v9 = 0;
  }
  else
  {
    v8 = sub_1B0005A1C();
    v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  v10 = self;
  PressureFormatter.locale.setter((uint64_t)v7);

}

- (_TtC9WeatherUI17PressureFormatter)init
{
  _TtC9WeatherUI17PressureFormatter *result;

  PressureFormatter.init()();
  return result;
}

- (_TtC9WeatherUI17PressureFormatter)initWithCoder:(id)a3
{
  sub_1AFD48CD0();
}

@end
