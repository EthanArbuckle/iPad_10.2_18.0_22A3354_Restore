@implementation NearbyPeerPaymentAppearancePreferencesFooterView

- (_TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView *result;

  v5 = OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView_label;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView *v2;

  v2 = self;
  sub_19D558070();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  uint64_t v4;
  _TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  v4 = qword_1EE494D40;
  v5 = self;
  if (v4 != -1)
    swift_once();
  objc_msgSend(*(id *)((char *)&v5->super.super.super.isa+ OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView_label), sel_sizeThatFits_, width - (*(double *)&qword_1EE4A8D30 + *(double *)&qword_1EE4A8D30), 1.79769313e308);
  v7 = v6;
  v9 = v8;
  if (qword_1EE494D38 != -1)
    swift_once();
  v10 = *(double *)&qword_1EE4A8D28;

  v11 = v9 + v10 + v10;
  v12 = v7;
  result.height = v11;
  result.width = v12;
  return result;
}

- (_TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView)initWithFrame:(CGRect)a3
{
  sub_19D5583A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesFooterView_label));
}

@end
