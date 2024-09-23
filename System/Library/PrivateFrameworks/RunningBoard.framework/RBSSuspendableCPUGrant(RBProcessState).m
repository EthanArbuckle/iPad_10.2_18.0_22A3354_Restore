@implementation RBSSuspendableCPUGrant(RBProcessState)

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(a1, "role");
  if (v4 > objc_msgSend(v5, "role"))
    objc_msgSend(v5, "setRole:", v4);

}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x24BE80B28], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

@end
