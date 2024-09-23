@implementation TTRIRootViewEmptyViewController

- (_TtC9RemindersP33_FA7497EFB9442A0772420FA2AEB0251131TTRIRootViewEmptyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC9RemindersP33_FA7497EFB9442A0772420FA2AEB0251131TTRIRootViewEmptyViewController *v12;
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
  v12 = -[TTRIRootViewEmptyViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC9RemindersP33_FA7497EFB9442A0772420FA2AEB0251131TTRIRootViewEmptyViewController)init
{
  return -[TTRIRootViewEmptyViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
}

- (_TtC9RemindersP33_FA7497EFB9442A0772420FA2AEB0251131TTRIRootViewEmptyViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[TTRIRootViewEmptyViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
