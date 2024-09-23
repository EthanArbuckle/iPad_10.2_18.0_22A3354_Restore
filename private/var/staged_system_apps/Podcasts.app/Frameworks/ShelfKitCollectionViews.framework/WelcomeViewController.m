@implementation WelcomeViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews21WelcomeViewController *v4;

  v4 = self;
  sub_20CF08(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC23ShelfKitCollectionViews21WelcomeViewController *v4;

  v4 = self;
  sub_20D078(a3);

}

- (void)viewDidLoad
{
  _TtC23ShelfKitCollectionViews21WelcomeViewController *v2;

  v2 = self;
  sub_20D28C();

}

- (NSArray)keyCommands
{
  uint64_t v3;
  uint64_t v4;
  _TtC23ShelfKitCollectionViews21WelcomeViewController *v5;
  NSString v6;
  id v7;
  uint64_t v8;
  Class isa;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_3D7980);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_2F11D0;
  v5 = self;
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend((id)objc_opt_self(UIKeyCommand), "keyCommandWithInput:modifierFlags:action:", v6, 0, "acknowledgeTerms");

  *(_QWORD *)(v4 + 32) = v7;
  specialized Array._endMutation()(v8);

  sub_E710(0, &qword_3D4C78, UIKeyCommand_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v4);
  return (NSArray *)isa;
}

- (void)acknowledgeTerms
{
  _TtC23ShelfKitCollectionViews21WelcomeViewController *v2;

  v2 = self;
  sub_20E108();

}

- (void)didTapStart:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews21WelcomeViewController *v5;

  v4 = a3;
  v5 = self;
  sub_211764();

}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (_TtC23ShelfKitCollectionViews21WelcomeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC23ShelfKitCollectionViews21WelcomeViewController *)WelcomeViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC23ShelfKitCollectionViews21WelcomeViewController)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews21WelcomeViewController *)WelcomeViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21WelcomeViewController_acknowledgementCompletionBlocks));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21WelcomeViewController_rootStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21WelcomeViewController_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21WelcomeViewController_tourButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21WelcomeViewController_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21WelcomeViewController____lazy_storage___continueButton));
}

@end
