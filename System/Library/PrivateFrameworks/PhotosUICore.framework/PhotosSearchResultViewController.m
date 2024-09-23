@implementation PhotosSearchResultViewController

- (void)viewDidLoad
{
  _TtC12PhotosUICoreP33_7CC344CCD6CCDC33802AE445894D7B6132PhotosSearchResultViewController *v2;

  v2 = self;
  sub_1A6E52278();

}

- (_TtC12PhotosUICoreP33_7CC344CCD6CCDC33802AE445894D7B6132PhotosSearchResultViewController)initWithConfiguration:(id)a3
{
  objc_super v6;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC12PhotosUICoreP33_7CC344CCD6CCDC33802AE445894D7B6132PhotosSearchResultViewController_searchDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PhotosSearchResultViewController();
  return -[PXPhotosUIViewController initWithConfiguration:](&v6, sel_initWithConfiguration_, a3);
}

- (_TtC12PhotosUICoreP33_7CC344CCD6CCDC33802AE445894D7B6132PhotosSearchResultViewController)initWithCoder:(id)a3
{
  objc_super v6;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC12PhotosUICoreP33_7CC344CCD6CCDC33802AE445894D7B6132PhotosSearchResultViewController_searchDelegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PhotosSearchResultViewController();
  return -[PXPhotosUIViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1A688D368((uint64_t)self+ OBJC_IVAR____TtC12PhotosUICoreP33_7CC344CCD6CCDC33802AE445894D7B6132PhotosSearchResultViewController_searchDelegate);
}

@end
