@implementation UpsellBannerViewController

- (_TtC16MusicApplication26UpsellBannerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_44EA24();
}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication26UpsellBannerViewController *v2;

  v2 = self;
  sub_44C1EC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[24];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = (char *)v11.receiver;
  -[UpsellBannerViewController traitCollectionDidChange:](&v11, "traitCollectionDidChange:", v4);
  v6 = *(_QWORD *)&v5[OBJC_IVAR____TtC16MusicApplication26UpsellBannerViewController_textDrawingCache];
  v7 = objc_msgSend(v5, "traitCollection");
  objc_msgSend(v7, "displayScale");
  v9 = v8;

  swift_beginAccess(v6 + 16, v10, 1, 0);
  *(_QWORD *)(v6 + 16) = v9;
  sub_277264();

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  _TtC16MusicApplication26UpsellBannerViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_44C420((uint64_t)a3);
  swift_unknownObjectRelease(a3);

}

- (_TtC16MusicApplication26UpsellBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication26UpsellBannerViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication26UpsellBannerViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.UpsellBannerViewController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication26UpsellBannerViewController_bannerView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication26UpsellBannerViewController_textDrawingCache));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC16MusicApplication26UpsellBannerViewController_jsUpsellBanner);
}

@end
