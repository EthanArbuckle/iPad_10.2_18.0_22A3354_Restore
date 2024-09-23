@implementation PKNearbyPeerPaymentEntryCollectionViewCell

- (PKNearbyPeerPaymentEntryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (PKNearbyPeerPaymentEntryCollectionViewCell *)NearbyPeerPaymentEntryCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKNearbyPeerPaymentEntryCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_19D8573E0();
}

- (void)layoutSubviews
{
  PKNearbyPeerPaymentEntryCollectionViewCell *v2;

  v2 = self;
  sub_19D8570EC();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  PKNearbyPeerPaymentEntryCollectionViewCell *v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___PKNearbyPeerPaymentEntryCollectionViewCell_titleLabel);
  v6 = self;
  v7 = objc_msgSend(v5, sel_font);
  if (v7)
  {
    v10 = v7;
    objc_msgSend(v7, sel_lineHeight);
    v12 = v11;

    v9 = fmin(width + 6.0 + v12, height);
    v8 = width;
  }
  else
  {
    __break(1u);
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentEntryCollectionViewCell_circleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentEntryCollectionViewCell_nearbySymbolView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentEntryCollectionViewCell_titleLabel));
}

@end
