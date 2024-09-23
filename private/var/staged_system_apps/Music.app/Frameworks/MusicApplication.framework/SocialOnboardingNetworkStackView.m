@implementation SocialOnboardingNetworkStackView

- (_TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView *)sub_7D1AF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_7D2E34();
}

- (void)layoutSubviews
{
  _TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView *v2;

  v2 = self;
  sub_7D2210();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_7D2C24(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView_title]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView_artworks));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView_titleLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplicationP33_AE81844C619861A7126782E3B7A64D4232SocialOnboardingNetworkStackView_reusableArtworkComponents));
}

@end
