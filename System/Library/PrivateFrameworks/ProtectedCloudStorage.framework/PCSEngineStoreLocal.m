@implementation PCSEngineStoreLocal

void __PCSEngineStoreLocal_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t PublicKey;
  const void *ServiceName;
  BOOL IsManatee;
  const void *v7;

  PublicKey = PCSIdentityGetPublicKey(a2);
  if (!objc_msgSend(*(id *)(a1 + 32), "limitLocalStoring")
    || (ServiceName = (const void *)PCSIdentityGetServiceName(a2)) != 0
    && IsLocalStoringService(*(void **)(a1 + 32), ServiceName))
  {
    IsManatee = _PCSIdentityIsManatee(a2);
    v7 = (const void *)PCSIdentitySetCopyIdentity(*(_QWORD *)(a1 + 40), PublicKey);
    if (v7)
    {
      CFRelease(v7);
      if (IsManatee)
        return;
    }
    else
    {
      PCSMigrationLog(objc_msgSend(*(id *)(a1 + 32), "log"), CFSTR("adding service to localStore: %@"), a2);
      PCSIdentitySetAddIdentity(*(_QWORD *)(a1 + 40), a2);
      objc_msgSend(*(id *)(a1 + 32), "setModified:", 1);
      if (IsManatee)
        return;
    }
    if (_PCSIdentitySetIsCurrentIdentity(objc_msgSend(*(id *)(a1 + 32), "set"), a2))
    {
      if ((_PCSIdentitySetIsCurrentIdentity(*(_QWORD *)(a1 + 40), a2) & 1) == 0)
      {
        PCSMigrationLog(objc_msgSend(*(id *)(a1 + 32), "log"), CFSTR("marking identity current: %@"), a2);
        PCSIdentitySetSetCurrentIdentity(*(_QWORD *)(a1 + 40), a2);
        objc_msgSend(*(id *)(a1 + 32), "setModified:", 1);
      }
    }
  }
}

@end
