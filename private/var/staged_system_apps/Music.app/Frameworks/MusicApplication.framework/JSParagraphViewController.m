@implementation JSParagraphViewController

- (_TtC16MusicApplication25JSParagraphViewController)initWithCoder:(id)a3
{
  _OWORD *v4;
  __int128 v5;
  id v6;
  _TtC16MusicApplication25JSParagraphViewController *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC16MusicApplication25JSParagraphViewController_additionalContentInsets);
  v5 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
  *v4 = *(_OWORD *)&UIEdgeInsetsZero.top;
  v4[1] = v5;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication25JSParagraphViewController____lazy_storage___paragraphView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication25JSParagraphViewController_metricsReporter) = 0;
  v6 = a3;

  result = (_TtC16MusicApplication25JSParagraphViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSParagraphViewController.swift", 48, 2, 26, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication25JSParagraphViewController *v2;

  v2 = self;
  sub_808278();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication25JSParagraphViewController *v2;

  v2 = self;
  sub_8087F8();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC16MusicApplication25JSParagraphViewController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_8089CC(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for JSParagraphViewController();
  v2 = v3.receiver;
  -[JSParagraphViewController music_viewInheritedLayoutInsetsDidChange](&v3, "music_viewInheritedLayoutInsetsDidChange");
  sub_808F34();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication25JSParagraphViewController *v6;

  v5 = a3;
  v6 = self;
  sub_808CF8(a3);

}

- (_TtC16MusicApplication25JSParagraphViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication25JSParagraphViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication25JSParagraphViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSParagraphViewController", 42, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25JSParagraphViewController_paragraphViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication25JSParagraphViewController____lazy_storage___paragraphView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication25JSParagraphViewController_metricsReporter));
}

@end
