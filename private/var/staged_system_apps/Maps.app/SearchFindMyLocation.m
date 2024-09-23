@implementation SearchFindMyLocation

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (CLLocationCoordinate2D)latLng
{
  _TtC4Maps20SearchFindMyLocation *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CLLocationCoordinate2D result;

  v2 = self;
  v3 = Location.latitude.getter();
  v4 = Location.longitude.getter();

  v5 = v3;
  v6 = v4;
  result.longitude = v6;
  result.latitude = v5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1001EE580(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC4Maps20SearchFindMyLocation_location, (uint64_t (*)(char *, uint64_t))&static Location.== infix(_:_:));
}

- (int64_t)hash
{
  _TtC4Maps20SearchFindMyLocation *v2;
  int64_t v3;

  v2 = self;
  v3 = Location.hashValue.getter();

  return v3;
}

- (NSString)description
{
  return (NSString *)sub_1001EE654(self, (uint64_t)a2, (void (*)(void))sub_1001EE6AC);
}

- (_TtC4Maps20SearchFindMyLocation)init
{
  _TtC4Maps20SearchFindMyLocation *result;

  result = (_TtC4Maps20SearchFindMyLocation *)_swift_stdlib_reportUnimplementedInitializer("Maps.SearchFindMyLocation", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1001EE838((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps20SearchFindMyLocation_location, (uint64_t (*)(_QWORD))&type metadata accessor for Location, &OBJC_IVAR____TtC4Maps20SearchFindMyLocation_id);
}

@end
