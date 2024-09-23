@implementation LocationModel

- (_TtC13SleepHealthUI13LocationModel)init
{
  _TtC13SleepHealthUI13LocationModel *result;

  result = (_TtC13SleepHealthUI13LocationModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI13LocationModel__currentLocation;
  sub_1A9B92F34(0, &qword_1EEB45298, (uint64_t (*)(uint64_t))sub_1A9CB7984, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC13SleepHealthUI13LocationModel *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1A9CB9640(v8);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC13SleepHealthUI13LocationModel *v8;

  sub_1A9B94A18(0, &qword_1EEB45278);
  v6 = sub_1A9CE83DC();
  v7 = a3;
  v8 = self;
  sub_1A9CB98E0(v6);

  swift_bridgeObjectRelease();
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  objc_class *v4;
  CLLocationManager v5;
  id internal;

  v4 = (objc_class *)a3;
  v5._internal = self;
  internal = v5._internal;
  v5.super.isa = v4;
  LocationModel.locationManagerDidChangeAuthorization(_:)(v5);

}

@end
