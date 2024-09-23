@implementation MCDSharePlayTogetherSessionViewController

- (_TtC16MusicApplication41MCDSharePlayTogetherSessionViewController)initWithViewModel:(id)a3
{
  id v3;
  char *v4;

  v3 = a3;
  v4 = sub_387D00((uint64_t)v3);

  return (_TtC16MusicApplication41MCDSharePlayTogetherSessionViewController *)v4;
}

- (_TtC16MusicApplication41MCDSharePlayTogetherSessionViewController)initWithCoder:(id)a3
{
  _TtC16MusicApplication41MCDSharePlayTogetherSessionViewController *result;

  result = (_TtC16MusicApplication41MCDSharePlayTogetherSessionViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/MCDSharePlayTogetherSessionViewController.swift", 64, 2, 33, 0);
  __break(1u);
  return result;
}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication41MCDSharePlayTogetherSessionViewController *v2;

  v2 = self;
  sub_387668();

}

- (void)dismissQRCode
{
  void *v2;
  _TtC16MusicApplication41MCDSharePlayTogetherSessionViewController *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication41MCDSharePlayTogetherSessionViewController_contentViewController);
  v3 = self;
  v4 = v2;
  sub_A1E134();

}

- (_TtC16MusicApplication41MCDSharePlayTogetherSessionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication41MCDSharePlayTogetherSessionViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication41MCDSharePlayTogetherSessionViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.MCDSharePlayTogetherSessionViewController", 58, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication41MCDSharePlayTogetherSessionViewController_contentViewController));
}

@end
