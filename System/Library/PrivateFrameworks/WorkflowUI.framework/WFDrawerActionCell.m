@implementation WFDrawerActionCell

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell *result;

  sub_220186904((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_22018278C);
  return result;
}

- (_TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_220183150();
}

- (void)layoutSubviews
{
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell *v2;

  v2 = self;
  sub_220183324();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_220183E80();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell *v6;
  void *v7;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_2201846E4();

  swift_unknownObjectRelease();
  sub_220083D98(0, (unint64_t *)&unk_2555ABE60);
  v7 = (void *)sub_220307158();
  swift_bridgeObjectRelease();
  return v7;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5;
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell *v6;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_220184D00();

  swift_unknownObjectRelease();
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return OUTLINED_FUNCTION_56() & 1;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v7;
  id v8;
  _TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  v10 = sub_220184DFC();

  swift_unknownObjectRelease();
  return v10;
}

- (void).cxx_destruct
{
  sub_2200888B0((uint64_t)self + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell_action, &qword_2555ABDC0);
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell_actionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell_infoButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_E1EBF4FF771D0942E2717CF38009080818WFDrawerActionCell_topHitsScrollView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
