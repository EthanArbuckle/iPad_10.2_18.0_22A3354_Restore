@implementation WFDeviceIdiomResource

- (BOOL)isEqual
{
  return sub_1C17681B0();
}

- (int64_t)idiom
{
  return sub_1C17681EC();
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

- (void)refreshAvailability
{
  _TtC11WorkflowKit21WFDeviceIdiomResource *v2;

  v2 = self;
  sub_1C1768384();

}

- (_TtC11WorkflowKit21WFDeviceIdiomResource)initWithDefinition:(id)a3
{
  if (a3)
    sub_1C1B0F164();
  WFDeviceIdiomResource.init(definition:)();
}

- (_TtC11WorkflowKit21WFDeviceIdiomResource)init
{
  WFDeviceIdiomResource.init()();
}

@end
