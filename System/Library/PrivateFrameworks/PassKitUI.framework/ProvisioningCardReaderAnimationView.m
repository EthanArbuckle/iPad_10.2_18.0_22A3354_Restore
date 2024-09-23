@implementation ProvisioningCardReaderAnimationView

- (_TtC9PassKitUI35ProvisioningCardReaderAnimationView)initWithCoder:(id)a3
{
  id v4;
  _TtC9PassKitUI35ProvisioningCardReaderAnimationView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9PassKitUI35ProvisioningCardReaderAnimationView_state) = 7;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9PassKitUI35ProvisioningCardReaderAnimationView_animationTimer) = 0;
  v4 = a3;

  result = (_TtC9PassKitUI35ProvisioningCardReaderAnimationView *)sub_19DE888C0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  CATransform3D v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v2 = (char *)v8.receiver;
  -[ProvisioningCardReaderAnimationView layoutSubviews](&v8, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds);
  v4 = v3;
  v5 = *(void **)&v2[OBJC_IVAR____TtC9PassKitUI35ProvisioningCardReaderAnimationView_animationLayer];
  objc_msgSend(v5, sel_size);
  CATransform3DMakeScale(&v7, v4 / v6, v4 / v6, 1.0);
  objc_msgSend(v5, sel_setTransform_, &v7);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v5, sel_setFrame_);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC9PassKitUI35ProvisioningCardReaderAnimationView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  PKFloatRoundToPixel();
  v5 = v4;
  PKFloatRoundToPixel();
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC9PassKitUI35ProvisioningCardReaderAnimationView)initWithFrame:(CGRect)a3
{
  _TtC9PassKitUI35ProvisioningCardReaderAnimationView *result;

  result = (_TtC9PassKitUI35ProvisioningCardReaderAnimationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningCardReaderAnimationView_animationPackage));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningCardReaderAnimationView_animationLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningCardReaderAnimationView_stateController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9PassKitUI35ProvisioningCardReaderAnimationView_animationTimer));
}

@end
