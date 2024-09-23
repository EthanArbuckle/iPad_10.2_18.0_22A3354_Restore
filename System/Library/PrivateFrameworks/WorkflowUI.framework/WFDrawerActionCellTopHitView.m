@implementation WFDrawerActionCellTopHitView

- (void)layoutSubviews
{
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView *v2;

  v2 = self;
  sub_22018591C();

}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_220185AA8();
}

- (void)didSelect:(id)a3
{
  id v4;
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView *v5;

  v4 = a3;
  v5 = self;
  sub_220185B74();

}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView)initWithFrame:(CGRect)a3
{
  sub_220188254();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView_topHit;
  v4 = sub_22030480C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView_thumbnailBorderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080828WFDrawerActionCellTopHitView_label));
}

@end
