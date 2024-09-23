@implementation RemoteAlertInvalidationHandler

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  _TtC21ProximityReaderDaemon30RemoteAlertInvalidationHandler *v5;

  v4 = a3;
  v5 = self;
  sub_244DDEA88(v4);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC21ProximityReaderDaemon30RemoteAlertInvalidationHandler *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_244DDED50(v6, (uint64_t)a4);

}

- (_TtC21ProximityReaderDaemon30RemoteAlertInvalidationHandler)init
{
  _TtC21ProximityReaderDaemon30RemoteAlertInvalidationHandler *result;

  result = (_TtC21ProximityReaderDaemon30RemoteAlertInvalidationHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
