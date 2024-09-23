@implementation FMFenceMapAnnotation

- (BOOL)didZoomOnSelection
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_didZoomOnSelection);
}

- (void)setDidZoomOnSelection:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_didZoomOnSelection) = a3;
}

- (MKCircle)overlay
{
  return (MKCircle *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_overlay));
}

- (void)setOverlay:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_overlay);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_overlay) = (Class)a3;
  v3 = a3;

}

- (double)customRadius
{
  return *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_customRadius);
}

- (void)setCustomRadius:(double)a3
{
  _TtC6FindMy20FMFenceMapAnnotation *v4;

  v4 = self;
  sub_1003CC954(a3);

}

- (NSString)displayAddress
{
  _TtC6FindMy20FMFenceMapAnnotation *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_1003CCA60();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- ($E3C724BDBCAA358FA97DFD43B1418CA9)region
{
  _TtC6FindMy20FMFenceMapAnnotation *v3;
  $E3C724BDBCAA358FA97DFD43B1418CA9 *result;
  CLLocationCoordinate2D v5;

  v3 = self;
  -[FMFenceMapAnnotation coordinate](v3, "coordinate");
  MKCoordinateRegionMakeWithDistance(v5, *(double *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_customRadius) * 3.5, *(double *)((char *)&v3->super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_customRadius) * 3.5);

  return result;
}

- (double)defaultRegionDimension
{
  _TtC6FindMy20FMFenceMapAnnotation *v2;
  double v3;

  v2 = self;
  v3 = sub_1003CCCF4();

  return v3;
}

- (double)defaultRadius
{
  _TtC6FindMy20FMFenceMapAnnotation *v2;
  double v3;

  v2 = self;
  v3 = sub_1003CD0E0();

  return v3;
}

- (BOOL)didReverseGeocode
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  _BYTE v10[24];

  v3 = sub_100053F2C(&qword_1005D3370);
  __chkstk_darwin(v3);
  v5 = &v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_fmfPlacemark;
  swift_beginAccess(v6, v10, 0, 0);
  sub_1003867C0((uint64_t)v6, (uint64_t)v5);
  v7 = type metadata accessor for FMFAddress(0);
  LOBYTE(v6) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v5, 1, v7) != 1;
  sub_100386808((uint64_t)v5);
  return (char)v6;
}

- (void)coordinateUpdated
{
  _TtC6FindMy20FMFenceMapAnnotation *v2;

  v2 = self;
  sub_1003CD550();

}

- (_TtC6FindMy20FMFenceMapAnnotation)init
{
  _TtC6FindMy20FMFenceMapAnnotation *result;

  result = (_TtC6FindMy20FMFenceMapAnnotation *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMFenceMapAnnotation", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_addressType;
  v4 = type metadata accessor for FMFLocationAlertAddressType(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100386808((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_fmfPlacemark);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMFenceMapAnnotation_didReverseGeocodeGroup));

}

@end
