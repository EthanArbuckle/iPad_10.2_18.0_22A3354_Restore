@implementation RBSSubordinateProcessAttribute(RBProcessState)

- (uint64_t)applyToAssertionIntransientState:()RBProcessState attributePath:context:
{
  return objc_msgSend(a3, "setTerminateTargetOnOriginatorExit:", 1);
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x24BE80B28], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

@end
