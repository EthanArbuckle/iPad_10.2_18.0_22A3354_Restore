@implementation ReadingHistoryAppFileSyncManager

- (uint64_t)applicationWillEnterForeground:(uint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_retain(a1);
  CRDTModelFileSyncManager.resume()();
  swift_release(a1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
