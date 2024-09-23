@implementation WKUIBreadcrumbPathRenderer

- (BOOL)canDrawMapRect:(id)a3 zoomScale:(double)a4
{
  double var1;
  double var0;
  double v6;
  double v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  _TtC9WorkoutUI26WKUIBreadcrumbPathRenderer *v11;
  MKMapRect v13;
  MKMapRect v14;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v6 = a3.var0.var1;
  v7 = a3.var0.var0;
  v8 = *(os_unfair_lock_s **)(*(char **)((char *)&self->super.super.isa
                                       + OBJC_IVAR____TtC9WorkoutUI26WKUIBreadcrumbPathRenderer_crumbs)
                            + OBJC_IVAR____TtC9WorkoutUI18WKUIBreadcrumbPath_protectedBreadcrumbData);
  v9 = (uint64_t)&v8[4];
  v10 = v8 + 14;
  v11 = self;
  os_unfair_lock_lock(v10);
  sub_24A674ACC(v9, (uint64_t)&v13);
  os_unfair_lock_unlock(v10);
  v14.origin.x = v7;
  v14.origin.y = v6;
  v14.size.width = var0;
  v14.size.height = var1;
  LOBYTE(v9) = MKMapRectIntersectsRect(v13, v14);

  return v9;
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1;
  double var0;
  double v8;
  double v9;
  CGContext *v11;
  _TtC9WorkoutUI26WKUIBreadcrumbPathRenderer *v12;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v8 = a3.var0.var1;
  v9 = a3.var0.var0;
  v11 = a5;
  v12 = self;
  sub_24A6713C4(v11, v9, v8, var0, var1, a4);

}

- (_TtC9WorkoutUI26WKUIBreadcrumbPathRenderer)initWithOverlay:(id)a3
{
  _TtC9WorkoutUI26WKUIBreadcrumbPathRenderer *result;

  swift_unknownObjectRetain();
  result = (_TtC9WorkoutUI26WKUIBreadcrumbPathRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
