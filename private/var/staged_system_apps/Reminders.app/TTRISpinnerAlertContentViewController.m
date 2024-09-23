@implementation TTRISpinnerAlertContentViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders37TTRISpinnerAlertContentViewController *v3;

  v3 = self;
  sub_1004EC444((uint64_t)v3, v2);

}

- (_TtC9Reminders37TTRISpinnerAlertContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC9Reminders37TTRISpinnerAlertContentViewController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
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
  v12 = -[TTRISpinnerAlertContentViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC9Reminders37TTRISpinnerAlertContentViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[TTRISpinnerAlertContentViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
