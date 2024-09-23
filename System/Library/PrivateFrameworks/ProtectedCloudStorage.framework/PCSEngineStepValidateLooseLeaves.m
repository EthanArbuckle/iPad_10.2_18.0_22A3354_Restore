@implementation PCSEngineStepValidateLooseLeaves

void __PCSEngineStepValidateLooseLeaves_block_invoke(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;
  uint64_t v5;
  const void *v6;
  const void *PublicKey;
  const void *v8;

  if (cf)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == CFDataGetTypeID())
    {
      v5 = PCSBackupCopyRecoveredKeyWithIdentitySet(objc_msgSend(*(id *)(a1 + 32), "set"), *(_QWORD *)(a1 + 40), (CFDataRef)cf, 0);
      if (v5)
      {
        v6 = (const void *)v5;
        PublicKey = (const void *)PCSIdentityGetPublicKey(v5);
        v8 = (const void *)PCSIdentitySetCopyIdentity(objc_msgSend(*(id *)(a1 + 32), "set"), (uint64_t)PublicKey);
        if (v8)
        {
          CFRelease(v8);
        }
        else
        {
          PCSMigrationLog(objc_msgSend(*(id *)(a1 + 32), "log"), CFSTR("Identity %@ not found locally, adding it from LooseLeaves"), v6);
          PCSIdentitySetAddIdentity(objc_msgSend(*(id *)(a1 + 32), "set"), (uint64_t)v6);
          objc_msgSend(*(id *)(a1 + 32), "setModified:", 1);
        }
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 56), PublicKey, v6);
        CFRelease(v6);
      }
      else
      {
        PCSMigrationLog(objc_msgSend(*(id *)(a1 + 32), "log"), CFSTR("Service %@ have an un-decrypted item"), *(_QWORD *)(a1 + 48));
      }
    }
  }
}

uint64_t __PCSEngineStepValidateLooseLeaves_block_invoke_2(uint64_t a1, uint64_t a2)
{
  const void *PublicKey;
  uint64_t result;

  PublicKey = (const void *)PCSIdentityGetPublicKey(a2);
  result = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 40), PublicKey);
  if (!(_DWORD)result)
  {
    result = _PCSIdentityIsManatee(a2);
    if ((result & 1) == 0)
    {
      AddLeaf(*(__CFArray **)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "escrowIdentity"), a2);
      PCSMigrationLog(objc_msgSend(*(id *)(a1 + 32), "log"), CFSTR("Local identity %@ missing in LooseLeaves, adding it"), a2);
      return objc_msgSend(*(id *)(a1 + 32), "setModified:", 1);
    }
  }
  return result;
}

uint64_t __PCSEngineStepValidateLooseLeaves_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = _PCSIdentityIsManatee(a3);
  if ((result & 1) == 0)
  {
    AddLeaf(*(__CFArray **)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "escrowIdentity"), a3);
    PCSMigrationLog(objc_msgSend(*(id *)(a1 + 32), "log"), CFSTR("Re-adding preexisting LooseLeaves identity %@"), a3);
    return objc_msgSend(*(id *)(a1 + 32), "setModified:", 1);
  }
  return result;
}

@end
