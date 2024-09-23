@implementation CRLBoardPreviewImageCache.LookupKey

- (BOOL)isEqual:(id)a3
{
  _TtCC8Freeform25CRLBoardPreviewImageCache9LookupKey *v5;
  uint64_t v6;
  _TtCC8Freeform25CRLBoardPreviewImageCache9LookupKey *v7;
  BOOL v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_10058BC20((uint64_t)v10);

  sub_1004CB800((uint64_t)v10, &qword_1013E0230);
  return v8;
}

- (int64_t)hash
{
  _TtCC8Freeform25CRLBoardPreviewImageCache9LookupKey *v2;
  Swift::Int v3;

  v2 = self;
  v3 = sub_10058BDCC();

  return v3;
}

- (NSString)description
{
  _TtCC8Freeform25CRLBoardPreviewImageCache9LookupKey *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10058C19C();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (_TtCC8Freeform25CRLBoardPreviewImageCache9LookupKey)init
{
  _TtCC8Freeform25CRLBoardPreviewImageCache9LookupKey *result;

  result = (_TtCC8Freeform25CRLBoardPreviewImageCache9LookupKey *)_swift_stdlib_reportUnimplementedInitializer("Freeform.LookupKey", 18, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004B84A4((uint64_t)self + OBJC_IVAR____TtCC8Freeform25CRLBoardPreviewImageCache9LookupKey_item, type metadata accessor for CRLBoardPreviewImageCache.Item);
}

@end
