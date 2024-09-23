@implementation FMAnnotation

- (CLLocationCoordinate2D)coordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_coordinate);
  v3 = *(double *)&self->coordinate[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_coordinate];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  *(CLLocationCoordinate2D *)((char *)&self->super.isa
                            + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_coordinate) = a3;
}

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->coordinate[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->coordinate[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title);
  v7 = *(_QWORD *)&self->coordinate[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

- (BOOL)isEqual:(id)a3
{
  _TtC26FindMyNotificationsContent12FMAnnotation *v5;
  uint64_t v6;
  _TtC26FindMyNotificationsContent12FMAnnotation *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_10000D2AC((uint64_t)v10);

  sub_1000071F0((uint64_t)v10, &qword_10001AA48);
  return v8 & 1;
}

- (_TtC26FindMyNotificationsContent12FMAnnotation)init
{
  _TtC26FindMyNotificationsContent12FMAnnotation *result;

  result = (_TtC26FindMyNotificationsContent12FMAnnotation *)_swift_stdlib_reportUnimplementedInitializer("FindMyNotificationsContent.FMAnnotation", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000E388(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_fmClusterIdentifier), *(_QWORD *)&self->coordinate[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_fmClusterIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->coordinate[OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_title]);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26FindMyNotificationsContent12FMAnnotation_stewieBadgeImage));
}

@end
