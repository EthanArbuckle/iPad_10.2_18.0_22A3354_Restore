@implementation UIAXRuntimeConvertOutgoingParameterizedValue

void __UIAXRuntimeConvertOutgoingParameterizedValue_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "objectForKey:", CFSTR("UIAccessibilityTextAttributeContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (v7)
  {
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0CEB0C0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AXSSTextualContextFromUITextualContext(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(*(id *)(a1 + 32), "setAttribute:forKey:withRange:", v10, *MEMORY[0x1E0CF4068], a3, a4);

    v8 = v11;
  }

}

@end
