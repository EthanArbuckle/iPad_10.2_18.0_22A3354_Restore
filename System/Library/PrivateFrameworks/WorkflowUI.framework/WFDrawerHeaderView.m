@implementation WFDrawerHeaderView

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerHeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerHeaderView *)sub_220186EAC(v3, v4);
}

- (void)layoutSubviews
{
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerHeaderView *v2;

  v2 = self;
  sub_2201870FC();

}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_220187250();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerHeaderView_label));
}

@end
