@implementation BKLanguageUtilities

+ (id)dominantLanguageForString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v3 = a3;
  _s5Books17LanguageUtilitiesC08dominantB03forSSSgSo7JSValueC_tFZ_0(v3);
  v5 = v4;

  if (v5)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BKLanguageUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LanguageUtilities();
  return -[BKLanguageUtilities init](&v3, "init");
}

@end
