@implementation BKAdjustGoalModalViewController

+ (void)createAsync:(int64_t)a3 :(int64_t)a4 :(id)a5 :(id)a6
{
  id v10;

  swift_unknownObjectRetain(a5);
  v10 = a6;
  sub_1005ACB00(a3, a4, (uint64_t)a5, v10);
  swift_unknownObjectRelease(a5);

}

- (BKAdjustGoalModalViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  BKAdjustGoalModalViewController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
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
  v12 = -[BKAdjustGoalModalViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (BKAdjustGoalModalViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[BKAdjustGoalModalViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
