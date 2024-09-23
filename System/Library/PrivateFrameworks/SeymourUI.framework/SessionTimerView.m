@implementation SessionTimerView

- (void)updateDuration:(double)a3
{
  _TtC9SeymourUI16SessionTimerView *v4;

  v4 = self;
  sub_22B7CDDE8(a3);

}

- (CGSize)intrinsicContentSize
{
  _TtC9SeymourUI16SessionTimerView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_22B7CDF18();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC9SeymourUI16SessionTimerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B7CF9BC();
}

- (void)dealloc
{
  void *v3;
  _TtC9SeymourUI16SessionTimerView *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI16SessionTimerView_animator);
  v4 = self;
  if (v3)
    objc_msgSend(v3, sel_stopAnimation_, 1);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SessionTimerView();
  -[SessionTimerView dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();

}

- (_TtC9SeymourUI16SessionTimerView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI16SessionTimerView *result;

  result = (_TtC9SeymourUI16SessionTimerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)updateDuration:(double)a3 remainingDuration:(double)a4
{
  -[SessionTimerView updateDuration:](self, sel_updateDuration_, a4);
}

@end
