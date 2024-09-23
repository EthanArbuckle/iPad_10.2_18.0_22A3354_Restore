@implementation FMLocationProvider

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6;
  _TtC6FindMy18FMLocationProvider *v7;

  v6 = a3;
  v7 = self;
  sub_100017744(a4);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC6FindMy18FMLocationProvider *v10;

  v7 = sub_100006C5C(0, (unint64_t *)&unk_1005DF4B0, CLLocation_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_10001E25C(v8);

  swift_bridgeObjectRelease(v8);
}

- (void)locationManager:(id)a3 didUpdateHeading:(id)a4
{
  id v6;
  id v7;
  _TtC6FindMy18FMLocationProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100013658(v7);

}

- (_TtC6FindMy18FMLocationProvider)init
{
  return (_TtC6FindMy18FMLocationProvider *)sub_10000E5FC();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC6FindMy18FMLocationProvider *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_100461AF0((uint64_t)v8);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC6FindMy18FMLocationProvider_subscriptions));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC6FindMy18FMLocationProvider_poiLocations));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy18FMLocationProvider_locationShifter));
}

@end
