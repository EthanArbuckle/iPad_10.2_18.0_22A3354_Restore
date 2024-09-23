@implementation MapsElevationGraphViewController

+ (id)makeHostingControllerFor:(id)a3 width:(double)a4 isMetric:(BOOL)a5 traitCollection:(id)a6 shouldHighlight:(BOOL)a7 chartStyle:(id)a8 currentPosition:(id)a9
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  id v22;
  id v23;
  char *v24;
  void *v25;
  uint64_t v27;

  v17 = sub_100008B04(&qword_10149A1F0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v20 = (char *)&v27 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_10000E4BC(0, (unint64_t *)&qword_10149A210, NSUnitLength_ptr);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)(a9, v21);
  swift_getObjCClassMetadata(a1);
  v22 = a3;
  v23 = a6;
  v24 = (char *)a8;
  v25 = (void *)sub_1001E8BEC(a3, a5, (uint64_t)v23, a7, v24, (uint64_t)v20, a4);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  return v25;
}

- (_TtC4Maps32MapsElevationGraphViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC4Maps32MapsElevationGraphViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for MapsElevationGraphViewController();
  v11 = -[MapsElevationGraphViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC4Maps32MapsElevationGraphViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MapsElevationGraphViewController();
  return -[MapsElevationGraphViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
