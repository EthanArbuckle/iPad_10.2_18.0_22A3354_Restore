@implementation SeparatorView

- (BOOL)isHidden
{
  _TtC5TeaUI13SeparatorView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = SeparatorView.isHidden.getter();

  return v3 & 1;
}

- (void)setHidden:(BOOL)a3
{
  _TtC5TeaUI13SeparatorView *v4;

  v4 = self;
  SeparatorView.isHidden.setter(a3);

}

- (UIColor)backgroundColor
{
  _TtC5TeaUI13SeparatorView *v2;
  id v3;

  v2 = self;
  v3 = SeparatorView.backgroundColor.getter();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC5TeaUI13SeparatorView *v6;

  v5 = a3;
  v6 = self;
  SeparatorView.backgroundColor.setter(a3);

}

- (_TtC5TeaUI13SeparatorView)initWithFrame:(CGRect)a3
{
  _TtC5TeaUI13SeparatorView *result;

  SeparatorView.init(frame:)();
  return result;
}

- (_TtC5TeaUI13SeparatorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SeparatorView.init(coder:)();
}

- (void).cxx_destruct
{

}

@end
