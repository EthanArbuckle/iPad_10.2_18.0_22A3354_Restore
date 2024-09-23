@implementation CreateKeyRegistry

void __CreateKeyRegistry_block_invoke(uint64_t a1, const void *a2)
{
  PCSMigrationLog(objc_msgSend(*(id *)(a1 + 32), "log"), CFSTR("  Removing Manatee service from registry: %@"), a2);
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 40), a2);
}

void __CreateKeyRegistry_block_invoke_2(uint64_t a1, const void *a2)
{
  const __CFDictionary *v4;
  const __CFArray *Value;
  const __CFArray *v6;
  CFTypeID v7;
  _QWORD *v8;
  const void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[3];
  int v14;
  const void *v15;
  CFRange v16;

  v15 = 0;
  if (PCSEngineIgnoreService(a2))
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 48), a2);
  }
  else if (!PCSServiceItemTypeIsManatee((_BOOL8)a2) && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) & 1) == 0)
  {
    v4 = PCSIdentitySetCopyPublishableIdentities(objc_msgSend(*(id *)(a1 + 40), "set"), (CFDictionaryRef)a2, &v15);
    if (v4)
    {
      PCSMigrationLog(objc_msgSend(*(id *)(a1 + 40), "log"), CFSTR("  Updating service %@ registry"), a2);
      Value = (const __CFArray *)CFDictionaryGetValue(v4, kPCSSecureBackupCFKeyRegistryPublicIdentities[0]);
      if (Value)
      {
        v6 = Value;
        v7 = CFGetTypeID(Value);
        if (v7 == CFArrayGetTypeID())
        {
          v13[0] = 0;
          v13[1] = v13;
          v13[2] = 0x2020000000;
          v14 = 0;
          v10[0] = MEMORY[0x1E0C809B0];
          v10[1] = 3221225472;
          v10[2] = __CreateKeyRegistry_block_invoke_3;
          v10[3] = &unk_1E553E740;
          v11 = *(id *)(a1 + 40);
          v12 = v13;
          v8 = v10;
          v16.length = CFArrayGetCount(v6);
          v16.location = 0;
          CFArrayApplyFunction(v6, v16, (CFArrayApplierFunction)apply_block_1_2, v8);

          _Block_object_dispose(v13, 8);
        }
      }
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 48), a2, v4);
    }
    v9 = v15;
    if (v15)
    {
      v15 = 0;
      CFRelease(v9);
    }
    if (v4)
      CFRelease(v4);
  }
}

void __CreateKeyRegistry_block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend(*(id *)(a1 + 32), "log");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(unsigned int *)(v5 + 24);
  *(_DWORD *)(v5 + 24) = v6 + 1;
  PCSMigrationLog(v4, CFSTR("     %d: %@"), v6, a2);
}

@end
