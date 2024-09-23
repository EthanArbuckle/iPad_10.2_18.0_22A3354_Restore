@implementation SageWorkflowRunnerClientToolExecutionSession

- (void)dealloc
{
  _TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession *v2;

  v2 = self;
  sub_248F5BF78();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession_client));
  sub_248DB939C((uint64_t)self + OBJC_IVAR____TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession_currentDialogHandler, &qword_2544700E0);
  sub_248DB939C((uint64_t)self + OBJC_IVAR____TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession_currentInvocation, &qword_254477C30);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254474F80);
  OUTLINED_FUNCTION_54_8(*(_QWORD *)(v3 - 8));
  v4 = OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_54_8(*(_QWORD *)(v4 - 8));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession_actionStateObservation));
}

- (void)workflowRunnerClient:(WFSageWorkflowRunnerClient *)a3 postedDialogRequest:(WFDialogRequest *)a4 completionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  WFSageWorkflowRunnerClient *v10;
  WFDialogRequest *v11;
  _TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_248F5C5E0((uint64_t)&unk_2577E8A30, (uint64_t)v9);
}

- (void)workflowRunnerClient:(id)a3 postedEvent:(int64_t)a4
{
  id v5;
  _TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession *v6;

  v5 = a3;
  v6 = self;
  sub_248F5C6BC();

}

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  id v6;
  id v7;
  _TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_248F5C97C((uint64_t)v8, a4);

}

- (NSString)debugDescription
{
  _TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession *v2;
  void *v3;

  v2 = self;
  sub_248F5CD1C();

  v3 = (void *)sub_2490E7F6C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC7ToolKit44SageWorkflowRunnerClientToolExecutionSession)init
{
  sub_248F5CE80();
}

@end
