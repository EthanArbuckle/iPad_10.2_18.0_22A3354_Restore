@implementation PlusMinusButton

- (_TtC13SleepHealthUI15PlusMinusButton)initWithCoder:(id)a3
{
  _TtC13SleepHealthUI15PlusMinusButton *result;

  result = (_TtC13SleepHealthUI15PlusMinusButton *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (BOOL)isEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PlusMinusButton();
  return -[PlusMinusButton isEnabled](&v3, sel_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  unsigned int v5;
  double v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PlusMinusButton();
  v4 = v7.receiver;
  -[PlusMinusButton setEnabled:](&v7, sel_setEnabled_, v3);
  v5 = objc_msgSend(v4, sel_isEnabled, v7.receiver, v7.super_class);
  v6 = 0.5;
  if (v5)
    v6 = 1.0;
  objc_msgSend(v4, sel_setAlpha_, v6);

}

- (_TtC13SleepHealthUI15PlusMinusButton)initWithFrame:(CGRect)a3
{
  _TtC13SleepHealthUI15PlusMinusButton *result;

  result = (_TtC13SleepHealthUI15PlusMinusButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
