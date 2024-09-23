@implementation PhotoItemCollectionParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditorP33_16F0212F6D31E3D618FE97C107DFCC2A41PhotoItemCollectionParameterSummaryEditor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_226793734(v6, v7);

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14WorkflowEditorP33_16F0212F6D31E3D618FE97C107DFCC2A41PhotoItemCollectionParameterSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_226838290((uint64_t)&unk_25587BCF8, v5);
}

- (_TtC14WorkflowEditorP33_16F0212F6D31E3D618FE97C107DFCC2A41PhotoItemCollectionParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_16F0212F6D31E3D618FE97C107DFCC2A41PhotoItemCollectionParameterSummaryEditor *)sub_226793DC4(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_16F0212F6D31E3D618FE97C107DFCC2A41PhotoItemCollectionParameterSummaryEditor_modal));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_16F0212F6D31E3D618FE97C107DFCC2A41PhotoItemCollectionParameterSummaryEditor_lastValue));
}

@end
