@implementation TVSummaryFooterView

- (NSArray)preferredFocusEnvironments
{
  _TtC9SeymourUI19TVSummaryFooterView *v2;
  void *v3;

  v2 = self;
  sub_22B3CF95C();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v3 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_TtC9SeymourUI19TVSummaryFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19TVSummaryFooterView *)sub_22B3CFAAC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19TVSummaryFooterView)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  _TtC9SeymourUI19TVSummaryFooterView *result;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI19TVSummaryFooterView_onDoneButtonTap);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9SeymourUI19TVSummaryFooterView_onCooldownButtonTap);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (_TtC9SeymourUI19TVSummaryFooterView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)doneButtonTapped
{
  sub_22B307500((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9SeymourUI19TVSummaryFooterView_onDoneButtonTap);
}

- (void)cooldownButtonTapped
{
  sub_22B307500((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC9SeymourUI19TVSummaryFooterView_onCooldownButtonTap);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19TVSummaryFooterView_cooldownButton));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI19TVSummaryFooterView_onDoneButtonTap));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI19TVSummaryFooterView_onCooldownButtonTap));
}

@end
