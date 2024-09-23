@implementation SearchLandingViewController

- (_TtC16MusicApplication27SearchLandingViewController)init
{
  return (_TtC16MusicApplication27SearchLandingViewController *)sub_14B3A8();
}

- (_TtC16MusicApplication27SearchLandingViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication27SearchLandingViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27SearchLandingViewController____lazy_storage___accountButton) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27SearchLandingViewController_availabilityBinding) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication27SearchLandingViewController_landingDrivenViewController) = 0;
  v4 = a3;

  result = (_TtC16MusicApplication27SearchLandingViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/SearchLandingViewController.swift", 50, 2, 52, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication27SearchLandingViewController *v2;

  v2 = self;
  sub_14B8C4();

}

- (_TtC16MusicApplication27SearchLandingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication27SearchLandingViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication27SearchLandingViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SearchLandingViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchLandingViewController____lazy_storage___accountButton));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27SearchLandingViewController_availabilityBinding));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27SearchLandingViewController_landingDrivenViewController));
}

@end
