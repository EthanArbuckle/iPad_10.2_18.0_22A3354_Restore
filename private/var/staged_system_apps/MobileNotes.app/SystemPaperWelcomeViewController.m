@implementation SystemPaperWelcomeViewController

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  id v6;
  Class isa;
  NSString v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType(self);
  v4 = v9.receiver;
  -[SystemPaperWelcomeViewController viewDidAppear:](&v9, "viewDidAppear:", v3);
  v5 = (void *)objc_opt_self(NSUserDefaults);
  v6 = objc_msgSend(v5, "standardUserDefaults", v9.receiver, v9.super_class);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v8 = String._bridgeToObjectiveC()();
  objc_msgSend(v6, "setObject:forKey:", isa, v8);

}

- (void)dismiss:(id)a3
{
  _TtC11MobileNotes32SystemPaperWelcomeViewController *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC11MobileNotes32SystemPaperWelcomeViewController *v8;
  __int128 v9;
  __int128 v10;

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(&v9, v6);
    swift_unknownObjectRelease(a3, v7);
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v8 = self;
  }
  -[SystemPaperWelcomeViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, v9, v10);

  sub_1000160C8((uint64_t)&v9);
}

- (_TtC11MobileNotes32SystemPaperWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
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
    return (_TtC11MobileNotes32SystemPaperWelcomeViewController *)sub_100356920(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;
  return (_TtC11MobileNotes32SystemPaperWelcomeViewController *)sub_100356920(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC11MobileNotes32SystemPaperWelcomeViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  objc_class *ObjectType;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSString v16;
  NSString v17;
  _TtC11MobileNotes32SystemPaperWelcomeViewController *v18;
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
  v18 = -[SystemPaperWelcomeViewController initWithTitle:detailText:icon:contentLayout:](&v20, "initWithTitle:detailText:icon:contentLayout:", v16, v17, v15, a6);

  return v18;
}

@end
