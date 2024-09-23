@implementation FMCardContainerViewController

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy29FMCardContainerViewController *v6;

  v5 = a3;
  v6 = self;
  sub_10000AC4C((uint64_t)a3);

}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMCardContainerViewController();
  v2 = v3.receiver;
  -[FMCardContainerViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(v2, "setDefinesPresentationContext:", 1, v3.receiver, v3.super_class);
  sub_100028AEC();
  sub_10002BB68();
  sub_100018FD0();

}

- (void)viewDidLayoutSubviews
{
  _TtC6FindMy29FMCardContainerViewController *v2;

  v2 = self;
  sub_10000AD54();

}

- (UITraitCollection)traitCollection
{
  _TtC6FindMy29FMCardContainerViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_10004DEE8();

  return (UITraitCollection *)v3;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_contentViewController));
}

- (_TtC6FindMy29FMCardContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC6FindMy29FMCardContainerViewController *)sub_10000DAFC(v5, v7, a4);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC6FindMy29FMCardContainerViewController *v4;

  v4 = self;
  sub_100009A44(a3, (SEL *)&selRef_viewWillAppear_);

}

- (void)loadView
{
  _TtC6FindMy29FMCardContainerViewController *v2;

  v2 = self;
  sub_100008174();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC6FindMy29FMCardContainerViewController *v4;

  v4 = self;
  sub_100009A44(a3, (SEL *)&selRef_viewWillDisappear_);

}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC6FindMy29FMCardContainerViewController *v11;
  UITraitCollection *v12;
  id v13;
  objc_class *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = -[FMCardContainerViewController traitCollection](v11, "traitCollection");
  v13 = -[UITraitCollection horizontalSizeClass](v12, "horizontalSizeClass");

  if (v13 == (id)1)
    v14 = (objc_class *)type metadata accessor for FMCardPresentedCompactTransition();
  else
    v14 = (objc_class *)type metadata accessor for FMCardPresentedRegularTransition();
  v15 = objc_msgSend(objc_allocWithZone(v14), "init");

  return v15;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC6FindMy29FMCardContainerViewController *v5;
  UITraitCollection *v6;
  id v7;
  objc_class *v8;
  id v9;

  v4 = a3;
  v5 = self;
  v6 = -[FMCardContainerViewController traitCollection](v5, "traitCollection");
  v7 = -[UITraitCollection horizontalSizeClass](v6, "horizontalSizeClass");

  if (v7 == (id)1)
    v8 = (objc_class *)type metadata accessor for FMCardDismissedCompactTransition();
  else
    v8 = (objc_class *)type metadata accessor for FMCardDismissedRegularTransition();
  v9 = objc_msgSend(objc_allocWithZone(v8), "init");

  return v9;
}

- (void)handleCloseAction
{
  _TtC6FindMy29FMCardContainerViewController *v2;

  v2 = self;
  sub_1001FDE20();

}

- (void)unwindToBaseAction
{
  _TtC6FindMy29FMCardContainerViewController *v2;

  v2 = self;
  sub_1001FDF9C();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC6FindMy29FMCardContainerViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1001FF594(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (BOOL)expandCard
{
  _TtC6FindMy29FMCardContainerViewController *v2;

  v2 = self;
  sub_1001FE688();

  return 1;
}

- (BOOL)collapseCard
{
  _TtC6FindMy29FMCardContainerViewController *v2;

  v2 = self;
  sub_1001FE6FC();

  return 1;
}

- (_TtC6FindMy29FMCardContainerViewController)initWithCoder:(id)a3
{
  return (_TtC6FindMy29FMCardContainerViewController *)sub_1001FF7BC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_tabBar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_tabBarTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_darkenerBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_cardShadow));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_cardContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_passthroughView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_otherGesture));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_compactConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_regularConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_compactCardTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_regularCardTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy29FMCardContainerViewController_contentViewController));
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC6FindMy29FMCardContainerViewController *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10046BF44(v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC6FindMy29FMCardContainerViewController *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10046C0D0(v7);

  return v9 & 1;
}

- (void)handlePanGestureWithSender:(id)a3
{
  id v4;
  _TtC6FindMy29FMCardContainerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10046B1D4(v4);

}

@end
