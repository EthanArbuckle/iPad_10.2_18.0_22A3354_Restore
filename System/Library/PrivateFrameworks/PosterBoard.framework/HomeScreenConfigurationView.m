@implementation HomeScreenConfigurationView

- (_TtC11PosterBoard27HomeScreenConfigurationView)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard27HomeScreenConfigurationView *)sub_1CBB08A38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard27HomeScreenConfigurationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1CBB0B7F0();
}

- (void)posterPairDidUpdateConfiguredProperties:(id)a3
{
  id v4;
  _TtC11PosterBoard27HomeScreenConfigurationView *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB08BE4((uint64_t)v4);

}

- (void)posterPairDidUpdateLockPosterAppearance:(id)a3
{
  id v4;
  _TtC11PosterBoard27HomeScreenConfigurationView *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB08D5C();

}

- (void)posterPairDidUpdateHomePosterAppearance:(id)a3
{
  id v4;
  _TtC11PosterBoard27HomeScreenConfigurationView *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB09204();

}

- (void)reloadLockPosterSnapshot
{
  _TtC11PosterBoard27HomeScreenConfigurationView *v2;

  v2 = self;
  sub_1CBB08D5C();

}

- (void)didSelectControl:(id)a3
{
  id v4;
  _TtC11PosterBoard27HomeScreenConfigurationView *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB0AFC0((uint64_t)v4);

}

- (void)toggleLegibilityBlur:(id)a3
{
  id v4;
  _TtC11PosterBoard27HomeScreenConfigurationView *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB0B8D8();

}

- (void).cxx_destruct
{
  sub_1CBAEE45C((uint64_t)self + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_posterPair));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_lockPosterPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_gradientPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_solidColorPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_homePosterPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_blurButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard27HomeScreenConfigurationView_homeScreenConfiguration));
}

@end
