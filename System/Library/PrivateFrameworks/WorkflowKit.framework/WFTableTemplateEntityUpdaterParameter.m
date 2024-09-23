@implementation WFTableTemplateEntityUpdaterParameter

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (WFPropertyListObject)defaultSerializedRepresentation
{
  _TtC11WorkflowKit37WFTableTemplateEntityUpdaterParameter *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1C1795AD8();

  return (WFPropertyListObject *)v3;
}

- (_TtC11WorkflowKit37WFTableTemplateEntityUpdaterParameter)initWithDefinition:(id)a3
{
  id v3;
  _TtC11WorkflowKit37WFTableTemplateEntityUpdaterParameter *result;

  v3 = a3;
  WFTableTemplateEntityUpdaterParameter.init(definition:)();
  return result;
}

- (Class)singleStateClass
{
  sub_1C1795C64();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void).cxx_destruct
{
  sub_1C1606884((uint64_t)self + OBJC_IVAR____TtC11WorkflowKit37WFTableTemplateEntityUpdaterParameter_delegate);
}

@end
