@implementation CRLSelectionAwareActivityViewController

- (BOOL)staysOpenOnSelectionChange
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC8Freeform39CRLSelectionAwareActivityViewController_staysOpenOnSelectionChange);
}

- (void)setStaysOpenOnSelectionChange:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform39CRLSelectionAwareActivityViewController_staysOpenOnSelectionChange) = a3;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLSelectionAwareActivityViewController();
  v2 = v5.receiver;
  -[CRLSelectionAwareActivityViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = objc_msgSend(v2, "view", v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setAccessibilityViewIsModal:", 1);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLSelectionAwareActivityViewController();
  v4 = v6.receiver;
  -[CRLSelectionAwareActivityViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  LODWORD(v3) = UIAccessibilityLayoutChangedNotification;
  v5 = objc_msgSend(v4, "view", v6.receiver, v6.super_class);
  UIAccessibilityPostNotification(v3, v5);

}

- (_TtC8Freeform39CRLSelectionAwareActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  unint64_t v6;
  NSArray v7;
  NSArray v8;
  _TtC8Freeform39CRLSelectionAwareActivityViewController *v9;
  objc_super v11;

  static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  if (a4)
  {
    v6 = sub_100BC22BC();
    a4 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v6);
  }
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8Freeform39CRLSelectionAwareActivityViewController_staysOpenOnSelectionChange) = 1;
  v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (a4)
  {
    sub_100BC22BC();
    v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v8.super.isa = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CRLSelectionAwareActivityViewController();
  v9 = -[CRLSelectionAwareActivityViewController initWithActivityItems:applicationActivities:](&v11, "initWithActivityItems:applicationActivities:", v7.super.isa, v8.super.isa);

  return v9;
}

@end
