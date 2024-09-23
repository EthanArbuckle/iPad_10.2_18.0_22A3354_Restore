@implementation SPObserverAnalytics

- (void)meDeviceChangedWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = *(_QWORD *)self->userStatsReporting;
  if (v9)
  {
    v10 = *(_QWORD *)(v9 + 40);
    swift_retain();
    swift_retain();
    OSAllocatedUnfairLock.callAsFunction<A>(_:)(sub_100139464, v9, v10, &type metadata for () + 1, &type metadata for () + 1);
    swift_release();
    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
