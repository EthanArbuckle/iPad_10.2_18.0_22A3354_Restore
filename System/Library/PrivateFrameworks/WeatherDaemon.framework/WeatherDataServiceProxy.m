@implementation WeatherDataServiceProxy

- (_TtC13WeatherDaemon23WeatherDataServiceProxy)init
{
  WeatherDataServiceProxy.init()();
}

- (void).cxx_destruct
{
  sub_1A61AF090();
  OUTLINED_FUNCTION_106(OBJC_IVAR____TtC13WeatherDaemon23WeatherDataServiceProxy_networkMonitor);
  OUTLINED_FUNCTION_106(OBJC_IVAR____TtC13WeatherDaemon23WeatherDataServiceProxy_authenticator);
  OUTLINED_FUNCTION_106(OBJC_IVAR____TtC13WeatherDaemon23WeatherDataServiceProxy_appConfigurationSettingsProvider);
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_14_9();
  OUTLINED_FUNCTION_60_0();
}

- (void)performRequestsWith:(id)a3 completion:(id)a4
{
  sub_1A61F0DE8(self, (int)a2, a3, a4, (uint64_t)&unk_1E4FFE980, (uint64_t)sub_1A61F3514, (void (*)(id, uint64_t, uint64_t))WeatherDataServiceProxy.performRequests(with:completion:));
}

- (void)fetchAvailableDataSetsWith:(id)a3 completion:(id)a4
{
  sub_1A61F0DE8(self, (int)a2, a3, a4, (uint64_t)&unk_1E4FFE958, (uint64_t)sub_1A61F41C0, (void (*)(id, uint64_t, uint64_t))WeatherDataServiceProxy.fetchAvailableDataSets(with:completion:));
}

- (void)fetchAirQualityScaleWith:(id)a3 completion:(id)a4
{
  sub_1A61F0DE8(self, (int)a2, a3, a4, (uint64_t)&unk_1E4FFE930, (uint64_t)sub_1A61F41C0, (void (*)(id, uint64_t, uint64_t))WeatherDataServiceProxy.fetchAirQualityScale(with:completion:));
}

@end
