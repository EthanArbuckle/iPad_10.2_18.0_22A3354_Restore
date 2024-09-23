@implementation SynapseLinkItem

- (void)linkPreviewDidFinishLoadingWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8PaperKit15SynapseLinkItem *v9;
  uint64_t v10;

  v4 = type metadata accessor for Notification();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  SynapseLinkItem.linkPreviewDidFinishLoading(notification:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC8PaperKit15SynapseLinkItem)init
{
  _TtC8PaperKit15SynapseLinkItem *result;

  result = (_TtC8PaperKit15SynapseLinkItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit15SynapseLinkItem_delegate);
}

@end
