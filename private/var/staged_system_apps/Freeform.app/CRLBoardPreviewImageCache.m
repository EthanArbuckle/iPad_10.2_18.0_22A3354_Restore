@implementation CRLBoardPreviewImageCache

- (void)dealloc
{
  _TtC8Freeform25CRLBoardPreviewImageCache *v2;

  v2 = self;
  sub_10058F610();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform25CRLBoardPreviewImageCache_cachedSizes));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform25CRLBoardPreviewImageCache_subscriptionSet));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform25CRLBoardPreviewImageCache_updatePublisher));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform25CRLBoardPreviewImageCache_assetDownloadHelper));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLBoardPreviewImageCache____lazy_storage___defaultUnsupportedImage));
}

- (_TtC8Freeform25CRLBoardPreviewImageCache)init
{
  _TtC8Freeform25CRLBoardPreviewImageCache *result;

  result = (_TtC8Freeform25CRLBoardPreviewImageCache *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLBoardPreviewImageCache", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)cache:(id)a3 willEvictObject:(id)a4
{
  id v6;
  _TtC8Freeform25CRLBoardPreviewImageCache *v7;
  _QWORD v8[4];

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  _bridgeAnyObjectToAny(_:)(v8, a4);
  swift_unknownObjectRelease(a4);
  sub_1005A1C14((uint64_t)v8);

  _s8Freeform26AnyCRLCommandChangeContextVwxx_0(v8);
}

@end
