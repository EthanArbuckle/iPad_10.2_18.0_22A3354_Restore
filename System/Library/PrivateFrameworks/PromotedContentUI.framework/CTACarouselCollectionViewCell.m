@implementation CTACarouselCollectionViewCell

- (void)prepareForReuse
{
  _TtC17PromotedContentUI29CTACarouselCollectionViewCell *v2;

  v2 = self;
  sub_1B12DDFA8();

}

- (void)didTapCTAButtonWithSender:(id)a3
{
  double v5;
  double v6;
  id v7;
  _TtC17PromotedContentUI29CTACarouselCollectionViewCell *v8;

  if (MEMORY[0x1B5E1B0F0]((char *)self + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_delegate, a2))
  {
    v5 = *(double *)((char *)&self->super.super.super.super.super.super.isa
                   + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_touchPoint);
    v6 = *(double *)((char *)&self->super.super.super.super.super._responderFlags
                   + OBJC_IVAR____TtC17PromotedContentUI26CarouselCollectionViewCell_touchPoint);
    v7 = a3;
    v8 = self;
    sub_1B1305060((uint64_t)v8, v5, v6);

    swift_unknownObjectRelease();
  }
}

- (_TtC17PromotedContentUI29CTACarouselCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC17PromotedContentUI29CTACarouselCollectionViewCell____lazy_storage___button) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CTACarouselCollectionViewCell();
  return -[CarouselCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC17PromotedContentUI29CTACarouselCollectionViewCell)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC17PromotedContentUI29CTACarouselCollectionViewCell____lazy_storage___button) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CTACarouselCollectionViewCell();
  return -[CarouselCollectionViewCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI29CTACarouselCollectionViewCell____lazy_storage___button));
}

@end
