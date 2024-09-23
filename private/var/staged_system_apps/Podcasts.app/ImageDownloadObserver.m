@implementation ImageDownloadObserver

- (void)notificationFiredWithNote:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __n128 v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_retain();
  sub_1003128D0();
  v9 = swift_release(self);
  (*(void (**)(char *, uint64_t, __n128))(v6 + 8))(v8, v5, v9);
}

@end
