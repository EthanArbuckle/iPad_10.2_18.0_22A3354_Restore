@implementation WorkflowEditorResults

- (_TtC14WorkflowEditor21WorkflowEditorResults)init
{
  return (_TtC14WorkflowEditor21WorkflowEditorResults *)WorkflowEditorResults.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorResults__actionError;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558734A8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC14WorkflowEditor21WorkflowEditorResults__finalResultCollection;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2558734C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
