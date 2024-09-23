@implementation CarouselCollectionViewCell

- (_TtC17PromotedContentUI26CarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC17PromotedContentUI26CarouselCollectionViewCell *)sub_1B12DCAE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17PromotedContentUI26CarouselCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B12DD344();
}

- (void)prepareForReuse
{
  _TtC17PromotedContentUI26CarouselCollectionViewCell *v2;

  v2 = self;
  sub_1B12DCD64();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC17PromotedContentUI26CarouselCollectionViewCell *v8;

  sub_1B12CFA9C(0, (unint64_t *)&unk_1ED386660);
  sub_1B12DD2E0();
  v6 = sub_1B1372D30();
  v7 = a4;
  v8 = self;
  sub_1B12DCEE0(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_assetToken));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell____lazy_storage___assetImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell____lazy_storage___captionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell____lazy_storage___captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell____lazy_storage___blurImageView));
  sub_1B12DB4F4((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_delegate);
}

@end
