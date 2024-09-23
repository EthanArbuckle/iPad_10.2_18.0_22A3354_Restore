@implementation CurrentLocationMonitor

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4;
  id v6;
  _TtC12searchpartyd22CurrentLocationMonitor *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = self;
  sub_1000096E0(v4);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC12searchpartyd22CurrentLocationMonitor *v10;

  v7 = sub_10000F4A0(0, (unint64_t *)&qword_1010F89C0, CLLocation_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_10000FA14(v8);

  swift_bridgeObjectRelease();
}

- (_TtC12searchpartyd22CurrentLocationMonitor)init
{
  _TtC12searchpartyd22CurrentLocationMonitor *result;

  result = (_TtC12searchpartyd22CurrentLocationMonitor *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.CurrentLocationMonitor", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1002EB2D8((uint64_t)self + OBJC_IVAR____TtC12searchpartyd22CurrentLocationMonitor_delegate);

  swift_release();
  swift_release();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  _TtC12searchpartyd22CurrentLocationMonitor *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = static os_log_type_t.error.getter(v8);
  if (qword_1010E9B88 != -1)
    swift_once(&qword_1010E9B88, sub_100356FDC);
  v10 = qword_1011B6DD8;
  v11 = sub_10001A9A8((uint64_t *)&unk_1010ED710);
  v12 = swift_allocObject(v11, 72, 7);
  *(_OWORD *)(v12 + 16) = xmmword_100E22B00;
  v17 = v7;
  swift_errorRetain(v7);
  v13 = sub_10001A9A8((uint64_t *)&unk_1010EE2F0);
  v14 = String.init<A>(describing:)(&v17, v13);
  v16 = v15;
  *(_QWORD *)(v12 + 56) = &type metadata for String;
  *(_QWORD *)(v12 + 64) = sub_10001AA00();
  *(_QWORD *)(v12 + 32) = v14;
  *(_QWORD *)(v12 + 40) = v16;
  os_log(_:dso:log:_:_:)(v9, &_mh_execute_header, v10, "failed with error - %{public}@", 30, 2, v12);

  swift_bridgeObjectRelease();
}

@end
