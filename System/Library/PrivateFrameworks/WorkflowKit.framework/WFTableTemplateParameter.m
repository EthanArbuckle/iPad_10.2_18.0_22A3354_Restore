@implementation WFTableTemplateParameter

- (Class)singleStateClass
{
  sub_1C179437C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (WFPropertyListObject)defaultSerializedRepresentation
{
  WFTableTemplateParameter *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1C1794410();

  return (WFPropertyListObject *)v3;
}

- (NSString)importQuestionBehavior
{
  return (NSString *)sub_1C1794438();
}

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (WFTableTemplateParameter)initWithDefinition:(id)a3
{
  id v3;
  WFTableTemplateParameter *result;

  v3 = a3;
  WFTableTemplateParameter.init(definition:)();
  return result;
}

- (id)defaultSupportedVariableTypes
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = a1;
  sub_1C1795A48();
  v3 = v2;

  if (v3)
  {
    type metadata accessor for WFVariableType(0);
    v5 = v4;
    sub_1C17943A0();
    sub_1C1B0F4D0();
    OUTLINED_FUNCTION_5_27();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
