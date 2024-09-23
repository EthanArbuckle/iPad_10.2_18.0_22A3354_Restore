@implementation RBSForceRoleManageAttribute(RBProcessState)

- (uint64_t)applyToProcessState:()RBProcessState attributePath:context:
{
  return objc_msgSend(a3, "setForceRoleManage:", 1);
}

- (uint64_t)isValidForContext:()RBProcessState withError:
{
  return objc_msgSend(MEMORY[0x24BE80B28], "allowedForPrimitiveAttributeForProcessTarget:withError:");
}

@end
