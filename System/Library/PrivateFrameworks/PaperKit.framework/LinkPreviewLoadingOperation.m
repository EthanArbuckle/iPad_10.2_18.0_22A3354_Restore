@implementation LinkPreviewLoadingOperation

- (void)linkPreviewDidFinishLoadingWithNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = type metadata accessor for Notification();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  LinkPreviewLoadingOperation.linkPreviewDidFinishLoading(notification:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

@end
