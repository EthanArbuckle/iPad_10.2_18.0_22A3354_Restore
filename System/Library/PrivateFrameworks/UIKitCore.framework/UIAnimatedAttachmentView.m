@implementation UIAnimatedAttachmentView

void __63___UIAnimatedAttachmentView_cachedObjectWithKey_creationBlock___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 5, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD81C80;
  qword_1ECD81C80 = v0;

}

id __48___UIAnimatedAttachmentView_initWithAttachment___block_invoke(uint64_t a1)
{
  const __CFData *v1;
  CGImageSource *v2;
  size_t Count;
  void *v4;
  void *v5;
  size_t v6;
  uint64_t v7;
  double v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  const __CFDictionary *Value;
  const __CFDictionary *v12;
  const __CFNumber *v13;
  float v14;
  double v15;
  CGImageRef ImageAtIndex;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v30;
  const __CFData *v31;
  void *v32;
  void *v33;
  void *v34;
  void *key;
  void *v36;
  float valuePtr;
  _QWORD v38[16];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v1 = (const __CFData *)*(id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("contents"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v1;
  v2 = CGImageSourceCreateWithData(v1, 0);
  Count = CGImageSourceGetCount(v2);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count + 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (Count)
  {
    v6 = 0;
    v7 = *MEMORY[0x1E0CBD288];
    key = (void *)*MEMORY[0x1E0CBCCE0];
    v34 = (void *)*MEMORY[0x1E0CBCCF8];
    v32 = (void *)*MEMORY[0x1E0CBCCD8];
    v33 = (void *)*MEMORY[0x1E0CBD028];
    v8 = 0.0;
    do
    {
      valuePtr = 0.0;
      *(_QWORD *)&v39 = v7;
      v38[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v39, 1, v30, v31);
      v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v10 = CGImageSourceCopyPropertiesAtIndex(v2, v6, v9);

      if (v10)
      {
        Value = (const __CFDictionary *)CFDictionaryGetValue(v10, key);
        if (Value || (Value = (const __CFDictionary *)CFDictionaryGetValue(v10, v33)) != 0)
        {
          v12 = Value;
          v13 = (const __CFNumber *)CFDictionaryGetValue(Value, v34);
          if (v13 || (v13 = (const __CFNumber *)CFDictionaryGetValue(v12, v32)) != 0)
            CFNumberGetValue(v13, kCFNumberFloatType, &valuePtr);
        }
        CFRelease(v10);
        v14 = valuePtr;
      }
      else
      {
        v14 = 0.0;
      }
      if (v14 >= 0.011)
        v15 = v14;
      else
        v15 = 0.100000001;
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v2, v6, 0);
      objc_msgSend(v36, "addObject:", ImageAtIndex);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v17);

      v8 = v8 + v15;
      ++v6;
    }
    while (Count != v6);
  }
  else
  {
    v8 = 0.0;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v18 = v4;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v40;
    v22 = 0.0;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v23);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22, v30);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v25);

        objc_msgSend(v24, "doubleValue");
        v22 = v22 + v26 / v8;
        ++v23;
      }
      while (v20 != v23);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    }
    while (v20);
  }

  objc_msgSend(v5, "addObject:", &unk_1E1A962A0);
  objc_msgSend(v36, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObject:", v27);

  objc_msgSend(v30, "setValues:", v36);
  objc_msgSend(v30, "setKeyTimes:", v5);
  objc_msgSend(v30, "setDuration:", v8);
  LODWORD(v28) = 2139095039;
  objc_msgSend(v30, "setRepeatCount:", v28);
  objc_msgSend(v30, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v30, "setCalculationMode:", *MEMORY[0x1E0CD2930]);
  objc_msgSend(v30, "setRemovedOnCompletion:", 0);
  objc_msgSend(v30, "setBeginTimeMode:", *MEMORY[0x1E0CD2918]);
  CFRelease(v2);

  return v30;
}

@end
