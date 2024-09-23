@implementation ActionParameterStateDataSource

- (void)dealloc
{
  _TtC14WorkflowEditorP33_A9926FE49755427AE9EF62E6C77745C430ActionParameterStateDataSource *v2;

  v2 = self;
  sub_2267E0440();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_A9926FE49755427AE9EF62E6C77745C430ActionParameterStateDataSource_action));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_A9926FE49755427AE9EF62E6C77745C430ActionParameterStateDataSource_parameter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowEditorP33_A9926FE49755427AE9EF62E6C77745C430ActionParameterStateDataSource_undoManager));
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v6;
  _TtC14WorkflowEditorP33_A9926FE49755427AE9EF62E6C77745C430ActionParameterStateDataSource *v7;

  sub_22688E220();
  v6 = a3;
  v7 = self;
  sub_2267E1304();

  swift_bridgeObjectRelease();
}

- (int64_t)hash
{
  _TtC14WorkflowEditorP33_A9926FE49755427AE9EF62E6C77745C430ActionParameterStateDataSource *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_2267E14C0();

  return v3;
}

- (_TtC14WorkflowEditorP33_A9926FE49755427AE9EF62E6C77745C430ActionParameterStateDataSource)init
{
  sub_2267E1584();
}

@end
