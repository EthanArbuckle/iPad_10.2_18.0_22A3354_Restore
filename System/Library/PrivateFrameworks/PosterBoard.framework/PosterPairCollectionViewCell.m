@implementation PosterPairCollectionViewCell

- (void)layoutSubviews
{
  _TtC11PosterBoard28PosterPairCollectionViewCell *v2;

  v2 = self;
  sub_1CBB0E460();

}

- (void)prepareForReuse
{
  _TtC11PosterBoard28PosterPairCollectionViewCell *v2;

  v2 = self;
  sub_1CBB0E74C();

}

- (void)posterPairDidUpdateConfiguredProperties:(id)a3
{
  void (*v4)(void);
  id v5;
  _TtC11PosterBoard28PosterPairCollectionViewCell *v6;

  v4 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.super.super.super.isa) + 0x170);
  v5 = a3;
  v6 = self;
  v4();

}

- (void)posterPairDidUpdateLockPosterAppearance:(id)a3
{
  id v4;
  _TtC11PosterBoard28PosterPairCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB0EB28(2, 1);

}

- (void)posterPairDidUpdateLockPosterSnapshots:(id)a3
{
  id v4;
  _TtC11PosterBoard28PosterPairCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB0EB28(1, 1);

}

- (_TtC11PosterBoard28PosterPairCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard28PosterPairCollectionViewCell *)sub_1CBB0EF6C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard28PosterPairCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard28PosterPairCollectionViewCell *)sub_1CBB0F040(a3);
}

- (void).cxx_destruct
{
  sub_1CBAEE45C((uint64_t)self + OBJC_IVAR____TtC11PosterBoard28PosterPairCollectionViewCell_snapshotProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard28PosterPairCollectionViewCell_posterPair));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard28PosterPairCollectionViewCell_lockPosterSnapshotView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard28PosterPairCollectionViewCell_keyLineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11PosterBoard28PosterPairCollectionViewCell_lockPosterSnapshotImage));
}

@end
