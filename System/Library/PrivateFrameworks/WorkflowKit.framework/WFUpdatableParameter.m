@implementation WFUpdatableParameter

- (WFParameter)underlyingParameter
{
  return (WFParameter *)WFUpdatableParameter.underlyingParameter.getter();
}

- (id)localizedLabelWithContext:(id)a3
{
  id v4;
  WFUpdatableParameter *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  sub_1C16056A0((uint64_t)v4);

  v6 = (void *)sub_1C1B0F1F4();
  swift_bridgeObjectRelease();
  return v6;
}

- (WFUpdatableParameter)initWithDefinition:(id)a3
{
  WFUpdatableParameter *result;

  WFUpdatableParameter.init(definition:)(a3);
  return result;
}

- (Class)singleStateClass
{
  sub_1C1605B94();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)createDialogRequestWithAttribution:(WFDialogAttribution *)a3 defaultState:(WFParameterState *)a4 prompt:(NSString *)a5 completionHandler:(id)a6
{
  void *v10;
  _QWORD *v11;
  WFDialogAttribution *v12;
  NSString *v13;
  WFUpdatableParameter *v14;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  sub_1C18B1138((uint64_t)&unk_1EF6FC4D0, (uint64_t)v11);
}

- (id)parameterStateFromDialogResponse:(id)a3
{
  id v4;
  WFUpdatableParameter *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1C1606100((uint64_t)v4);

  return v6;
}

- (Class)toolkitStateClass
{
  WFUpdatableParameter *v2;

  v2 = self;
  sub_1C16064A8();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void).cxx_destruct
{

  sub_1C1606884((uint64_t)self + OBJC_IVAR___WFUpdatableParameter_stateDataSource);
}

@end
