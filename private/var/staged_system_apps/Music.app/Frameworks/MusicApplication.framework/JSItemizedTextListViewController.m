@implementation JSItemizedTextListViewController

- (_TtC16MusicApplication32JSItemizedTextListViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication32JSItemizedTextListViewController *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication32JSItemizedTextListViewController_verticalStackItemPrefersTopHairline) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication32JSItemizedTextListViewController_textListView) = 0;
  v4 = a3;

  result = (_TtC16MusicApplication32JSItemizedTextListViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSItemizedTextListViewController.swift", 55, 2, 22, 0);
  __break(1u);
  return result;
}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication32JSItemizedTextListViewController *v2;

  v2 = self;
  sub_1D9130();

}

- (void)viewDidLoad
{
  _TtC16MusicApplication32JSItemizedTextListViewController *v2;

  v2 = self;
  sub_1D9200();

}

- (_TtC16MusicApplication32JSItemizedTextListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication32JSItemizedTextListViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication32JSItemizedTextListViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSItemizedTextListViewController", 49, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32JSItemizedTextListViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32JSItemizedTextListViewController_textListView));
}

@end
