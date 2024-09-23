@implementation WeatherConfigurationManager

- (_TtC11WeatherCore27WeatherConfigurationManager)initWithContentDirectoryURL:(id)a3
{
  uint64_t v3;

  v3 = sub_1B0266ACC();
  MEMORY[0x1E0C80A78](v3);
  sub_1B0266AA8();
  return (_TtC11WeatherCore27WeatherConfigurationManager *)WeatherConfigurationManager.init(contentDirectoryURL:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
