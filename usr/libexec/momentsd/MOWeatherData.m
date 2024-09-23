@implementation MOWeatherData

- (NSMeasurement)temperature
{
  return (NSMeasurement *)@objc MOWeatherData.temperature.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for Measurement<NSUnitTemperature>, &OBJC_IVAR____TtC8momentsd13MOWeatherData_temperature);
}

- (void)setTemperature:(id)a3
{
  @objc MOWeatherData.temperature.setter((char *)self, (uint64_t)a2, (uint64_t)a3, &demangling cache variable for type metadata for Measurement<NSUnitTemperature>, &lazy cache variable for type metadata for NSUnitTemperature, NSUnitTemperature_ptr, &OBJC_IVAR____TtC8momentsd13MOWeatherData_temperature);
}

- (NSMeasurement)windSpeed
{
  return (NSMeasurement *)@objc MOWeatherData.temperature.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for Measurement<NSUnitSpeed>, &OBJC_IVAR____TtC8momentsd13MOWeatherData_windSpeed);
}

- (void)setWindSpeed:(id)a3
{
  @objc MOWeatherData.temperature.setter((char *)self, (uint64_t)a2, (uint64_t)a3, &demangling cache variable for type metadata for Measurement<NSUnitSpeed>, &lazy cache variable for type metadata for NSUnitSpeed, NSUnitSpeed_ptr, &OBJC_IVAR____TtC8momentsd13MOWeatherData_windSpeed);
}

- (NSString)weatherSummary
{
  return (NSString *)@objc MOWeatherData.weatherSummary.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8momentsd13MOWeatherData_weatherSummary);
}

- (void)setWeatherSummary:(id)a3
{
  @objc MOWeatherData.weatherSummary.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8momentsd13MOWeatherData_weatherSummary);
}

- (NSString)symbolName
{
  return (NSString *)@objc MOWeatherData.weatherSummary.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8momentsd13MOWeatherData_symbolName);
}

- (void)setSymbolName:(id)a3
{
  @objc MOWeatherData.weatherSummary.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC8momentsd13MOWeatherData_symbolName);
}

- (_TtC8momentsd13MOWeatherData)initWithTemperature:(id)a3 windSpeed:(id)a4 weatherSummry:(id)a5 symbolName:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  objc_class *v31;
  _TtC8momentsd13MOWeatherData *v32;
  uint64_t v34;
  uint64_t v35;
  objc_super v36;

  v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
  v11 = *(_QWORD *)(v35 - 8);
  __chkstk_darwin(v35);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  v15 = *(_QWORD *)(v14 - 8);
  v34 = v14;
  __chkstk_darwin(v14);
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for NSUnitTemperature(0, &lazy cache variable for type metadata for NSUnitTemperature, NSUnitTemperature_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a3, v18);
  v19 = type metadata accessor for NSUnitTemperature(0, &lazy cache variable for type metadata for NSUnitSpeed, NSUnitSpeed_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a4, v19);
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v22 = v21;
  v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v25 = v24;
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))((char *)self + OBJC_IVAR____TtC8momentsd13MOWeatherData_temperature, v17, v14);
  v26 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v27 = v11;
  v28 = v35;
  v26((char *)self + OBJC_IVAR____TtC8momentsd13MOWeatherData_windSpeed, v13, v35);
  v29 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8momentsd13MOWeatherData_weatherSummary);
  *v29 = v20;
  v29[1] = v22;
  v30 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8momentsd13MOWeatherData_symbolName);
  *v30 = v23;
  v30[1] = v25;
  v31 = (objc_class *)type metadata accessor for MOWeatherData(0);
  v36.receiver = self;
  v36.super_class = v31;
  v32 = -[MOWeatherData init](&v36, "init");
  (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v34);
  return v32;
}

- (id)getTemperature
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC8momentsd13MOWeatherData *v8;
  Class isa;
  uint64_t v11;
  NSMeasurement v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x70);
  v8 = self;
  v7();

  v12 = Measurement._bridgeToObjectiveC()();
  isa = v12.super.isa;
  (*(void (**)(char *, uint64_t, __n128))(v4 + 8))(v6, v3, *(__n128 *)&v12._doubleValue);
  return isa;
}

- (id)getWinSpeed
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC8momentsd13MOWeatherData *v8;
  Class isa;
  uint64_t v11;
  NSMeasurement v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x88);
  v8 = self;
  v7();

  v12 = Measurement._bridgeToObjectiveC()();
  isa = v12.super.isa;
  (*(void (**)(char *, uint64_t, __n128))(v4 + 8))(v6, v3, *(__n128 *)&v12._doubleValue);
  return isa;
}

- (id)getWeatherSummary
{
  void (*v2)(void);
  _TtC8momentsd13MOWeatherData *v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xA0);
  v3 = self;
  v2();
  v5 = v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

- (id)getSymbolName
{
  void (*v2)(void);
  _TtC8momentsd13MOWeatherData *v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0xB8);
  v3 = self;
  v2();
  v5 = v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

- (_TtC8momentsd13MOWeatherData)init
{
  _TtC8momentsd13MOWeatherData *result;

  result = (_TtC8momentsd13MOWeatherData *)_swift_stdlib_reportUnimplementedInitializer("momentsd.MOWeatherData", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC8momentsd13MOWeatherData_temperature;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitTemperature>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8momentsd13MOWeatherData_windSpeed;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Measurement<NSUnitSpeed>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease(*(_QWORD *)&self->weatherSummary[OBJC_IVAR____TtC8momentsd13MOWeatherData_weatherSummary]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->weatherSummary[OBJC_IVAR____TtC8momentsd13MOWeatherData_symbolName]);
}

@end
