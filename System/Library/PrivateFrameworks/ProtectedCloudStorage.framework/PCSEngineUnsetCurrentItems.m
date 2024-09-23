@implementation PCSEngineUnsetCurrentItems

void __PCSEngineUnsetCurrentItems_block_invoke(uint64_t a1, __CFString *a2)
{
  void *v4;
  __CFString *AccessGroupByName;
  const __CFString *CKKSViewByName;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;

  v4 = (void *)MEMORY[0x1AF415520]();
  if (!PCSServiceItemTypeIsManatee((_BOOL8)a2) && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) == 0)
  {
    AccessGroupByName = PCSServiceItemGetAccessGroupByName(a2);
    if (CFEqual(CFSTR("com.apple.ProtectedCloudStorage"), AccessGroupByName))
    {
      CKKSViewByName = PCSServiceItemGetCKKSViewByName(a2);
      if (CFEqual(CFSTR("ProtectedCloudStorage"), CKKSViewByName))
      {
        v11 = 0;
        v7 = PCSIdentitySetUnsetCurrentIdentity(*(_QWORD *)(a1 + 64), (uint64_t)a2, &v11);
        v8 = *(void **)(a1 + 40);
        if ((v7 & 1) != 0)
        {
          if ((PCSIdentitySetUnsetCurrentIdentity(objc_msgSend(v8, "set"), (uint64_t)a2, &v11) & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 48), "addObject:", a2);
            goto LABEL_13;
          }
          v10 = objc_msgSend(*(id *)(a1 + 40), "log");
          PCSMigrationLog(v10, CFSTR("Failed to unset current identity in set: %@"), v11);
        }
        else
        {
          v9 = objc_msgSend(v8, "log");
          PCSMigrationLog(v9, CFSTR("Failed to unset current identity: %@"), v11);
        }
      }
      else
      {
        PCSMigrationLog(objc_msgSend(*(id *)(a1 + 40), "log"), CFSTR("Incorrect view for %@"), a2);
      }
    }
    else
    {
      PCSMigrationLog(objc_msgSend(*(id *)(a1 + 40), "log"), CFSTR("Incorrect access group for %@"), a2);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
LABEL_13:
  objc_autoreleasePoolPop(v4);
}

intptr_t __PCSEngineUnsetCurrentItems_block_invoke_2(uint64_t a1, CFTypeRef cf)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (cf)
  {
    *(_BYTE *)(v3 + 24) = 0;
    if (*(_QWORD *)(a1 + 48))
      **(_QWORD **)(a1 + 48) = CFRetain(cf);
  }
  else
  {
    *(_BYTE *)(v3 + 24) = 1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
