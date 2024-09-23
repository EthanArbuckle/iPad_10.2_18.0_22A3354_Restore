@implementation GKSecureFileLocator

+ (NSString)globalContextID
{
  NSString v2;
  uint64_t v3;

  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE600000000000000, v3);
  return (NSString *)v2;
}

- (GKSecureFileLocator)initWithFileManager:(id)a3
{
  id v3;

  v3 = a3;
  return (GKSecureFileLocator *)sub_10019FBD4();
}

- (id)cacheDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5
{
  return sub_1001A01D0();
}

- (id)databaseDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5
{
  return sub_1001A01D0();
}

- (id)databaseFileWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5 name:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  GKSecureFileLocator *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSURL *v28;
  void *v29;
  void *v30;
  uint64_t v32;

  v11 = sub_100161BD0(&qword_100315B00);
  __chkstk_darwin(v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v17 = v16;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v19 = v18;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v21 = v20;
  v22 = self;
  sub_1001A02D8();

  swift_bridgeObjectRelease(v15, v23);
  swift_bridgeObjectRelease(v17, v24);
  swift_bridgeObjectRelease(v19, v25);
  swift_bridgeObjectRelease(v21, v26);
  v27 = type metadata accessor for URL(0);
  v29 = 0;
  if (sub_10016445C((uint64_t)v13, 1, v27) != 1)
  {
    URL._bridgeToObjectiveC()(v28);
    v29 = v30;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(v13, v27);
  }
  return v29;
}

- (id)globalDatabaseFileWithBundleID:(id)a3 language:(id)a4 name:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  GKSecureFileLocator *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSURL *v23;
  void *v24;
  void *v25;
  uint64_t v27;

  v9 = sub_100161BD0(&qword_100315B00);
  __chkstk_darwin(v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v17 = v16;
  v18 = self;
  sub_1001A0788();

  swift_bridgeObjectRelease(v13, v19);
  swift_bridgeObjectRelease(v15, v20);
  swift_bridgeObjectRelease(v17, v21);
  v22 = type metadata accessor for URL(0);
  v24 = 0;
  if (sub_10016445C((uint64_t)v11, 1, v22) != 1)
  {
    URL._bridgeToObjectiveC()(v23);
    v24 = v25;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v11, v22);
  }
  return v24;
}

- (void)removeCacheDirectoryWithBundleID:(id)a3 language:(id)a4 contextID:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  GKSecureFileLocator *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = v12;
  v14 = self;
  sub_1001A08E4();

  swift_bridgeObjectRelease(v9, v15);
  swift_bridgeObjectRelease(v11, v16);
  swift_bridgeObjectRelease(v13, v17);
}

- (void)removeCaches
{
  GKSecureFileLocator *v2;

  v2 = self;
  sub_1001A0C44();

}

- (GKSecureFileLocator)init
{
  SecureFileLocator.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR___GKSecureFileLocator_rootDirectory;
  v4 = sub_10019FB28();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___GKSecureFileLocator_parentCachesDirectory, v4);
}

@end
