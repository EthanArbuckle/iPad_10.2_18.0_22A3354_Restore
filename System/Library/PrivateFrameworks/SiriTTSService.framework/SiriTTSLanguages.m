@implementation SiriTTSLanguages

+ (NSSet)availableLanguages
{
  void *v2;

  static Languages.availableLanguages.getter();
  v2 = (void *)sub_19AE55724();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

+ (id)fallbackLanguageFor:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  void *v5;

  v3 = sub_19AE55448();
  static Languages.fallbackLanguage(for:)(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (void *)sub_19AE55424();
  swift_bridgeObjectRelease();
  return v5;
}

- (SiriTTSLanguages)init
{
  return (SiriTTSLanguages *)Languages.init()();
}

@end
