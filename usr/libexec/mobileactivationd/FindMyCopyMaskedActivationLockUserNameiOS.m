@implementation FindMyCopyMaskedActivationLockUserNameiOS

void ___FindMyCopyMaskedActivationLockUserNameiOS_block_invoke(uint64_t a1, id a2, void *a3)
{
  id v5;
  id v6;
  NSError *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (v6 || (v9 = objc_msgSend(v5, "maskedAppleID"), v9, !v9))
  {
    v7 = createMobileActivationError((uint64_t)"_FindMyCopyMaskedActivationLockUserNameiOS_block_invoke", 329, CFSTR("com.apple.MobileActivation.ErrorDomain"), -1, v6, CFSTR("Failed to retrieve activation lock info."));
    v8 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v7 = (NSError *)objc_msgSend(v5, "maskedAppleID");
    v8 = *(_QWORD *)(a1 + 48);
  }
  v10 = *(_QWORD *)(v8 + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
