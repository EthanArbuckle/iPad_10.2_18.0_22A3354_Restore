@implementation TouchPassThroughView

- (_TtC14WidgetRenderer20TouchPassThroughView)init
{
  _TtC14WidgetRenderer20TouchPassThroughView *v2;
  void *v3;
  _TtC14WidgetRenderer20TouchPassThroughView *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TouchPassThroughView();
  v2 = -[TouchPassThroughView initWithFrame:](&v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v3 = (void *)objc_opt_self();
  v4 = v2;
  v5 = objc_msgSend(v3, sel_clearColor);
  -[TouchPassThroughView setBackgroundColor:](v4, sel_setBackgroundColor_, v5);

  -[TouchPassThroughView setOpaque:](v4, sel_setOpaque_, 0);
  return v4;
}

- (_TtC14WidgetRenderer20TouchPassThroughView)initWithCoder:(id)a3
{
  _TtC14WidgetRenderer20TouchPassThroughView *result;

  result = (_TtC14WidgetRenderer20TouchPassThroughView *)sub_24A55985C();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for TouchPassThroughView();
  v7 = v13.receiver;
  v8 = a4;
  v9 = -[TouchPassThroughView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v8, x, y);
  if (v9)
  {
    v10 = v9;
    sub_24A50F674(0, (unint64_t *)&unk_2544D27C0);
    v11 = v7;
    v7 = v10;
    LOBYTE(v10) = sub_24A55955C();

    if ((v10 & 1) == 0)
      return v7;
  }
  else
  {

  }
  v7 = 0;
  return v7;
}

- (_TtC14WidgetRenderer20TouchPassThroughView)initWithFrame:(CGRect)a3
{
  _TtC14WidgetRenderer20TouchPassThroughView *result;

  result = (_TtC14WidgetRenderer20TouchPassThroughView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
