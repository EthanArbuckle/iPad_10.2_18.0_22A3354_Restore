@implementation PCSEngineStepValidateRegistry

void __PCSEngineStepValidateRegistry_block_invoke(uint64_t a1, void *key)
{
  if (PCSServiceItemTypeIsManatee((_BOOL8)key) || objc_msgSend(*(id *)(a1 + 32), "containsObject:", key))
  {
    PCSMigrationLog(objc_msgSend(*(id *)(a1 + 40), "log"), CFSTR("Registry contains Manatee service: %@"), key);
    if (*(_BYTE *)(a1 + 48))
    {
      if (!objc_msgSend(*(id *)(a1 + 40), "removeFromRegistry"))
        objc_msgSend(*(id *)(a1 + 40), "setRemoveFromRegistry:", CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]));
      CFArrayAppendValue((CFMutableArrayRef)objc_msgSend(*(id *)(a1 + 40), "removeFromRegistry"), key);
      objc_msgSend(*(id *)(a1 + 40), "setModified:", 1);
    }
  }
}

void __PCSEngineStepValidateRegistry_block_invoke_2(uint64_t a1, void *key)
{
  const void *v4;
  const void *v5;
  int v6;
  CFMutableSetRef Mutable;
  const __CFArray *v8;
  const __CFArray *v9;
  const void *Value;
  CFTypeID v11;
  const void *v12;
  CFIndex Count;
  CFIndex v14;
  uint64_t v15;
  const __CFData *ValueAtIndex;
  const __CFData *v17;
  CFTypeID v18;
  _QWORD *v19;
  const void *v20;
  const void *ServiceName;
  const void *v22;
  _BOOL4 v23;
  uint64_t PublicID;
  const void *v25;
  char v26;
  _QWORD context[5];
  CFRange v28;

  if (PCSServiceItemTypeIsManatee((_BOOL8)key) || (objc_msgSend(*(id *)(a1 + 32), "containsObject:", key) & 1) != 0)
    return;
  v4 = _PCSIdentitySetCopyCurrentIdentityInternal(objc_msgSend(*(id *)(a1 + 40), "set"), (uint64_t)key, 0);
  if (!v4 || (v5 = v4, v6 = PCSIdentityCheckValidPublicKey((uint64_t)v4, 0), CFRelease(v5), v6))
  {
    Mutable = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
    v8 = (const __CFArray *)PCSIdentitySetCopyOrderedIdentities(objc_msgSend(*(id *)(a1 + 40), "set"), (uint64_t)key);
    if (!v8)
      goto LABEL_29;
    v9 = v8;
    context[0] = MEMORY[0x1E0C809B0];
    context[1] = 3221225472;
    context[2] = __PCSEngineStepValidateRegistry_block_invoke_3;
    context[3] = &__block_descriptor_40_e10_v16__0r_v8l;
    context[4] = Mutable;
    v28.length = CFArrayGetCount(v8);
    v28.location = 0;
    CFArrayApplyFunction(v9, v28, (CFArrayApplierFunction)apply_block_1_2, context);
    CFRelease(v9);
    if (!objc_msgSend(*(id *)(a1 + 40), "oldRegistry"))
      goto LABEL_29;
    Value = CFDictionaryGetValue((CFDictionaryRef)objc_msgSend(*(id *)(a1 + 40), "oldRegistry"), key);
    if (PCSEngineIgnoreService(key))
    {
      if (Value)
        objc_msgSend(*(id *)(a1 + 40), "setModified:", 1);
      goto LABEL_10;
    }
    if (!Value
      || (v11 = CFGetTypeID(Value), v11 != CFDictionaryGetTypeID())
      || (v12 = CFDictionaryGetValue((CFDictionaryRef)Value, kPCSSecureBackupCFKeyRegistryPublicIdentities[0]),
          !isArray(v12))
      || (Count = CFArrayGetCount((CFArrayRef)v12)) == 0)
    {
LABEL_29:
      v23 = 1;
      goto LABEL_30;
    }
    v14 = Count;
    if (Count < 1)
    {
      if (!CFSetGetCount(Mutable))
      {
LABEL_10:
        if (Mutable)
          CFRelease(Mutable);
        return;
      }
      v23 = 0;
    }
    else
    {
      v26 = 0;
      v15 = 1;
      while (1)
      {
        ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)v12, v15 - 1);
        if (!ValueAtIndex)
          break;
        v17 = ValueAtIndex;
        v18 = CFGetTypeID(ValueAtIndex);
        if (v18 != CFDataGetTypeID())
          break;
        v19 = PCSPublicIdentityCreateWithPublicKeyInfo(v17, 0);
        if (!v19)
        {
          PCSMigrationLog(objc_msgSend(*(id *)(a1 + 40), "log"), CFSTR("Failed to parse identity: %@"), v17);
          break;
        }
        v20 = v19;
        ServiceName = (const void *)PCSPublicIdentityGetServiceName((uint64_t)v19);
        v22 = ServiceName;
        v23 = ServiceName == 0;
        if (ServiceName)
        {
          if (CFEqual(ServiceName, key))
          {
            PublicID = PCSPublicIdentityGetPublicID((uint64_t)v20);
            if (PublicID)
            {
              v25 = (const void *)PublicID;
              PCSMigrationLog(objc_msgSend(*(id *)(a1 + 40), "log"), CFSTR("Found identity %@ in registry for %@"), PublicID, key);
              CFSetRemoveValue(Mutable, v25);
            }
          }
          else
          {
            PCSMigrationLog(objc_msgSend(*(id *)(a1 + 40), "log"), CFSTR("Need regen of registry since %@ have the service %@ (%@) in it"), key, v20, v22);
            v26 = 1;
          }
        }
        CFRelease(v20);
        if (v15 < v14)
        {
          ++v15;
          if (v22)
            continue;
        }
        goto LABEL_42;
      }
      v23 = 1;
LABEL_42:
      if (!CFSetGetCount(Mutable))
      {
        if ((v26 & 1) == 0)
        {
LABEL_30:
          if (Mutable)
          {
            CFRelease(Mutable);
            if (!v23)
              return;
          }
          else if (!v23)
          {
            return;
          }
          goto LABEL_34;
        }
LABEL_44:
        PCSMigrationLog(objc_msgSend(*(id *)(a1 + 40), "log"), CFSTR("Triggering update for metadata"));
        objc_msgSend(*(id *)(a1 + 40), "setModified:", 1);
        goto LABEL_30;
      }
    }
    PCSMigrationLog(objc_msgSend(*(id *)(a1 + 40), "log"), CFSTR("Identities not in registry, updating needed: %@"), key);
    goto LABEL_44;
  }
LABEL_34:
  if (!objc_msgSend(*(id *)(a1 + 40), "missingFromRegistry"))
    objc_msgSend(*(id *)(a1 + 40), "setMissingFromRegistry:", CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]));
  CFArrayAppendValue((CFMutableArrayRef)objc_msgSend(*(id *)(a1 + 40), "missingFromRegistry"), key);
  objc_msgSend(*(id *)(a1 + 40), "setModified:", 1);
}

void __PCSEngineStepValidateRegistry_block_invoke_3(uint64_t a1, uint64_t a2)
{
  __CFSet *v2;
  const void *PublicKey;

  v2 = *(__CFSet **)(a1 + 32);
  PublicKey = (const void *)PCSIdentityGetPublicKey(a2);
  CFSetAddValue(v2, PublicKey);
}

@end
