@implementation SBManagedDisplayModeRequirementMaskDescription

void __SBManagedDisplayModeRequirementMaskDescription_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("|"));
  if (a2 == 2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = CFSTR(".HardwareKeyboard");
  }
  else
  {
    if (a2 != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull SBManagedDisplayModeRequirementMaskDescription(SBManagedDisplayModeRequirementMask)_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("SBManagedDisplayModeRequirementMask.m"), 31, CFSTR("you shouldna done that"));

      goto LABEL_9;
    }
    v4 = *(void **)(a1 + 32);
    v5 = CFSTR(".Pointer");
  }
  objc_msgSend(v4, "appendString:", v5);
LABEL_9:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

@end
