@implementation TTRILabeledIconsView

- (_TtC15RemindersUICore20TTRILabeledIconsView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore20TTRILabeledIconsView *)sub_1B43754D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore20TTRILabeledIconsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B4376ADC();
}

- (void)layoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[TTRILabeledIconsView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  sub_1B4374C54();

}

- (_TtC15RemindersUICore20TTRILabeledIconsView)initWithArrangedSubviews:(id)a3
{
  _TtC15RemindersUICore20TTRILabeledIconsView *result;

  result = (_TtC15RemindersUICore20TTRILabeledIconsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore20TTRILabeledIconsView_viewDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore20TTRILabeledIconsView_titleFont));
  swift_bridgeObjectRelease();
}

@end
