@implementation NearbyPeerPaymentFooterView

- (_TtC9PassKitUI27NearbyPeerPaymentFooterView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC9PassKitUI27NearbyPeerPaymentFooterView *result;

  v5 = OBJC_IVAR____TtC9PassKitUI27NearbyPeerPaymentFooterView_stateLabelsView;
  v6 = objc_allocWithZone((Class)type metadata accessor for NearbyPeerPaymentStateLabelsView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC9PassKitUI27NearbyPeerPaymentFooterView_buttonsView;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for NearbyPeerPaymentButtonsView(0)), sel_init);

  result = (_TtC9PassKitUI27NearbyPeerPaymentFooterView *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC9PassKitUI27NearbyPeerPaymentFooterView *v2;

  v2 = self;
  sub_19D7B8D60();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC9PassKitUI27NearbyPeerPaymentFooterView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_19D7B9090(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC9PassKitUI27NearbyPeerPaymentFooterView)initWithFrame:(CGRect)a3
{
  _TtC9PassKitUI27NearbyPeerPaymentFooterView *result;

  result = (_TtC9PassKitUI27NearbyPeerPaymentFooterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI27NearbyPeerPaymentFooterView_stateLabelsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI27NearbyPeerPaymentFooterView_buttonsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI27NearbyPeerPaymentFooterView_appearAsView));
}

@end
