@implementation PLErrorUserInfoContainerIsSafeForXPC

uint64_t ___PLErrorUserInfoContainerIsSafeForXPC_block_invoke(void *a1)
{
  id v1;
  uint64_t IsSafeForXPC;

  v1 = a1;
  if (objc_msgSend(v1, "conformsToProtocol:", &unk_1EE38FF30))
    IsSafeForXPC = _PLErrorUserInfoContainerIsSafeForXPC(v1);
  else
    IsSafeForXPC = 1;

  return IsSafeForXPC;
}

@end
