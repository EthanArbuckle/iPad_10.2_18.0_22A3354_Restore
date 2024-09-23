@implementation WFToolInvocation

+ (NSString)errorDomain
{
  void *v2;

  static ToolInvocationBox.errorDomain.getter();
  v2 = (void *)sub_1C1B0F1F4();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)containsParameterValueForKey:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  WFToolInvocation *v7;
  Swift::String v8;

  v4 = sub_1C1B0F224();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = ToolInvocationBox.containsParameterValueForKey(_:)(v8);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (id)options
{
  WFToolInvocation *v2;
  void *v3;

  v2 = self;
  v3 = (void *)ToolInvocationBox.options()();

  return v3;
}

- (WFToolInvocation)initWithEncodedToolInvocation:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  WFToolInvocation *result;

  v4 = a3;
  v5 = sub_1C1B0DC4C();
  v7 = v6;

  ToolInvocationBox.init(encodedToolInvocation:)(v5, v7);
  return result;
}

- (void)valueForParameter:(WFParameter *)a3 ofClass:(Class)a4 variableSource:(WFVariableDataSource *)a5 completionHandler:(id)a6
{
  void *v10;
  _QWORD *v11;
  WFParameter *v12;
  WFToolInvocation *v13;

  v10 = _Block_copy(a6);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = a5;
  v11[5] = v10;
  v11[6] = self;
  v12 = a3;
  swift_unknownObjectRetain();
  v13 = self;
  sub_1C18B1138((uint64_t)&unk_1EF6FCBD8, (uint64_t)v11);
}

- (void)processedValueFromEncodedValue:(WFEncodedTypedValue *)a3 forParameter:(WFParameter *)a4 ofClass:(Class)a5 variableSource:(WFVariableDataSource *)a6 completionHandler:(id)a7
{
  void *v12;
  _QWORD *v13;
  WFEncodedTypedValue *v14;
  WFParameter *v15;
  WFToolInvocation *v16;

  v12 = _Block_copy(a7);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  v14 = a3;
  v15 = a4;
  swift_unknownObjectRetain();
  v16 = self;
  sub_1C18B1138((uint64_t)&unk_1EF6FCBC8, (uint64_t)v13);
}

- (WFToolInvocation)init
{
  ToolInvocationBox.init()();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___WFToolInvocation_toolInvocation;
  v3 = OUTLINED_FUNCTION_55_3();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
