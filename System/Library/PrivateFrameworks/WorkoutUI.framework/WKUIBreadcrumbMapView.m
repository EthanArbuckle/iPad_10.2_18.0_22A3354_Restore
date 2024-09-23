@implementation WKUIBreadcrumbMapView

- (_TtC9WorkoutUI21WKUIBreadcrumbMapView)initWithCoder:(id)a3
{
  id v4;
  _TtC9WorkoutUI21WKUIBreadcrumbMapView *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_breadcrumbPath) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_breadcrumbPathRenderer) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_cancellable) = (Class)MEMORY[0x24BEE4B08];
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_routePolyline) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_didReceiveInitialUpdate) = 0;
  v4 = a3;

  result = (_TtC9WorkoutUI21WKUIBreadcrumbMapView *)sub_24A77C01C();
  __break(1u);
  return result;
}

- (_TtC9WorkoutUI21WKUIBreadcrumbMapView)initWithFrame:(CGRect)a3
{
  _TtC9WorkoutUI21WKUIBreadcrumbMapView *result;

  result = (_TtC9WorkoutUI21WKUIBreadcrumbMapView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9WorkoutUI21WKUIBreadcrumbMapView)initWithFrame:(CGRect)a3 locationManager:(id)a4
{
  id v4;
  _TtC9WorkoutUI21WKUIBreadcrumbMapView *result;

  v4 = a4;
  result = (_TtC9WorkoutUI21WKUIBreadcrumbMapView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_breadcrumbPath));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_breadcrumbPathRenderer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_routePolyline));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9WorkoutUI21WKUIBreadcrumbMapView_inUseAssertion));
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v5;
  _TtC9WorkoutUI21WKUIBreadcrumbMapView *v6;
  id v7;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_24A7056A8();

  swift_unknownObjectRelease();
  return v7;
}

@end
