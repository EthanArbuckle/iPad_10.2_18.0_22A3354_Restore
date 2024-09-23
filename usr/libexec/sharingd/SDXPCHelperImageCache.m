@implementation SDXPCHelperImageCache

+ (void)clearCacheWithSync:(BOOL)a3
{
  _s16DaemoniOSLibrary21SDXPCHelperImageCacheC05clearE8WithSyncyySbFZ_0(a3);
}

+ (void)evictWithContactIdentifier:(id)a3
{
  uint64_t v3;
  const char *v4;
  const char *v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  _s16DaemoniOSLibrary21SDXPCHelperImageCacheC5evict17contactIdentifierySS_tFZ_0(v3, v4);
  swift_bridgeObjectRelease(v5);
}

+ (void)setImage:(CGImage *)a3 forKey:(id)a4 contactIDs:(id)a5
{
  uint64_t v7;
  const char *v8;
  const char *v9;
  const char *v10;
  CGImage *v11;
  double v12;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v9 = v8;
  v10 = (const char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String);
  v11 = a3;
  _s16DaemoniOSLibrary21SDXPCHelperImageCacheC03setD0_6forKey10contactIDsySo10CGImageRefa_SSSaySSGtFZ_0(v11, v7, v9, v10);

  *(_QWORD *)&v12 = swift_bridgeObjectRelease(v9).n128_u64[0];
  swift_bridgeObjectRelease(v10, v12);
}

+ (BOOL)cacheIsEmpty
{
  id v2;
  uint64_t v3;
  __n128 v4;
  const char *v5;
  const char *v6;
  NSString v7;

  v2 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  if (qword_1007B4250 != -1)
    swift_once(&qword_1007B4250, sub_100516548);
  v3 = type metadata accessor for URL(0);
  sub_100221DF8(v3, (uint64_t)qword_1007C4DB0);
  URL.path.getter(v4);
  v6 = v5;
  v7 = String._bridgeToObjectiveC()();
  LOBYTE(v6) = objc_msgSend(v2, "fileExistsAtPath:", v7, swift_bridgeObjectRelease(v6).n128_f64[0]);

  return v6 ^ 1;
}

+ (CGImage)imageForKey:(id)a3 contactIDs:(id)a4
{
  uint64_t v5;
  const char *v6;
  const char *v7;
  const char *v8;
  void *v9;
  double v10;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = (const char *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v9 = (void *)_s16DaemoniOSLibrary21SDXPCHelperImageCacheC11imageForKey_10contactIDsSo10CGImageRefaSgSS_SaySSGtFZ_0(v5, v7, v8);
  *(_QWORD *)&v10 = swift_bridgeObjectRelease(v7).n128_u64[0];
  swift_bridgeObjectRelease(v8, v10);
  return (CGImage *)v9;
}

+ (int64_t)cacheCount
{
  return sub_100518CD8();
}

- (_TtC16DaemoniOSLibrary21SDXPCHelperImageCache)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SDXPCHelperImageCache();
  return -[SDXPCHelperImageCache init](&v3, "init");
}

@end
