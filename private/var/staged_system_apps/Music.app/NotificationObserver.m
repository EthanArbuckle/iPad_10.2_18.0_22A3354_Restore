@implementation NotificationObserver

- (void)handleNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __n128 v8;
  uint64_t v9;

  v4 = type metadata accessor for Notification(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_retain();
  sub_100B755F8((uint64_t)v7);
  v8 = swift_release();
  (*(void (**)(char *, uint64_t, __n128))(v5 + 8))(v7, v4, v8);
}

@end
