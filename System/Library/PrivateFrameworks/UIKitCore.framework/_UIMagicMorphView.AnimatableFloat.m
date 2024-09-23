@implementation _UIMagicMorphView.AnimatableFloat

- (double)value
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _UIMagicMorphView.AnimatableFloat();
  -[UIViewFloatAnimatableProperty value](&v3, sel_value);
  return result;
}

- (void)setValue:(double)a3
{
  double v4;
  double v5;
  _TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat *v6;
  objc_super v7;

  v6 = self;
  -[_UIMagicMorphView.AnimatableFloat value](v6, sel_value);
  if (v4 == a3)
  {

  }
  else
  {
    -[_UIMagicMorphView.AnimatableFloat value](v6, sel_value);
    *((_BYTE *)&v6->super.super.super.super.isa
    + OBJC_IVAR____TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat_lastModelValueChangeWasPositive) = v5 < a3;
    v7.receiver = v6;
    v7.super_class = (Class)type metadata accessor for _UIMagicMorphView.AnimatableFloat();
    -[UIViewFloatAnimatableProperty setValue:](&v7, sel_setValue_, a3);

  }
}

- (_TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat)init
{
  _TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat *result;

  result = (_TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat)initWithValue:(id)a3
{
  _TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat *result;

  swift_unknownObjectRetain();
  result = (_TtCC5UIKit17_UIMagicMorphViewP33_02EA41E60575B66216FC0CFE82D0492B15AnimatableFloat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
