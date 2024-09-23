@implementation PCSEngineValidateStepEnsureServicesHaveCurrentSet

void __PCSEngineValidateStepEnsureServicesHaveCurrentSet_block_invoke(uint64_t a1, const void *a2)
{
  const void *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  const void *ValueAtIndex;

  if ((!objc_msgSend(*(id *)(a1 + 32), "limitLocalStoring") || IsLocalStoringService(*(void **)(a1 + 32), a2))
    && ((objc_msgSend(*(id *)(a1 + 32), "iCDP") & 1) != 0 || !PCSServiceItemTypeIsManatee((_BOOL8)a2)))
  {
    v4 = _PCSIdentitySetCopyCurrentIdentityInternal(objc_msgSend(*(id *)(a1 + 32), "set"), (uint64_t)a2, 0);
    if (v4)
    {
LABEL_6:
      CFRelease(v4);
      return;
    }
    v5 = (const __CFArray *)PCSIdentitySetCopyOrderedIdentities(objc_msgSend(*(id *)(a1 + 32), "set"), (uint64_t)a2);
    if (v5)
    {
      v6 = v5;
      if (!CFArrayGetCount(v5))
      {
        v4 = v6;
        goto LABEL_6;
      }
      ValueAtIndex = CFArrayGetValueAtIndex(v6, 0);
      PCSIdentitySetSetCurrentIdentity(objc_msgSend(*(id *)(a1 + 32), "set"), (uint64_t)ValueAtIndex);
      CFRelease(v6);
      objc_msgSend(*(id *)(a1 + 32), "setModified:", 1);
    }
  }
}

@end
