@implementation HomeAccessoryPickerSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditorP33_1A61F53087D1474697F25AFA4527846B32HomeAccessoryPickerSummaryEditor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22679B068((uint64_t)v6, v7);

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14WorkflowEditorP33_1A61F53087D1474697F25AFA4527846B32HomeAccessoryPickerSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_226838290((uint64_t)&unk_25587C210, v5);
}

- (id)stateByReplacingVariableFromCurrentState:(id)a3 withVariable:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditorP33_1A61F53087D1474697F25AFA4527846B32HomeAccessoryPickerSummaryEditor *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_22679B438();

  return v9;
}

- (_TtC14WorkflowEditorP33_1A61F53087D1474697F25AFA4527846B32HomeAccessoryPickerSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_1A61F53087D1474697F25AFA4527846B32HomeAccessoryPickerSummaryEditor *)sub_22679B568(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_1A61F53087D1474697F25AFA4527846B32HomeAccessoryPickerSummaryEditor_modal));
}

@end
