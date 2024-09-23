@implementation RBSProcessIdentity(RBConcreteTargeting)

- (uint64_t)isSystem
{
  return 0;
}

- (uint64_t)process
{
  return 0;
}

- (uint64_t)environment
{
  return 0;
}

- (uint64_t)createRBSTarget
{
  return objc_msgSend(MEMORY[0x24BE80D38], "targetWithProcessIdentity:", a1);
}

@end
