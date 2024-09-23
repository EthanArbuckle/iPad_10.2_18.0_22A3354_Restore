@implementation NearbyPeerPaymentSenderMetadataView

- (_TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView)init
{
  return (_TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView *)sub_19D3439A4();
}

- (_TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_19D344388();
}

- (void)layoutSubviews
{
  _TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView *v2;

  v2 = self;
  sub_19D343DA8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  v4 = self;
  sub_19D3440DC(width);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView)initWithFrame:(CGRect)a3
{
  sub_19D344294();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView_avatarController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_88C4D7CE4C235A7E18F3A7D5C4D275AF35NearbyPeerPaymentSenderMetadataView_image));
}

@end
