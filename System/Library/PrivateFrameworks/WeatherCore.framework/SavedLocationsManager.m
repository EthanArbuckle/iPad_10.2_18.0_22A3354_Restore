@implementation SavedLocationsManager

- (void)dealloc
{
  _TtC11WeatherCore21SavedLocationsManager *v2;

  v2 = self;
  SavedLocationsManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_28_12(OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_syncedDataManager);
  OUTLINED_FUNCTION_28_12(OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_localKeyValueStore);
  OUTLINED_FUNCTION_28_12(OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_keyValueStoreProvider);
  OUTLINED_FUNCTION_28_12(OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_locationDataModelFactory);
  OUTLINED_FUNCTION_28_12(OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_locationsReconciler);
  OUTLINED_FUNCTION_28_12(OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_savedLocationsReader);
  OUTLINED_FUNCTION_28_12(OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_coherenceMigrator);
  OUTLINED_FUNCTION_28_12(OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_nanoSyncManager);
  sub_1B00C976C((uint64_t)self + OBJC_IVAR____TtC11WeatherCore21SavedLocationsManager_locationMetadataManager, &qword_1ED201F50);
  swift_bridgeObjectRelease();
  swift_release();

  swift_unknownObjectRelease();
  swift_release();
}

- (_TtC11WeatherCore21SavedLocationsManager)init
{
  SavedLocationsManager.init()();
}

- (void)sharedPreferencesChangedExternally
{
  _TtC11WeatherCore21SavedLocationsManager *v2;

  v2 = self;
  SavedLocationsManager.sharedPreferencesChangedExternally()();

}

@end
