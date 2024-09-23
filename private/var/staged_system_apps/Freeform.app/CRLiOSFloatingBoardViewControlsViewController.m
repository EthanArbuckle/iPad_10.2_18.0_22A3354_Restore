@implementation CRLiOSFloatingBoardViewControlsViewController

- (_TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1008610F4();
}

- (void)loadView
{
  _TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_10085EBA0();
  -[CRLiOSFloatingBoardViewControlsViewController setView:](v2, "setView:", v3);

}

- (void)viewDidLoad
{
  _TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController *v2;

  v2 = self;
  sub_1008602C8();

}

- (_TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController *result;

  v4 = a4;
  result = (_TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLiOSFloatingBoardViewControlsViewController", 54, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1004CBB0C((uint64_t)self + OBJC_IVAR____TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController_stackViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController_stackViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController____lazy_storage___gridButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController____lazy_storage___connectorButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform45CRLiOSFloatingBoardViewControlsViewController____lazy_storage___separator));
}

@end
