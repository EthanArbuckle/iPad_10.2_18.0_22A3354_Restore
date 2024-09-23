@implementation RedoSearchContainerViewController

- (_TtC4Maps33RedoSearchContainerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100204238();
}

- (void)viewDidLoad
{
  _TtC4Maps33RedoSearchContainerViewController *v2;

  v2 = self;
  sub_100203798();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC4Maps33RedoSearchContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC4Maps33RedoSearchContainerViewController *result;

  v4 = a4;
  result = (_TtC4Maps33RedoSearchContainerViewController *)_swift_stdlib_reportUnimplementedInitializer("Maps.RedoSearchContainerViewController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000BF74(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC4Maps33RedoSearchContainerViewController_buttonActionHandler), *(_QWORD *)&self->state[OBJC_IVAR____TtC4Maps33RedoSearchContainerViewController_buttonActionHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps33RedoSearchContainerViewController_cardView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC4Maps33RedoSearchContainerViewController_constraints));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps33RedoSearchContainerViewController____lazy_storage___redoSearchButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps33RedoSearchContainerViewController____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps33RedoSearchContainerViewController____lazy_storage___activityIndicator));
}

- (void)redoSearchButtonClicked:(id)a3
{
  id v4;
  _TtC4Maps33RedoSearchContainerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100204314();

}

@end
