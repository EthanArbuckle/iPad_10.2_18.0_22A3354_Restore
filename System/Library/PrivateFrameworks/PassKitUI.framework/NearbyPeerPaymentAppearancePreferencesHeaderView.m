@implementation NearbyPeerPaymentAppearancePreferencesHeaderView

- (_TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_19D55F344();
}

- (void)layoutSubviews
{
  _TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView *v2;

  v2 = self;
  sub_19D55797C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  _TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView_titleLabel);
  v6 = self;
  objc_msgSend(v5, sel_sizeThatFits_, width, height);
  v8 = v7;
  if (qword_1EE494D28 != -1)
    swift_once();
  v9 = *(double *)&qword_1EE4A8D18;
  if (qword_1EE494D20 != -1)
    swift_once();
  v10 = v8 + v9 + v9;
  v11 = *(double *)&qword_1EE4A8D10;

  if (v10 > v11)
    v12 = v10;
  else
    v12 = v11;
  v13 = width;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)closeTapped
{
  void (*v2)(uint64_t);
  uint64_t v3;
  _TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView *v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView_closeAction);
  if (v2)
  {
    v4 = self;
    v3 = sub_19D1A9EC4((uint64_t)v2);
    v2(v3);
    sub_19D1A9F60((uint64_t)v2);

  }
}

- (_TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView)initWithFrame:(CGRect)a3
{
  sub_19D5583A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView_closeButton));
  sub_19D1A9F60(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9PassKitUIP33_A2EF9233F7BE1A078A97F131412991B548NearbyPeerPaymentAppearancePreferencesHeaderView_closeAction));
}

@end
