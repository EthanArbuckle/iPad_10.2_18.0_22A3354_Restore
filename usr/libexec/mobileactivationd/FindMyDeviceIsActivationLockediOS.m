@implementation FindMyDeviceIsActivationLockediOS

intptr_t ___FindMyDeviceIsActivationLockediOS_block_invoke(uint64_t a1, char a2, void *a3)
{
  NSError *v4;
  uint64_t v5;
  void *v6;

  if (a3)
  {
    v4 = createMobileActivationError((uint64_t)"_FindMyDeviceIsActivationLockediOS_block_invoke", 266, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, a3, CFSTR("Failed to query activation lock state."));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
