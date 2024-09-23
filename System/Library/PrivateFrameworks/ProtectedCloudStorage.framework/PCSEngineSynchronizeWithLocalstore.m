@implementation PCSEngineSynchronizeWithLocalstore

void __PCSEngineSynchronizeWithLocalstore_block_invoke(uint64_t a1, const void *a2)
{
  const void *v4;

  v4 = _PCSIdentitySetCopyCurrentIdentityInternal(objc_msgSend(*(id *)(a1 + 32), "set"), (uint64_t)a2, 0);
  if (v4)
    CFRelease(v4);
  else
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 40), a2);
}

void __PCSEngineSynchronizeWithLocalstore_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const void *ServiceName;
  const void *v7;
  int IsCurrentIdentity;
  uint64_t v9;
  _BOOL4 IsManatee;
  void *v11;

  ServiceName = (const void *)PCSIdentityGetServiceName(a3);
  v7 = (const void *)PCSIdentitySetCopyIdentity(objc_msgSend(*(id *)(a1 + 32), "set"), a2);
  if (v7)
  {
    CFRelease(v7);
    return;
  }
  PCSMigrationLog(objc_msgSend(*(id *)(a1 + 32), "log"), CFSTR("adding local service to memory store: %@"), a3);
  if (ServiceName && CFSetContainsValue(*(CFSetRef *)(a1 + 40), ServiceName))
  {
    IsCurrentIdentity = _PCSIdentitySetIsCurrentIdentity(*(_QWORD *)(a1 + 48), a3);
    v9 = objc_msgSend(*(id *)(a1 + 32), "set");
    if (IsCurrentIdentity)
    {
      PCSIdentitySetSetCurrentIdentity(v9, a3);
      goto LABEL_9;
    }
  }
  else
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "set");
  }
  PCSIdentitySetAddIdentity(v9, a3);
LABEL_9:
  IsManatee = _PCSIdentityIsManatee(a3);
  v11 = *(void **)(a1 + 32);
  if (IsManatee)
    PCSMigrationLog(objc_msgSend(v11, "log"), CFSTR("was a manatee identity, skipping update of metadata"));
  else
    objc_msgSend(v11, "setModified:", 1);
}

void __PCSEngineSynchronizeWithLocalstore_block_invoke_3(uint64_t a1, uint64_t a2)
{
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;

  v4 = _PCSIdentitySetCopyCurrentIdentityInternal(*(_QWORD *)(a1 + 40), a2, 0);
  if (v4)
  {
    v5 = v4;
    v6 = _PCSIdentitySetCopyCurrentIdentityInternal(objc_msgSend(*(id *)(a1 + 32), "set"), a2, 0);
    if (v6)
    {
      v7 = v6;
      if (!CFEqual(v5, v6))
        PCSIdentitySetSetCurrentIdentity(objc_msgSend(*(id *)(a1 + 32), "set"), (uint64_t)v5);
      CFRelease(v5);
    }
    else
    {
      PCSIdentitySetSetCurrentIdentity(objc_msgSend(*(id *)(a1 + 32), "set"), (uint64_t)v5);
      v7 = v5;
    }
    CFRelease(v7);
  }
}

@end
