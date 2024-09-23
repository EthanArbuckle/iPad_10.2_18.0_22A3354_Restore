@implementation ClearBackground.Controller

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ClearBackground.Controller();
  v2 = v6.receiver;
  -[ClearBackground.Controller viewDidLoad](&v6, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
    objc_msgSend(v4, "setBackgroundColor:", v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ClearBackground.Controller();
  v4 = v9.receiver;
  v5 = a3;
  -[ClearBackground.Controller willMoveToParentViewController:](&v9, "willMoveToParentViewController:", v5);
  if (v5)
  {
    v6 = objc_msgSend(v5, "view", v9.receiver, v9.super_class);
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
      objc_msgSend(v7, "setBackgroundColor:", v8);

      v5 = v7;
      v4 = v8;
    }

  }
}

- (_TtCV11MusicCoreUIP33_BED032AFC26D7293E5DA491DDAECC51415ClearBackground10Controller)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  NSString v7;
  id v8;
  _TtCV11MusicCoreUIP33_BED032AFC26D7293E5DA491DDAECC51415ClearBackground10Controller *v9;
  objc_super v11;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = a4;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ClearBackground.Controller();
  v9 = -[ClearBackground.Controller initWithNibName:bundle:](&v11, "initWithNibName:bundle:", v7, a4);

  return v9;
}

- (_TtCV11MusicCoreUIP33_BED032AFC26D7293E5DA491DDAECC51415ClearBackground10Controller)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClearBackground.Controller();
  return -[ClearBackground.Controller initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
