@implementation PCSIdentitySetCreateExternalFormWithName

void __PCSIdentitySetCreateExternalFormWithName_block_invoke(uint64_t a1, int a2, void *value)
{
  uint64_t ServiceName;
  const void *v6;
  const __CFArray *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;
  CFRange v13;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56) && _PCSIdentityIsManatee((uint64_t)value))
    return;
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_12;
  ServiceName = PCSIdentityGetServiceName((uint64_t)value);
  if (!ServiceName)
  {
    PCSLogGetOSLog(*(_QWORD *)(a1 + 40));
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = value;
      _os_log_impl(&dword_1A9508000, v9, OS_LOG_TYPE_DEFAULT, "Identity have unknown service: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    goto LABEL_12;
  }
  v6 = (const void *)ServiceName;
  v7 = *(const __CFArray **)(a1 + 32);
  v13.length = CFArrayGetCount(v7);
  v13.location = 0;
  if (CFArrayContainsValue(v7, v13, v6))
  {
LABEL_12:
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 48), value);
    return;
  }
  PCSLogGetOSLog(*(_QWORD *)(a1 + 40));
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = value;
    _os_log_impl(&dword_1A9508000, v8, OS_LOG_TYPE_DEFAULT, "Identity not selected for migration: %{public}@", (uint8_t *)&v10, 0xCu);
  }

}

void __PCSIdentitySetCreateExternalFormWithName_block_invoke_34(uint64_t a1, const void *a2)
{
  CFNumberRef v4;
  uint64_t v5;
  CFMutableDictionaryRef *v6;
  const __CFDictionary *v7;
  _QWORD v8[3];

  memset(v8, 0, sizeof(v8));
  if (__PCSIdentitySetGetPrivateKey((uint64_t)a2, v8, *(const void ***)(a1 + 48)))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = add_PCSPrivateKeys((unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    free_PCSPrivateKey();
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      v4 = PCSIdentityCopyServiceNumber((uint64_t)a2);
      v5 = *(_QWORD *)(a1 + 56);
      if (PCSCurrentPersonaMatchesDSIDFromSet(v5)
        && (*(unsigned int (**)(uint64_t, const void *, _QWORD))(*(_QWORD *)(v5 + 16) + 32))(v5, a2, 0))
      {
        CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 64), a2);
        v6 = (CFMutableDictionaryRef *)(a1 + 72);
      }
      else
      {
        v7 = *(const __CFDictionary **)(a1 + 72);
        v6 = (CFMutableDictionaryRef *)(a1 + 72);
        if (CFDictionaryGetValue(v7, v4))
        {
LABEL_8:
          CFRelease(v4);
          return;
        }
      }
      CFDictionarySetValue(*v6, v4, a2);
      goto LABEL_8;
    }
  }
}

void __PCSIdentitySetCreateExternalFormWithName_block_invoke_2(uint64_t a1, uint64_t a2)
{
  CFNumberRef v3;

  v3 = PCSIdentityCopyServiceNumber(a2);
  CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 32), v3);
  if (v3)
    CFRelease(v3);
}

uint64_t __PCSIdentitySetCreateExternalFormWithName_block_invoke_3(uint64_t a1, int a2, void *value)
{
  uint64_t v5;
  uint64_t result;

  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), value);
  v5 = *(_QWORD *)(a1 + 40);
  result = PCSCurrentPersonaMatchesDSIDFromSet(v5);
  if ((_DWORD)result)
    return (*(uint64_t (**)(uint64_t, void *, _QWORD))(*(_QWORD *)(v5 + 16) + 56))(v5, value, 0);
  return result;
}

@end
