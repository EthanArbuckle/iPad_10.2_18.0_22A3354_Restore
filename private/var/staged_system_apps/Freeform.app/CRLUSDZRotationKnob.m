@implementation CRLUSDZRotationKnob

- (CRLImage)knobImage
{
  return (CRLImage *)(id)sub_100C19418();
}

- (id)createKnobRenderable
{
  _TtC8Freeform19CRLUSDZRotationKnob *v2;
  id v3;

  v2 = self;
  v3 = sub_100C18D74();

  return v3;
}

- (void)updateHitRegionPath
{
  _TtC8Freeform19CRLUSDZRotationKnob *v2;

  v2 = self;
  sub_1005C9ED8();

}

- (_TtC8Freeform19CRLUSDZRotationKnob)initWithType:(unint64_t)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  id v7;
  _TtC8Freeform19CRLUSDZRotationKnob *result;

  v7 = a7;
  result = (_TtC8Freeform19CRLUSDZRotationKnob *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLUSDZRotationKnob", 28, "init(type:position:radius:tag:on:)", 34, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
