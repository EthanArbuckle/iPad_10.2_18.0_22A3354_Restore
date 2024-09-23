@implementation Toolbar

- (_TtC9ShortcutsP33_8702A5D8D13AC095577E43331996DAF77Toolbar)initWithFrame:(CGRect)a3
{
  return (_TtC9ShortcutsP33_8702A5D8D13AC095577E43331996DAF77Toolbar *)sub_10002D460(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIColor)backgroundColor
{
  _TtC9ShortcutsP33_8702A5D8D13AC095577E43331996DAF77Toolbar *v2;
  id v3;

  v2 = self;
  v3 = sub_10002D2B0();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5;
  _TtC9ShortcutsP33_8702A5D8D13AC095577E43331996DAF77Toolbar *v6;

  v5 = a3;
  v6 = self;
  sub_10002D330(a3);

}

- (_TtC9ShortcutsP33_8702A5D8D13AC095577E43331996DAF77Toolbar)initWithCoder:(id)a3
{
  return (_TtC9ShortcutsP33_8702A5D8D13AC095577E43331996DAF77Toolbar *)sub_10002D4C4(a3);
}

@end
