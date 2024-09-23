@implementation WFDrawerSwitchCell

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell *result;

  sub_220186904((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_220186690);
  return result;
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_220186950();
}

- (void)layoutSubviews
{
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell *v2;

  v2 = self;
  sub_220186A2C();

}

- (void)switchValueChanged
{
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell *v2;

  v2 = self;
  sub_220186D10();

}

- (void)prepareForReuse
{
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell *v2;

  v2 = self;
  sub_220186DC0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell_valueSwitch));
  sub_220096AA0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerSwitchCell_onChange));
}

@end
