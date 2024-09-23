@implementation SliderParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditorP33_43BA2E4FFF91A585BB3837D4F314AD5928SliderParameterSummaryEditor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2266C20B0((uint64_t)v6, v7);

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14WorkflowEditorP33_43BA2E4FFF91A585BB3837D4F314AD5928SliderParameterSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_226838290((uint64_t)&unk_255874EE8, v5);
}

+ (unint64_t)variableResultTypeForParameter:(id)a3
{
  swift_getObjCClassMetadata();
  return sub_2266C27B8();
}

- (_TtC14WorkflowEditorP33_43BA2E4FFF91A585BB3837D4F314AD5928SliderParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_43BA2E4FFF91A585BB3837D4F314AD5928SliderParameterSummaryEditor *)sub_2266C27EC(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_43BA2E4FFF91A585BB3837D4F314AD5928SliderParameterSummaryEditor_modal));
}

@end
