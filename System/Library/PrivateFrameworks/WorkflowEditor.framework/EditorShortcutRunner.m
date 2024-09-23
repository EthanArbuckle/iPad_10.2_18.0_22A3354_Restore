@implementation EditorShortcutRunner

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  id v6;
  _TtC14WorkflowEditor20EditorShortcutRunner *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_22678DCAC((uint64_t)v7, a4);

}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithAllResults:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  uint64_t v7;
  id v10;
  id v11;
  _TtC14WorkflowEditor20EditorShortcutRunner *v12;

  v7 = (uint64_t)a4;
  if (a4)
  {
    sub_226674F0C(0, &qword_255876770);
    sub_226674F0C(0, (unint64_t *)&unk_25587BB40);
    sub_2266C5384();
    v7 = sub_22688E0C4();
  }
  v10 = a3;
  v11 = a5;
  v12 = self;
  sub_22678DF00((uint64_t)v12, v7, a5);

  swift_bridgeObjectRelease();
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v9;
  _TtC14WorkflowEditor20EditorShortcutRunner *v10;
  id v11;
  id v12;

  v12 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_22678E4B4((uint64_t)v11, a4, a5);

}

- (_TtC14WorkflowEditor20EditorShortcutRunner)init
{
  sub_22678EE14();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_33_12();
  OUTLINED_FUNCTION_33_12();
  v3 = (char *)self + OBJC_IVAR____TtC14WorkflowEditor20EditorShortcutRunner__runningState;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25587A680);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  OUTLINED_FUNCTION_33_12();
  swift_release();
}

@end
