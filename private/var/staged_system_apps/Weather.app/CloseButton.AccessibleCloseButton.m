@implementation CloseButton.AccessibleCloseButton

- (BOOL)accessibilityActivate
{
  _TtCV7Weather11CloseButton21AccessibleCloseButton *v2;

  v2 = self;
  sub_10071B360();

  return 1;
}

- (_TtCV7Weather11CloseButton21AccessibleCloseButton)initWithFrame:(CGRect)a3
{
  return (_TtCV7Weather11CloseButton21AccessibleCloseButton *)sub_10071B3B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV7Weather11CloseButton21AccessibleCloseButton)initWithCoder:(id)a3
{
  _TtCV7Weather11CloseButton21AccessibleCloseButton *result;

  sub_10071B434(a3);
  return result;
}

@end
