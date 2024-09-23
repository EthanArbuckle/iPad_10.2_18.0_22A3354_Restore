@implementation STEyeReliefMicaView

- (_TtC20ScreenTimeSettingsUI19STEyeReliefMicaView)initWithFrame:(CGRect)a3
{
  return (_TtC20ScreenTimeSettingsUI19STEyeReliefMicaView *)STEyeReliefMicaView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ScreenTimeSettingsUI19STEyeReliefMicaView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_219B93A28();
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STEyeReliefMicaView();
  v2 = v3.receiver;
  -[STEyeReliefMicaView layoutSubviews](&v3, sel_layoutSubviews);
  sub_219B93004();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;
  CGRect v6;
  CGRect v7;
  CGRect v8;

  v8.size.height = a3.height;
  v8.size.width = a3.width;
  *(_QWORD *)&v6.size.width = *(Class *)((char *)&self->super.super.super.super.isa
                                       + OBJC_IVAR____TtC20ScreenTimeSettingsUI19STEyeReliefMicaView_originalSize);
  v6.size.height = *(CGFloat *)((char *)&self->super.super.super._responderFlags
                              + OBJC_IVAR____TtC20ScreenTimeSettingsUI19STEyeReliefMicaView_originalSize);
  v6.origin.x = 0.0;
  v6.origin.y = 0.0;
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v7 = CGRectIntersection(v6, v8);
  width = v7.size.width;
  height = v7.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)makeCAPackage
{
  _TtC20ScreenTimeSettingsUI19STEyeReliefMicaView *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_219B9328C();

  return v3;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
