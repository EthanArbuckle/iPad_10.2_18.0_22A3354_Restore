@implementation TTRIQuickBar

- (_TtC15RemindersUICore12TTRIQuickBar)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore12TTRIQuickBar *)sub_1B43F50D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore12TTRIQuickBar)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore12TTRIQuickBar *)sub_1B43F54D4(a3);
}

- (void)layoutSubviews
{
  _TtC15RemindersUICore12TTRIQuickBar *v2;

  v2 = self;
  sub_1B43F55A0();

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore12TTRIQuickBar_clipViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore12TTRIQuickBar_bottomBarToContainerTopConstraint));
  swift_release();
}

@end
