@implementation NSCoreTypesetterTruncateLine

const void *____NSCoreTypesetterTruncateLine_block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  uint64_t IsRightToLeft;
  void *v9;
  void *v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t Value;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  const void *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  IsRightToLeft = CTLineIsRightToLeft();
  v9 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("NSParagraphStyle"));
  v10 = v9;
  v25 = 0;
  v26 = 0;
  v24 = 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v11 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32);
  }
  else
  {
    v24 = 0;
    v25 = 0;
    v11 = &v24;
    v26 = 0;
  }
  if (objc_msgSend(v9, "baseWritingDirection") == IsRightToLeft
    && objc_msgSend(v10, "lineBreakMode") == *(_QWORD *)(a1 + 64))
  {
    v12 = 0;
    v13 = a4;
  }
  else
  {
    v14 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v14, "setLineBreakMode:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v14, "setBaseWritingDirection:", IsRightToLeft);
    v12 = (void *)objc_msgSend(a4, "mutableCopy");
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("NSParagraphStyle"));

    v13 = v12;
  }
  v15 = *MEMORY[0x1E0CA85C0];
  Value = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a4, (const void *)*MEMORY[0x1E0CA85C0]);
  v17 = *MEMORY[0x1E0CA8158];
  v18 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)a4, (const void *)*MEMORY[0x1E0CA8158]);
  if (Value | v18)
  {
    v19 = v18;
    if (v12)
    {
      if (!Value)
        goto LABEL_12;
    }
    else
    {
      v12 = (void *)objc_msgSend(v13, "mutableCopy");
      v13 = v12;
      if (!Value)
      {
LABEL_12:
        if (v19)
          objc_msgSend(v12, "removeObjectForKey:", v17);
        goto LABEL_14;
      }
    }
    objc_msgSend(v12, "removeObjectForKey:", v15);
    goto LABEL_12;
  }
LABEL_14:
  v20 = (const void *)objc_msgSend(*(id *)(a1 + 32), "_truncationTokenRunRefWithContext:token:attributes:", v11, objc_msgSend(*(id *)(a1 + 32), "_truncationTokenForRange:attributes:originalLineRef:", a3, v13, a2), v13);
  v21 = v20;
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (v20)
  {
    *(_OWORD *)(v22 + 32) = *a3;
    CFRetain(v20);
  }
  else
  {
    *(_OWORD *)(v22 + 32) = xmmword_18D6CBB80;
  }

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    __NSCoreTypesetterTruncationTokenContextDeallocate((uint64_t)&v24);
  return v21;
}

@end
