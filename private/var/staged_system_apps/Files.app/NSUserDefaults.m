@implementation NSUserDefaults

- (NSArray)DOCSourceOrderKey
{
  NSUserDefaults *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_1000873BC();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)setDOCSourceOrderKey:(id)a3
{
  uint64_t v4;
  NSUserDefaults *v5;
  NSArray v6;
  NSUserDefaults *v7;
  id v8;

  if (a3)
  {
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
    v5 = self;
    v6.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v7 = self;
    v6.super.isa = 0;
  }
  v8 = String._bridgeToObjectiveC()();
  -[NSUserDefaults setValue:forKey:](self, "setValue:forKey:", v6.super.isa, v8);

  swift_unknownObjectRelease(v6.super.isa);
}

- (BOOL)forceDisplayFilenameExtensions
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSUserDefaults *v6;
  NSString v7;
  NSUserDefaults *v8;
  unsigned __int8 v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)(DOCDefaultsSuiteName);
  v4 = v3;
  v5 = objc_allocWithZone((Class)NSUserDefaults);
  v6 = self;
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  v8 = (NSUserDefaults *)objc_msgSend(v5, "initWithSuiteName:", v7);

  if (v8)
  {
    v9 = -[NSUserDefaults BOOLForKey:](v8, "BOOLForKey:", DOCUserDefaultsForceShowFilenameExtensionsKey);

    v6 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setForceDisplayFilenameExtensions:(BOOL)a3
{
  sub_100392354(a3);
}

@end
