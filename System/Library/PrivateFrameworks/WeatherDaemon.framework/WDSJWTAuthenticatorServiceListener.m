@implementation WDSJWTAuthenticatorServiceListener

- (_TtC13WeatherDaemon34WDSJWTAuthenticatorServiceListener)init
{
  WDSJWTAuthenticatorServiceListener.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC13WeatherDaemon34WDSJWTAuthenticatorServiceListener *v8;
  Swift::Bool v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = WDSJWTAuthenticatorServiceListener.listener(_:shouldAcceptNewConnection:)((NSXPCListener)v8, (NSXPCConnection)v7);

  return v9;
}

- (void)generateTokenWithUrl:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC13WeatherDaemon34WDSJWTAuthenticatorServiceListener *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1A62D59C4(v7, (uint64_t)v8, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);

}

@end
