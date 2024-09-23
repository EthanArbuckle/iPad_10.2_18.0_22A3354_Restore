@implementation UIGuidedAccessConfigureAccessibilityFeatures

void __UIGuidedAccessConfigureAccessibilityFeatures_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    _UINSLocalizedStringWithDefaultValue(CFSTR("The application is not locked into Single App Mode."), CFSTR("The application is not locked into Single App Mode."));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2D50];
    v7[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("UIGuidedAccessErrorDomain"), 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

@end
