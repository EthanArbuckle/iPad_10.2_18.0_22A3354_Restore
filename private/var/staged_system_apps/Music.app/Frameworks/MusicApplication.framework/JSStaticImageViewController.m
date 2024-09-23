@implementation JSStaticImageViewController

- (_TtC16MusicApplication27JSStaticImageViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_90D53C();
}

- (NSString)playActivityFeatureName
{
  void (*v2)(void);
  _TtC16MusicApplication27JSStaticImageViewController *v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;

  v2 = *(void (**)(void))&stru_68.segname[(**(_QWORD **)((char *)&self->super.super.super.isa
                                                       + OBJC_IVAR____TtC16MusicApplication27JSStaticImageViewController_staticImageViewModel) & swift_isaMask)
                                        + 8];
  v3 = self;
  v2();
  v5 = v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  return (NSString *)v6;
}

- (NSData)playActivityRecommendationData
{
  uint64_t (*v2)(void);
  _TtC16MusicApplication27JSStaticImageViewController *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  Class isa;

  v2 = *(uint64_t (**)(void))((char *)&stru_68.offset
                           + (**(_QWORD **)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC16MusicApplication27JSStaticImageViewController_staticImageViewModel) & swift_isaMask));
  v3 = self;
  v4 = v2();
  v6 = v5;

  if (v6 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_50C4C(v4, v6);
  }
  return (NSData *)isa;
}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication27JSStaticImageViewController *v2;

  v2 = self;
  sub_90C570();

}

- (void)viewDidLoad
{
  _TtC16MusicApplication27JSStaticImageViewController *v2;

  v2 = self;
  sub_90C71C();

}

- (_TtC16MusicApplication27JSStaticImageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication27JSStaticImageViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication27JSStaticImageViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSStaticImageViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSStaticImageViewController_staticImageViewModel));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication27JSStaticImageViewController_tapGestureRecognizerHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSStaticImageViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSStaticImageViewController_artworkCatalog));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSStaticImageViewController_image));
}

@end
