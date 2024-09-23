@implementation LibraryRecommendationBannerViewController

- (_TtC16MusicApplication41LibraryRecommendationBannerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_90546C();
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[LibraryRecommendationBannerViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  sub_8FE1A0();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC16MusicApplication41LibraryRecommendationBannerViewController *v4;

  v4 = self;
  sub_8FE508(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC16MusicApplication41LibraryRecommendationBannerViewController *v4;

  v4 = self;
  sub_8FE6A0(a3);

}

- (void)viewDidLoad
{
  _TtC16MusicApplication41LibraryRecommendationBannerViewController *v2;

  v2 = self;
  sub_8FE9E0();

}

- (void)viewDidLayoutSubviews
{
  _TtC16MusicApplication41LibraryRecommendationBannerViewController *v2;

  v2 = self;
  sub_8FF3E4();

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
  -[LibraryRecommendationBannerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v8 = swift_allocObject(&unk_138CC50, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  v12[4] = sub_905DF4;
  v13 = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_20B50C;
  v12[3] = &block_descriptor_17_8;
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
  _TtC16MusicApplication41LibraryRecommendationBannerViewController *v6;

  v5 = a3;
  v6 = self;
  sub_8FF940(a3);

}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[LibraryRecommendationBannerViewController music_viewInheritedLayoutInsetsDidChange](&v3, "music_viewInheritedLayoutInsetsDidChange");
  sub_8FF6D8();

}

- (void)willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC16MusicApplication41LibraryRecommendationBannerViewController *v6;

  v5 = a3;
  v6 = self;
  sub_8FFB88(a3);

}

- (void)didMoveToParentViewController:(id)a3
{
  id v5;
  _TtC16MusicApplication41LibraryRecommendationBannerViewController *v6;

  v5 = a3;
  v6 = self;
  sub_8FFD44(a3);

}

- (UIView)accessibilityBannerView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_bannerView));
}

- (NSString)accessibilityHeadlineText
{
  return (NSString *)sub_9011D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_headlineText);
}

- (NSString)accessibilityTitleText
{
  return (NSString *)sub_9011D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_titleText);
}

- (NSString)accessibilitySubtitleText
{
  return (NSString *)sub_9011D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_subtitleText);
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(*(char **)((char *)&self->super.super.super.isa
                            + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_bannerView)
                 + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_badgeView);
  if (v2)
    v3 = sub_A32CDC(0, *(_QWORD *)(v2 + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
  else
    v3 = 0;
  return v3 & 1;
}

- (MPButton)accessibilityCloseButton
{
  _TtC16MusicApplication41LibraryRecommendationBannerViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_901DE8();

  return (MPButton *)v3;
}

- (_TtC16MusicApplication41LibraryRecommendationBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC16MusicApplication41LibraryRecommendationBannerViewController *result;

  v4 = a4;
  result = (_TtC16MusicApplication41LibraryRecommendationBannerViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.LibraryRecommendationBannerViewController", 58, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_recommendationContext);
  v4 = *(void **)&self->recommendationContext[OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_recommendationContext
                                            + 16];
  swift_bridgeObjectRelease();

  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController____lazy_storage___accountButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_pageHeaderContentView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_textDrawingCache));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication41LibraryRecommendationBannerViewController_contentOffsetObserver));
}

@end
