@implementation NSCreateClippingAttributesForExclusionPaths

void ____NSCreateClippingAttributesForExclusionPaths_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  CFIndex v5;
  uint64_t v6;
  CFDictionaryRef v7;
  void *values;
  uint64_t v9;
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x1E0C80C00];
  v4 = (void *)*MEMORY[0x1E0CA8570];
  keys[0] = *(void **)MEMORY[0x1E0CA8568];
  keys[1] = v4;
  v9 = 0;
  values = (void *)objc_msgSend(a2, "CGPath");
  if ((objc_msgSend(a2, "usesEvenOddFillRule") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", 1);
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    v9 = v6;
    v5 = 2;
  }
  v7 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, v5, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), v7);
  if (v7)
    CFRelease(v7);
}

@end
