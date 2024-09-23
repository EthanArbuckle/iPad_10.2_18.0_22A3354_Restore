@implementation ContextualPreviewViewController

- (_TtC16MusicApplication31ContextualPreviewViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2A22F0();
}

- (void)viewDidLoad
{
  _TtC16MusicApplication31ContextualPreviewViewController *v2;

  v2 = self;
  sub_29F8F0();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication31ContextualPreviewViewController *v2;

  v2 = self;
  sub_2A028C();

}

- (_TtC16MusicApplication31ContextualPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication31ContextualPreviewViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication31ContextualPreviewViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.ContextualPreviewViewController", 48, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController_artworkCatalog));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController_artworkCachingReference));
  v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController_artworkCornerTreatment;
  v4 = type metadata accessor for UIView.Corner(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_9AFF4(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController_artworkPlaceholder), *(void **)&self->supportsNavigation[OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController_artworkPlaceholder], *(void **)&self->artworkCatalog[OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController_artworkPlaceholder+ 7], *(void **)&self->artworkCachingReference[OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController_artworkPlaceholder+ 7]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController__artworkAspectRatioConstraint));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController____lazy_storage___artworkComponent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController____lazy_storage___labelsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController____lazy_storage___chevronImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController____lazy_storage___detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication31ContextualPreviewViewController____lazy_storage___contributorLabel));
}

@end
