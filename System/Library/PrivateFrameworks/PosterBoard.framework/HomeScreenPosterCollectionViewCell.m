@implementation HomeScreenPosterCollectionViewCell

- (void)posterPairDidUpdateHomePosterAppearance:(id)a3
{
  id v4;
  _TtC11PosterBoard34HomeScreenPosterCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB3A484(1);

}

- (void)layoutSubviews
{
  _TtC11PosterBoard34HomeScreenPosterCollectionViewCell *v2;

  v2 = self;
  sub_1CBB399D8();

}

- (void)prepareForReuse
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HomeScreenPosterCollectionViewCell();
  v2 = (char *)v3.receiver;
  -[PosterPairCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_homePosterSnapshotView], sel_setImage_, 0, v3.receiver, v3.super_class);

}

- (_TtC11PosterBoard34HomeScreenPosterCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard34HomeScreenPosterCollectionViewCell *)sub_1CBB3AC48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard34HomeScreenPosterCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard34HomeScreenPosterCollectionViewCell *)sub_1CBB3ADEC(a3);
}

- (void).cxx_destruct
{
  sub_1CBAEE45C((uint64_t)self + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_homeScreenIconContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell____lazy_storage___lockPosterPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_lockPosterBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_gradientPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_solidColorPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell____lazy_storage___homePosterPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_homePosterSnapshotView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_homePosterBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard34HomeScreenPosterCollectionViewCell_homeScreenConfiguration));
}

@end
