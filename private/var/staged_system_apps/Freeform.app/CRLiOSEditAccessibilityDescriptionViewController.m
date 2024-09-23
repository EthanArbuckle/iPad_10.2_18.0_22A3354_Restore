@implementation CRLiOSEditAccessibilityDescriptionViewController

- (BOOL)isCancelled
{
  return *((_BYTE *)&self->super.super.super.isa
         + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController_isCancelled);
}

- (void)setIsCancelled:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController_isCancelled) = a3;
  if (a3)
    -[CRLiOSEditAccessibilityDescriptionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController)initWithInitialAccessibilityDescription:(id)a3 title:(id)a4 subtitle:(id)a5 submitButtonTitle:(id)a6 placeholder:(id)a7 delegate:(id)a8
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;

  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v28 = v14;
  v29 = v13;
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v17 = v16;
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v20 = v19;
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v23 = v22;
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
  v26 = v25;
  swift_getObjectType(a8);
  swift_unknownObjectRetain(a8);
  return (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController *)sub_1009FF7DC(v29, v28, v15, v17, v18, v20, v21, v23, v24, v26, (uint64_t)a8, self);
}

- (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController_isCancelled) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController_delegate, 0);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController_isCompact) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController____lazy_storage___textView) = 0;
  v5 = a3;

  result = (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLiOSEditAccessibilityDescriptionViewController.swift", 63, 2, 51, 0);
  __break(1u);
  return result;
}

- (void)loadView
{
  _TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController *v2;

  v2 = self;
  sub_1009FE424();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  NSString v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLiOSEditAccessibilityDescriptionViewController();
  v4 = v7.receiver;
  -[CRLiOSEditAccessibilityDescriptionViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "navigationItem", v7.receiver, v7.super_class);
  v6 = String._bridgeToObjectiveC()();
  objc_msgSend(v5, "setTitle:", v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLiOSEditAccessibilityDescriptionViewController();
  v4 = v6.receiver;
  -[CRLiOSEditAccessibilityDescriptionViewController viewDidAppear:](&v6, "viewDidAppear:", v3);
  LODWORD(v3) = UIAccessibilityLayoutChangedNotification;
  v5 = objc_msgSend(v4, "view", v6.receiver, v6.super_class);
  UIAccessibilityPostNotification(v3, v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController *v4;

  v4 = self;
  sub_1009FECF8(a3);

}

- (void)triggerClose
{
  -[CRLiOSEditAccessibilityDescriptionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController *result;

  v4 = a4;
  result = (_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSEditAccessibilityDescriptionViewController", 57, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController____lazy_storage___textView));
}

- (NSString)accessibilityDescriptionToSubmit
{
  _TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController *v2;
  id v3;
  id v4;
  NSString v5;

  v2 = self;
  v3 = sub_1009FF1C4();
  v4 = objc_msgSend(v3, "text");

  if (v4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);

  }
  else
  {

  }
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController *v8;
  int64_t v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1009FF998(v7);

  return v9;
}

@end
