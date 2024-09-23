@implementation ConditionalSubjectParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  _TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_2266F0AEC(v8, v6);

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_226838290((uint64_t)&unk_255876748, v5);
}

- (BOOL)variableMenuSupportsVariableSelectionForSlotWithIdentifier:(id)a3
{
  id v4;
  _TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_2266F12D4(v4);

  return self & 1;
}

- (id)clearButtonMenuItemForSlotWithIdentifier:(id)a3
{
  id v4;
  _TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_2266F14B0(v4);

  return v6;
}

- (id)customMenuElementsForSlotWithIdentifier:(id)a3 style:(unint64_t)a4
{
  id v6;
  _TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = self;
  sub_2266F16C0(v6, a4);
  v9 = v8;

  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255875CD8);
    v10 = (void *)sub_22688E334();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)stateByReplacingVariableFromCurrentState:(id)a3 withVariable:(id)a4
{
  id v7;
  id v8;
  _TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor *v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = sub_2266F261C((uint64_t)a3, (uint64_t)a4);

  return v10;
}

- (_TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor *)sub_2266F2D64(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor_homeServiceModal));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_88919392127B4CC4A9712067A850793640ConditionalSubjectParameterSummaryEditor_pendingHome));
}

@end
