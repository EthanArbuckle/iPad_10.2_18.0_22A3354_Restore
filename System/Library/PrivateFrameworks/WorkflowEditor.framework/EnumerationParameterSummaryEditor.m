@implementation EnumerationParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  _TtC14WorkflowEditor33EnumerationParameterSummaryEditor *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_226838400(v8, v6);

}

- (id)customMenuElementsForSlotWithIdentifier:(id)a3 style:(unint64_t)a4
{
  id v5;
  _TtC14WorkflowEditor33EnumerationParameterSummaryEditor *v6;
  unint64_t v7;
  void *v8;

  v5 = a3;
  v6 = self;
  v7 = sub_226838868((uint64_t)v6);

  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255875CD8);
    v8 = (void *)sub_22688E334();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)beginEditingNewArrayElementFromPresentationAnchor:(id)a3
{
  _TtC14WorkflowEditor33EnumerationParameterSummaryEditor *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_226839228((uint64_t)v5);

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14WorkflowEditor33EnumerationParameterSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_226838290((uint64_t)&unk_255882848, v5);
}

- (void)completeEditing
{
  _TtC14WorkflowEditor33EnumerationParameterSummaryEditor *v2;

  v2 = self;
  sub_226839784((uint64_t)v2);

}

+ (unint64_t)variableResultTypeForParameter:(id)a3
{
  return sub_22683A08C();
}

- (_TtC14WorkflowEditor33EnumerationParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  _TtC14WorkflowEditor33EnumerationParameterSummaryEditor *result;

  sub_22683A0D8(a3, a4, a5);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor33EnumerationParameterSummaryEditor_valuePicker));
}

@end
