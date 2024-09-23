@implementation ContactFieldParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22682391C(v6, v7);

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_226838290((uint64_t)&unk_255881B58, v5);
}

- (_TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor *)sub_226824020(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor_modal));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_55AA4CCD1A6B2E7075ABE2FF9E5C4A7234ContactFieldParameterSummaryEditor_lastValue));
}

@end
