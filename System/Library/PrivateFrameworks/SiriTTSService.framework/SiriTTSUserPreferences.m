@implementation SiriTTSUserPreferences

- (SiriTTSUserPreferences)init
{
  return (SiriTTSUserPreferences *)sub_19AD87F6C();
}

+ (NSString)spokenLanguageChangedNotification
{
  void *v2;

  static UserPreferences.spokenLanguageChangedNotification.getter();
  v2 = (void *)sub_19AE55424();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (void)setSpokenLanguageIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a3)
  {
    v3 = sub_19AE55448();
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  swift_getObjCClassMetadata();
  static UserPreferences.setSpokenLanguageIdentifier(_:)(v3, v5);
  swift_bridgeObjectRelease();
}

+ (id)getSpokenLanguageIdentifier
{
  return sub_19AD89124((uint64_t)a1, (uint64_t)a2, static UserPreferences.getSpokenLanguageIdentifier());
}

+ (id)getAvailableLanguageIdentifiers
{
  void *v2;

  static UserPreferences.getAvailableLanguageIdentifiers()();
  v2 = (void *)sub_19AE55724();
  swift_bridgeObjectRelease();
  return v2;
}

+ (id)defaultOutputLanguageIdentifier
{
  return sub_19AD89124((uint64_t)a1, (uint64_t)a2, (void (*)(void))static UserPreferences.defaultOutputLanguageIdentifier());
}

+ (void)setLogging:(BOOL)a3
{
  static UserPreferences.setLogging(_:)();
}

+ (BOOL)getLogging
{
  return static UserPreferences.getLogging()() & 1;
}

@end
