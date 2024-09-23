@implementation BKLibraryBookUpdateCountOperation

- (NSDictionary)result
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___BKLibraryBookUpdateCountOperation_result);
  swift_beginAccess((char *)self + OBJC_IVAR___BKLibraryBookUpdateCountOperation_result, v6, 0, 0);
  v3 = *v2;
  if (!v3)
    return (NSDictionary *)0;
  swift_bridgeObjectRetain(v3);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (void)setResult:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7[24];

  if (a3)
    v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v4 = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___BKLibraryBookUpdateCountOperation_result);
  swift_beginAccess(v5, v7, 1, 0);
  v6 = *v5;
  *v5 = v4;
  swift_bridgeObjectRelease(v6);
}

- (BKLibraryBookUpdateCountOperation)initWithLibraryAssetProvider:(id)a3 updatesURL:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_class *updated;
  BKLibraryBookUpdateCountOperation *v12;
  objc_super v14;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKLibraryBookUpdateCountOperation_result) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___BKLibraryBookUpdateCountOperation_libraryAssetProvider) = (Class)a3;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)self + OBJC_IVAR___BKLibraryBookUpdateCountOperation_updatesURL, v10, v7);
  updated = (objc_class *)type metadata accessor for LibraryBookUpdateCountOperation(0);
  v14.receiver = self;
  v14.super_class = updated;
  swift_unknownObjectRetain(a3);
  v12 = -[BKLibraryBookUpdateCountOperation init](&v14, "init");
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v12;
}

- (void)main
{
  BKLibraryBookUpdateCountOperation *v2;

  v2 = self;
  LibraryBookUpdateCountOperation.main()();

}

- (BKLibraryBookUpdateCountOperation)init
{
  BKLibraryBookUpdateCountOperation *result;

  result = (BKLibraryBookUpdateCountOperation *)_swift_stdlib_reportUnimplementedInitializer("Books.LibraryBookUpdateCountOperation", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR___BKLibraryBookUpdateCountOperation_libraryAssetProvider));
  v3 = (char *)self + OBJC_IVAR___BKLibraryBookUpdateCountOperation_updatesURL;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR___BKLibraryBookUpdateCountOperation_result));
}

@end
