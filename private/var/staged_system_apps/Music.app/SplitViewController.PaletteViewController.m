@implementation SplitViewController.PaletteViewController

- (_TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100360460();
}

- (void)viewDidLoad
{
  _TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController *v2;

  v2 = self;
  sub_100358D34();

}

- (void)viewDidLayoutSubviews
{
  _TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController *v2;

  v2 = self;
  sub_10035900C();

}

- (void)viewSafeAreaInsetsDidChange
{
  _TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController *v2;

  v2 = self;
  sub_100359124();

}

- (void)viewLayoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SplitViewController.PaletteViewController();
  v2 = v3.receiver;
  -[SplitViewController.PaletteViewController viewLayoutMarginsDidChange](&v3, "viewLayoutMarginsDidChange");
  sub_10035A1B0();

}

- (int64_t)preferredStatusBarStyle
{
  _TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1003592C0();

  return v3;
}

- (_TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_10035A2A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"Music.PaletteViewController", 27);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController_contentNavigationController));
  sub_10004BA30(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController_onWillNavigateToViewController), *(_QWORD *)&self->contentNavigationController[OBJC_IVAR____TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController_onWillNavigateToViewController]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController_accessoryViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music19SplitViewControllerP33_848D7094BD77AF71EC18DACB023076F421PaletteViewController____lazy_storage___accessoryContainerView));
}

@end
