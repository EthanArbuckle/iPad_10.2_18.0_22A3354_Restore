@implementation SDAirDropHandlerIPA

- (BOOL)canHandleTransfer
{
  _TtC16DaemoniOSLibrary19SDAirDropHandlerIPA *v2;
  char v3;
  char v4;

  v2 = self;
  sub_1002D4FDC();
  v4 = v3;

  return v4 & 1;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x8000;
}

- (NSString)suitableContentsDescription
{
  _TtC16DaemoniOSLibrary19SDAirDropHandlerIPA *v2;
  const char *v3;
  const char *v4;
  NSString v5;

  v2 = self;
  sub_1002D57D4();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)singleItemActionTitle
{
  _TtC16DaemoniOSLibrary19SDAirDropHandlerIPA *v2;
  NSString v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = self;
  v3 = String._bridgeToObjectiveC()();
  v5 = (id)SFLocalizedStringForKey(v3, v4);

  if (v5)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
    v7 = v6;

    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {

    v8 = 0;
  }
  return (NSString *)v8;
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

- (void)updatePossibleActions
{
  _TtC16DaemoniOSLibrary19SDAirDropHandlerIPA *v2;

  v2 = self;
  sub_1002D5C84();

}

- (_TtC16DaemoniOSLibrary19SDAirDropHandlerIPA)initWithTransfer:(id)a3 bundleIdentifier:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSString v11;
  _TtC16DaemoniOSLibrary19SDAirDropHandlerIPA *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType(self);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v9 = v8;
  v10 = a3;
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[SDAirDropHandler initWithTransfer:bundleIdentifier:](&v14, "initWithTransfer:bundleIdentifier:", v10, v11);

  return v12;
}

@end
