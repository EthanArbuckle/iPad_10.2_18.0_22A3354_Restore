@implementation NearbyPeerPaymentVFXView

+ (BOOL)shouldObserveApplicationStateToPreventBackgroundGPUAccess
{
  return 0;
}

- (_TtC9PassKitUI24NearbyPeerPaymentVFXView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  _TtC9PassKitUI24NearbyPeerPaymentVFXView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    sub_19DE87AC8();
    v9 = (void *)sub_19DE87ABC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for NearbyPeerPaymentVFXView();
  v10 = -[NearbyPeerPaymentVFXView initWithFrame:options:](&v12, sel_initWithFrame_options_, v9, x, y, width, height);

  return v10;
}

- (_TtC9PassKitUI24NearbyPeerPaymentVFXView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NearbyPeerPaymentVFXView();
  return -[NearbyPeerPaymentVFXView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9PassKitUI24NearbyPeerPaymentVFXView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NearbyPeerPaymentVFXView();
  return -[NearbyPeerPaymentVFXView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
