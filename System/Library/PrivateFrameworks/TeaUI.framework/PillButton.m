@implementation PillButton

- (void)layoutSubviews
{
  _TtC5TeaUI10PillButton *v2;

  v2 = self;
  sub_1B13C1A18();

}

- (_TtC5TeaUI10PillButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI10PillButton *)PillButton.init(frame:)();
}

+ (Class)layerClass
{
  sub_1B145CF64();
  return (Class)swift_getObjCClassFromMetadata();
}

- (UIColor)backgroundColor
{
  _TtC5TeaUI10PillButton *v2;
  id v3;

  v2 = self;
  v3 = sub_1B15215CC();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC5TeaUI10PillButton *v6;

  v5 = a3;
  v6 = self;
  sub_1B15216BC(a3);

}

- (_TtC5TeaUI10PillButton)initWithCoder:(id)a3
{
  return (_TtC5TeaUI10PillButton *)PillButton.init(coder:)(a3);
}

@end
