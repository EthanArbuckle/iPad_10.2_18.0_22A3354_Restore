@implementation WFActivityProgressViewController

- (void)viewDidLoad
{
  WFActivityProgressViewController *v2;

  v2 = self;
  sub_2201944D0();

}

- (unint64_t)state
{
  return sub_220194630();
}

- (void)setState:(unint64_t)a3
{
  WFActivityProgressViewController *v4;

  v4 = self;
  sub_220194680(a3);

}

- (WFActivityProgressViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (WFActivityProgressViewController *)sub_220194E28(v5, v7, a4);
}

- (WFActivityProgressViewController)initWithCoder:(id)a3
{
  return (WFActivityProgressViewController *)sub_220194FC8(a3);
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_6_14(*(id *)((char *)&self->super.super.super.isa
                               + OBJC_IVAR___WFActivityProgressViewController__contentView));
}

@end
