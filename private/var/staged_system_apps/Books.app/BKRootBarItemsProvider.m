@implementation BKRootBarItemsProvider

+ (id)standardItemsFromBagWith:(id)a3 countryCode:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  Class isa;

  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  if (a4)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v7;
  }
  else
  {
    v6 = 0;
  }
  v8 = _s5Books20RootBarItemsProviderC08standardD7FromBag4with11countryCodeSayAA0bC4ItemCGSayypG_SSSgtFZ_0(v5, v6, (uint64_t)a4);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(a4);
  type metadata accessor for RootBarItem();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

+ (int64_t)tabTypeFor:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = _s5Books20RootBarItemsProviderC7tabType3for13BookAnalytics010BridgedTabG0OSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease(v5);
  return v6;
}

+ (NSString)LibraryAllIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)HomeIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)BooksIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)AudiobooksIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)MangaIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)SearchIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)LibraryWantToReadIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)LibraryFinishedIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)LibraryBooksIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)LibraryAudiobooksIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)LibraryPDFIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)LibraryMySamplesIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)LibraryDownloadedIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)LibraryUserCollectionIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)NewCollectionIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSArray)placeholderStandardItems
{
  uint64_t v2;
  Class isa;

  v2 = _s5Books20RootBarItemsProviderC019placeholderStandardD0SayAA0bC4ItemCGvgZ_0();
  type metadata accessor for RootBarItem();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

+ (BOOL)isSearchFor:(id)a3
{
  return sub_10041668C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s5Books20RootBarItemsProviderC8isSearch3forSbSS_tFZ_0);
}

+ (BOOL)isStoreOnlyFor:(id)a3
{
  return sub_100416768((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, __n128))sub_100415C94);
}

+ (BOOL)isDefaultCollectionFor:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned __int8 v9;
  Swift::String v11;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  swift_bridgeObjectRetain(v4);
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, (unint64_t)v5);
  v7 = v6;
  swift_bridgeObjectRelease(v6);
  if (v7)
  {
    swift_bridgeObjectRelease(v5);
    LOBYTE(v8) = 0;
  }
  else
  {
    v11._countAndFlagsBits = v3;
    v11._object = v5;
    v9 = _s5Books20RootBarItemsProviderC8ItemKindO8rawValueAESgSS_tcfC_0(v11);
    if (v9 <= 0x10u)
      v8 = (0x1FE0u >> v9) & 1;
    else
      LOBYTE(v8) = 1;
  }
  swift_bridgeObjectRelease(v5);
  return v8;
}

+ (BOOL)canBeHiddenFor:(id)a3
{
  return sub_10041668C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s5Books20RootBarItemsProviderC11canBeHidden3forSbSS_tFZ_0);
}

+ (BOOL)isCustomCollectionFor:(id)a3
{
  return sub_10041668C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s5Books20RootBarItemsProviderC18isCustomCollection3forSbSS_tFZ_0);
}

+ (BOOL)isLibraryCollectionFor:(id)a3
{
  return sub_10041668C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))_s5Books20RootBarItemsProviderC19isLibraryCollection3forSbSS_tFZ_0);
}

+ (BOOL)isStandardItemFor:(id)a3
{
  return sub_100416768((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, __n128))sub_100415E40);
}

+ (id)itemIdentifierForDefaultCollectionID:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v3 = a3;
  _s5Books20RootBarItemsProviderC14itemIdentifier22forDefaultCollectionIDSSSgSo09BCDefaultjK0a_tFZ_0((uint64_t)v3);
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

+ (id)defaultCollectionIDFromItemIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = _s5Books20RootBarItemsProviderC19defaultCollectionID18fromItemIdentifierSo09BCDefaultgH0aSgSS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease(v5);
  return v6;
}

+ (id)itemIdentifierForCustomCollectionID:(id)a3
{
  Swift::String v3;
  void *object;
  NSString v5;

  v3._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  object = v3._object;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(object);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE700000000000000);
  return v5;
}

+ (id)customCollectionIDFromItemIdentifier:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, v4);
  v7 = v6;
  swift_bridgeObjectRelease(v5);
  if (v7)
  {
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)itemIdentifierForCollectionID:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSString v6;
  unint64_t v7;
  unint64_t v8;
  Swift::String v9;
  NSString v10;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = String._bridgeToObjectiveC()();
  _s5Books20RootBarItemsProviderC14itemIdentifier22forDefaultCollectionIDSSSgSo09BCDefaultjK0a_tFZ_0((uint64_t)v6);
  v8 = v7;

  if (v8)
  {
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v9._countAndFlagsBits = v3;
    v9._object = v5;
    String.append(_:)(v9);
    swift_bridgeObjectRelease(v5);
    v8 = 0xE700000000000000;
  }
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  return v10;
}

+ (BOOL)requiresURLFor:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned __int8 v9;
  Swift::String v11;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  swift_bridgeObjectRetain(v4);
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, (unint64_t)v5);
  v7 = v6;
  swift_bridgeObjectRelease(v6);
  if (v7)
  {
    swift_bridgeObjectRelease(v5);
    LOBYTE(v8) = 1;
  }
  else
  {
    v11._countAndFlagsBits = v3;
    v11._object = v5;
    v9 = _s5Books20RootBarItemsProviderC8ItemKindO8rawValueAESgSS_tcfC_0(v11);
    if (v9 <= 0x10u)
      v8 = (0x1E01Fu >> v9) & 1;
    else
      LOBYTE(v8) = 0;
  }
  swift_bridgeObjectRelease(v5);
  return v8;
}

+ (id)stringForReturnToRootBarItemFor:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;
  Swift::String v13;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  swift_bridgeObjectRetain(v4);
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, (unint64_t)v5);
  v7 = v6;
  swift_bridgeObjectRelease(v6);
  if (v7)
  {
    swift_bridgeObjectRelease(v5);
    v8 = 14;
  }
  else
  {
    v13._countAndFlagsBits = v3;
    v13._object = v5;
    v8 = _s5Books20RootBarItemsProviderC8ItemKindO8rawValueAESgSS_tcfC_0(v13);
    if (v8 == 16)
      v8 = 15;
  }
  sub_100415594(v8);
  v10 = v9;
  swift_bridgeObjectRelease(v5);
  if (v10)
  {
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v10);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (id)automationIdentifierFor:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  Swift::String v14;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  swift_bridgeObjectRetain(v4);
  _s5Books20RootBarItemsProviderC18customCollectionID18fromItemIdentifierSSSgSS_tFZ_0(v3, (unint64_t)v5);
  v7 = v6;
  swift_bridgeObjectRelease(v6);
  if (v7)
  {
    swift_bridgeObjectRelease(v5);
    v8 = 14;
  }
  else
  {
    v14._countAndFlagsBits = v3;
    v14._object = v5;
    v9 = _s5Books20RootBarItemsProviderC8ItemKindO8rawValueAESgSS_tcfC_0(v14);
    if (v9 == 16)
      v8 = 15;
    else
      v8 = v9;
  }
  swift_bridgeObjectRelease(v5);
  sub_100048A4C(v8);
  v11 = v10;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  return v12;
}

- (BKRootBarItemsProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RootBarItemsProvider();
  return -[BKRootBarItemsProvider init](&v3, "init");
}

@end
