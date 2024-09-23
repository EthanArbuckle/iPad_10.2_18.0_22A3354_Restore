@implementation PKSetupAssistantRequirementsCheckResult

- (BOOL)shouldRun
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___PKSetupAssistantRequirementsCheckResult_shouldRun);
}

- (unint64_t)missingRequirements
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR___PKSetupAssistantRequirementsCheckResult_missingRequirements);
}

- (NSString)description
{
  PKSetupAssistantRequirementsCheckResult *v2;
  void *v3;

  v2 = self;
  sub_18FDF03BC();

  v3 = (void *)sub_1903D05A4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PKSetupAssistantRequirementsCheckResult)init
{
  PKSetupAssistantRequirementsCheckResult *result;

  result = (PKSetupAssistantRequirementsCheckResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
