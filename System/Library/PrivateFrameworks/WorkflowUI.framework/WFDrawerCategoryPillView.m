@implementation WFDrawerCategoryPillView

- (CGSize)intrinsicContentSize
{
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080824WFDrawerCategoryPillView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_2201880EC();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080824WFDrawerCategoryPillView *v2;

  v2 = self;
  sub_220188104();

}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080824WFDrawerCategoryPillView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2201881A0();
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080824WFDrawerCategoryPillView)initWithFrame:(CGRect)a3
{
  sub_220188254();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080824WFDrawerCategoryPillView_button));
}

@end
