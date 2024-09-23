@implementation HomeServicePickerSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditorP33_2032D7CE8BA73970A5B3569FA036E63530HomeServicePickerSummaryEditor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2266EF484((uint64_t)v6, v7);

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14WorkflowEditorP33_2032D7CE8BA73970A5B3569FA036E63530HomeServicePickerSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_226838290((uint64_t)&unk_2558765E8, v5);
}

- (id)stateByReplacingVariableFromCurrentState:(id)a3 withVariable:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditorP33_2032D7CE8BA73970A5B3569FA036E63530HomeServicePickerSummaryEditor *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2266EF854();
  v10 = v9;

  return v10;
}

- (_TtC14WorkflowEditorP33_2032D7CE8BA73970A5B3569FA036E63530HomeServicePickerSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_2032D7CE8BA73970A5B3569FA036E63530HomeServicePickerSummaryEditor *)sub_2266EF954(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_2032D7CE8BA73970A5B3569FA036E63530HomeServicePickerSummaryEditor_modal));
}

@end
