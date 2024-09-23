@implementation FMPersonAnnotationView

- (_TtC26FindMyNotificationsContent22FMPersonAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  _TtC26FindMyNotificationsContent22FMPersonAnnotationView *v9;
  objc_super v11;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    swift_unknownObjectRetain(a3);
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    swift_unknownObjectRetain(a3);
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FMPersonAnnotationView();
  v9 = -[FMMapAnnotationView initWithAnnotation:reuseIdentifier:](&v11, "initWithAnnotation:reuseIdentifier:", a3, v8);

  swift_unknownObjectRelease(a3);
  return v9;
}

- (_TtC26FindMyNotificationsContent22FMPersonAnnotationView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMPersonAnnotationView();
  return -[FMMapAnnotationView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
