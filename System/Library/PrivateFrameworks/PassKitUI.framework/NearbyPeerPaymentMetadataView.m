@implementation NearbyPeerPaymentMetadataView

- (_TtC9PassKitUI29NearbyPeerPaymentMetadataView)init
{
  uint64_t v3;
  id v4;
  _TtC9PassKitUI29NearbyPeerPaymentMetadataView *v5;
  uint64_t v6;
  _TtC9PassKitUI29NearbyPeerPaymentMetadataView *v7;
  objc_super v9;

  v3 = OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentMetadataView_memoLabel;
  v4 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  v6 = OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentMetadataView_senderMetadataView;
  *(Class *)((char *)&v5->super.super.super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for NearbyPeerPaymentSenderMetadataView()), sel_init);

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for NearbyPeerPaymentMetadataView();
  v7 = -[NearbyPeerPaymentMetadataView initWithFrame:](&v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_19D342FB4();

  return v7;
}

- (_TtC9PassKitUI29NearbyPeerPaymentMetadataView)initWithCoder:(id)a3
{
  return (_TtC9PassKitUI29NearbyPeerPaymentMetadataView *)sub_19D342EC8(a3);
}

- (void)layoutSubviews
{
  _TtC9PassKitUI29NearbyPeerPaymentMetadataView *v2;

  v2 = self;
  sub_19D343080();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC9PassKitUI29NearbyPeerPaymentMetadataView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_19D3433E0(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC9PassKitUI29NearbyPeerPaymentMetadataView)initWithFrame:(CGRect)a3
{
  sub_19D344294();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentMetadataView_memoLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI29NearbyPeerPaymentMetadataView_senderMetadataView));
}

@end
