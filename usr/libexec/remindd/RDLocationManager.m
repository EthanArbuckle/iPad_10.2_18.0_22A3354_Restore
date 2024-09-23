@implementation RDLocationManager

- (_TtC7remindd17RDLocationManager)init
{
  _TtC7remindd17RDLocationManager *result;

  result = (_TtC7remindd17RDLocationManager *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDLocationManager", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_100008EFC((uint64_t)self + OBJC_IVAR____TtC7remindd17RDLocationManager_delegate);
}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  sub_10046C2E0(self, (uint64_t)a2, a3, a4, 0x7265746E45646964, (void *)0xEE006E6F69676552, "didEnterRegion: %@", (void (*)(NSObject *, uint64_t))sub_10046D3E0);
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  sub_10046C2E0(self, (uint64_t)a2, a3, a4, 0x5274697845646964, (void *)0xED00006E6F696765, "didExitRegion: %@", (void (*)(NSObject *, uint64_t))sub_10046D5E8);
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v8;
  id v9;
  _TtC7remindd17RDLocationManager *v10;

  v8 = a3;
  v9 = a5;
  v10 = self;
  sub_10046E178(a4, v9);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC7remindd17RDLocationManager *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_10046E420((uint64_t)v8);

}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  _TtC7remindd17RDLocationManager *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_10046E664(a4, (uint64_t)v11);

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  _TtC7remindd17RDLocationManager *v5;

  v5 = self;
  v4 = a3;
  sub_10046DCD4(0xD000000000000016, (void *)0x8000000100704F10, (uint64_t)v5, v4);

}

@end
