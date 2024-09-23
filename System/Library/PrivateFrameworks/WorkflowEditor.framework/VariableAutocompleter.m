@implementation VariableAutocompleter

- (void)availableVariablesDidChange
{
  _TtC14WorkflowEditor21VariableAutocompleter *v2;

  v2 = self;
  sub_22680182C();

}

- (_TtC14WorkflowEditor21VariableAutocompleter)init
{
  _TtC14WorkflowEditor21VariableAutocompleter *result;

  sub_226801864();
  return result;
}

- (void).cxx_destruct
{
  sub_22669DFD4((uint64_t)self + OBJC_IVAR____TtC14WorkflowEditor21VariableAutocompleter_variableProvider);
  swift_bridgeObjectRelease();
  swift_weakDestroy();

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_39();
}

@end
