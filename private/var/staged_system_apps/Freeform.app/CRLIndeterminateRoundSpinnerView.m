@implementation CRLIndeterminateRoundSpinnerView

- (_TtC8Freeform32CRLIndeterminateRoundSpinnerView)initWithCoder:(id)a3
{
  id v4;
  _TtC8Freeform32CRLIndeterminateRoundSpinnerView *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC8Freeform32CRLIndeterminateRoundSpinnerView_wantsLinkViewSublayerTransformAdjustedHitTestFrame) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform32CRLIndeterminateRoundSpinnerView_backgroundLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform32CRLIndeterminateRoundSpinnerView_spinnerLayer) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform32CRLIndeterminateRoundSpinnerView_lineWidth) = (Class)0x4000000000000000;
  v4 = a3;

  result = (_TtC8Freeform32CRLIndeterminateRoundSpinnerView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100FAD6F0, "Freeform/CRLIndeterminateRoundSpinnerView.swift", 47, 2, 46, 0);
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC8Freeform32CRLIndeterminateRoundSpinnerView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_10085BAE0((uint64_t)a4, x, y);

  return v10;
}

- (_TtC8Freeform32CRLIndeterminateRoundSpinnerView)initWithFrame:(CGRect)a3
{
  _TtC8Freeform32CRLIndeterminateRoundSpinnerView *result;

  result = (_TtC8Freeform32CRLIndeterminateRoundSpinnerView *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLIndeterminateRoundSpinnerView", 41, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLIndeterminateRoundSpinnerView_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform32CRLIndeterminateRoundSpinnerView_spinnerLayer));
}

@end
