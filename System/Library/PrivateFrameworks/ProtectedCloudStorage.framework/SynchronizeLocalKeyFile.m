@implementation SynchronizeLocalKeyFile

void __SynchronizeLocalKeyFile_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ServiceName;
  const void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  ServiceName = PCSIdentityGetServiceName(a3);
  v7 = (const void *)PCSIdentitySetCopyIdentity(objc_msgSend(*(id *)(a1 + 32), "set"), a2);
  if (v7)
  {
    CFRelease(v7);
    return;
  }
  if (_PCSIdentityIsManatee(a3) && (PCSIdentityIsNewManatee(a3) & 1) == 0)
  {
    PCSMigrationLog(objc_msgSend(*(id *)(a1 + 32), "log"), CFSTR("Skip recovering old manatee identity (%@) from keyfile"), a3);
    return;
  }
  if (ServiceName && objc_msgSend(*(id *)(a1 + 40), "containsObject:", ServiceName))
  {
    PCSMigrationLog(objc_msgSend(*(id *)(a1 + 32), "log"), CFSTR("Skip tooRolled identity (%@) from keyfile"), a3);
    return;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (ServiceName)
    {
LABEL_10:
      v8 = _PCSIdentitySetCopyCurrentIdentityInternal(objc_msgSend(*(id *)(a1 + 32), "set"), ServiceName, 0);
      goto LABEL_14;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (ServiceName)
      goto LABEL_10;
  }
  v8 = 0;
LABEL_14:
  PCSIdentitySetAddIdentity(objc_msgSend(*(id *)(a1 + 32), "set"), a3);
  if (ServiceName && !v8)
    PCSIdentitySetSetCurrentIdentity(objc_msgSend(*(id *)(a1 + 32), "set"), a3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", CFSTR("Identity %@ of service %@ existed in backup (but not in local storage)\n"), PCSIdentityGetPublicKey(a3), ServiceName);
  if (v8)
    CFRelease(v8);
  objc_msgSend(*(id *)(a1 + 32), "setModified:", 1);
}

@end
