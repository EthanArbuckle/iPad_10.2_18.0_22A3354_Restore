@implementation DIPLockStateMonitor

- (_TtC8coreidvd19DIPLockStateMonitor)init
{
  return (_TtC8coreidvd19DIPLockStateMonitor *)sub_1004FE400();
}

- (BOOL)registerForDeviceLockNotificationsWithWatchPairingID:(id)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  _TtC8coreidvd19DIPLockStateMonitor *v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = self;
  sub_1004FE648(v5, v7);
  swift_bridgeObjectRelease(v7);

  return 1;
}

- (void)unregisterFromDeviceLockNotificationsWithWatchPairingID:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _TtC8coreidvd19DIPLockStateMonitor *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_1004FEFCC(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)dealloc
{
  _TtC8coreidvd19DIPLockStateMonitor *v2;

  v2 = self;
  sub_1004FF3C4();
}

- (void).cxx_destruct
{
  sub_10001D07C((uint64_t)self + OBJC_IVAR____TtC8coreidvd19DIPLockStateMonitor_delegate);

  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC8coreidvd19DIPLockStateMonitor_deviceLockStateNotification]);
}

@end
