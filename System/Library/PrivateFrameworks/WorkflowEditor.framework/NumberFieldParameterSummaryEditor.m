@implementation NumberFieldParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditor33NumberFieldParameterSummaryEditor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2266E6E90();

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14WorkflowEditor33NumberFieldParameterSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_226838290((uint64_t)&unk_255876240, v5);
}

- (WFVariableProvider)variableProvider
{
  _TtC14WorkflowEditor33NumberFieldParameterSummaryEditor *v2;
  id v3;

  v2 = self;
  v3 = sub_2266E71D0();

  return (WFVariableProvider *)v3;
}

- (void)setVariableProvider:(id)a3
{
  _TtC14WorkflowEditor33NumberFieldParameterSummaryEditor *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_2266E7250();

}

+ (unint64_t)variableResultTypeForParameter:(id)a3
{
  return 1;
}

- (id)stateByReplacingVariableFromCurrentState:(id)a3 withVariable:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditor33NumberFieldParameterSummaryEditor *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2266E735C((uint64_t)v8, (uint64_t)a4);
  v10 = v9;

  return v10;
}

- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4
{
  _TtC14WorkflowEditor33NumberFieldParameterSummaryEditor *v7;

  swift_unknownObjectRetain();
  v7 = self;
  sub_2266E73F8(a3, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (BOOL)textEntryShouldChangeText:(id)a3
{
  id v3;
  id v5;
  _TtC14WorkflowEditor33NumberFieldParameterSummaryEditor *v6;

  v3 = a3;
  v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_2266E786C(v3);

  return v3 & 1;
}

- (void)textEntryTextDidChange:(id)a3
{
  _TtC14WorkflowEditor33NumberFieldParameterSummaryEditor *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_2266E7984();

}

- (void)textEntryDidFinish
{
  _TtC14WorkflowEditor33NumberFieldParameterSummaryEditor *v2;

  v2 = self;
  sub_2266E7C08();

}

- (void)stageState:(id)a3
{
  _TtC14WorkflowEditor33NumberFieldParameterSummaryEditor *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_2266E7CD0();

}

- (_TtC14WorkflowEditor33NumberFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditor33NumberFieldParameterSummaryEditor *)sub_2266E8014(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor33NumberFieldParameterSummaryEditor_autocompleteDataSource));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor33NumberFieldParameterSummaryEditor_autocompleteCoordinator));
}

@end
