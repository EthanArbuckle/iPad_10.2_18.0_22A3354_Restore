@implementation PresenterContainer

- (void)moduleSummaryPresenter:(id)a3 didStageParameterState:(id)a4
{
  sub_2267C8D78(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))sub_2267C8D04);
}

- (void)moduleSummaryPresenter:(id)a3 didCommitParameterState:(id)a4
{
  sub_2267C8D78(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))sub_2267C8D40);
}

- (void)moduleSummaryPresenterDidFinish:(id)a3
{
  id v4;
  _TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer *v5;

  v4 = a3;
  v5 = self;
  sub_2267C8DE8();

}

- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  void *v8;
  uint64_t v9;
  _TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer *v10;

  v6 = a3;
  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  swift_unknownObjectRetain();
  v10 = self;
  sub_2267C8EA0(v6, (uint64_t)a4, (uint64_t)sub_2267CB0A8, v9);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)revealAction:(id)a3 preScrollHandler:(id)a4 goBackHandler:(id)a5 scrolledAwayHandler:(id)a6
{
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer *v17;

  v10 = _Block_copy(a4);
  v11 = _Block_copy(a5);
  v12 = _Block_copy(a6);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v10;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v11;
  if (v12)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v12;
    v12 = sub_2266E5704;
  }
  else
  {
    v15 = 0;
  }
  v16 = a3;
  v17 = self;
  sub_2267C8FC0((uint64_t)v16, (uint64_t)sub_2266E3CFC, v13, (uint64_t)sub_2266E5704, v14, (uint64_t)v12, v15);
  sub_22666DCBC((uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)showParameterEditingHint:(id)a3
{
  _TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer *v4;

  if (a3)
    sub_22688E220();
  v4 = self;
  sub_2267C9200();

  swift_bridgeObjectRelease();
}

- (_TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer)init
{
  sub_2267C9310();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer_presenter));
  swift_release();
  sub_22666DCBC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer_onShowActionOutputPicker));
  sub_22666DCBC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer_onRevealAction));
  sub_22666DCBC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer_onFinish));
  sub_2267CB048(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer_parameterEditingHint), *(_QWORD *)&self->presenter[OBJC_IVAR____TtC14WorkflowEditorP33_460410A17E70035D97A591FA113148C318PresenterContainer_parameterEditingHint]);
}

@end
