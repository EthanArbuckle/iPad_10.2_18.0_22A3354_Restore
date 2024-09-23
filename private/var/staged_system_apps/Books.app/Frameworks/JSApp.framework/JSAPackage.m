@implementation JSAPackage

- (NSString)nameForJSContext
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->nameForJSContext[OBJC_IVAR___JSAPackage_nameForJSContext];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (BOOL)isBundled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___JSAPackage_isBundled);
}

- (NSString)version
{
  uint64_t v3;
  uint64_t v4;
  JSAPackage *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v3 = type metadata accessor for BooksJetPackResourceBundle(0);
  v4 = sub_2A1FC(&qword_B84D8, type metadata accessor for BooksJetPackResourceBundle, (uint64_t)&protocol conformance descriptor for BooksJetPackResourceBundle);
  v5 = self;
  JetPackResourceBundle.version.getter(v3, v4);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    if (qword_B8130 != -1)
      swift_once(&qword_B8130, sub_51450);
    v7 = unk_BC9B0;
    swift_bridgeObjectRetain(unk_BC9B0);
  }

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return (NSString *)v8;
}

- (id)dataAtPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  JSAPackage *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Class isa;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = Package.data(atPath:)(v4, v6);
  v10 = v9;

  swift_bridgeObjectRelease(v6);
  if (v10 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_3B6C4(v8, v10);
  }
  return isa;
}

- (id)bytesAtPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  JSAPackage *v7;
  uint64_t v8;
  NSArray v9;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = sub_51AD0(v4, v6);

  swift_bridgeObjectRelease(v6);
  if (v8)
  {
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (id)stringAtPath:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  JSAPackage *v7;
  Swift::String v8;
  void *object;
  NSString v10;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = Package.string(atPath:)(v8).value._object;

  swift_bridgeObjectRelease(v6);
  if (object)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)dirAtPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  JSAPackage *v7;
  _QWORD *v8;
  Class isa;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8 = Package.dir(atPath:)(v4, v6);

  swift_bridgeObjectRelease(v6);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

- (NSArray)allLocalizationPaths
{
  return (NSArray *)sub_526FC(self, (uint64_t)a2, (uint64_t (*)(void))Package.allLocalizationPaths.getter);
}

- (NSArray)allLocales
{
  return (NSArray *)sub_526FC(self, (uint64_t)a2, (uint64_t (*)(void))Package.allLocales.getter);
}

- (id)localizationPathForLocale:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  JSAPackage *v7;
  Swift::String v8;
  void *object;
  NSString v10;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  object = Package.localizationPath(forLocale:)(v8)._object;

  swift_bridgeObjectRelease(v6);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  return v10;
}

- (void)startEviction
{
  JSAPackage *v2;

  v2 = self;
  Package.startEviction()();

}

- (JSAPackage)init
{
  JSAPackage *result;

  result = (JSAPackage *)_swift_stdlib_reportUnimplementedInitializer("JSApp.Package", 13, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_37C04((uint64_t)self + OBJC_IVAR___JSAPackage_jetPack);
  swift_bridgeObjectRelease(*(_QWORD *)&self->nameForJSContext[OBJC_IVAR___JSAPackage_nameForJSContext]);
}

@end
