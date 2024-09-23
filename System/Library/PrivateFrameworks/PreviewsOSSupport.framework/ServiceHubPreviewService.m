@implementation ServiceHubPreviewService

- (void)activateWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC17PreviewsOSSupport24ServiceHubPreviewService *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_224D73F18((uint64_t)sub_224D67F10, v5);

  swift_release();
}

- (void)cancel
{
  uint64_t v2;

  swift_getObjectType();
  sub_224D74F7C((unint64_t *)&unk_2557D82F8, v2, (uint64_t (*)(uint64_t))type metadata accessor for ServiceHubPreviewService, (uint64_t)&unk_224D850CC);
  sub_224D82288();
}

- (void)observeCancelation:(id)a3
{
  void *v5;
  uint64_t v6;
  _TtC17PreviewsOSSupport24ServiceHubPreviewService *v7;

  swift_getObjectType();
  v5 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v5;
  sub_224D74F7C((unint64_t *)&unk_2557D82F8, v6, (uint64_t (*)(uint64_t))type metadata accessor for ServiceHubPreviewService, (uint64_t)&unk_224D850CC);
  v7 = self;
  sub_224D82294();

  swift_release();
}

- (_TtC17PreviewsOSSupport24ServiceHubPreviewService)init
{
  _TtC17PreviewsOSSupport24ServiceHubPreviewService *result;

  result = (_TtC17PreviewsOSSupport24ServiceHubPreviewService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
