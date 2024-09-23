@implementation RecommendationBannerView

- (_TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView *)sub_9013D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_905A48();
}

- (void)layoutSubviews
{
  _TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView *v2;

  v2 = self;
  sub_902244();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView *v6;

  v5 = a3;
  v6 = self;
  sub_902950((uint64_t)a3);

}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_lockupImageArtworkCatalog));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_artworkPlaceholder);
  v4 = *(void **)&self->headlineText[OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_artworkPlaceholder];
  v5 = *(void **)&self->headlineText[OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_artworkPlaceholder
                                   + 8];

  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_closeButtonHandler), *(_QWORD *)&self->headlineText[OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_closeButtonHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_didSelectHandler), *(_QWORD *)&self->headlineText[OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_didSelectHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_artworkCachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_textStackView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_badgeView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_artworkComponent));
  v6 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_textComponents);
  v7 = *(_QWORD *)&self->headlineText[OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_textComponents];
  v8 = *(_QWORD *)&self->headlineText[OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_textComponents
                                    + 8];
  swift_bridgeObjectRelease();
  swift_release(v8);
  swift_release(v7);
  swift_release(v6);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_tapGestureRecognizerHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_shadowBackdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView____lazy_storage___appleMusicImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView____lazy_storage___closeButton));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView_measurementTextStackViewComponent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_0F58D309CAC2DB05AEBCAFE562C241DB24RecommendationBannerView____lazy_storage___measurementTextStackView));
}

@end
