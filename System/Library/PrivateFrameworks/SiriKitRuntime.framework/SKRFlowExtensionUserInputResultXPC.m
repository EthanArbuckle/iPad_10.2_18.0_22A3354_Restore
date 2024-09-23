@implementation SKRFlowExtensionUserInputResultXPC

- (SKRFlowExtensionUserInputResultXPC)initWithCoder:(id)a3
{
  return (SKRFlowExtensionUserInputResultXPC *)FlowExtensionUserInputResultXPC.init(coder:)(a3);
}

- (void).cxx_destruct
{
  outlined consume of Data?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData), *(_QWORD *)&self->type[OBJC_IVAR___SKRFlowExtensionUserInputResultXPC_reformedInputData]);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SKRFlowExtensionUserInputResultXPC *v5;

  v4 = a3;
  v5 = self;
  FlowExtensionUserInputResultXPC.encode(with:)((NSCoder)v4);

}

- (SKRFlowExtensionUserInputResultXPC)init
{
  SKRFlowExtensionUserInputResultXPC *result;

  result = (SKRFlowExtensionUserInputResultXPC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
