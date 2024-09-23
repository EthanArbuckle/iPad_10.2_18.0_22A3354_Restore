@implementation JSBiographyViewController

- (_TtC16MusicApplication25JSBiographyViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC16MusicApplication25JSBiographyViewController *result;

  v5 = OBJC_IVAR____TtC16MusicApplication25JSBiographyViewController_textDrawingCache;
  v6 = type metadata accessor for TextDrawing.Cache();
  swift_allocObject(v6, 120, 7);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)TextDrawing.Cache.init()();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication25JSBiographyViewController____lazy_storage___biographyView) = 0;

  result = (_TtC16MusicApplication25JSBiographyViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSBiographyViewController.swift", 48, 2, 24, 0);
  __break(1u);
  return result;
}

- (void)viewDidLayoutSubviews
{
  id v2;
  id v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for JSBiographyViewController();
  v2 = v6.receiver;
  -[JSBiographyViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  v3 = sub_73FDB4();
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
  _TtC16MusicApplication25JSBiographyViewController *v2;

  v2 = self;
  sub_73F758();

}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JSBiographyViewController();
  v2 = v3.receiver;
  -[JSBiographyViewController music_viewInheritedLayoutInsetsDidChange](&v3, "music_viewInheritedLayoutInsetsDidChange");
  sub_740074();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication25JSBiographyViewController *v6;

  v5 = a3;
  v6 = self;
  sub_73F9A0(a3);

}

- (_TtC16MusicApplication25JSBiographyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication25JSBiographyViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication25JSBiographyViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSBiographyViewController", 42, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25JSBiographyViewController_viewModel));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25JSBiographyViewController_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25JSBiographyViewController____lazy_storage___biographyView));
}

@end
