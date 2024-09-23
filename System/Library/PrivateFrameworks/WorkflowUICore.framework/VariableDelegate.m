@implementation VariableDelegate

- (void)dealloc
{
  _TtC14WorkflowUICoreP33_D6521D150D80B7008B3CC8BBAF4C7F1316VariableDelegate *v2;

  v2 = self;
  sub_2270A48E8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowUICoreP33_D6521D150D80B7008B3CC8BBAF4C7F1316VariableDelegate_variable));
}

- (void)variableDidChange:(id)a3
{
  id v4;
  _TtC14WorkflowUICoreP33_D6521D150D80B7008B3CC8BBAF4C7F1316VariableDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_2270A4964();

}

- (_TtC14WorkflowUICoreP33_D6521D150D80B7008B3CC8BBAF4C7F1316VariableDelegate)init
{
  return (_TtC14WorkflowUICoreP33_D6521D150D80B7008B3CC8BBAF4C7F1316VariableDelegate *)sub_2270A4A10();
}

@end
