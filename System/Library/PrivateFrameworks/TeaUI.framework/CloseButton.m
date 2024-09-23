@implementation CloseButton

- (_TtC5TeaUI11CloseButton)init
{
  return (_TtC5TeaUI11CloseButton *)CloseButton.init()();
}

- (_TtC5TeaUI11CloseButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B1538A14();
}

- (CGSize)intrinsicContentSize
{
  _TtC5TeaUI11CloseButton *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = CloseButton.intrinsicContentSize.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC5TeaUI11CloseButton *v3;
  unint64_t v4;
  unint64_t v5;
  CGSize v6;
  double width;
  double height;
  CGSize result;

  v3 = self;
  v6 = CloseButton.sizeThatFits(_:)((CGSize)__PAIR128__(v5, v4));

  width = v6.width;
  height = v6.height;
  result.height = height;
  result.width = width;
  return result;
}

- (_TtC5TeaUI11CloseButton)initWithFrame:(CGRect)a3
{
  CloseButton.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI11CloseButton____lazy_storage___backing));
}

- (BOOL)accessibilityActivate
{
  _TtC5TeaUI11CloseButton *v2;

  v2 = self;
  CloseButton.accessibilityActivate()();

  return 1;
}

@end
