@implementation ColumnDebugView

- (_TtC11TeaTemplate15ColumnDebugView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ColumnDebugView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC11TeaTemplate15ColumnDebugView *v2;

  v2 = self;
  ColumnDebugView.layoutSubviews()();

}

- (_TtC11TeaTemplate15ColumnDebugView)initWithFrame:(CGRect)a3
{
  ColumnDebugView.init(frame:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_leftMarginView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11TeaTemplate15ColumnDebugView_rightMarginView));
}

@end
