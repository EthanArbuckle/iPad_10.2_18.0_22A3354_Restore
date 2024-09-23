@implementation DatePickerParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditorP33_F98045B4B06EF7F5A24A30DEAE57012B32DatePickerParameterSummaryEditor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2267F502C((uint64_t)v6, v7);

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14WorkflowEditorP33_F98045B4B06EF7F5A24A30DEAE57012B32DatePickerParameterSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_226838290((uint64_t)&unk_25587F718, v5);
}

- (_TtC14WorkflowEditorP33_F98045B4B06EF7F5A24A30DEAE57012B32DatePickerParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_F98045B4B06EF7F5A24A30DEAE57012B32DatePickerParameterSummaryEditor *)sub_2267F564C(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_F98045B4B06EF7F5A24A30DEAE57012B32DatePickerParameterSummaryEditor_modal));
}

@end
