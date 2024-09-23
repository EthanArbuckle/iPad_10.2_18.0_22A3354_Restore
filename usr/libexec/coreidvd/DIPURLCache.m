@implementation DIPURLCache

- (void)storeCachedResponse:(id)a3 forDataTask:(id)a4
{
  id v6;
  id v7;
  _TtC8coreidvd11DIPURLCache *v8;
  id v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10044D3C8(v6, 0);
  if (v9)
  {
    v10 = v9;
    v11.receiver = v8;
    v11.super_class = (Class)type metadata accessor for DIPURLCache();
    -[DIPURLCache storeCachedResponse:forDataTask:](&v11, "storeCachedResponse:forDataTask:", v10, v7);

  }
  else
  {

  }
}

- (void)storeCachedResponse:(id)a3 forRequest:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8coreidvd11DIPURLCache *v12;
  id v13;
  id v14;
  Class isa;
  objc_class *v16;
  objc_super v17;

  v7 = type metadata accessor for URLRequest(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URLRequest._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_10044D3C8(v11, 0);
  if (v13)
  {
    v14 = v13;
    isa = URLRequest._bridgeToObjectiveC()().super.isa;
    v16 = (objc_class *)type metadata accessor for DIPURLCache();
    v17.receiver = v12;
    v17.super_class = v16;
    -[DIPURLCache storeCachedResponse:forRequest:](&v17, "storeCachedResponse:forRequest:", v14, isa);

    v11 = v14;
    v12 = (_TtC8coreidvd11DIPURLCache *)isa;
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC8coreidvd11DIPURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 diskPath:(id)a5
{
  _TtC8coreidvd11DIPURLCache *result;

  result = (_TtC8coreidvd11DIPURLCache *)_swift_stdlib_reportUnimplementedInitializer("coreidvd.DIPURLCache", 20, "init(memoryCapacity:diskCapacity:diskPath:)", 43, 0);
  __break(1u);
  return result;
}

- (_TtC8coreidvd11DIPURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 directoryURL:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _TtC8coreidvd11DIPURLCache *result;
  uint64_t v12;

  v6 = sub_100004828(&qword_100630A48);
  __chkstk_darwin(v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v9 = type metadata accessor for URL(0);
    v10 = 0;
  }
  else
  {
    v9 = type metadata accessor for URL(0);
    v10 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, v10, 1);
  result = (_TtC8coreidvd11DIPURLCache *)_swift_stdlib_reportUnimplementedInitializer("coreidvd.DIPURLCache", 20, "init(__memoryCapacity:diskCapacity:directoryURL:)", 49, 0);
  __break(1u);
  return result;
}

- (_TtC8coreidvd11DIPURLCache)init
{
  _TtC8coreidvd11DIPURLCache *result;

  result = (_TtC8coreidvd11DIPURLCache *)_swift_stdlib_reportUnimplementedInitializer("coreidvd.DIPURLCache", 20, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
