@implementation RBSGPUAccessGrant(RBProcessState)

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x24BE80B28], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

- (void)applyToProcessState:()RBProcessState attributePath:context:
{
  unsigned int v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(a1, "role");
  if (v4 > objc_msgSend(v5, "gpuRole"))
    objc_msgSend(v5, "setGPURole:", objc_msgSend(a1, "role"));

}

@end
