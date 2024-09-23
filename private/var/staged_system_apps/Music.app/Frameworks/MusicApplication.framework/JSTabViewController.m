@implementation JSTabViewController

- (_TtC16MusicApplication19JSTabViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication19JSTabViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication19JSTabViewController____lazy_storage___accountButton) = 0;
  v4 = a3;

  result = (_TtC16MusicApplication19JSTabViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSTabViewController.swift", 42, 2, 26, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication19JSTabViewController *v2;

  v2 = self;
  JSTabViewController.viewDidLoad()();

}

- (_TtC16MusicApplication19JSTabViewController)init
{
  _TtC16MusicApplication19JSTabViewController *result;

  result = (_TtC16MusicApplication19JSTabViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSTabViewController", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19JSTabViewController____lazy_storage___accountButton));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.contentViewController[OBJC_IVAR____TtC16MusicApplication19JSTabViewController_identifier]);
}

@end
