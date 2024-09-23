@implementation WFPosterPickerParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditor36WFPosterPickerParameterSummaryEditor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22680C428((uint64_t)v8, v7);

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14WorkflowEditor36WFPosterPickerParameterSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_22680CA7C((uint64_t)sub_2266E3CFC, v5);

  swift_release();
}

- (_TtC14WorkflowEditor36WFPosterPickerParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditor36WFPosterPickerParameterSummaryEditor *)sub_22680CC68(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor36WFPosterPickerParameterSummaryEditor_presentedViewController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor36WFPosterPickerParameterSummaryEditor_controller));
}

- (void)modalController:(id)a3 didDismissSheetWithResponse:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditor36WFPosterPickerParameterSummaryEditor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22680CD8C((uint64_t)v8, v7);

}

@end
