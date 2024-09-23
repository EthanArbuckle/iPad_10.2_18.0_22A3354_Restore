@implementation NearbyPeerPaymentStateLabelsView

- (_TtC9PassKitUI32NearbyPeerPaymentStateLabelsView)init
{
  uint64_t v3;
  id v4;
  _TtC9PassKitUI32NearbyPeerPaymentStateLabelsView *v5;
  uint64_t v6;
  _TtC9PassKitUI32NearbyPeerPaymentStateLabelsView *v7;
  objc_super v9;

  v3 = OBJC_IVAR____TtC9PassKitUI32NearbyPeerPaymentStateLabelsView_titleLabel;
  v4 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  v6 = OBJC_IVAR____TtC9PassKitUI32NearbyPeerPaymentStateLabelsView_subtitleLabel;
  *(Class *)((char *)&v5->super.super.super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for NearbyPeerPaymentStateLabelsView();
  v7 = -[NearbyPeerPaymentStateLabelsView initWithFrame:](&v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_19D85E318();

  return v7;
}

- (_TtC9PassKitUI32NearbyPeerPaymentStateLabelsView)initWithCoder:(id)a3
{
  return (_TtC9PassKitUI32NearbyPeerPaymentStateLabelsView *)sub_19D85E228(a3);
}

- (void)layoutSubviews
{
  _TtC9PassKitUI32NearbyPeerPaymentStateLabelsView *v2;

  v2 = self;
  sub_19D85E558();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  _TtC9PassKitUI32NearbyPeerPaymentStateLabelsView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUI32NearbyPeerPaymentStateLabelsView_titleLabel);
  v6 = self;
  objc_msgSend(v5, sel_sizeThatFits_, width, height);
  v8 = v7;
  objc_msgSend(*(id *)((char *)&v6->super.super.super.isa+ OBJC_IVAR____TtC9PassKitUI32NearbyPeerPaymentStateLabelsView_subtitleLabel), sel_sizeThatFits_, width, height);
  v10 = v9;
  if (qword_1EE494F58 != -1)
    swift_once();
  v11 = v8 + v10;
  v12 = *(double *)&qword_1EE4BA1A0;

  v13 = v11 + v12;
  v14 = width;
  result.height = v13;
  result.width = v14;
  return result;
}

- (_TtC9PassKitUI32NearbyPeerPaymentStateLabelsView)initWithFrame:(CGRect)a3
{
  _TtC9PassKitUI32NearbyPeerPaymentStateLabelsView *result;

  result = (_TtC9PassKitUI32NearbyPeerPaymentStateLabelsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI32NearbyPeerPaymentStateLabelsView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI32NearbyPeerPaymentStateLabelsView_subtitleLabel));
}

@end
