@implementation PKSetupAssistantRequirementsChecker

- (PKSetupAssistantRequirementsChecker)initWithTargetDevice:(id)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKSetupAssistantRequirementsChecker_targetDevice) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SetupAssistantRequirementsChecker();
  swift_unknownObjectRetain();
  return -[PKSetupAssistantRequirementsChecker init](&v4, sel_init);
}

- (id)checkPhoneRequirementsWithContext:(id)a3
{
  return sub_18FDF0704(self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_18FE27438);
}

- (id)checkMacRequirementsWithContext:(id)a3
{
  return sub_18FDF0704(self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_18FE27560);
}

- (PKSetupAssistantRequirementsChecker)init
{
  PKSetupAssistantRequirementsChecker *result;

  result = (PKSetupAssistantRequirementsChecker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
