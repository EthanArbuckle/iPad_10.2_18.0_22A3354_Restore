@implementation NearbyPeerPaymentButtonsView

- (_TtC9PassKitUI28NearbyPeerPaymentButtonsView)init
{
  return (_TtC9PassKitUI28NearbyPeerPaymentButtonsView *)sub_19D44412C();
}

- (_TtC9PassKitUI28NearbyPeerPaymentButtonsView)initWithCoder:(id)a3
{
  return (_TtC9PassKitUI28NearbyPeerPaymentButtonsView *)sub_19D44429C(a3);
}

- (void)layoutSubviews
{
  _TtC9PassKitUI28NearbyPeerPaymentButtonsView *v2;

  v2 = self;
  sub_19D445240();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC9PassKitUI28NearbyPeerPaymentButtonsView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_19D4455FC();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)closeTapped
{
  sub_19D445998((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_closeAction);
}

- (void)primaryTapped
{
  sub_19D445998((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_primaryAction);
}

- (void)secondaryTapped
{
  sub_19D445998((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_secondaryAction);
}

- (_TtC9PassKitUI28NearbyPeerPaymentButtonsView)initWithFrame:(CGRect)a3
{
  _TtC9PassKitUI28NearbyPeerPaymentButtonsView *result;

  result = (_TtC9PassKitUI28NearbyPeerPaymentButtonsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19D1CE5EC((uint64_t)self + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_style, type metadata accessor for NearbyPeerPaymentButtonsView.Style);
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_closeAction));
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_primaryAction));
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_secondaryAction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_singleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_primaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI28NearbyPeerPaymentButtonsView_secondaryButton));
}

@end
