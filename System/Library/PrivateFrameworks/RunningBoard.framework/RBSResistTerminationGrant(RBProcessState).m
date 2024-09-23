@implementation RBSResistTerminationGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x24BE80B28], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(a1, "resistance");
  if (v4 > objc_msgSend(v5, "terminationResistance"))
    objc_msgSend(v5, "setTerminationResistance:", v4);

}

@end
