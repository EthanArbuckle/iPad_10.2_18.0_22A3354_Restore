@implementation UnifiedMessagingProvider

- (_TtC8ShelfKit24UnifiedMessagingProvider)init
{
  _TtC8ShelfKit24UnifiedMessagingProvider *result;

  result = (_TtC8ShelfKit24UnifiedMessagingProvider *)_swift_stdlib_reportUnimplementedInitializer("ShelfKit.UnifiedMessagingProvider", 33, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->placement[OBJC_IVAR____TtC8ShelfKit24UnifiedMessagingProvider_placement]);

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8ShelfKit24UnifiedMessagingProvider_amsDialogRequestSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8ShelfKit24UnifiedMessagingProvider____lazy_storage___bannerShelfPublisher));
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  id v8;
  id v9;
  _TtC8ShelfKit24UnifiedMessagingProvider *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_E6324(a4);

}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  _Block_release(v5);
}

@end
