@implementation JSBadgingViewController

- (_TtC16MusicApplication23JSBadgingViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC16MusicApplication23JSBadgingViewController *result;

  v5 = OBJC_IVAR____TtC16MusicApplication23JSBadgingViewController_badgingView;
  v6 = objc_allocWithZone((Class)type metadata accessor for BadgingView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC16MusicApplication23JSBadgingViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSBadgingViewController.swift", 46, 2, 23, 0);
  __break(1u);
  return result;
}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication23JSBadgingViewController *v2;

  v2 = self;
  sub_9EEFC();

}

- (void)viewDidLoad
{
  _TtC16MusicApplication23JSBadgingViewController *v2;

  v2 = self;
  sub_9F054();

}

- (_TtC16MusicApplication23JSBadgingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication23JSBadgingViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication23JSBadgingViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSBadgingViewController", 40, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23JSBadgingViewController_badgingViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication23JSBadgingViewController_badgingView));
}

@end
