@implementation WFDeviceCapabilityResource

- (_TtC11WorkflowKit26WFDeviceCapabilityResource)initWithMobileGestaltKey:(id)a3 value:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1C1B0F224();
  return (_TtC11WorkflowKit26WFDeviceCapabilityResource *)WFDeviceCapabilityResource.init(mobileGestaltKey:value:)(v5, v6, a4);
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

- (void)refreshAvailability
{
  _TtC11WorkflowKit26WFDeviceCapabilityResource *v2;

  v2 = self;
  sub_1C18A0CA8();

}

- (_TtC11WorkflowKit26WFDeviceCapabilityResource)initWithDefinition:(id)a3
{
  if (a3)
    sub_1C1B0F164();
  WFDeviceCapabilityResource.init(definition:)();
}

- (_TtC11WorkflowKit26WFDeviceCapabilityResource)init
{
  WFDeviceCapabilityResource.init()();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC11WorkflowKit26WFDeviceCapabilityResource_capability;
  v3 = OUTLINED_FUNCTION_0_35();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
