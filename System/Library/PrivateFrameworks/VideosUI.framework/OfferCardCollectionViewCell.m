@implementation OfferCardCollectionViewCell

- (_TtC8VideosUI27OfferCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI27OfferCardCollectionViewCell *)sub_1DA08A6EC();
}

- (_TtC8VideosUI27OfferCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA08A778();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtC8VideosUI27OfferCardCollectionViewCell *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1DA08A804(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)vui_prepareForReuse
{
  _TtC8VideosUI27OfferCardCollectionViewCell *v2;

  v2 = self;
  sub_1DA08A91C();

}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27OfferCardCollectionViewCell_offerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27OfferCardCollectionViewCell_belowCardTextLabel));
}

- (void)rentalExpirationLabelNeedsRelayout:(id)a3
{
  id v4;
  _TtC8VideosUI27OfferCardCollectionViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1D9DD5240();

}

@end
