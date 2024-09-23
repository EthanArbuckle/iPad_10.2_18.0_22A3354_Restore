@implementation JSInlineSocialUpsellViewController

- (_TtC16MusicApplication34JSInlineSocialUpsellViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC16MusicApplication34JSInlineSocialUpsellViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication34JSInlineSocialUpsellViewController_socialUpsellView) = 0;
  v5 = OBJC_IVAR____TtC16MusicApplication34JSInlineSocialUpsellViewController_artworkCachingReference;
  v6 = type metadata accessor for Artwork.CachingReference();
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)swift_allocObject(v6, 16, 7);
  v7 = OBJC_IVAR____TtC16MusicApplication34JSInlineSocialUpsellViewController_textDrawingCache;
  v8 = type metadata accessor for TextDrawing.Cache();
  swift_allocObject(v8, 120, 7);
  v9 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)TextDrawing.Cache.init()();

  result = (_TtC16MusicApplication34JSInlineSocialUpsellViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSInlineSocialUpsellViewController.swift", 57, 2, 25, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication34JSInlineSocialUpsellViewController *v2;

  v2 = self;
  JSInlineSocialUpsellViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication34JSInlineSocialUpsellViewController *v2;

  v2 = self;
  JSInlineSocialUpsellViewController.viewDidLayoutSubviews()();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain(a4);
  v7 = v14.receiver;
  -[JSInlineSocialUpsellViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = swift_allocObject(&unk_1382C20, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v12[4] = sub_7E1CA4;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_20B50C;
  v12[3] = &block_descriptor_16_8;
  v9 = _Block_copy(v12);
  v10 = v13;
  v11 = v7;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v9, 0, swift_release(v10).n128_f64[0]);
  _Block_release(v9);
  swift_unknownObjectRelease(a4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication34JSInlineSocialUpsellViewController *v6;
  _TtC16MusicApplication34JSInlineSocialUpsellViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  JSInlineSocialUpsellViewController.traitCollectionDidChange(_:)(v8);

}

- (_TtC16MusicApplication34JSInlineSocialUpsellViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication34JSInlineSocialUpsellViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication34JSInlineSocialUpsellViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSInlineSocialUpsellViewController", 51, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication34JSInlineSocialUpsellViewController_inlineSocialUpsell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication34JSInlineSocialUpsellViewController_socialUpsellView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication34JSInlineSocialUpsellViewController_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication34JSInlineSocialUpsellViewController_textDrawingCache));
}

@end
