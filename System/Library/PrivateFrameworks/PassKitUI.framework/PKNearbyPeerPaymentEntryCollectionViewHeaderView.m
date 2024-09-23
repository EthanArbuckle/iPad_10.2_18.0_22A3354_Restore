@implementation PKNearbyPeerPaymentEntryCollectionViewHeaderView

- (PKNearbyPeerPaymentEntryCollectionViewHeaderView)initWithFrame:(CGRect)a3
{
  return (PKNearbyPeerPaymentEntryCollectionViewHeaderView *)NearbyEntryCollectionViewHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKNearbyPeerPaymentEntryCollectionViewHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  PKNearbyPeerPaymentEntryCollectionViewHeaderView *result;

  v5 = OBJC_IVAR___PKNearbyPeerPaymentEntryCollectionViewHeaderView_lineView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (PKNearbyPeerPaymentEntryCollectionViewHeaderView *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double Width;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NearbyEntryCollectionViewHeaderView();
  v2 = (char *)v8.receiver;
  -[PKNearbyPeerPaymentEntryCollectionViewHeaderView layoutSubviews](&v8, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v8.receiver, v8.super_class);
  v4 = v3;
  objc_msgSend(v2, sel_bounds);
  v6 = v5;
  objc_msgSend(v2, sel_bounds);
  Width = CGRectGetWidth(v9);
  objc_msgSend(*(id *)&v2[OBJC_IVAR___PKNearbyPeerPaymentEntryCollectionViewHeaderView_lineView], sel_setFrame_, v4, v6, Width, PKUIPixelLength());

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  v4 = PKUIPixelLength();
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PKNearbyPeerPaymentEntryCollectionViewHeaderView_lineView));
}

@end
