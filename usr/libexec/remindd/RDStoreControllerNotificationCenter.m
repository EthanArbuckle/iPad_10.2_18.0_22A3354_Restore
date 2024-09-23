@implementation RDStoreControllerNotificationCenter

- (void)handleNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  swift_retain();
  sub_100395890((uint64_t)v9);
  swift_release(self);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

@end
