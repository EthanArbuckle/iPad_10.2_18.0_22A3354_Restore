@implementation JSGroupedTextListViewController

- (_TtC16MusicApplication31JSGroupedTextListViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _TtC16MusicApplication31JSGroupedTextListViewController *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication31JSGroupedTextListViewController_verticalStackItemPrefersTopHairline) = 1;
  v5 = OBJC_IVAR____TtC16MusicApplication31JSGroupedTextListViewController_textDrawingCache;
  v6 = type metadata accessor for TextDrawing.Cache();
  swift_allocObject(v6, 120, 7);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)TextDrawing.Cache.init()();
  v8 = OBJC_IVAR____TtC16MusicApplication31JSGroupedTextListViewController_textListView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for GroupedTextListView()), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC16MusicApplication31JSGroupedTextListViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSGroupedTextListViewController.swift", 54, 2, 22, 0);
  __break(1u);
  return result;
}

- (void)viewDidLayoutSubviews
{
  char *v2;
  id v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for JSGroupedTextListViewController();
  v2 = (char *)v6.receiver;
  -[JSGroupedTextListViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  v3 = *(id *)&v2[OBJC_IVAR____TtC16MusicApplication31JSGroupedTextListViewController_textListView];
  v4 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:");

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLoad
{
  _TtC16MusicApplication31JSGroupedTextListViewController *v2;

  v2 = self;
  sub_50F55C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication31JSGroupedTextListViewController *v6;

  v5 = a3;
  v6 = self;
  sub_50F9A4((uint64_t)a3);

}

- (_TtC16MusicApplication31JSGroupedTextListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication31JSGroupedTextListViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication31JSGroupedTextListViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSGroupedTextListViewController", 48, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31JSGroupedTextListViewController_viewModel));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication31JSGroupedTextListViewController_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31JSGroupedTextListViewController_textListView));
}

@end
