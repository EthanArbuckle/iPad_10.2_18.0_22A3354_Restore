@implementation SecureLayerView

- (_TtC20UniversalControl_iOSP33_1C975297EB0024E2AA69CEAAE8602FEB15SecureLayerView)initWithFrame:(CGRect)a3
{
  return (_TtC20UniversalControl_iOSP33_1C975297EB0024E2AA69CEAAE8602FEB15SecureLayerView *)sub_100006D50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20UniversalControl_iOSP33_1C975297EB0024E2AA69CEAAE8602FEB15SecureLayerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100006DE0();
}

- (void)layoutIfNeeded
{
  _TtC20UniversalControl_iOSP33_1C975297EB0024E2AA69CEAAE8602FEB15SecureLayerView *v2;

  v2 = self;
  sub_1000066D4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20UniversalControl_iOSP33_1C975297EB0024E2AA69CEAAE8602FEB15SecureLayerView_secureLayer));
}

@end
