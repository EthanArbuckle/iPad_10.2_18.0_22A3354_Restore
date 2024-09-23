@implementation WFDrawerAppCell

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell *result;

  sub_220186904((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_220185DEC);
  return result;
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_220186100();
}

- (void)layoutSubviews
{
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell *v2;

  v2 = self;
  sub_220186230();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_220186588((uint64_t)v3);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  sub_220188DD8(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell_app), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell_app));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080815WFDrawerAppCell_iconView));
}

@end
