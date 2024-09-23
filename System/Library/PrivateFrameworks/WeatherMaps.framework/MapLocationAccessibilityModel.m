@implementation MapLocationAccessibilityModel

- (CLLocation)location
{
  return (CLLocation *)MapLocationAccessibilityModel.location.getter();
}

- (NSString)accessibilityDescription
{
  uint64_t v2;
  void *v3;

  MapLocationAccessibilityModel.accessibilityDescription.getter();
  if (v2)
  {
    v3 = (void *)sub_1DBFF8170();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)overlayDescriptionKey
{
  void *v2;

  MapLocationAccessibilityModel.overlayDescriptionKey.getter();
  v2 = (void *)sub_1DBFF8170();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDate)expiration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_1DBFF6934();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MapLocationAccessibilityModel.expiration.getter((uint64_t)v5);
  v6 = (void *)sub_1DBFF6880();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSDate *)v6;
}

- (_TtC11WeatherMaps29MapLocationAccessibilityModel)init
{
  MapLocationAccessibilityModel.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_71();
  OUTLINED_FUNCTION_2_71();
  v3 = (char *)self + OBJC_IVAR____TtC11WeatherMaps29MapLocationAccessibilityModel_expiration;
  v4 = OUTLINED_FUNCTION_23();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
