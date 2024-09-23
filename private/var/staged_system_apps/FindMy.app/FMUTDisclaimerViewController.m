@implementation FMUTDisclaimerViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self);
  v4 = v8.receiver;
  -[FMUTDisclaimerViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "parentViewController", v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_opt_self(UIPageViewController);
    if (swift_dynamicCastObjCClass(v6, v7))
      sub_10010D39C();

  }
  else
  {
    v6 = v4;
  }

}

- (void)continue
{
  _TtC6FindMy28FMUTDisclaimerViewController *v2;
  _TtC6FindMy28FMUTDisclaimerViewController *v3;
  uint64_t v4;
  _TtC6FindMy28FMUTDisclaimerViewController *v5;
  _TtC6FindMy28FMUTDisclaimerViewController *v6;

  v2 = self;
  v3 = (_TtC6FindMy28FMUTDisclaimerViewController *)-[FMUTDisclaimerViewController parentViewController](v2, "parentViewController");
  if (v3)
  {
    v6 = v3;
    v4 = objc_opt_self(UIPageViewController);
    if (swift_dynamicCastObjCClass(v6, v4))
      sub_10010D178(1, 0, 0);

    v5 = v6;
  }
  else
  {
    v5 = v2;
  }

}

- (_TtC6FindMy28FMUTDisclaimerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (!a4)
  {
    v13 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    v16 = 0;
    return (_TtC6FindMy28FMUTDisclaimerViewController *)sub_100229808(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;
  return (_TtC6FindMy28FMUTDisclaimerViewController *)sub_100229808(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC6FindMy28FMUTDisclaimerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  objc_class *ObjectType;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSString v16;
  NSString v17;
  _TtC6FindMy28FMUTDisclaimerViewController *v18;
  objc_super v20;

  ObjectType = (objc_class *)swift_getObjectType(self);
  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v14;
  }
  v15 = a5;
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  if (a4)
  {
    v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    v17 = 0;
  }
  v20.receiver = self;
  v20.super_class = ObjectType;
  v18 = -[FMUTDisclaimerViewController initWithTitle:detailText:icon:contentLayout:](&v20, "initWithTitle:detailText:icon:contentLayout:", v16, v17, v15, a6);

  return v18;
}

@end
