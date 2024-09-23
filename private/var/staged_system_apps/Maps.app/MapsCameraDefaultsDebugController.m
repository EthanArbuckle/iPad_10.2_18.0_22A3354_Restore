@implementation MapsCameraDefaultsDebugController

+ (id)navigationDestinationTitle
{
  return String._bridgeToObjectiveC()();
}

- (void)prepareContent
{
  _TtC4Maps33MapsCameraDefaultsDebugController *v2;

  v2 = self;
  sub_1001422B8();

}

- (_TtC4Maps33MapsCameraDefaultsDebugController)initWithStyle:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[MapsCameraDefaultsDebugController initWithStyle:](&v5, "initWithStyle:", a3);
}

- (_TtC4Maps33MapsCameraDefaultsDebugController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC4Maps33MapsCameraDefaultsDebugController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType(self);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
    v10 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[MapsCameraDefaultsDebugController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC4Maps33MapsCameraDefaultsDebugController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[MapsCameraDefaultsDebugController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
