@implementation QuantityFieldParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2266FC3E0(v6);

}

- (id)customMenuElementsForSlotWithIdentifier:(id)a3 style:(unint64_t)a4
{
  id v5;
  _TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = self;
  sub_2266FC514(v5);
  v8 = v7;

  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255875CD8);
    v9 = (void *)sub_22688E334();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_226838290((uint64_t)&unk_255876D28, v5);
}

- (WFVariableProvider)variableProvider
{
  _TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *v2;
  id v3;

  v2 = self;
  v3 = sub_2266FCACC();

  return (WFVariableProvider *)v3;
}

- (void)setVariableProvider:(id)a3
{
  _TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_2266FCB4C();

}

+ (unint64_t)variableResultTypeForParameter:(id)a3
{
  return 1;
}

- (id)stateByReplacingVariableFromCurrentState:(id)a3 withVariable:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2266FCC68((uint64_t)v8, a4);
  v10 = v9;

  return v10;
}

- (BOOL)variableMenuSupportsVariableSelectionForSlotWithIdentifier:(id)a3
{
  id v4;
  _TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *v5;
  char v6;
  char v7;

  v4 = a3;
  v5 = self;
  sub_2266FCD80(v4);
  v7 = v6;

  return v7 & 1;
}

- (id)clearButtonMenuItemForSlotWithIdentifier:(id)a3
{
  id v4;
  _TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_2266FCE80(v4);
  v7 = v6;

  return v7;
}

- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4
{
  _TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *v7;

  swift_unknownObjectRetain();
  v7 = self;
  sub_2266FCFC0(a3, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (BOOL)textEntryShouldChangeText:(id)a3
{
  id v3;
  id v5;
  _TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *v6;
  char v7;

  v3 = a3;
  v5 = a3;
  v6 = self;
  sub_2266FD28C(v3);
  LOBYTE(v3) = v7;

  return v3 & 1;
}

- (void)textEntryTextDidChange:(id)a3
{
  _TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_2266FD360((uint64_t)a3);

}

- (void)textEntryDidFinish
{
  _TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *v2;

  v2 = self;
  sub_2266FD670();

}

- (void)stageState:(id)a3
{
  _TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_2266FD740();

}

- (_TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor *)sub_2266FDB44(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor_autocompleteDataSource));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor35QuantityFieldParameterSummaryEditor_autocompleteCoordinator));
}

@end
