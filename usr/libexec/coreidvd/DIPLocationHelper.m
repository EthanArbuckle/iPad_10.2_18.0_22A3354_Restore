@implementation DIPLocationHelper

- (_TtC8coreidvd17DIPLocationHelper)init
{
  id v3;
  _TtC8coreidvd17DIPLocationHelper *v4;
  uint64_t ObjectType;

  v3 = objc_allocWithZone((Class)type metadata accessor for DIPLocationHelper());
  v4 = (_TtC8coreidvd17DIPLocationHelper *)sub_100258320(0, 0, 0);
  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 36, 7);
  return v4;
}

- (void)dealloc
{
  _TtC8coreidvd17DIPLocationHelper *v2;

  v2 = self;
  sub_100257188();
}

- (void).cxx_destruct
{

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8coreidvd17DIPLocationHelper *v10;

  v7 = sub_10001CFF8(0, &qword_100639D58, CLLocation_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_100257E8C(v9, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC8coreidvd17DIPLocationHelper *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_100258870(v6, (uint64_t)v8);

}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6;
  _TtC8coreidvd17DIPLocationHelper *v7;

  v6 = a3;
  v7 = self;
  sub_100258A6C(a4);

}

@end
