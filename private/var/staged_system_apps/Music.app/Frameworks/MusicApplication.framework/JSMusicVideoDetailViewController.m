@implementation JSMusicVideoDetailViewController

- (_TtC16MusicApplication32JSMusicVideoDetailViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication32JSMusicVideoDetailViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication32JSMusicVideoDetailViewController_detailHeaderLockupView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication32JSMusicVideoDetailViewController_contentItem) = 0;
  v4 = a3;

  result = (_TtC16MusicApplication32JSMusicVideoDetailViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSMusicVideoDetailViewController.swift", 55, 2, 29, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication32JSMusicVideoDetailViewController *v2;

  v2 = self;
  sub_10C574();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication32JSMusicVideoDetailViewController *v2;

  v2 = self;
  sub_10CC88();

}

- (_TtC16MusicApplication32JSMusicVideoDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication32JSMusicVideoDetailViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication32JSMusicVideoDetailViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSMusicVideoDetailViewController", 49, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32JSMusicVideoDetailViewController_musicVideoViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32JSMusicVideoDetailViewController_detailHeaderLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32JSMusicVideoDetailViewController_contentItem));
}

@end
