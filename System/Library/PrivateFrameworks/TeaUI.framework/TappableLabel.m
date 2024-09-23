@implementation TappableLabel

- (_TtC5TeaUI13TappableLabel)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI13TappableLabel *)TappableLabel.init(frame:)();
}

- (_TtC5TeaUI13TappableLabel)initWithCoder:(id)a3
{
  return (_TtC5TeaUI13TappableLabel *)TappableLabel.init(coder:)(a3);
}

- (void).cxx_destruct
{

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return TappableLabel.accessibilityTraits.getter();
}

- (NSString)accessibilityLabel
{
  _TtC5TeaUI13TappableLabel *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  TappableLabel.accessibilityLabel.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B16B983C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setAccessibilityLabel:(id)a3
{
  _TtC5TeaUI13TappableLabel *v4;

  if (a3)
    sub_1B16B9860();
  v4 = self;
  TappableLabel.accessibilityLabel.setter();

}

@end
