@implementation SidebarButton

- (_TtC5TeaUI13SidebarButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B158BB18();
}

- (CGSize)intrinsicContentSize
{
  _TtC5TeaUI13SidebarButton *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1B158BBCC();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSString)accessibilityLabel
{
  _TtC5TeaUI13SidebarButton *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1B158BC78();
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
  _TtC5TeaUI13SidebarButton *v4;

  if (a3)
    sub_1B16B9860();
  v4 = self;
  sub_1B158BE68();

}

- (_TtC5TeaUI13SidebarButton)initWithFrame:(CGRect)a3
{
  SidebarButton.init(frame:)();
}

- (void).cxx_destruct
{
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI13SidebarButton_accessibilityDelegate);
}

@end
