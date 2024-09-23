@implementation WKUIBreadcrumbPath

- ($B22509A9E1E897CB5DF0DB02A23A695A)boundingMapRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  $B22509A9E1E897CB5DF0DB02A23A695A result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_boundingMapRect);
  v3 = *(double *)&self->boundingMapRect[OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_boundingMapRect];
  v4 = *(double *)&self->boundingMapRect[OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_boundingMapRect + 8];
  v5 = *(double *)&self->boundingMapRect[OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_boundingMapRect + 16];
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (CLLocationCoordinate2D)coordinate
{
  double *v2;
  double v3;
  double v4;
  CLLocationCoordinate2D result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_coordinate);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  result.longitude = v4;
  result.latitude = v3;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  CLLocationDegrees *v5;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v5 = (CLLocationDegrees *)((char *)self + OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_coordinate);
  swift_beginAccess();
  *v5 = latitude;
  v5[1] = longitude;
}

- (_TtC9WorkoutUI18WKUIBreadcrumbPath)init
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_boundingMapRect);
  v4 = *MEMORY[0x24BDDAFF0];
  v5 = *(_QWORD *)(MEMORY[0x24BDDAFF0] + 8);
  v6 = *(_QWORD *)(MEMORY[0x24BDDAFF0] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BDDAFF0] + 24);
  *v3 = *MEMORY[0x24BDDAFF0];
  v3[1] = v5;
  v3[2] = v6;
  v3[3] = v7;
  v8 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_coordinate);
  *v8 = 0;
  v8[1] = 0;
  v9 = OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_protectedBreadcrumbData;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257948B68);
  v10 = swift_allocObject();
  *(_DWORD *)(v10 + 56) = 0;
  *(_QWORD *)(v10 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v10 + 24) = v4;
  *(_QWORD *)(v10 + 32) = v5;
  *(_QWORD *)(v10 + 40) = v6;
  *(_QWORD *)(v10 + 48) = v7;
  *(Class *)((char *)&self->super.isa + v9) = (Class)v10;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for WKUIBreadcrumbPath();
  return -[WKUIBreadcrumbPath init](&v12, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
