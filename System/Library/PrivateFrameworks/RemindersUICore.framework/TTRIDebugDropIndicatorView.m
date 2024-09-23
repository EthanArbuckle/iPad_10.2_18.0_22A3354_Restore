@implementation TTRIDebugDropIndicatorView

- (_TtC15RemindersUICore26TTRIDebugDropIndicatorView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore26TTRIDebugDropIndicatorView *)sub_1B47556E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore26TTRIDebugDropIndicatorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B47566C4();
}

- (void)layoutSubviews
{
  _TtC15RemindersUICore26TTRIDebugDropIndicatorView *v2;

  v2 = self;
  TTRIDebugDropIndicatorView.layoutSubviews()();

}

- (void)updateConstraints
{
  _TtC15RemindersUICore26TTRIDebugDropIndicatorView *v2;

  v2 = self;
  TTRIDebugDropIndicatorView.updateConstraints()();

}

- (void).cxx_destruct
{
  sub_1B4755594((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore26TTRIDebugDropIndicatorView_currentDropContext);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore26TTRIDebugDropIndicatorView_line));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore26TTRIDebugDropIndicatorView_infoContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore26TTRIDebugDropIndicatorView_info));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore26TTRIDebugDropIndicatorView_lineYPositionInTargetViewConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore26TTRIDebugDropIndicatorView_activeDropTargetView));
}

@end
